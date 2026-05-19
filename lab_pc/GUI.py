"""ENGG2800 Power Meter PC software.

This program receives measurement arrays from the AVR over a serial port and
updates a live Tkinter display.  The AVR sends one Python-list-formatted line
for each sample, for example:

    [3.14, 0.52, 9.80, 0.95, 4.2, 18.6, 4.2, 4.2, 12.3,
     0.87, 50.0, 1.63, 9.55, 1.38, 9.65, 3600]

Index mapping:
     0  DC Voltage (V)
     1  DC Current (A)
     2  AC Voltage RMS (V)
     3  AC Current High RMS (A)
     4  AC Current Low RMS (A)
     5  AC Voltage Vpp (V)
     6  AC Current High Vpp (A)
     7  AC Current Low Vpp (A)
     8  Phase Difference (deg)
     9  Power Factor
    10  Frequency (Hz)
    11  DC Power (W)
    12  AC Real Power (W)
    13  AC Reactive Power (VAR)
    14  AC Apparent Power (VA)
    15  RTC time (seconds since midnight)

The current AVR firmware only transmits data.  It does not enable UART
reception, and it does not parse a PC time-sync command.  Therefore this GUI
only displays the RTC value sent by the AVR.

Special values:
    PLACEHOLDER_VALUE (4.2) -> measurement not yet available
    UL_CODE (37)            -> under-limit marker for selected AC values
"""

import ast
import queue
import threading
import time
import tkinter as tk
from tkinter import ttk

import matplotlib

# TkAgg must be selected before importing the Tkinter canvas backend.
matplotlib.use("TkAgg")

import serial  # noqa: E402
import serial.tools.list_ports  # noqa: E402
from matplotlib.backends.backend_tkagg import FigureCanvasTkAgg  # noqa: E402
from matplotlib.figure import Figure  # noqa: E402

# Serial-port settings.  These values must match the AVR UART configuration.
BAUD_RATE = 9600
SERIAL_TIMEOUT_S = 0.1

# Main window settings.
WINDOW_TITLE = "ENGG2800 Power Meter"
WINDOW_GEOMETRY = "1380x820"

# Plot time-range limits, in seconds.
MIN_TIME_RANGE_S = 10
MAX_TIME_RANGE_S = 3600
DEFAULT_TIME_RANGE_S = 60

# The AVR initially fills unused measurements with 4.2.
PLACEHOLDER_VALUE = 37  ### change4.2 to 37
PLACEHOLDER_TOL = 0.0001

# The AVR writes 37 into selected AC-current-related measurements when they
# are under the current threshold.  Do not apply this code to every field,
# because other measurements may legitimately have the numeric value 37.
UL_CODE = 37
UL_MEASUREMENT_INDICES = {
    3,   # AC Current High RMS (A).
    4,   # AC Current Low RMS (A).
    6,   # AC Current High Vpp (A).
    7,   # AC Current Low Vpp (A).
    8,   # Phase Difference (deg).
    9,   # Power Factor.
    12,  # AC Real Power (W).
    13,  # AC Reactive Power (VAR).
    14,  # AC Apparent Power (VA).
}

# GUI colour constants are kept together so the theme is easy to change.
COLOR_BG = "#abc1f0"
COLOR_PANEL = "#fefefe"
COLOR_BORDER = "#b2b2ef"
COLOR_TEXT = "#000000"
COLOR_SUBTEXT = "#222222"
COLOR_GREEN = "#2e7d32"
COLOR_ORANGE = "#ef6c00"
COLOR_RED = "#c62828"
COLOR_PLOT_BG = "#eef2ff"
COLOR_PLOT_LINE = "#1565c0"

# Each tuple contains the display name, AVR array index, and display format.
DISPLAY_MEASUREMENTS = [
    ("DC Voltage (V)", 0, "{:.2f}"),
    ("DC Current (A)", 1, "{:.2f}"),
    ("DC Power (W)", 11, "{:.2f}"),
    ("AC Voltage RMS (V)", 2, "{:.2f}"),
    ("AC Current RMS (A)", 3, "{:.2f}"),
    ("AC Frequency (Hz)", 10, "{:.2f}"),
    ("AC Phase Difference (deg)", 8, "{:.2f}"),
    ("AC Real Power (W)", 12, "{:.2f}"),
    ("AC Reactive Power (VAR)", 13, "{:.2f}"),
    ("AC Apparent Power (VA)", 14, "{:.2f}"),
    ("AC Power Factor", 9, "{:.3f}"),
    ("AC Peak-to-Peak Voltage (V)", 5, "{:.2f}"),
    ("AC Peak-to-Peak Current (A)", 6, "{:.2f}"),
]

MEASUREMENTS = [measurement[0] for measurement in DISPLAY_MEASUREMENTS]


class SerialManager:
    """Own the serial port and run a background reader thread."""

    def __init__(self):
        self.ser = None
        self.thread = None
        self.running = False
        self.queue = queue.Queue()
        self.lock = threading.Lock()

    def connect(self, port: str):
        """Open a serial port and start the reader thread."""
        with self.lock:
            if self.ser and self.ser.is_open:
                raise RuntimeError("Serial port is already connected")

            self.ser = serial.Serial(
                port,
                BAUD_RATE,
                timeout=SERIAL_TIMEOUT_S,
            )
            self.running = True
            self.thread = threading.Thread(
                target=self._reader,
                daemon=True,
            )
            self.thread.start()

    def disconnect(self):
        """Close the serial port and stop the reader thread."""
        with self.lock:
            self.running = False
            ser = self.ser
            thread = self.thread

        try:
            if ser and ser.is_open:
                ser.close()
        except serial.SerialException:
            pass
        except OSError:
            pass

        if thread and thread.is_alive():
            thread.join(timeout=0.2)

        with self.lock:
            self.ser = None
            self.thread = None
            self.running = False

    def _reader(self):
        """Read complete serial lines and place them on the queue."""
        while True:
            with self.lock:
                running = self.running
                ser = self.ser

            if not running or ser is None or not ser.is_open:
                break

            try:
                raw = ser.readline()
                if not raw:
                    continue

                # Bad bytes are replaced so one corrupt byte cannot stop the
                # GUI from receiving later serial samples.
                line = raw.decode("utf-8", errors="replace").strip()
                if line:
                    self.queue.put(line)
            except (serial.SerialException, OSError) as exc:
                with self.lock:
                    still_running = self.running

                # Only report the error when the disconnect was not requested
                # by the user.
                if still_running:
                    self.queue.put(
                        {
                            "type": "__error__",
                            "msg": str(exc),
                        }
                    )
                break


class App:
    """Tkinter application for the ENGG2800 Power Meter GUI."""

    def __init__(self, root):
        self.root = root
        self.root.title(WINDOW_TITLE)
        self.root.geometry(WINDOW_GEOMETRY)
        self.root.configure(bg=COLOR_BG)

        self.serial_mgr = SerialManager()
        self.first_sample_monotonic = None
        self.sample_seq = 0
        self.value_labels = {}
        self.hover_annotation = None
        self.disconnecting = False

        # Each history entry is stored as (time_offset_s, value, sequence).
        # The value is usually a float.  The string "UL" is used for an
        # under-limit point so the graph can draw it differently.
        self.history = {name: [] for name in MEASUREMENTS}

        self._build_style()
        self._build_ui()

        # Tkinter widgets must be updated on the main thread, so the serial
        # thread only pushes lines to a queue.  The GUI checks that queue here.
        self.root.after(80, self.poll_serial_queue)

    def _build_style(self):
        """Apply theme overrides to ttk widgets."""
        style = ttk.Style()
        style.theme_use("clam")
        style.configure(
            "TCombobox",
            fieldbackground=COLOR_PANEL,
            background=COLOR_PANEL,
            foreground=COLOR_TEXT,
            arrowcolor=COLOR_TEXT,
        )

    def _build_ui(self):
        """Build all UI sections."""
        self.build_top_bar()

        body = tk.Frame(self.root, bg=COLOR_BG)
        body.pack(fill="both", expand=True, padx=10, pady=10)

        self.build_measurement_panel(body)
        self.build_chart_panel(body)

    def build_top_bar(self):
        """Build the connection control bar."""
        frame = tk.Frame(
            self.root,
            bg=COLOR_PANEL,
            highlightbackground=COLOR_BORDER,
            highlightthickness=1,
            padx=12,
            pady=8,
        )
        frame.pack(fill="x", padx=10, pady=(10, 6))

        tk.Label(
            frame,
            text="Port:",
            bg=COLOR_PANEL,
            fg=COLOR_TEXT,
        ).pack(side="left")

        self.combo_port = ttk.Combobox(frame, width=24, state="readonly")
        self.combo_port.pack(side="left", padx=6)

        self.btn_refresh = tk.Button(
            frame,
            text="Refresh",
            command=self.refresh_ports,
        )
        self.btn_refresh.pack(side="left", padx=4)

        self.btn_connect = tk.Button(
            frame,
            text="Connect",
            command=self.connect,
        )
        self.btn_connect.pack(side="left", padx=4)

        self.btn_disconnect = tk.Button(
            frame,
            text="Disconnect",
            command=self.disconnect,
        )
        self.btn_disconnect.pack(side="left", padx=4)

        self.label_status = tk.Label(
            frame,
            text="Disconnected",
            bg=COLOR_PANEL,
            fg=COLOR_RED,
        )
        self.label_status.pack(side="left", padx=14)

        self.label_seq = tk.Label(
            frame,
            text="Seq: --",
            bg=COLOR_PANEL,
            fg=COLOR_TEXT,
        )
        self.label_seq.pack(side="left", padx=8)

        # The RTC label displays index 15 from the AVR measurement array.
        self.label_time = tk.Label(
            frame,
            text="RTC: --",
            bg=COLOR_PANEL,
            fg=COLOR_TEXT,
        )
        self.label_time.pack(side="left", padx=8)

        self.label_rx = tk.Label(
            frame,
            text="RX: --",
            bg=COLOR_PANEL,
            fg=COLOR_SUBTEXT,
        )
        self.label_rx.pack(side="right", padx=8)

        self.refresh_ports()
        self._set_connected_ui(False)

    def build_measurement_panel(self, parent):
        """Build the left panel that shows live values."""
        frame = tk.LabelFrame(
            parent,
            text=" Live Measurements ",
            bg=COLOR_PANEL,
            fg=COLOR_TEXT,
            highlightbackground=COLOR_BORDER,
            highlightthickness=1,
            padx=10,
            pady=10,
            width=430,
        )
        frame.pack(side="left", fill="y", padx=(0, 10))
        frame.pack_propagate(False)

        for name in MEASUREMENTS:
            row = tk.Frame(frame, bg=COLOR_PANEL)
            row.pack(fill="x", pady=3)

            tk.Label(
                row,
                text=name,
                width=32,
                anchor="w",
                bg=COLOR_PANEL,
                fg=COLOR_TEXT,
            ).pack(side="left")

            value_label = tk.Label(
                row,
                text="--",
                width=12,
                anchor="e",
                bg=COLOR_PANEL,
                fg=COLOR_SUBTEXT,
            )
            value_label.pack(side="right")
            self.value_labels[name] = value_label

    def build_chart_panel(self, parent):
        """Build the right panel containing the live chart."""
        frame = tk.LabelFrame(
            parent,
            text=" Live Chart ",
            bg=COLOR_PANEL,
            fg=COLOR_TEXT,
            highlightbackground=COLOR_BORDER,
            highlightthickness=1,
            padx=8,
            pady=8,
        )
        frame.pack(side="left", fill="both", expand=True)

        control_frame = tk.Frame(frame, bg=COLOR_PANEL)
        control_frame.pack(fill="x", pady=(0, 8))

        tk.Label(
            control_frame,
            text="Measurement:",
            bg=COLOR_PANEL,
            fg=COLOR_TEXT,
        ).pack(side="left")

        self.var_plot = tk.StringVar(value="DC Voltage (V)")
        plot_combo = ttk.Combobox(
            control_frame,
            textvariable=self.var_plot,
            values=MEASUREMENTS,
            width=36,
            state="readonly",
        )
        plot_combo.pack(side="left", padx=6)
        self.var_plot.trace_add("write", self.update_plot)

        tk.Label(
            control_frame,
            text="Time range (s):",
            bg=COLOR_PANEL,
            fg=COLOR_TEXT,
        ).pack(side="left", padx=(16, 0))

        self.entry_range = tk.Entry(control_frame, width=8)
        self.entry_range.insert(0, str(DEFAULT_TIME_RANGE_S))
        self.entry_range.pack(side="left", padx=6)

        tk.Button(
            control_frame,
            text="Apply",
            command=self.apply_time_range,
        ).pack(side="left", padx=4)

        tk.Label(
            control_frame,
            text="  Normal points; red x = Under Limit (UL)",
            bg=COLOR_PANEL,
            fg=COLOR_SUBTEXT,
        ).pack(side="right", padx=8)

        figure = Figure(figsize=(8.3, 5.8), facecolor=COLOR_PANEL)
        self.ax = figure.add_subplot(111)
        figure.subplots_adjust(
            left=0.12,
            right=0.97,
            top=0.92,
            bottom=0.13,
        )

        self.canvas = FigureCanvasTkAgg(figure, master=frame)
        self.canvas.get_tk_widget().pack(fill="both", expand=True)
        self.canvas.mpl_connect("motion_notify_event", self.on_hover)
        self.canvas.mpl_connect("axes_leave_event", self.on_leave)

        self.update_plot()

    def _set_connected_ui(self, connected: bool):
        """Enable or disable widgets based on connection state."""
        if connected:
            self.btn_connect.config(state="disabled")
            self.btn_disconnect.config(state="normal")
            self.btn_refresh.config(state="disabled")
            self.combo_port.config(state="disabled")
        else:
            self.btn_connect.config(state="normal")
            self.btn_disconnect.config(state="disabled")
            self.btn_refresh.config(state="normal")
            self.combo_port.config(state="readonly")

    def refresh_ports(self):
        """Repopulate the port dropdown with available serial ports."""
        ports = [port.device for port in serial.tools.list_ports.comports()]
        self.combo_port["values"] = ports

        if ports:
            self.combo_port.current(0)
        else:
            self.combo_port.set("No ports found")

    def connect(self):
        """Open the selected serial port."""
        if self.disconnecting:
            return

        port = self.combo_port.get()
        if not port or port == "No ports found":
            self.set_status("No port selected", COLOR_ORANGE)
            return

        try:
            self.serial_mgr.connect(port)
        except (serial.SerialException, OSError) as exc:
            self.set_status(f"Connect failed: {exc}", COLOR_RED)
            self._set_connected_ui(False)
            return

        self.set_status(f"Connected: {port}", COLOR_GREEN)
        self._set_connected_ui(True)

    def disconnect(self):
        """Close the serial port in a background thread."""
        if self.disconnecting:
            return

        self.disconnecting = True
        self.set_status("Disconnecting...", COLOR_ORANGE)
        self.btn_disconnect.config(state="disabled")

        thread = threading.Thread(
            target=self._disconnect_worker,
            daemon=True,
        )
        thread.start()

    def _disconnect_worker(self):
        """Close the port, then notify the GUI thread."""
        self.serial_mgr.disconnect()
        self.root.after(0, self._disconnect_finished)

    def _disconnect_finished(self):
        """Update the GUI after disconnect completes."""
        self.disconnecting = False
        self.set_status("Disconnected", COLOR_RED)
        self._set_connected_ui(False)

    def set_status(self, text: str, color: str):
        """Update the connection-status label."""
        self.label_status.config(text=text, fg=color)

    def poll_serial_queue(self):
        """Drain the serial queue and process all pending items."""
        try:
            while True:
                item = self.serial_mgr.queue.get_nowait()
                self.handle_serial_item(item)
        except queue.Empty:
            pass

        self.root.after(80, self.poll_serial_queue)

    def handle_serial_item(self, item):
        """Route one item received from the serial reader thread."""
        if isinstance(item, dict) and item.get("type") == "__error__":
            if not self.disconnecting:
                self.set_status(f"Serial error: {item['msg']}", COLOR_RED)
            return

        self.label_rx.config(text=f"RX: {item[:110]}")

        values = self.parse_array_line(item)
        if values is None:
            return

        self.handle_measurement_array(values)

        # Index 15 is already seconds since midnight from the AVR RTC.
        # No PC time-sync command is sent back to the AVR here.
        rtc_raw = values[15] if len(values) > 15 else None
        if not self.is_placeholder(rtc_raw):
            self.label_time.config(
                text=f"RTC: {self.format_rtc_time(rtc_raw)}",
            )

    @staticmethod
    def parse_array_line(line: str):
        """Parse a Python-list-formatted line into a list of floats."""
        line = line.strip()
        if not (line.startswith("[") and line.endswith("]")):
            return None

        try:
            # literal_eval is safer than eval because it only accepts Python
            # literals, not arbitrary executable code.
            raw_values = ast.literal_eval(line)
        except (SyntaxError, ValueError):
            return None

        if not isinstance(raw_values, list):
            return None

        parsed_values = []
        for item in raw_values:
            try:
                parsed_values.append(float(item))
            except (TypeError, ValueError):
                parsed_values.append(None)

        return parsed_values

    @staticmethod
    def is_placeholder(value) -> bool:
        """Return True if value is the AVR placeholder sentinel."""
        if value is None:
            return True
        return abs(value - PLACEHOLDER_VALUE) < PLACEHOLDER_TOL

    @staticmethod
    def is_ul(value, index: int) -> bool:
        """Return True if value is a valid under-limit sentinel."""
        if index not in UL_MEASUREMENT_INDICES:
            return False

        if value is None:
            return False

        return abs(value - UL_CODE) < PLACEHOLDER_TOL

    def handle_measurement_array(self, values: list):
        """Update live labels and history from one parsed measurement array."""
        now_mono = time.monotonic()
        if self.first_sample_monotonic is None:
            self.first_sample_monotonic = now_mono

        offset_s = now_mono - self.first_sample_monotonic

        self.sample_seq += 1
        self.label_seq.config(text=f"Seq: {self.sample_seq}")

        for name, index, number_format in DISPLAY_MEASUREMENTS:
            value = values[index] if index < len(values) else None

            if self.is_ul(value, index):
                self.value_labels[name].config(text="UL", fg=COLOR_RED)
                self.history[name].append((offset_s, "UL", self.sample_seq))
                continue

            # Only selected AC-current-related fields use 37 as "UL".
            # Other fields can be real measurements with the value 37.
            if self.is_placeholder(value):
                self.value_labels[name].config(text="--", fg=COLOR_SUBTEXT)
                continue

            self.value_labels[name].config(
                text=number_format.format(value),
                fg=COLOR_GREEN,
            )
            self.history[name].append((offset_s, value, self.sample_seq))

        self.update_plot()

    @staticmethod
    def format_rtc_time(rtc_value) -> str:
        """Convert RTC seconds since midnight to HH:MM:SS."""
        try:
            total_seconds = int(float(rtc_value)) % (24 * 3600)
        except (TypeError, ValueError):
            return "--"

        if total_seconds < 0:
            return "--"

        hours = total_seconds // 3600
        minutes = (total_seconds % 3600) // 60
        seconds = total_seconds % 60

        return f"{hours:02d}:{minutes:02d}:{seconds:02d}"

    def get_time_range(self) -> float:
        """Return the validated time-range value in seconds."""
        try:
            value = float(self.entry_range.get())
        except ValueError:
            return DEFAULT_TIME_RANGE_S

        return max(MIN_TIME_RANGE_S, min(MAX_TIME_RANGE_S, value))

    def apply_time_range(self):
        """Validate and apply the time-range entry."""
        time_range = int(self.get_time_range())
        self.entry_range.delete(0, tk.END)
        self.entry_range.insert(0, str(time_range))
        self.update_plot()

    def update_plot(self, *_):
        """Redraw the live chart for the selected measurement."""
        selected = self.var_plot.get()
        points = self.history[selected]
        time_range = self.get_time_range()

        if points:
            latest = points[-1][0]
            visible = [
                (offset, value, seq)
                for offset, value, seq in points
                if latest - offset <= time_range
            ]
        else:
            latest = 0.0
            visible = []

        self.ax.clear()
        self.ax.set_facecolor(COLOR_PLOT_BG)
        self.ax.set_title(selected, fontsize=10)
        self.ax.set_xlabel("Time offset (s)", fontsize=9)
        self.ax.set_ylabel(selected, fontsize=9)
        self.ax.grid(True, linewidth=0.5, alpha=0.5)

        # The x-axis always shows the selected time window, even when there
        # are only a few samples at the start of a run.
        x_min = max(0.0, latest - time_range)
        x_max = x_min + time_range
        self.ax.set_xlim(x_min, x_max)

        if visible:
            normal = [
                (offset, value, seq)
                for offset, value, seq in visible
                if value != "UL"
            ]
            ul_points = [
                (offset, value, seq)
                for offset, value, seq in visible
                if value == "UL"
            ]

            if normal:
                x_values = [point[0] for point in normal]
                y_values = [point[1] for point in normal]
                self.ax.plot(
                    x_values,
                    y_values,
                    linewidth=1.3,
                    color=COLOR_PLOT_LINE,
                )
                self.ax.scatter(
                    x_values,
                    y_values,
                    s=20,
                    color=COLOR_PLOT_LINE,
                    zorder=3,
                    label="Measurement",
                )

            if ul_points:
                # UL has no real y-value, so it is placed at the bottom of the
                # current visible range and drawn as a red cross.
                y_bottom = min((point[1] for point in normal), default=0.0)
                self.ax.scatter(
                    [point[0] for point in ul_points],
                    [y_bottom] * len(ul_points),
                    color=COLOR_RED,
                    marker="x",
                    s=70,
                    linewidths=2,
                    zorder=4,
                    label="Under Limit (UL)",
                )

            if normal or ul_points:
                self.ax.legend(fontsize=8)

        self.hover_annotation = self.ax.annotate(
            "",
            xy=(0, 0),
            xytext=(14, 14),
            textcoords="offset points",
            bbox={
                "boxstyle": "round,pad=0.4",
                "fc": "#f7f7f7",
                "ec": "#444444",
                "alpha": 0.95,
            },
            fontsize=8,
            color=COLOR_TEXT,
            visible=False,
        )

        self.canvas.draw_idle()

    def on_hover(self, event):
        """Show a tooltip with seq, offset, and value near the cursor."""
        if self.hover_annotation is None or event.inaxes != self.ax:
            return

        selected = self.var_plot.get()
        points = self.history[selected]

        if not points or event.xdata is None:
            self.hover_annotation.set_visible(False)
            self.canvas.draw_idle()
            return

        time_range = self.get_time_range()
        latest = points[-1][0]
        visible = [
            (offset, value, seq)
            for offset, value, seq in points
            if latest - offset <= time_range
        ]

        if not visible:
            self.hover_annotation.set_visible(False)
            self.canvas.draw_idle()
            return

        # The closest point is chosen by x-distance because the live plot is
        # normally a time series with a clear horizontal sample order.
        closest = min(
            visible,
            key=lambda point: abs(point[0] - event.xdata),
        )
        offset_s, value, seq = closest

        value_str = "UL" if value == "UL" else f"{value:.4g}"
        y_pos = value if value != "UL" else self.ax.get_ylim()[0]

        self.hover_annotation.xy = (offset_s, y_pos)
        self.hover_annotation.set_text(
            f"Seq    : {seq}\n"
            f"Offset : {offset_s:.2f} s\n"
            f"Value  : {value_str}"
        )
        self.hover_annotation.set_visible(True)
        self.canvas.draw_idle()

    def on_leave(self, _event):
        """Hide the hover tooltip when the cursor leaves the axes."""
        if self.hover_annotation:
            self.hover_annotation.set_visible(False)
        self.canvas.draw_idle()


def main():
    """Create the Tk root window and start the application."""
    root = tk.Tk()
    app = App(root)

    def on_close():
        """Disconnect cleanly before destroying the window."""
        try:
            app.serial_mgr.disconnect()
        finally:
            root.destroy()

    root.protocol("WM_DELETE_WINDOW", on_close)
    root.mainloop()


if __name__ == "__main__":
    main()
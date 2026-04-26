import ast
import queue
import threading
import time
import tkinter as tk
from tkinter import ttk

import matplotlib
matplotlib.use("TkAgg")

from matplotlib.backends.backend_tkagg import FigureCanvasTkAgg
from matplotlib.figure import Figure

import serial
import serial.tools.list_ports


BAUD_RATE = 9600
WINDOW_TITLE = "ENGG2800 Power Meter"
WINDOW_GEOMETRY = "1380x820"

MIN_TIME_RANGE_S = 10
MAX_TIME_RANGE_S = 3600
DEFAULT_TIME_RANGE_S = 60

PLACEHOLDER_VALUE = 4.2
PLACEHOLDER_TOL = 0.0001

COLOR_BG = "#abc1f0"
COLOR_PANEL = "#fefefe"
COLOR_BORDER = "#b2b2ef"
COLOR_TEXT = "#000000"
COLOR_SUBTEXT = "#222222"
COLOR_GREEN = "#2e7d32"
COLOR_ORANGE = "#ef6c00"
COLOR_RED = "#c62828"

# AVR array format:
# [0 DC Voltage,
#  1 DC Current,
#  2 AC Voltage RMS,
#  3 AC Current High RMS,
#  4 AC Current Low RMS,
#  5 AC Voltage Vpp,
#  6 AC Current High Vpp,
#  7 AC Current Low Vpp,
#  8 Phase Difference,
#  9 Power Factor,
# 10 Frequency,
# 11 DC Power,
# 12 AC Real Power,
# 13 AC Reactive Power,
# 14 AC Apparent Power,
# 15 RTC Time]
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

MEASUREMENTS = [m[0] for m in DISPLAY_MEASUREMENTS]


class SerialManager:
    def __init__(self):
        self.ser = None
        self.thread = None
        self.running = False
        self.queue = queue.Queue()

    def connect(self, port: str):
        self.ser = serial.Serial(port, BAUD_RATE, timeout=0.2)
        self.running = True
        self.thread = threading.Thread(target=self._reader, daemon=True)
        self.thread.start()

    def disconnect(self):
        self.running = False
        if self.thread and self.thread.is_alive():
            self.thread.join(timeout=1.0)
        if self.ser and self.ser.is_open:
            self.ser.close()
        self.ser = None

    def _reader(self):
        while self.running and self.ser and self.ser.is_open:
            try:
                raw = self.ser.readline()
                if not raw:
                    continue
                line = raw.decode("utf-8", errors="replace").strip()
                if line:
                    self.queue.put(line)
            except Exception as exc:
                self.queue.put({"type": "__error__", "msg": str(exc)})
                break


class App:
    def __init__(self, root):
        self.root = root
        self.root.title(WINDOW_TITLE)
        self.root.geometry(WINDOW_GEOMETRY)
        self.root.configure(bg=COLOR_BG)

        self.serial_mgr = SerialManager()
        self.first_sample_monotonic = None
        self.sample_seq = 0
        self.value_labels = {}
        self.history = {name: [] for name in MEASUREMENTS}
        self.hover_annotation = None

        self._build_style()
        self._build_ui()
        self.root.after(80, self.poll_serial_queue)

    def _build_style(self):
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
        self.build_top_bar()

        body = tk.Frame(self.root, bg=COLOR_BG)
        body.pack(fill="both", expand=True, padx=10, pady=10)

        self.build_measurement_panel(body)
        self.build_chart_panel(body)

    def build_top_bar(self):
        frame = tk.Frame(
            self.root,
            bg=COLOR_PANEL,
            highlightbackground=COLOR_BORDER,
            highlightthickness=1,
            padx=12,
            pady=8,
        )
        frame.pack(fill="x", padx=10, pady=(10, 6))

        tk.Label(frame, text="Port:", bg=COLOR_PANEL, fg=COLOR_TEXT).pack(side="left")

        self.combo_port = ttk.Combobox(frame, width=24, state="readonly")
        self.combo_port.pack(side="left", padx=6)

        tk.Button(frame, text="Refresh", command=self.refresh_ports).pack(side="left", padx=4)
        tk.Button(frame, text="Connect", command=self.connect).pack(side="left", padx=4)
        tk.Button(frame, text="Disconnect", command=self.disconnect).pack(side="left", padx=4)

        self.label_status = tk.Label(frame, text="Disconnected", bg=COLOR_PANEL, fg=COLOR_RED)
        self.label_status.pack(side="left", padx=14)

        self.label_seq = tk.Label(frame, text="Seq: —", bg=COLOR_PANEL, fg=COLOR_TEXT)
        self.label_seq.pack(side="left", padx=8)

        self.label_rx = tk.Label(frame, text="RX: —", bg=COLOR_PANEL, fg=COLOR_SUBTEXT)
        self.label_rx.pack(side="right", padx=8)

        self.refresh_ports()

    def build_measurement_panel(self, parent):
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

            val = tk.Label(
                row,
                text="—",
                width=12,
                anchor="e",
                bg=COLOR_PANEL,
                fg=COLOR_SUBTEXT,
            )
            val.pack(side="right")
            self.value_labels[name] = val

    def build_chart_panel(self, parent):
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

        ctrl = tk.Frame(frame, bg=COLOR_PANEL)
        ctrl.pack(fill="x", pady=(0, 8))

        tk.Label(ctrl, text="Measurement:", bg=COLOR_PANEL, fg=COLOR_TEXT).pack(side="left")

        self.var_plot = tk.StringVar(value="DC Voltage (V)")
        combo = ttk.Combobox(
            ctrl,
            textvariable=self.var_plot,
            values=MEASUREMENTS,
            width=36,
            state="readonly",
        )
        combo.pack(side="left", padx=6)
        self.var_plot.trace_add("write", self.update_plot)

        tk.Label(ctrl, text="Time range (s):", bg=COLOR_PANEL, fg=COLOR_TEXT).pack(side="left", padx=(16, 0))
        self.entry_range = tk.Entry(ctrl, width=8)
        self.entry_range.insert(0, str(DEFAULT_TIME_RANGE_S))
        self.entry_range.pack(side="left", padx=6)

        tk.Button(ctrl, text="Apply", command=self.apply_time_range).pack(side="left", padx=4)

        fig = Figure(figsize=(8.3, 5.8), facecolor=COLOR_PANEL)
        self.ax = fig.add_subplot(111)
        fig.subplots_adjust(left=0.12, right=0.97, top=0.92, bottom=0.13)

        self.canvas = FigureCanvasTkAgg(fig, master=frame)
        self.canvas.get_tk_widget().pack(fill="both", expand=True)

        self.canvas.mpl_connect("motion_notify_event", self.on_hover)
        self.canvas.mpl_connect("axes_leave_event", self.on_leave)

        self.update_plot()

    def refresh_ports(self):
        ports = [p.device for p in serial.tools.list_ports.comports()]
        self.combo_port["values"] = ports
        if ports:
            self.combo_port.current(0)
        else:
            self.combo_port.set("No ports found")

    def connect(self):
        port = self.combo_port.get()
        if not port or port == "No ports found":
            self.set_status("No port selected", COLOR_ORANGE)
            return

        try:
            self.serial_mgr.connect(port)
            self.set_status(f"Connected: {port}", COLOR_GREEN)
        except Exception as exc:
            self.set_status(f"Connect failed: {exc}", COLOR_RED)

    def disconnect(self):
        self.serial_mgr.disconnect()
        self.set_status("Disconnected", COLOR_RED)

    def set_status(self, text, color):
        self.label_status.config(text=text, fg=color)

    def poll_serial_queue(self):
        try:
            while True:
                item = self.serial_mgr.queue.get_nowait()
                self.handle_serial_item(item)
        except queue.Empty:
            pass

        self.root.after(80, self.poll_serial_queue)

    def handle_serial_item(self, item):
        if isinstance(item, dict) and item.get("type") == "__error__":
            self.set_status(f"Serial error: {item['msg']}", COLOR_RED)
            return

        self.label_rx.config(text=f"RX: {item[:110]}")

        values = self.parse_array_line(item)
        if values is None:
            return

        self.handle_measurement_array(values)

    def parse_array_line(self, line):
        line = line.strip()

        if not (line.startswith("[") and line.endswith("]")):
            return None

        try:
            values = ast.literal_eval(line)
        except Exception:
            return None

        if not isinstance(values, list):
            return None

        parsed = []
        for value in values:
            try:
                parsed.append(float(value))
            except Exception:
                parsed.append(None)

        return parsed

    def is_placeholder(self, value):
        if value is None:
            return True
        return abs(value - PLACEHOLDER_VALUE) < PLACEHOLDER_TOL

    def handle_measurement_array(self, values):
        now_mono = time.monotonic()
        if self.first_sample_monotonic is None:
            self.first_sample_monotonic = now_mono

        offset_s = now_mono - self.first_sample_monotonic
        self.sample_seq += 1
        self.label_seq.config(text=f"Seq: {self.sample_seq}")

        for name, idx, fmt in DISPLAY_MEASUREMENTS:
            value = values[idx] if idx < len(values) else None

            if self.is_placeholder(value):
                self.value_labels[name].config(text="—", fg=COLOR_ORANGE)
                continue

            self.value_labels[name].config(text=fmt.format(value), fg=COLOR_GREEN)
            self.history[name].append((offset_s, value, self.sample_seq))

        self.update_plot()

    def get_time_range(self):
        try:
            v = float(self.entry_range.get())
            return max(MIN_TIME_RANGE_S, min(MAX_TIME_RANGE_S, v))
        except ValueError:
            return DEFAULT_TIME_RANGE_S

    def apply_time_range(self):
        v = int(self.get_time_range())
        self.entry_range.delete(0, tk.END)
        self.entry_range.insert(0, str(v))
        self.update_plot()

    def update_plot(self, *_):
        selected = self.var_plot.get()
        points = self.history[selected]
        t_range = self.get_time_range()

        if points:
            latest = points[-1][0]
            visible = [(o, v, s) for (o, v, s) in points if latest - o <= t_range]
        else:
            latest = 0.0
            visible = []

        self.ax.clear()
        self.ax.set_facecolor("#eef2ff")
        self.ax.set_title(selected, fontsize=10)
        self.ax.set_xlabel("Time offset (s)", fontsize=9)
        self.ax.set_ylabel(selected, fontsize=9)
        self.ax.grid(True, linewidth=0.5, alpha=0.5)

        x_min = max(0.0, latest - t_range)
        x_max = x_min + t_range
        self.ax.set_xlim(x_min, x_max)

        if visible:
            xs = [p[0] for p in visible]
            ys = [p[1] for p in visible]
            self.ax.plot(xs, ys, linewidth=1.3)
            self.ax.scatter(xs, ys, s=20)

        self.hover_annotation = self.ax.annotate(
            "",
            xy=(0, 0),
            xytext=(14, 14),
            textcoords="offset points",
            bbox=dict(boxstyle="round,pad=0.4", fc="#f7f7f7", ec="#444444", alpha=0.95),
            fontsize=8,
            color="#000000",
            visible=False,
        )

        self.canvas.draw_idle()

    def on_hover(self, event):
        if self.hover_annotation is None or event.inaxes != self.ax:
            return

        selected = self.var_plot.get()
        points = self.history[selected]

        if not points or event.xdata is None:
            self.hover_annotation.set_visible(False)
            self.canvas.draw_idle()
            return

        t_range = self.get_time_range()
        latest = points[-1][0]
        visible = [(o, v, s) for (o, v, s) in points if latest - o <= t_range]

        if not visible:
            self.hover_annotation.set_visible(False)
            self.canvas.draw_idle()
            return

        closest = min(visible, key=lambda p: abs(p[0] - event.xdata))
        offset_s, value, seq = closest

        self.hover_annotation.xy = (offset_s, value)
        self.hover_annotation.set_text(
            f"Seq      : {seq}\n"
            f"Offset   : {offset_s:.2f} s\n"
            f"Value    : {value:.4g}"
        )
        self.hover_annotation.set_visible(True)
        self.canvas.draw_idle()

    def on_leave(self, _event):
        if self.hover_annotation:
            self.hover_annotation.set_visible(False)
            self.canvas.draw_idle()


def main():
    root = tk.Tk()
    app = App(root)

    def on_close():
        try:
            app.serial_mgr.disconnect()
        finally:
            root.destroy()

    root.protocol("WM_DELETE_WINDOW", on_close)
    root.mainloop()


if __name__ == "__main__":
    main()
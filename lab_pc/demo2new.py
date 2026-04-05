"""
ENGG2800 Power Meter PC Software.

Displays live AC/DC measurements received from an AVR microcontroller
via a Seeeduino Xiao (polyglot-turtle firmware) over USB serial.

Requirements addressed:
    - [Spec]  All measurements displayed live in textual form.
    - [Spec]  Live graph: time offset (seconds from first point) on X axis.
    - [Spec]  Hover tooltip shows exact RTC time and exact measurement value.
    - [Spec]  Time range control 10-3600 s; oldest point discarded at limit.
    - [Spec]  All measurements recorded in background across plot switches.
    - [Spec]  UL (Under Limit) values clearly marked on the graph.
    - [Spec]  Button to sync current PC time to the device RTC.
    - [Demo1] Port selector via dropdown (valid serial ports only).
    - [Demo1] Send single character; MCU echoes back the capitalised version.
    - [Demo2] Graph hover shows exact RTC timestamp for each data point.
"""

# ---------------------------------------------------------------------------
# Standard-library imports
# ---------------------------------------------------------------------------
import datetime
import time

# ---------------------------------------------------------------------------
# Third-party imports
# ---------------------------------------------------------------------------
import matplotlib
import serial
import serial.tools.list_ports
import tkinter as tk
from matplotlib.backends.backend_tkagg import FigureCanvasTkAgg
from matplotlib.figure import Figure
from tkinter import ttk

matplotlib.use("TkAgg")

# ---------------------------------------------------------------------------
# Constants
# ---------------------------------------------------------------------------

# All measurement key names.  These must match exactly what the AVR sends
# before the colon, e.g.  "DC Voltage (V):3.14\n"
MEASUREMENTS = [
    "DC Voltage (V)",
    "DC Current (A)",
    "DC Power (W)",
    "AC Voltage RMS (V)",
    "AC Current RMS (A)",
    "AC Frequency (Hz)",
    "AC Phase Difference (deg)",
    "AC Real Power (W)",
    "AC Reactive Power (VAR)",
    "AC Apparent Power (VA)",
    "AC Power Factor",
    "AC Peak-Peak Voltage (V)",
    "AC Peak-Peak Current (A)",
]

# Colour palette (dark theme)
COLOR_BG = "#1e1e2e"
COLOR_PANEL = "#2a2a3e"
COLOR_ACCENT = "#7aa2f7"
COLOR_GREEN = "#9ece6a"
COLOR_ORANGE = "#e0af68"
COLOR_RED = "#f7768e"
COLOR_TEXT = "#cdd6f4"
COLOR_SUBTEXT = "#6c7086"
COLOR_BORDER = "#3b3b52"

BAUD_RATE = 9600
POLL_INTERVAL_MS = 100
DEFAULT_TIME_RANGE_S = 60
MIN_TIME_RANGE_S = 10
MAX_TIME_RANGE_S = 3600
WINDOW_TITLE = "AC/DC Power Meter  ·  ENGG2800"
WINDOW_GEOMETRY = "1320x760"

# ---------------------------------------------------------------------------
# Application state
# ---------------------------------------------------------------------------

# Active serial connection (None when disconnected).
ser = None

# Timestamp of the very first data point received in this session.
first_data_time = None

# Per-measurement history: list of (offset_s, value, rtc_time) tuples.
# value is either a float or the string "UL".
history = {m: [] for m in MEASUREMENTS}

# Matplotlib annotation handle for the hover tooltip.
hover_annotation = None

# ---------------------------------------------------------------------------
# Serial helpers
# ---------------------------------------------------------------------------


def get_available_ports():
    """Return a list of available serial port device strings."""
    return [p.device for p in serial.tools.list_ports.comports()]


def refresh_ports():
    """Repopulate the port dropdown with currently available ports."""
    ports = get_available_ports()
    combo_port["values"] = ports
    if ports:
        combo_port.current(0)
    else:
        combo_port.set("No ports available")


def connect():
    """Open the selected serial port and begin polling for data."""
    global ser, first_data_time

    port = combo_port.get()
    if not port or port == "No ports available":
        set_status("No port selected", COLOR_ORANGE)
        return

    try:
        ser = serial.Serial(port, BAUD_RATE, timeout=1)
        first_data_time = None
        set_status(f"Connected  ·  {port}", COLOR_GREEN)
        btn_connect.config(state="disabled")
        btn_disconnect.config(state="normal")
        schedule_read()
    except serial.SerialException as exc:
        set_status(f"Failed: {exc}", COLOR_RED)


def disconnect():
    """Close the active serial connection."""
    global ser

    if ser:
        ser.close()
        ser = None

    set_status("Disconnected", COLOR_RED)
    btn_connect.config(state="normal")
    btn_disconnect.config(state="disabled")


def send_char():
    """Send a single character to the MCU.

    Demo 1 requirement: the MCU must echo back the capitalised version.
    """
    if not (ser and ser.is_open):
        set_status("Not connected", COLOR_ORANGE)
        return

    char = entry_char.get().strip()
    if char:
        ser.write(char[0].encode("utf-8"))
        label_sent.config(text=f"TX: {char[0]!r}")
        entry_char.delete(0, tk.END)


def send_time():
    """Send current PC time to the device so it can update its RTC.

    Format sent: TIME:YYYY-MM-DD HH:MM:SS\\n
    """
    if not (ser and ser.is_open):
        set_status("Not connected", COLOR_ORANGE)
        return

    timestamp = datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S")
    message = f"TIME:{timestamp}\n"
    ser.write(message.encode("utf-8"))
    set_status(f"Time synced  ·  {timestamp}", COLOR_GREEN)


# ---------------------------------------------------------------------------
# Serial reading
# ---------------------------------------------------------------------------


def schedule_read():
    """Schedule the next serial poll via Tkinter's event loop."""
    window.after(POLL_INTERVAL_MS, read_data)


def read_data():
    """Read one line from the serial port and update state.

    Expected format from AVR:
        <measurement key>:<value>\\n
    where value is a decimal number or the string "UL".
    """
    global ser, first_data_time

    if not (ser and ser.is_open):
        return

    try:
        raw = ser.readline()
        line = raw.decode("utf-8").strip()
    except (serial.SerialException, UnicodeDecodeError) as exc:
        set_status(f"Read error: {exc}", COLOR_RED)
        return

    if line:
        label_received.config(text=f"RX: {line}")

        if ":" in line:
            key, value_str = line.split(":", 1)
            key = key.strip()
            value_str = value_str.strip()

            now = time.time()
            if first_data_time is None:
                first_data_time = now
            offset_s = now - first_data_time
            rtc_time = datetime.datetime.now().strftime(
                "%Y-%m-%d %H:%M:%S"
            )

            if key in history:
                is_ul = value_str.upper() == "UL"
                value = "UL" if is_ul else float(value_str)
                history[key].append((offset_s, value, rtc_time))

                _update_measurement_label(key, value_str, is_ul)

                if key == var_plot.get():
                    update_plot()

    if ser and ser.is_open:
        schedule_read()


def _update_measurement_label(key, value_str, is_ul):
    """Refresh the live-measurement label for one key."""
    if key not in labels:
        return

    display_text = "UL" if is_ul else f"{float(value_str):.4g}"
    color = COLOR_ORANGE if is_ul else COLOR_GREEN
    labels[key].config(text=display_text, fg=color)


# ---------------------------------------------------------------------------
# Plot helpers
# ---------------------------------------------------------------------------


def get_time_range():
    """Return the validated time-range value (seconds) from the entry."""
    try:
        value = float(entry_range.get())
        return max(MIN_TIME_RANGE_S, min(MAX_TIME_RANGE_S, value))
    except ValueError:
        return DEFAULT_TIME_RANGE_S


def apply_time_range():
    """Validate and apply the time-range entry, then redraw the plot."""
    validated = int(get_time_range())
    entry_range.delete(0, tk.END)
    entry_range.insert(0, str(validated))
    update_plot()


def update_plot(*_args):
    """Redraw the live chart for the currently selected measurement."""
    global hover_annotation

    selected = var_plot.get()
    t_range = get_time_range()
    all_points = history[selected]

    if all_points:
        latest = all_points[-1][0]
        visible = [
            (o, v, r)
            for o, v, r in all_points
            if latest - o <= t_range
        ]
    else:
        visible = []

    ax.clear()
    _style_axes(selected)

    normal = [(o, v, r) for o, v, r in visible if v != "UL"]
    ul_pts = [(o, v, r) for o, v, r in visible if v == "UL"]

    if normal:
        x_vals = [p[0] for p in normal]
        y_vals = [p[1] for p in normal]
        ax.plot(
            x_vals, y_vals,
            color=COLOR_ACCENT, linewidth=1.4, zorder=2,
        )
        ax.scatter(
            x_vals, y_vals,
            color=COLOR_ACCENT, s=22, zorder=3,
            label="Measurement",
        )

    if ul_pts:
        y_bottom = min((p[1] for p in normal), default=0)
        ax.scatter(
            [p[0] for p in ul_pts],
            [y_bottom] * len(ul_pts),
            color=COLOR_RED, marker="x", s=70, linewidths=2,
            zorder=4, label="Under Limit (UL)",
        )

    if normal or ul_pts:
        ax.legend(
            facecolor=COLOR_PANEL,
            edgecolor=COLOR_BORDER,
            labelcolor=COLOR_TEXT,
            fontsize=8,
        )

    hover_annotation = ax.annotate(
        "",
        xy=(0, 0),
        xytext=(14, 14),
        textcoords="offset points",
        bbox=dict(
            boxstyle="round,pad=0.4",
            fc="#2a2a3e",
            ec=COLOR_ACCENT,
            alpha=0.95,
        ),
        fontsize=8,
        color=COLOR_TEXT,
        visible=False,
    )

    canvas.draw()


def _style_axes(title):
    """Apply consistent dark-theme styling to the axes."""
    ax.set_facecolor("#12121e")
    ax.set_title(title, color=COLOR_TEXT, fontsize=10, pad=8)
    ax.set_xlabel("Time offset (s)", color=COLOR_SUBTEXT, fontsize=8)
    ax.set_ylabel(title, color=COLOR_SUBTEXT, fontsize=8)
    ax.tick_params(colors=COLOR_SUBTEXT, labelsize=7)
    for spine in ax.spines.values():
        spine.set_edgecolor(COLOR_BORDER)
    ax.grid(True, color=COLOR_BORDER, linewidth=0.5, alpha=0.6)


# ---------------------------------------------------------------------------
# Hover tooltip
# ---------------------------------------------------------------------------


def on_hover(event):
    """Show a tooltip with exact RTC time and value near the cursor."""
    if hover_annotation is None or event.inaxes != ax:
        return

    selected = var_plot.get()
    t_range = get_time_range()
    all_points = history[selected]

    if not all_points or event.xdata is None:
        return

    latest = all_points[-1][0]
    visible = [
        (o, v, r)
        for o, v, r in all_points
        if latest - o <= t_range
    ]

    if not visible:
        return

    closest = min(visible, key=lambda p: abs(p[0] - event.xdata))
    offset_s, value, rtc_time = closest
    value_str = "UL" if value == "UL" else f"{value:.6g}"
    y_pos = value if value != "UL" else ax.get_ylim()[0]

    hover_annotation.xy = (offset_s, y_pos)
    hover_annotation.set_text(
        f"RTC time : {rtc_time}\n"
        f"Offset   : {offset_s:.2f} s\n"
        f"Value    : {value_str}"
    )
    hover_annotation.set_visible(True)
    canvas.draw_idle()


def on_leave(_event):
    """Hide the hover tooltip when the cursor leaves the axes."""
    if hover_annotation:
        hover_annotation.set_visible(False)
        canvas.draw_idle()


# ---------------------------------------------------------------------------
# UI helpers
# ---------------------------------------------------------------------------


def set_status(message, color=COLOR_TEXT):
    """Update the connection-status label text and colour."""
    label_status.config(text=message, fg=color)


def make_button(parent, text, command, bg, **kwargs):
    """Return a styled flat Button widget."""
    return tk.Button(
        parent,
        text=text,
        command=command,
        bg=bg,
        fg="white",
        activebackground=bg,
        relief="flat",
        bd=0,
        padx=10,
        pady=4,
        font=("Consolas", 9),
        cursor="hand2",
        **kwargs,
    )


# ---------------------------------------------------------------------------
# UI construction
# ---------------------------------------------------------------------------


def build_top_bar(parent):
    """Build the port-selection and connection-control bar."""
    global combo_port, btn_connect, btn_disconnect, label_status

    frame = tk.Frame(
        parent,
        bg=COLOR_PANEL,
        pady=8,
        padx=12,
        highlightbackground=COLOR_BORDER,
        highlightthickness=1,
    )
    frame.pack(fill="x", side="top")

    tk.Label(
        frame,
        text="Port:",
        bg=COLOR_PANEL,
        fg=COLOR_TEXT,
        font=("Consolas", 9),
    ).pack(side="left")

    combo_port = ttk.Combobox(
        frame, width=20, state="readonly", font=("Consolas", 9),
    )
    combo_port.pack(side="left", padx=6)

    make_button(
        frame, "⟳  Refresh", refresh_ports, COLOR_BORDER,
    ).pack(side="left", padx=4)

    btn_connect = make_button(frame, "Connect", connect, "#27ae60")
    btn_connect.pack(side="left", padx=4)

    btn_disconnect = make_button(
        frame, "Disconnect", disconnect, "#c0392b", state="disabled",
    )
    btn_disconnect.pack(side="left", padx=4)

    label_status = tk.Label(
        frame,
        text="Disconnected",
        fg=COLOR_RED,
        bg=COLOR_PANEL,
        font=("Consolas", 9, "bold"),
    )
    label_status.pack(side="left", padx=14)

    make_button(
        frame, "⏱  Sync PC Time", send_time, "#8e44ad",
    ).pack(side="right", padx=6)


def build_send_bar(parent):
    """Build the Demo-1 send-character test bar."""
    global entry_char, label_sent, label_received

    frame = tk.Frame(parent, bg=COLOR_BG, pady=6, padx=12)
    frame.pack(fill="x")

    tk.Label(
        frame,
        text="Send char:",
        bg=COLOR_BG,
        fg=COLOR_SUBTEXT,
        font=("Consolas", 8),
    ).pack(side="left")

    entry_char = tk.Entry(
        frame,
        width=5,
        bg=COLOR_PANEL,
        fg=COLOR_TEXT,
        insertbackground=COLOR_TEXT,
        font=("Consolas", 9),
        relief="flat",
        highlightbackground=COLOR_BORDER,
        highlightthickness=1,
    )
    entry_char.pack(side="left", padx=6)

    make_button(
        frame, "Send", send_char, COLOR_ACCENT,
    ).pack(side="left", padx=2)

    label_sent = tk.Label(
        frame, text="TX: —", bg=COLOR_BG,
        fg=COLOR_SUBTEXT, font=("Consolas", 8),
    )
    label_sent.pack(side="left", padx=12)

    label_received = tk.Label(
        frame, text="RX: —", bg=COLOR_BG,
        fg=COLOR_SUBTEXT, font=("Consolas", 8),
    )
    label_received.pack(side="left", padx=4)


def build_measurement_panel(parent):
    """Build the left panel showing all live measurement values."""
    frame = tk.LabelFrame(
        parent,
        text=" Live Measurements ",
        bg=COLOR_PANEL,
        fg=COLOR_ACCENT,
        padx=10,
        pady=8,
        font=("Consolas", 9, "bold"),
        width=300,
        relief="flat",
        highlightbackground=COLOR_BORDER,
        highlightthickness=1,
    )
    frame.pack(side="left", fill="y", padx=(0, 10))
    frame.pack_propagate(False)

    for measurement in MEASUREMENTS:
        row = tk.Frame(frame, bg=COLOR_PANEL)
        row.pack(fill="x", pady=2)

        tk.Label(
            row,
            text=measurement,
            bg=COLOR_PANEL,
            fg=COLOR_TEXT,
            font=("Consolas", 8),
            anchor="w",
            width=26,
        ).pack(side="left")

        value_label = tk.Label(
            row,
            text="—",
            bg=COLOR_PANEL,
            fg=COLOR_SUBTEXT,
            font=("Consolas", 8, "bold"),
            anchor="e",
            width=9,
        )
        value_label.pack(side="right")
        labels[measurement] = value_label


def build_chart_panel(parent):
    """Build the right panel containing plot controls and the live chart."""
    global ax, canvas, var_plot, entry_range

    frame = tk.LabelFrame(
        parent,
        text=" Live Chart ",
        bg=COLOR_PANEL,
        fg=COLOR_ACCENT,
        padx=8,
        pady=8,
        font=("Consolas", 9, "bold"),
        relief="flat",
        highlightbackground=COLOR_BORDER,
        highlightthickness=1,
    )
    frame.pack(side="left", fill="both", expand=True)

    ctrl = tk.Frame(frame, bg=COLOR_PANEL)
    ctrl.pack(fill="x", pady=(0, 8))

    tk.Label(
        ctrl,
        text="Measurement:",
        bg=COLOR_PANEL,
        fg=COLOR_TEXT,
        font=("Consolas", 8),
    ).pack(side="left")

    var_plot = tk.StringVar(value=MEASUREMENTS[0])
    ttk.Combobox(
        ctrl,
        textvariable=var_plot,
        values=MEASUREMENTS,
        width=28,
        state="readonly",
        font=("Consolas", 8),
    ).pack(side="left", padx=6)
    var_plot.trace_add("write", update_plot)

    tk.Label(
        ctrl,
        text="  Time range (s):",
        bg=COLOR_PANEL,
        fg=COLOR_TEXT,
        font=("Consolas", 8),
    ).pack(side="left")

    entry_range = tk.Entry(
        ctrl,
        width=6,
        bg=COLOR_BG,
        fg=COLOR_TEXT,
        insertbackground=COLOR_TEXT,
        font=("Consolas", 9),
        relief="flat",
        highlightbackground=COLOR_BORDER,
        highlightthickness=1,
    )
    entry_range.insert(0, str(DEFAULT_TIME_RANGE_S))
    entry_range.pack(side="left", padx=6)

    make_button(
        ctrl, "Apply", apply_time_range, COLOR_BORDER,
    ).pack(side="left", padx=2)

    tk.Label(
        ctrl,
        text="  ● Normal   ✕ Under Limit (UL)",
        bg=COLOR_PANEL,
        fg=COLOR_SUBTEXT,
        font=("Consolas", 7),
    ).pack(side="right", padx=8)

    fig = Figure(figsize=(7.5, 4.8), facecolor=COLOR_PANEL)
    ax = fig.add_subplot(111)
    ax.set_facecolor("#12121e")
    fig.subplots_adjust(left=0.1, right=0.97, top=0.92, bottom=0.12)

    canvas = FigureCanvasTkAgg(fig, master=frame)
    canvas.get_tk_widget().configure(bg=COLOR_PANEL, highlightthickness=0)
    canvas.get_tk_widget().pack(fill="both", expand=True)

    canvas.mpl_connect("motion_notify_event", on_hover)
    canvas.mpl_connect("axes_leave_event", on_leave)


def configure_combobox_style():
    """Apply dark-theme styling to all ttk Combobox widgets."""
    style = ttk.Style()
    style.theme_use("clam")
    style.configure(
        "TCombobox",
        fieldbackground=COLOR_PANEL,
        background=COLOR_PANEL,
        foreground=COLOR_TEXT,
        selectbackground=COLOR_ACCENT,
        arrowcolor=COLOR_TEXT,
    )


# ---------------------------------------------------------------------------
# Entry point
# ---------------------------------------------------------------------------


def main():
    """Build and run the Power Meter GUI application."""
    global window, labels

    window = tk.Tk()
    window.title(WINDOW_TITLE)
    window.geometry(WINDOW_GEOMETRY)
    window.configure(bg=COLOR_BG)
    window.resizable(True, True)

    configure_combobox_style()

    labels = {}

    build_top_bar(window)
    build_send_bar(window)

    frame_main = tk.Frame(window, bg=COLOR_BG)
    frame_main.pack(fill="both", expand=True, padx=10, pady=(0, 10))

    build_measurement_panel(frame_main)
    build_chart_panel(frame_main)

    refresh_ports()
    update_plot()

    window.mainloop()


if __name__ == "__main__":
    main()
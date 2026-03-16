import tkinter as tk
from tkinter import ttk
import serial
import serial.tools.list_ports

# Global variables
ser = None


# Get list of available serial ports
def get_ports():
    ports = serial.tools.list_ports.comports()
    return [p.device for p in ports]


# Refresh the port dropdown
def refresh_ports():
    port_list = get_ports()
    combo_port["values"] = port_list
    if port_list:
        combo_port.current(0)
    else:
        combo_port.set("No ports available")


# Connect to selected serial port
def connect():
    global ser
    port = combo_port.get()
    try:
        ser = serial.Serial(port, 9600, timeout=1)
        label_status.config(text="Status: Connected", fg="green")
        btn_connect.config(state="disabled")
        btn_disconnect.config(state="normal")
        read_data()
    except Exception:
        label_status.config(text="Status: Connection failed", fg="red")


# Disconnect from serial port
def disconnect():
    global ser
    if ser:
        ser.close()
        ser = None
    label_status.config(text="Status: Disconnected", fg="red")
    btn_connect.config(state="normal")
    btn_disconnect.config(state="disabled")


# Send a single character to MCU, display response
def send_char():
    if ser and ser.is_open:
        char = entry_char.get()
        if char:
            ser.write(char[0].encode("utf-8"))
            label_sent.config(text="Sent: " + char[0])
            entry_char.delete(0, tk.END)
    else:
        label_status.config(text="Status: Not connected", fg="orange")


# Read response from MCU every 100ms
def read_data():
    if ser and ser.is_open:
        try:
            line = ser.readline().decode("utf-8").strip()
            if line:
                label_received.config(text="Received: " + line)
        except Exception:
            pass
        window.after(100, read_data)


# Create main window
window = tk.Tk()
window.title("AC/DC Power Meter")
window.geometry("600x200")
window.resizable(width=True, height=True)

# Top bar: port selection and buttons
frame_top = tk.Frame(window, pady=6, padx=10)
frame_top.pack(fill="x")

tk.Label(frame_top, text="Port:").pack(side="left")

combo_port = ttk.Combobox(frame_top, width=20, state="readonly")
combo_port.pack(side="left", padx=4)

tk.Button(frame_top, text="Refresh", command=refresh_ports).pack(side="left", padx=4)

btn_connect = tk.Button(frame_top, text="Connect", command=connect)
btn_connect.pack(side="left", padx=4)

btn_disconnect = tk.Button(frame_top, text="Disconnect", command=disconnect, state="disabled")
btn_disconnect.pack(side="left", padx=4)

label_status = tk.Label(frame_top, text="Status: Disconnected", fg="red")
label_status.pack(side="left", padx=10)

# Second bar: send character and show response
frame_send = tk.Frame(window, pady=6, padx=10)
frame_send.pack(fill="x")

tk.Label(frame_send, text="Send character:").pack(side="left")

entry_char = tk.Entry(frame_send, width=5)
entry_char.pack(side="left", padx=4)

tk.Button(frame_send, text="Send", command=send_char).pack(side="left", padx=4)

label_sent = tk.Label(frame_send, text="Sent: —", fg="gray")
label_sent.pack(side="left", padx=10)

label_received = tk.Label(frame_send, text="Received: —", fg="gray")
label_received.pack(side="left", padx=10)

# Initialise port list
refresh_ports()

# Start the window (always at the bottom)
window.mainloop()
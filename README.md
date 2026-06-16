# ⚡ Digital Power Meter (ENGG2800)

> **ENGG2800 Group Project:** This repository is a  mirror of a team project developed for **ENGG2800**. 

A high precision digital power meter designed to sample voltage and current telemetry from a load, calculate real time electrical parameters, and stream data to a localised GUI for monitoring and analysis. The system bridges custom hardware instrumentation with embedded processing and local host application interfaces.

---

## 👥 The Engineering Team & Contributions

Individual technical ownership is broken down below:

## 👥 The Engineering Team & Contributions

This project was developed by a collaborative 4 person engineering team. Individual technical ownership during the core implementation phase was structured as follows:

* **Joseph Lee (Firmware & Analogue Electronics Engineer):** Engineered the core measurement firmware, designed and implemented the signal conditioning analogue circuits, and performed the final hardware schematic and PCB design audits to ensure production compliance. Compiled and structured the final engineering Bill of Materials.
* **Software Engineer:** Developed the desktop Graphical User Interface (GUI), built the data parsing serial communication protocols, and integrated secondary hardware timekeeping features.
* **Display Systems Engineer:** Owned the low level firmware drivers and hardware interfacing for the localised system LCD menus.
* **PCB Design Engineer:** Handled the physical PCB layout routing, electronic component soldering, and implemented safe switching circuitry for wide-range current measurements.

---

## My Contributions

### 1. Analogue Measurement Circuit Design
* **Signal Conditioning Pipeline:** Researched analogue to digital converter constraints to design and physically implement a five stage signal conditioning pipeline to safely process accurate AC and DC voltage and current waveforms.
* **Iterative Design Process:** Conducted rigorous prototyping and design iterations, evaluating various topologies for scaling and biasing before selecting the optimal layout configuration.
* **Hardware Debugging:** Diagnosed and resolved circuit loading effects during breadboard prototyping by implementing active operational amplifier buffering stages.
* **Power Subsystem Redesign:** Resolved amplifier saturation limits by restructuring the power subsystem, upgrading the supply rails to 10V and integrating a 5V regulator to provide clean power to the ATmega microcontroller and display hardware.
* **Simulation Verification:** Modelled the full DC and AC voltage and current circuits using simulation software to validate the operational theory prior to board production.

### 2. Measurement Firmware Engineering
* **Architecture Selection:** Conducted performance trade offs between polling and interrupt routines, opting for an interrupt based sampling architecture to guarantee deterministic data collection and overall system responsiveness.
* **Digital Signal Processing Algorithms:** Developed low level measurement firmware to execute real time calculations, progressing from raw DC sampling to complex True Root Mean Square accumulation loops for AC electrical telemetry.
* **Precision Calculations:** Engineered efficient frequency tracking routines within the firmware to drive precise power factor and phase angle measurements.
* **Telemetry Routing:** Designed serial communication protocols to securely stream calculated metrics over to the host interface monitor.

### 3. PCB Review and Documentation
* **Design Audits:** Spearheaded comprehensive audits of the physical hardware schematic against technical standards to preempt production failures and layout errors.
* **Bill of Materials Generation:** Compiled and structured the final engineering Bill of Materials, cross referencing component datasheets to ensure exact footprint matches and proper part sourcing for assembly.

## Repository Architecture

The codebase has been stripped of legacy test files and is organised strictly around production grade deliverables:
```text
Power-Meter/
├── .gitignore
├── embedded/           # Firmwire Files
│   ├── lcd/            # Display drivers
│   └── measurement.X/  # Core firmware workspace
└── lab_pc/             # GUI Files
    └── GUI_new.py      # Python based user interface for telemetry rendering
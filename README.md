🚦 Traffic Signal Controller with Emergency Override

A Finite State Machine (FSM)-based traffic signal controller designed using Verilog HDL and implemented in Xilinx Vivado 2026.1.

📌 Project Overview

This project implements an automated traffic signal controller with an emergency override feature. The controller manages traffic signal sequencing using a Finite State Machine (FSM).

The emergency override functionality is designed to prioritize emergency vehicle movement over normal traffic signal operation.

🎯 Objectives

- Design an FSM-based traffic signal controller.
- Implement automatic traffic light sequencing.
- Integrate an emergency override mechanism.
- Develop modular Verilog HDL code.
- Verify the design through simulation using a Verilog testbench.

⚙️ Technologies Used

Technology| Purpose
Verilog HDL| RTL design
Xilinx Vivado 2026.1| FPGA design and implementation
Artix-7| Target FPGA platform
FSM| Control architecture

🏗️ Project Architecture

The design consists of three main Verilog modules:

1. clock_divider.v – Generates the timing signal for the controller.
2. traffic_fsm.v – Implements the finite state machine and traffic control logic.
3. traffic_signal_top.v – Top-level module connecting the design components.

🚨 Key Features

- Automatic traffic signal sequencing.
- Finite State Machine-based control.
- Emergency override functionality.
- Modular RTL architecture.
- Simulation testbench for functional verification.

📂 Repository Structure

Traffic-Signal-Controller/
│
├── clock_divider.v
├── traffic_fsm.v
├── traffic_signal_top.v
├── traffic_signal_tb.v
│
├── traffic_signal.xdc
├── traffic_signal_emergency.xpr
│
├── design_1.bd
└── design_2.bd

🧪 Simulation and Implementation

The design includes a Verilog testbench:

- "traffic_signal_tb.v"

The project was developed using Xilinx Vivado, with synthesis and implementation completed as part of the FPGA design workflow.

Simulation waveforms and implementation reports can be added to this repository.

🔧 Tools and Platform

- HDL: Verilog
- Design Software: Xilinx Vivado 2026.1
- Target FPGA: Artix-7
- Design Methodology: RTL Design and FSM

🚀 Future Improvements

- Add pedestrian crossing support.
- Introduce adaptive traffic timing.
- Integrate real-time vehicle detection.
- Extend the design for multiple intersections.
- Explore ASIC physical design implementation.

👨‍💻 Author

Saravanan G K

Electronics and Communication Engineering

Areas of Interest: VLSI Design | RTL Design | FPGA | Physical Design | Automotive Electronics

---

⭐ If you find this project interesting, consider starring the repository!

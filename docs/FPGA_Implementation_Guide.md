# FPGA Implementation Guide

## Smart Home Automation FPGA Pro

### Author

**Vayunandan Mishra**

---

# 1. Introduction

This document describes the complete FPGA implementation flow for the Smart Home Automation FPGA Pro project.

The design is developed using SystemVerilog and can be implemented on Xilinx FPGA development boards using Vivado Design Suite.

The project demonstrates:

* RTL Design
* Finite State Machines (FSM)
* PWM Generation
* Security Monitoring Logic
* Seven Segment Display Control
* FPGA Verification Flow

---

# 2. FPGA Implementation Flow

```text
SystemVerilog RTL
        ↓
Behavioral Simulation
        ↓
Functional Verification
        ↓
Constraint Assignment
        ↓
Synthesis
        ↓
Implementation
        ↓
Bitstream Generation
        ↓
FPGA Programming
        ↓
Hardware Validation
```

---

# 3. Recommended FPGA Boards

The design can be implemented on:

### Xilinx Boards

* Basys 3
* Nexys A7
* Arty A7
* Spartan-7 Boards
* Artix-7 Boards

### Educational Boards

* Basys 3 FPGA Trainer Kit
* Nexys A7 FPGA Board

---

# 4. Vivado Project Creation

## Step 1: Launch Vivado

Open:

```text
Vivado Design Suite
```

Select:

```text
Create New Project
```

---

## Step 2: Project Name

```text
Smart_Home_Automation_FPGA_Pro
```

Project Type:

```text
RTL Project
```

Enable:

```text
Do not specify sources at this time
```

---

## Step 3: Select FPGA Device

Example:

```text
Basys 3
XC7A35T-1CPG236C
```

Click Finish.

---

# 5. Add RTL Sources

Add files from:

```text
rtl/

home_fsm.sv
security_fsm.sv
priority_controller.sv
pwm_generator.sv
seven_segment.sv
uart_tx.sv
smart_home_top.sv
```

Use:

```text
Add Sources
→ Add Design Sources
```

---

# 6. Add Testbench

Add:

```text
tb/smart_home_top_tb.sv
```

Use:

```text
Add Sources
→ Add Simulation Sources
```

---

# 7. Add Constraints File

Add:

```text
constraints/smart_home.xdc
```

Use:

```text
Add Sources
→ Add Constraints
```

---

# 8. Example FPGA Pin Mapping

## Inputs

| Signal          | FPGA Resource |
| --------------- | ------------- |
| clk             | Clock Pin     |
| rst             | Push Button   |
| motion_sensor   | Switch SW0    |
| temp_high       | Switch SW1    |
| door_open       | Switch SW2    |
| security_enable | Switch SW3    |
| manual_override | Switch SW4    |

---

## Outputs

| Signal     | FPGA Resource |
| ---------- | ------------- |
| light_ctrl | LED0          |
| fan_pwm    | LED1          |
| ac_ctrl    | LED2          |
| alarm      | LED3          |

---

# 9. Example XDC Constraints

```tcl
## Clock
set_property PACKAGE_PIN W5 [get_ports clk]
set_property IOSTANDARD LVCMOS33 [get_ports clk]

## Reset
set_property PACKAGE_PIN U18 [get_ports rst]
set_property IOSTANDARD LVCMOS33 [get_ports rst]

## Switches
set_property PACKAGE_PIN V17 [get_ports motion_sensor]
set_property PACKAGE_PIN V16 [get_ports temp_high]
set_property PACKAGE_PIN W16 [get_ports door_open]
set_property PACKAGE_PIN W17 [get_ports security_enable]
set_property PACKAGE_PIN W15 [get_ports manual_override]

## LEDs
set_property PACKAGE_PIN U16 [get_ports light_ctrl]
set_property PACKAGE_PIN E19 [get_ports fan_pwm]
set_property PACKAGE_PIN U19 [get_ports ac_ctrl]
set_property PACKAGE_PIN V19 [get_ports alarm]
```

Note: Pin numbers may vary depending on FPGA board.

---

# 10. Behavioral Simulation

Run:

```text
Flow Navigator
→ Simulation
→ Run Behavioral Simulation
```

Verify:

* Occupancy Detection
* Climate Control
* Security Alarm
* PWM Operation
* Seven Segment Output

---

# 11. Synthesis

Run:

```text
Run Synthesis
```

Vivado generates:

* RTL Schematic
* Resource Utilization
* Design Statistics

Verify:

```text
Synthesis Completed Successfully
```

---

# 12. Implementation

Run:

```text
Run Implementation
```

Implementation performs:

* Placement
* Routing
* Timing Optimization

Verify:

```text
Implementation Completed Successfully
```

---

# 13. Timing Analysis

Open:

```text
Timing Summary
```

Verify:

### Setup Timing

```text
WNS > 0
```

### Hold Timing

```text
WHS > 0
```

Expected Result:

```text
Timing Met
```

---

# 14. Resource Utilization

Review:

```text
Utilization Report
```

Check:

* LUT Usage
* Flip-Flop Usage
* I/O Usage
* Clock Resources

Typical Utilization:

```text
Low FPGA Resource Consumption
```

Suitable for educational FPGA boards.

---

# 15. Generate Bitstream

Run:

```text
Generate Bitstream
```

Vivado creates:

```text
smart_home_top.bit
```

This file is used to configure the FPGA.

---

# 16. Program FPGA

Connect FPGA board.

Open:

```text
Open Hardware Manager
```

Select:

```text
Open Target
→ Auto Connect
```

Program Device:

```text
smart_home_top.bit
```

---

# 17. Hardware Verification

Test all scenarios.

### Occupancy Mode

Switch:

```text
motion_sensor = ON
```

Expected:

```text
light_ctrl LED ON
```

---

### Climate Mode

Switch:

```text
temp_high = ON
```

Expected:

```text
AC LED ON
Fan PWM Active
```

---

### Security Mode

Switch:

```text
security_enable = ON
door_open = ON
```

Expected:

```text
Alarm LED ON
```

---

# 18. Verification Results

| Test Case             | Result |
| --------------------- | ------ |
| Occupancy Detection   | PASS   |
| Climate Control       | PASS   |
| Security Alarm        | PASS   |
| PWM Fan Control       | PASS   |
| Seven Segment Display | PASS   |
| FSM Verification      | PASS   |

---

# 19. FPGA Deployment Without Hardware

If FPGA hardware is unavailable, project validation can still be demonstrated using:

### GTKWave

* Waveform Verification
* FSM State Validation
* Signal Monitoring

### Vivado Reports

* Synthesis Report
* Utilization Report
* Timing Report

These reports serve as proof of FPGA readiness.

---

# 20. Conclusion

The Smart Home Automation FPGA Pro project successfully demonstrates FPGA-based automation control using SystemVerilog RTL design.

The project integrates FSM design, security monitoring, PWM generation, seven-segment display interfacing, and FPGA implementation methodologies while maintaining a modular and scalable architecture suitable for academic, industrial, and portfolio applications.

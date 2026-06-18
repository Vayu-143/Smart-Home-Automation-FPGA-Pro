# Smart Home Automation FPGA Pro - Architecture

## System Overview

The Smart Home Automation FPGA Pro is an FPGA-based automation controller developed using SystemVerilog. The system automatically controls household appliances based on occupancy, temperature, and security conditions.

## Functional Blocks

### Sensor Inputs

* Motion Sensor
* Temperature Sensor
* Door Sensor
* Security Enable Switch
* Manual Override Switch

### Processing Blocks

* Home FSM
* Security FSM
* Priority Controller
* PWM Fan Controller
* UART Status Module
* Seven Segment Display Driver

### Outputs

* Light Control
* Fan PWM Control
* AC Control
* Security Alarm
* State Display

## Architecture Diagram

Sensors
↓
Priority Controller
↓
Home FSM
↓
Light Control
Fan Control
AC Control
↓
Security FSM
↓
Alarm
↓
Seven Segment Display
↓
UART Monitoring

## Design Advantages

* Real-time control
* Low latency operation
* Hardware-level automation
* Scalable architecture
* FPGA implementation ready

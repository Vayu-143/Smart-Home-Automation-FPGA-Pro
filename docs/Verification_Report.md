# Verification Report

## Verification Methodology

The Smart Home Automation FPGA Pro design was verified using Icarus Verilog and GTKWave.

## Test Cases

### Test Case 1: Occupancy Detection

Input:

* motion_sensor = 1

Expected:

* light_ctrl = 1

Result:
PASS

### Test Case 2: Climate Control

Input:

* temp_high = 1

Expected:

* ac_ctrl = 1
* fan_pwm active

Result:
PASS

### Test Case 3: Security Alarm

Input:

* security_enable = 1
* door_open = 1

Expected:

* alarm = 1

Result:
PASS

### Test Case 4: PWM Verification

Expected:

* fan_pwm toggles periodically

Result:
PASS

### Test Case 5: Seven Segment Display

Expected:

* State encoding changes with FSM state transitions

Result:
PASS

## Verification Summary

All test cases passed successfully.

Simulation completed without errors.

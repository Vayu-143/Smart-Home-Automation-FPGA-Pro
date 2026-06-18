# FSM Design

## Home FSM States

### State 0: IDLE

No occupancy detected.

### State 1: OCCUPIED

Motion detected inside room.

### State 2: CLIMATE

High temperature detected.

### State 3: ENERGY_SAVE

No occupancy for extended period.

## State Transition Table

| Current State | Condition          | Next State  |
| ------------- | ------------------ | ----------- |
| IDLE          | Motion Detected    | OCCUPIED    |
| OCCUPIED      | High Temperature   | CLIMATE     |
| OCCUPIED      | No Motion          | ENERGY_SAVE |
| CLIMATE       | Temperature Normal | OCCUPIED    |
| ENERGY_SAVE   | Motion Detected    | OCCUPIED    |

## Security FSM

### DISARMED

Security disabled.

### ARMED

Security monitoring enabled.

### INTRUSION

Unauthorized activity detected.

### ALARM

Alarm activated.

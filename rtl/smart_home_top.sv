module smart_home_top(

input logic clk,
input logic rst,

input logic motion_sensor,
input logic temp_high,
input logic door_open,
input logic security_enable,

input logic manual_override,

output logic light_ctrl,
output logic fan_pwm,
output logic ac_ctrl,
output logic alarm,

output logic [6:0] seg

);

logic [2:0] home_state;

logic [2:0] priority_state;

home_fsm HOME(
.clk(clk),
.rst(rst),
.motion_sensor(motion_sensor),
.temp_high(temp_high),
.state(home_state)
);

security_fsm SEC(
.clk(clk),
.rst(rst),
.security_enable(security_enable),
.door_open(door_open),
.motion_sensor(motion_sensor),
.alarm(alarm)
);

priority_controller PRI(
.security_alarm(alarm),
.manual_override(manual_override),
.temp_high(temp_high),
.motion_sensor(motion_sensor),
.priority_state(priority_state)
);

pwm_generator PWM(
.clk(clk),
.rst(rst),
.speed_level(2'b10),
.pwm_out(fan_pwm)
);

seven_segment DISP(
.state(home_state),
.seg(seg)
);

assign light_ctrl =
(home_state == 3'd1);

assign ac_ctrl =
(home_state == 3'd2);

endmodule
`timescale 1ns/1ps

module smart_home_top_tb;

/////////////////////////////////////////////////
// Signals
/////////////////////////////////////////////////

reg clk;
reg rst;

reg motion_sensor;
reg temp_high;
reg door_open;
reg security_enable;
reg manual_override;

wire light_ctrl;
wire fan_pwm;
wire ac_ctrl;
wire alarm;

wire [6:0] seg;

/////////////////////////////////////////////////
// DUT
/////////////////////////////////////////////////

smart_home_top DUT(

    .clk(clk),
    .rst(rst),

    .motion_sensor(motion_sensor),
    .temp_high(temp_high),
    .door_open(door_open),
    .security_enable(security_enable),

    .manual_override(manual_override),

    .light_ctrl(light_ctrl),
    .fan_pwm(fan_pwm),
    .ac_ctrl(ac_ctrl),
    .alarm(alarm),

    .seg(seg)

);

/////////////////////////////////////////////////
// Clock
/////////////////////////////////////////////////

initial
begin
    clk = 0;
end

always #5 clk = ~clk;

/////////////////////////////////////////////////
// Monitor
/////////////////////////////////////////////////

initial
begin

$display("------------------------------------------------------");
$display(" Smart Home Automation FPGA Pro Simulation");
$display("------------------------------------------------------");

$monitor(
"TIME=%0t Motion=%b Temp=%b Door=%b Security=%b Light=%b FanPWM=%b AC=%b Alarm=%b",
$time,
motion_sensor,
temp_high,
door_open,
security_enable,
light_ctrl,
fan_pwm,
ac_ctrl,
alarm
);

end

/////////////////////////////////////////////////
// Test Sequence
/////////////////////////////////////////////////

initial
begin

/////////////////////////////////////////////////
// Initialize
/////////////////////////////////////////////////

rst = 1;

motion_sensor = 0;
temp_high = 0;
door_open = 0;
security_enable = 0;
manual_override = 0;

/////////////////////////////////////////////////
// Reset
/////////////////////////////////////////////////

#20;
rst = 0;

/////////////////////////////////////////////////
// Test 1 Occupancy
/////////////////////////////////////////////////

$display("\nTEST 1 : OCCUPANCY MODE");

#20;
motion_sensor = 1;

#50;

if(light_ctrl)
    $display("PASS : Light ON when occupancy detected");
else
    $display("FAIL : Light not ON");

/////////////////////////////////////////////////
// Test 2 Climate Control
/////////////////////////////////////////////////

$display("\nTEST 2 : CLIMATE CONTROL");

temp_high = 1;

#80;

if(ac_ctrl)
    $display("PASS : AC ON during high temperature");
else
    $display("FAIL : AC not ON");

temp_high = 0;

/////////////////////////////////////////////////
// Test 3 Security Alarm
/////////////////////////////////////////////////

$display("\nTEST 3 : SECURITY ALARM");

security_enable = 1;

#20;

door_open = 1;

#40;

if(alarm)
    $display("PASS : Alarm activated");
else
    $display("FAIL : Alarm not activated");

door_open = 0;

/////////////////////////////////////////////////
// Test 4 Motion Intrusion
/////////////////////////////////////////////////

$display("\nTEST 4 : MOTION INTRUSION");

motion_sensor = 1;

#40;

motion_sensor = 0;

/////////////////////////////////////////////////
// Test 5 Manual Override
/////////////////////////////////////////////////

$display("\nTEST 5 : MANUAL OVERRIDE");

manual_override = 1;

#50;

manual_override = 0;

/////////////////////////////////////////////////
// Test 6 Energy Save
/////////////////////////////////////////////////

$display("\nTEST 6 : ENERGY SAVE");

motion_sensor = 0;

#10000;

/////////////////////////////////////////////////
// Finish
/////////////////////////////////////////////////

$display("\nSimulation Completed Successfully");

$finish;

end

/////////////////////////////////////////////////
// VCD Dump
/////////////////////////////////////////////////

initial
begin

$dumpfile("smart_home_pro.vcd");

$dumpvars(0,smart_home_top_tb);

end

endmodule
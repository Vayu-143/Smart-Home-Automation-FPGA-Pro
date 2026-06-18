module priority_controller(

input logic security_alarm,
input logic manual_override,
input logic temp_high,
input logic motion_sensor,

output logic [2:0] priority_state

);

always_comb
begin

if(security_alarm)
priority_state = 3'd4;

else if(manual_override)
priority_state = 3'd3;

else if(temp_high)
priority_state = 3'd2;

else if(motion_sensor)
priority_state = 3'd1;

else
priority_state = 3'd0;

end

endmodule
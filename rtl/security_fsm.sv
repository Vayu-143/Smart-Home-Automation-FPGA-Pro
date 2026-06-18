module security_fsm(

input logic clk,
input logic rst,

input logic security_enable,
input logic door_open,
input logic motion_sensor,

output logic alarm

);

typedef enum logic [2:0] {

DISARMED = 3'd0,
ARMED    = 3'd1,
INTRUSION= 3'd2,
ALARM    = 3'd3

} sec_state_t;

sec_state_t state,next_state;

always_ff @(posedge clk or posedge rst)
begin
    if(rst)
        state <= DISARMED;
    else
        state <= next_state;
end

always_comb
begin

next_state = state;

case(state)

DISARMED:
if(security_enable)
next_state = ARMED;

ARMED:
if(door_open || motion_sensor)
next_state = INTRUSION;

INTRUSION:
next_state = ALARM;

ALARM:
if(!security_enable)
next_state = DISARMED;

endcase

end

assign alarm = (state == ALARM);

endmodule
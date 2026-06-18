module seven_segment(

input logic [2:0] state,

output logic [6:0] seg

);

always_comb
begin

case(state)

3'd0: seg = 7'b1000000;
3'd1: seg = 7'b1111001;
3'd2: seg = 7'b0100100;
3'd3: seg = 7'b0110000;
3'd4: seg = 7'b0011001;

default:
seg = 7'b1111111;

endcase

end

endmodule
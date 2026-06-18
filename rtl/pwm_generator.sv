module pwm_generator(

input logic clk,
input logic rst,

input logic [1:0] speed_level,

output logic pwm_out

);

logic [7:0] counter;
logic [7:0] duty;

always_ff @(posedge clk or posedge rst)
begin
    if(rst)
        counter <= 0;
    else
        counter <= counter + 1;
end

always_comb
begin

case(speed_level)

2'b00: duty = 8'd64;    //25%
2'b01: duty = 8'd128;   //50%
2'b10: duty = 8'd192;   //75%
2'b11: duty = 8'd255;   //100%

endcase

end

assign pwm_out = (counter < duty);

endmodule
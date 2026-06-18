module uart_tx(

input logic clk,
input logic rst,

input logic start,

input logic [7:0] data_in,

output logic tx

);

always_ff @(posedge clk or posedge rst)
begin

if(rst)
tx <= 1'b1;

else if(start)
tx <= data_in[0];

end

endmodule
`timescale 1ns/ 1ns
module HiLo( inputA, outputHI, clk, reset, outputLO );

input [63:0]inputA;
input clk, reset ;

output reg[31:0] outputHI, outputLO;

reg [63:0]HiLo_reg;

always @(posedge clk or reset )
begin
if( reset )
	HiLo_reg = 64'd0;
else 
begin
	HiLo_reg = inputA;
end

assign outputHI = HiLo_reg[63:32];
assign outputLO = HiLo_reg[31:0];


end

endmodule

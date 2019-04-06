`timescale 1ns/ 1ns
module ALUControl( clk, signal, sltALU, sltShift, sltMul, sltMux ) ;

  parameter AND = 6'd36;
  parameter OR  = 6'd37;
  parameter ADD = 6'd32;
  parameter SUB = 6'd34;
  parameter SLT = 6'd42;
  parameter SRL = 6'd2;
  parameter SLL = 6'd0;
  parameter MULTU = 6'd25;

  parameter ALU = 6'd63;                             
  parameter SHIFT = 6'd62;   
  parameter HI = 6'd61;
  parameter LO = 6'd60;


input [5:0] signal ;
input clk ;
output  sltALU, sltShift, sltMul, sltMux;
wire clk ;
reg[5:0]  sltALU, sltShift, sltMul, sltMux ;

always @( posedge clk )
begin


sltMul = signal ;
sltALU = signal ;
sltShift = signal ;
if ( signal == AND || signal == OR || signal == ADD || signal == SUB || signal == SLT )
  sltMux = ALU ;
else if ( signal == SRL || signal == SLL )
  sltMux = SHIFT ;
else if ( signal == MULTU )
  sltMux = MULTU ;
else if ( signal == HI )
  sltMux = HI ;
else if ( signal == LO )
  sltMux = LO ;


end

endmodule

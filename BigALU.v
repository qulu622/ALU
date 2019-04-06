`timescale 1ns/ 1ns
module BigALU( a,b,signal,result,reset,clk);
  input reset,clk;
  input [5:0] signal;
  input [31:0] a,b;
  output [31:0] result;

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

  wire [5:0] signal_ALU,signal_SHIFT,signal_MULTU,sltMux;
  wire [63:0] MULTU_out;
  wire [31:0] ALU_out, SHIFT_out,HI_out,LO_out;

  ALUControl alucontorl1( clk, signal, signal_ALU, signal_SHIFT, signal_MULTU, sltMux );
  ALU alu1( a,b,signal_ALU,ALU_out,reset);
  MULTIPLIER multiplier1( a, b,MULTU_out, reset, clk, signal_MULTU);
  SHIFT shift1( signal_SHIFT,a, b,SHIFT_out,reset ) ;
  HiLo hilo1( MULTU_out, HI_out, clk, reset, LO_out);
  MUX mux1( sltMux, ALU_out, HI_out, LO_out, SHIFT_out, result);
  
endmodule
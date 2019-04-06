`timescale 1ns/ 1ns
module ALU( a,b,signal,result,reset);

  output [31:0] result ;
  input [31:0] a,b;
  input [5:0] signal ;
  input reset;
  
  wire cIn,ctrl,set ;
  wire [31:0] out,cOut;

  parameter AND = 6'd36;
  parameter OR  = 6'd37;
  parameter ADD = 6'd32;
  parameter SUB = 6'd34;
  parameter SLT = 6'd42;

  assign cIn = (signal == ADD) ? 1'b0:1'b1 ;
  assign ctrl = (signal == ADD) ? 1'b0:1'b1 ;
  
  ALUbit alu0( a[0],b[0],cIn,out[0],cOut[0],ctrl,signal,set,z);
  ALUbit alu1( a[1],b[1],cOut[0],out[1],cOut[1],ctrl,signal,1'b0,z);
  ALUbit alu2( a[2],b[2],cOut[1],out[2],cOut[2],ctrl,signal,1'b0,z);
  ALUbit alu3( a[3],b[3],cOut[2],out[3],cOut[3],ctrl,signal,1'b0,z);
  ALUbit alu4( a[4],b[4],cOut[3],out[4],cOut[4],ctrl,signal,1'b0,z);
  ALUbit alu5( a[5],b[5],cOut[4],out[5],cOut[5],ctrl,signal,1'b0,z);
  ALUbit alu6( a[6],b[6],cOut[5],out[6],cOut[6],ctrl,signal,1'b0,z);
  ALUbit alu7( a[7],b[7],cOut[6],out[7],cOut[7],ctrl,signal,1'b0,z);
  ALUbit alu8( a[8],b[8],cOut[7],out[8],cOut[8],ctrl,signal,1'b0,z);
  ALUbit alu9( a[9],b[9],cOut[8],out[9],cOut[9],ctrl,signal,1'b0,z);
  ALUbit alu10( a[10],b[10],cOut[9],out[10],cOut[10],ctrl,signal,1'b0,z);
  ALUbit alu11( a[11],b[11],cOut[10],out[11],cOut[11],ctrl,signal,1'b0,z);
  ALUbit alu12( a[12],b[12],cOut[11],out[12],cOut[12],ctrl,signal,1'b0,z);
  ALUbit alu13( a[13],b[13],cOut[12],out[13],cOut[13],ctrl,signal,1'b0,z);
  ALUbit alu14( a[14],b[14],cOut[13],out[14],cOut[14],ctrl,signal,1'b0,z);
  ALUbit alu15( a[15],b[15],cOut[14],out[15],cOut[15],ctrl,signal,1'b0,z);
  ALUbit alu16( a[16],b[16],cOut[15],out[16],cOut[16],ctrl,signal,1'b0,z);
  ALUbit alu17( a[17],b[17],cOut[16],out[17],cOut[17],ctrl,signal,1'b0,z);
  ALUbit alu18( a[18],b[18],cOut[17],out[18],cOut[18],ctrl,signal,1'b0,z);
  ALUbit alu19( a[19],b[19],cOut[18],out[19],cOut[19],ctrl,signal,1'b0,z);
  ALUbit alu20( a[20],b[20],cOut[19],out[20],cOut[20],ctrl,signal,1'b0,z);
  ALUbit alu21( a[21],b[21],cOut[20],out[21],cOut[21],ctrl,signal,1'b0,z);
  ALUbit alu22( a[22],b[22],cOut[21],out[22],cOut[22],ctrl,signal,1'b0,z);
  ALUbit alu23( a[23],b[23],cOut[22],out[23],cOut[23],ctrl,signal,1'b0,z);
  ALUbit alu24( a[24],b[24],cOut[23],out[24],cOut[24],ctrl,signal,1'b0,z);
  ALUbit alu25( a[25],b[25],cOut[24],out[25],cOut[25],ctrl,signal,1'b0,z);
  ALUbit alu26( a[26],b[26],cOut[25],out[26],cOut[26],ctrl,signal,1'b0,z);
  ALUbit alu27( a[27],b[27],cOut[26],out[27],cOut[27],ctrl,signal,1'b0,z);
  ALUbit alu28( a[28],b[28],cOut[27],out[28],cOut[28],ctrl,signal,1'b0,z);
  ALUbit alu29( a[29],b[29],cOut[28],out[29],cOut[29],ctrl,signal,1'b0,z);
  ALUbit alu30( a[30],b[30],cOut[29],out[30],cOut[30],ctrl,signal,1'b0,z);
  ALUbit alu31( a[31],b[31],cOut[30],out[31],cOut[31],ctrl,signal,1'b0,set);
    
  assign result = (reset == 1) ? 32'd0:out ;



endmodule
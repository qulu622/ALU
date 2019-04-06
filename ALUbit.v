`timescale 1ns/ 1ns
module ALUbit( a,b,cIn,out,cOut,ctrl,signal,less,set);

  output wire out,cOut,set;
  input a,b,cIn,ctrl,less;
  input [5:0] signal ;
  wire and_out,or_out,as_out,slt_out;
  
  parameter AND = 6'd36;
  parameter OR  = 6'd37;
  parameter ADD = 6'd32;
  parameter SUB = 6'd34;
  parameter SLT = 6'd42;
  

  and and1(and_out,a,b);
  or or1(or_out,a,b);
  ADD_SUB as1(a,b,cIn,as_out,cOut,ctrl);
  SLT slt1(slt_out,as_out,less,set);

  assign out = (signal == AND) ? and_out:
               (signal == OR) ? or_out:
               (signal == ADD || signal == SUB )? as_out:
               (signal == SLT)? slt_out : out;
endmodule
`timescale 1ns/ 1ns
module ADD_SUB( a,b,cIn,out,cOut,ctrl);
  
  output out,cOut;
  input a,b,cIn,ctrl;
  wire b_tmp ;

  assign b_tmp = b^ctrl;

  FullAdder fulladder(a,b_tmp,cIn,out,cOut);

endmodule
  
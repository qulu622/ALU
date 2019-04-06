`timescale 1ns/ 1ns
module FullAdder(a,b,cIn,out,cOut);
  
  output wire out,cOut;
  input a,b,cIn;

  assign out = a^b^cIn;
  assign cOut = a&b|a&cIn|b&cIn;
  
endmodule
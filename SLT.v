`timescale 1ns/ 1ns
module SLT(out,as_out,less,set) ;

  output out,set;
  input as_out,less;

  assign out = less ;
  assign set = as_out ;

endmodule


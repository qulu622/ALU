`timescale 1ns/ 1ns
module MUX( signal, ALU_input, Hi_input, Lo_input, shift_input, result );

input [5:0] signal; 
input [31:0]ALU_input, Hi_input, Lo_input, shift_input ;

output wire [31:0] result ;

parameter ALU = 6'd63;                             
parameter SHIFT = 6'd62 ;   
parameter MULTU = 6'd25 ;
parameter HI = 6'd61;
parameter LO = 6'd60;

assign result = ( signal == ALU) ? ALU_input :
                ( signal == SHIFT ) ? shift_input :
				( signal == HI ) ? Hi_input : 
				( signal == LO ) ? Lo_input : 32'd0 ;
				



endmodule

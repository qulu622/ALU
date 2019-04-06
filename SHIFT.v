`timescale 1ns/ 1ns
module SHIFT( type,number, movenum, result,reset  ) ;

input[31:0] number,movenum ;
input[5:0] type ;
input reset ;
output[31:0] result ;
wire[31:0] number,movenum ;
wire[5:0] type ;
wire[31:0] leftresult, rightresult ;
wire[31:0] lefttemp0, lefttemp1,lefttemp2,lefttemp3,lefttemp4,lefttemp5 ;
wire[31:0] righttemp0, righttemp1,righttemp2,righttemp3,righttemp4,righttemp5 ; 
wire reset ;
parameter SRL = 6'd2 ;

assign lefttemp0 = ( movenum[0] == 1 )? { number[30:0],1'b0 } : number ;
assign lefttemp1 = ( movenum[1] == 1 )? { lefttemp0[29:0],2'b0 }: lefttemp0 ;
assign lefttemp2 = ( movenum[2] == 1 )? { lefttemp1[27:0],4'b0 } : lefttemp1 ;
assign lefttemp3 = ( movenum[3] == 1 )? { lefttemp2[23:0],8'b0 } : lefttemp2 ;
assign lefttemp4 = ( movenum[4] == 1 )? { lefttemp3[15:0],16'b0 }: lefttemp3 ;
assign lefttemp5 = ( movenum[5] == 1 )?  32'b0 : lefttemp4 ;

assign righttemp0 = ( movenum[0] == 1 ) ? {1'b0, number[31:1]} : number ;
assign righttemp1 = ( movenum[1] == 1 ) ? {2'b0, righttemp0[31:2]} : righttemp0 ;
assign righttemp2 = ( movenum[2] == 1 ) ? {4'b0, righttemp1[31:4]} : righttemp1 ;
assign righttemp3 = ( movenum[3] == 1 ) ? {8'b0, righttemp2[31:8]} : righttemp2 ;
assign righttemp4 = ( movenum[4] == 1 ) ? {16'b0, righttemp3[31:16]} : righttemp3 ;
assign righttemp5 = ( movenum[5] == 1 ) ? 32'b0 : righttemp4 ;

assign result = (reset)? 0 : ( ( type == SRL )? righttemp5:lefttemp5)  ;





endmodule



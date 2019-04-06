`timescale 1ns/ 1ns
module Testbench;
  reg clk, reset;
  reg [5:0] signal;
  reg [31:0] a,b,ans;
  wire [31:0] result;
  integer fp_r, fp_r_ans, eof,tmp;

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

  initial 
  begin
    clk = 1'b1;
    forever #5 clk = ~clk;
  end
	
  initial 
  begin
    eof = 0;
    reset = 1'b1;
    #10;
    reset = 1'b0;

    fp_r = $fopen( "input.txt", "r" );

    fp_r_ans = $fopen( "ans.txt", "r" );

    $display( "Start\n" );
    eof = $fscanf(fp_r_ans, "%d", ans);
    while( eof != -1 ) 
    begin
      tmp = $fscanf(fp_r, "%d%d%d", signal, a, b );
      $write( "%d: Input: ", $time/10 );
      if ( signal == AND )
        $write( "AND(%d)", signal );
      else if ( signal == OR ) 
        $write( "OR(%d) ", signal );
      else if ( signal == ADD ) 
        $write( "ADD(%d) ", signal );
      else if ( signal == SUB ) 
        $write( "SUB(%d) ", signal );
      else if ( signal == SLT ) 
        $write( "SLT(%d) ", signal );
      else if ( signal == SRL ) 
        $write( "SRL(%d) ", signal );
      else if ( signal == SLL ) 
        $write( "SLL(%d) ", signal );
      else if ( signal == MULTU ) 
        $write( "MULTU(%d) ", signal );

      $display( "%d%d", a, b  );
      if ( signal == MULTU ) 
      begin
        #330;
        $display( "%d: MULTU End\n", $time/10 );
        #10;
        #10;
        $display( "                   Move Hi" );
        signal = HI ;
        #10;
        if ( ans == result )
          $display( "%d: Correct: Your answer is:%d,\n                      Correct answer is:%d\n", $time/10, result, ans );
        else
          $display( "%d: Wrong Answer: Your answer is:%d,\n                            Correct answer is:%d\n", $time/10, result, ans );
        $display( "                   Move Lo" );
        signal = LO ;
        eof = $fscanf(fp_r_ans, "%d", ans);
        #10;
        if ( ans == result )
          $display( "%d: Correct: Your answer is:%d,\n                      Correct answer is:%d\n", $time/10, result, ans );
        else
          $display( "%d: Wrong Answer: Your answer is:%d,\n                            Correct answer is:%d\n", $time/10, result, ans );
      end
      else 
      begin
        #10;
        if ( ans == result )
          $display( "%d: Correct: Your answer is:%d,\n                      Correct answer is:%d\n", $time/10, result, ans );
        else
          $display( "%d: Wrong Answer: Your answer is:%d,\n                            Correct answer is:%d\n", $time/10, result, ans );
      end
      eof = $fscanf(fp_r_ans, "%d", ans);
    end
    $fclose( fp_r );
    $fclose( fp_r_ans );
    $display( "Simulation End\n" );
    $stop();
  end
    
  BigALU test( a,b,signal,result,reset,clk);
  

endmodule
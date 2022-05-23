module top_fmul
();

  logic clk;
  logic [31:0] a;
  logic [31:0] b;
  logic [31:0] z;
  logic [31:0] gold;


  fmul mymul ( .a( a ), .b( b ), .z( z ) );


  // A clock for sequencing
  initial begin
    clk = 1'b0 ;
    while(1) begin
      #500 clk = 1'b0 ;
      #500 clk = 1'b1 ;
    end
  end

  // How long should our test run
  initial begin
    repeat(100) @(posedge clk) ;
    $finish(1) ;
  end

  //Driver Model
  initial begin

   a    = 32'h3f800000; // 1.000000000e+00
   b    = 32'h3f800000; // 1.000000000e+00
   gold = 32'h3f800000; // 1.000000000e+00
   @(negedge clk) ;
   a    = 32'hbf800000; // -1.000000000e+00
   b    = 32'h3f800000; // 1.000000000e+00
   gold = 32'hbf800000; // -1.000000000e+00
   @(negedge clk ) ;
   a    = 32'hbf800000; // -1.000000000e+00
   b    = 32'hbf800000; // -1.000000000e+00
   gold = 32'h3f800000; // 1.000000000e+00
   @(negedge clk ) ;
   a    = 32'h3eaaaaab; // 3.333333433e-01
   b    = 32'h3f800000; // 1.000000000e+00
   gold = 32'h3eaaaaab; // 3.333333433e-01
   @(negedge clk ) ;
   a    = 32'h3eaaaaab; // 3.333333433e-01
   b    = 32'h3eaaaaab; // 3.333333433e-01
   gold = 32'h3de38e39; // 1.111111119e-01
   @(negedge clk ) ;
   a    = 32'h3ffffff8; // 1.999999046e+00
   b    = 32'h3ffffff8; // 1.999999046e+00
   gold = 32'h407ffff0; // 3.999996185e+00
   @(negedge clk ) ;
   a    = 32'hbffffff8; // -1.999999046e+00
   b    = 32'h3ffffff8; // 1.999999046e+00
   gold = 32'hc07ffff0; // -3.999996185e+00
   @(negedge clk ) ;
   a    = 32'h3ffffff8; // 1.999999046e+00
   b    = 32'hbffffff8; // -1.999999046e+00
   gold = 32'hc07ffff0; // -3.999996185e+00
 @(negedge clk ) ;
   a    = 32'h3ffffff8; // 1.999999046e+00
   b    = 32'h3eaaaaab; // 3.333333433e-01
   gold = 32'h3f2aaaa5; // 6.666663289e-01
   @(negedge clk ) ;
   a    = 32'h00000000; // 0.000000000e+00
   b    = 32'h3f800000; // 1.000000000e+00
   gold = 32'h00000000; // 0.000000000e+00
   @(negedge clk ) ;
   a    = 32'h00000000; // 0.000000000e+00
   b    = 32'hbf800000; // -1.000000000e+00
   gold = 32'h80000000; // -0.000000000e+00
   @(negedge clk ) ;
   a    = 32'h00000000; // 0.000000000e+00
   b    = 32'h00000000; // 0.000000000e+00
   gold = 32'h00000000; // 0.000000000e+00
   @(negedge clk ) ;
   a    = 32'h3f800000; // 1.000000000e+00
   b    = 32'h00000000; // 0.000000000e+00
   gold = 32'h00000000; // 0.000000000e+00
   @(negedge clk ) ;
   a    = 32'hbf800000; // -1.000000000e+00
   b    = 32'h00000000; // 0.000000000e+00
   gold = 32'h80000000; // -0.000000000e+00

   @(negedge clk ) ;
   $finish(0);



  end

  //Test
  always @(posedge clk) begin
     #1;
     assert( ! $isunknown(z) ) ;
     assert(  (z == gold)   );
  end


  //Monitor
  always @(posedge clk) begin
     #1 ;
     $write( " %x", a) ;
     $write( " %x", b);
     $write( " -->" );
     $write( " %x", z);
     $write( " (%x)", gold );
     $write("\n");
  end

endmodule

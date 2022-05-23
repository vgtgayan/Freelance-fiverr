//; my $bW = 8;
//; my $hC= 5 ;

module top_fir ();

parameter bW=8;
parameter hC=5;
parameter hClog2=3;

   logic [bW-1:0] x;
   logic [bW-1:0] y;
   logic [bW-1:0] y_g;

   logic          clk;
   logic          rst;

   logic [bW-1:0]            h[hC:0] ;
   logic [bW+hClog2-1:0]     s ;

   genvar                  i ;
   int                     k;

   //; my $dut=generate("fir","my_fir");
   //`$dut->instantiate()` (.*) ;
   fir #(bW,hC) my_fir (.*);

   initial begin
      clk = 1'b0 ;
      while(1)
        #500 clk = ~clk ;
   end

   initial begin
      rst = 1'b0 ;
      #1 ;
      rst = 1'b0 ;
      repeat(10) @(posedge clk);
      #1;
      rst = 1'b1 ;
      repeat(20000) @(posedge clk) ;
      $finish(1) ;
   end // initial begin

   always @(negedge clk)
     x = $random() ;

   assign h[0] = x ;

   always @(posedge clk) begin
      #1 ;

/*      for( k=1 ; k <= hC ; k++ )
        $write("%d ",h[k]);

      $display( "--> %d  g:%d",y,y_g );
*/
//      $display( "%10t %d -- %d (%d)",$time(),x,y,y_g);

      firCorrect: assert(y_g == y) ;
   end


   int ii;
   always @(posedge clk) begin
      for( ii = 0 ; ii < hC ; ii++ )
        h[ii+1] <=  rst ? h[ii] : '0 ;
   end

   always @* begin
      s = 0 ;
      for( k=1 ; k <= hC ; k++ )
        s = s + h[k] ;
      s = s >> 3 ;
      y_g = s[bW-1:0];
   end

endmodule // fir
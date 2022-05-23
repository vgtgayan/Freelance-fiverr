module top_fifo  #(
                parameter int bW=16 ,
                parameter int eC=13
                ) ();

   logic [bW-1:0]             pushData;
   logic                      push;
   logic                      full;
   logic [bW-1:0]             popData;
   logic                      pop;
   logic                      empty;
   logic                      clk;
   logic                      rst;

   logic [bW-1:0]             q[$];

   int                        pushCnt ;
   int                        popCnt;


   fifo #(bW,eC) my_fifo( .* ) ;

   initial begin
      clk = 1'b0 ;
      while(1)
        #500 clk = ~clk ;
   end

   always @(posedge clk) begin
      if( push )
        pushCnt++;
      if( pop )
        popCnt++;
   end


   task spillFill( int n );
      repeat(n) begin
         for( int i = 0 ; i < eC ; i++ ) begin
            @(negedge clk);
            pushData = $random();
            push = 1'b0 ;
            pop  = rst && (empty === 1'b0) ? 1'b1 : 1'b0 ;
         end
         for( int i = 0 ; i < eC ; i++ ) begin
            @(negedge clk);
            pushData = $random();
            push = 1'b1 ;
            pop  = 1'b0 ;
         end
      end
   endtask

   task randomAbuse( int n );
      repeat(n) begin
         @(negedge clk);
         pushData = $random();
         push = rst && (full === 1'b0) ? $random()  : 1'b0 ;
         pop  = rst && (empty === 1'b0) ? $random() : 1'b0 ;
      end
   endtask
   initial begin
      pushCnt = 0 ;
      popCnt = 0 ;
      rst = 1'b1 ;
      #1 ;
      rst = 1'b0 ;
      repeat(10) @(posedge clk);
      rst = 1'b1 ;
      spillFill(10);
      randomAbuse(10000);
      $finish(1) ; // Note that the input is an error state
   end

   // Gold Model
   always @(posedge clk) begin
      if(push) begin
         //$write(" push %h",pushData);
        q.push_back(pushData);
      end
      if(pop) begin
         //$write(" pop %h %h" , popData, q[0] );
        q.pop_front();
      end
      //$display();

   end

   always @(posedge clk) begin
      #2 ;
//      $display( "s:%2d hws:%2d psh:%b pop:%b q:%h hd:%h", q.size(), my_fifo.occCnt , push, pop, q[0], popData  );
      assert( empty || (q[0] == popData) );
      assert( empty == (q.size() == 0 ));
      assert( full  == (q.size() == eC ));
   end

   final begin
      lazyPush: assert( pushCnt >= eC );
      lazyPop:  assert( popCnt >= eC );
      hungry:   assert( pushCnt >= popCnt );
      dropped:  assert( popCnt + eC >= pushCnt );
   end

endmodule

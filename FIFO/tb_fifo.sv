module tb_fifo();
                // Push interface
                 logic [7:0] pushData;
                 logic          push;
                 logic         full;
                // pop interface
                 logic [7:0] popData;
                 logic pop;
                 logic empty;

                // Globals
                 logic clk;
                 logic rst;


always #5 clk = ~clk;

fifo # (.bW(8), .eC(8)) dut ( .pushData (pushData),
                             .push (push),
                             .full (full) ,
                             .popData (popData),
                             .pop (pop),
                             .empty (empty),
                             .clk (clk),
                             .rst (rst)
                            );


initial begin

    clk = 0;
    rst = 1;
#100;
    rst = 0;
#10;
    Push(8'd5);
    Push(8'd4);
    Push(8'd3);
#10;
    Pop();
    Pop();
    Pop();
#100;
    $finish;

end

task Push (input logic [7:0] data);
    pushData = data;
    push = 1;
#10;
    push = 0;

endtask

task Pop ();
    pop = 1;
#10;
    pop = 0;

endtask

endmodule

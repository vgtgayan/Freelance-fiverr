module fifo #  (
                parameter int bW = 8 ,
                parameter int eC = 8 ,
                parameter int ptrW = $clog2(eC) ,
                parameter int cntW = $clog2(eC +1)
                )
                (
                // Push interface
                input logic [bW-1:0] pushData,
                input logic          push,
                output logic         full,
                // pop interface
                output logic [bW-1:0] popData,
                input logic pop,
                output logic empty,

                // Globals
                input logic clk,
                input logic rst

                );

// counters
logic [ptrW-1:0] push_ptr;
logic [ptrW-1:0] pop_ptr;
logic [cntW-1:0] item_cnt;

logic               writeEn;
logic   [bW-1:0]    TOS; // Top of the stack
logic   [bW-1:0]    pushData_reg;


// memory
memory #(bW,eC) mymem ( .readAddr (pop_ptr),
                        .writeAddr(push_ptr),
                        .writeData(pushData_reg),
                        .writeEn  (writeEn),
                        .readData (TOS),
                        .clk      (clk)
                      );
                
always_ff @(posedge clk or posedge rst) begin
    if (rst) begin
         push_ptr <= 8'hff;
         pop_ptr  <= 0;
         item_cnt <= 0;
         writeEn  <= 0;
    end
    else if (push) begin
        push_ptr <= push_ptr + 1;
        writeEn  <= 1;
        item_cnt <= item_cnt + 1;
    end
    else if (pop) begin
        pop_ptr  <= pop_ptr + 1;
        writeEn  <= 0;
        item_cnt <= item_cnt - 1;
    end
    else begin
        writeEn  <= 0;
    end

end


// full and empty logic
always_comb begin

    full = 0;
    empty = 0;
    if (item_cnt == eC)
        full = 1;
    if (item_cnt == 0)
        empty = 1;
end

// pushData reg
always_ff @ (posedge clk or posedge rst) begin

    if (rst)
        pushData_reg <= 0;
    else
        pushData_reg <= pushData;

end

// popData
always_ff @ (posedge clk or posedge rst) begin

    if (rst)
        popData <= 0;
    else if (pop)
        popData <= TOS;

end

endmodule

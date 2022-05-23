`timescale 1ns/1ns


module spi_master(reset,SCK,SSB,MOSI,MISO);
  input reset;
  input SCK;
  output logic SSB;
  output logic MOSI;
  input MISO;
  
 
//local parameters
parameter DATA_WIDTH = 8;

typedef enum logic[3:0] {IDLE,ACTIVE,COMPLETE} master_states;
master_states cur_state,nxt_state;

//local variables
logic [3:0] counter; // counter to track the no: of sent bits
//reg [DATA_WIDTH-1 :0] tx_reg,rx_reg;
//logic [2:0] sck_cnt;
logic shift;
logic clear;

  logic [DATA_WIDTH-1 :0] master_reg;
  logic mload;
  logic [7:0] mdata;


  always @(posedge SCK)
    begin
      if (SSB == 0)
        begin
          master_reg[7:1] <= master_reg[6:0];
          master_reg[0] <= MISO;
        end
      else if (mload)
        master_reg <= mdata;
    end
  
  assign MOSI = master_reg[7];
  
// Stimulus ---------------------
initial begin
#40;

//Write Address register
master_transmit(8'h01); //Command Byte 
master_transmit(8'haa); // Data byte

//Write Data in register 
master_transmit(8'h02); //Command Byte 
master_transmit(8'hbb); // Data byte

// Sample data
master_transmit(8'h04); //Command Byte 
master_transmit(8'h03); // Data byte
#100; // Addtional time to sample data

//Read status register
master_transmit(8'h05); //Command Byte 
master_transmit(8'hff); // Data byte

//Write Address register for read Data Out
master_transmit(8'h01); //Command Byte 
master_transmit(8'h00); // Data byte

// Read data out register
master_transmit(8'h03); //Command Byte 
master_transmit(8'hff); // Data byte

//Write Address register
master_transmit(8'h01); //Command Byte 
master_transmit(8'hdd); // Data byte
end


// State machine-------------------
always@ (*) begin

    nxt_state = cur_state;
    clear = 0;
    shift = 0;  
    //spmif.d_out_valid = 0;  

        case(cur_state)
            IDLE: begin
                if (mload) begin
                    shift = 1;
                    //spmif.d_out_valid = 0;
                    nxt_state = ACTIVE;
                end
            end
            ACTIVE: begin
                SSB = 0;
                if(counter != DATA_WIDTH) begin
                    shift = 1;
                    nxt_state = ACTIVE;
                end
                else begin
                   // spmif.d_out = rx_reg;
                     //spmif.d_out_valid = 1;
                    nxt_state = COMPLETE;
                end
            end
            COMPLETE: begin
                shift = 0;
                SSB = 1;
                clear = 1;
                nxt_state = IDLE;
            end
            default: begin
                nxt_state = COMPLETE;
            end
        endcase
end

// State transition
always_ff @(posedge SCK) begin : proc_cur_state
    if(reset) begin
        cur_state <= COMPLETE;
    end else begin
        cur_state <= nxt_state;
    end
end

// Counter behavior
always_ff @(posedge SCK) begin

if(reset | clear) begin 
  counter <= 0;
end
else if (shift == 1) begin 
  counter <= counter + 1;
end

end


//Tasks  
  task master_transmit(input [7:0] value);
    @ (posedge SCK);
      mload = 1;
      mdata = value;
    @ (posedge SCK);
      mload = 0;  
    @ (posedge SCK);

    
        @ (posedge SCK);
        @ (posedge SCK);
        @ (posedge SCK);
        @ (posedge SCK);
        @ (posedge SCK);
        @ (posedge SCK);
        @ (posedge SCK);
        @ (posedge SCK);
    
        @ (posedge SCK);
        @ (posedge SCK);
        @ (posedge SCK);
        @ (posedge SCK);


  endtask
  
endmodule
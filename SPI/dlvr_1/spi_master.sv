`timescale 1ns/1ps
//-----------------------------------------------------
//  Author: VGT Gayan
//  Design: SPI MASTER
//  Date:   2018-03-22
//  Project: SPI BUS
//-----------------------------------------------------
/*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  SPI MODE 2 (CPOL = 1, CPHA = 0)
        CHANGE DATA @ NEGEDGE
        read data @posedge
 
 reset-active low asyn reset
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~*/
//+++++++++++++++++++++++++++++++++++++++++++++++++++++
//Define Interface
//+++++++++++++++++++++++++++++++++++++++++++++++++++++
interface spi_if (input wire clk);

parameter DATA_WIDTH = 8;

logic reset;
logic [DATA_WIDTH-1 :0] d_in;
logic send_data;
logic [DATA_WIDTH-1 :0] d_out;
logic d_out_valid;
logic [DATA_WIDTH-1 :0] ext_data;
// SPI interface
logic MOSI;
logic MISO;
logic SCK;
logic SS;

//----------------------------------
// Mod port for SPI Master
//----------------------------------
modport master (
input clk,reset,d_in,send_data,MISO,
output d_out,d_out_valid,MOSI,SCK,SS
);
//----------------------------------
// Mod port for SPI Slave
//----------------------------------
modport slave (
input clk,reset,MOSI,SCK,SS,ext_data,
output MISO
);
//----------------------------------
// Mod port for Test bench V1
//----------------------------------
modport tb_v1 (
input d_out,d_out_valid,
output reset,d_in,send_data,ext_data
);


endinterface : spi_if

//+++++++++++++++++++++++++++++++++++++++++++++++++++++  
//Define SPI Master
//+++++++++++++++++++++++++++++++++++++++++++++++++++++
module spi_master (spi_if.master spmif);

//local parameters
parameter DATA_WIDTH = 8;

typedef enum logic[3:0] {IDLE,ACTIVE,COMPLETE} master_states;
master_states cur_state,nxt_state;

//local variables
integer counter;
reg [DATA_WIDTH-1 :0] tx_reg,rx_reg;
logic [2:0] sck_cnt;
logic shift;
logic clear;



//implementation++++++++++++++++++++++++++++++++++++++++++++++++++++++


always@ (*) begin

    nxt_state = cur_state;
    clear = 0;
    shift = 0;  
    spmif.d_out_valid = 0;  

        case(cur_state)
            IDLE: begin
                if (spmif.send_data) begin
                    shift = 1;
                    spmif.d_out_valid = 0;
                    nxt_state = ACTIVE;
                end
            end
            ACTIVE: begin
                spmif.SS = 0;
                if(counter != DATA_WIDTH) begin
                    shift = 1;
                    nxt_state = ACTIVE;
                end
                else begin
                    spmif.d_out = rx_reg;
                    spmif.d_out_valid = 1;
                    nxt_state = COMPLETE;
                end
            end
            COMPLETE: begin
                shift = 0;
                spmif.SS = 1;
                clear = 1;
                nxt_state = IDLE;
            end
            default: begin
                nxt_state = COMPLETE;
            end
        endcase
end

always_ff @(posedge spmif.clk or negedge spmif.reset) begin : proc_cur_state
    if(~(spmif.reset)) begin
        cur_state <= COMPLETE;
    end else begin
        cur_state <= nxt_state;
    end
end

// 
// SCK generation (SCK = clk/4)
always_ff @(negedge spmif.clk or posedge clear) begin
  if(clear==1) 
        begin  
            spmif.SCK <= 1; 
            sck_cnt <= 0;
        end
  else begin
    if(shift==1) begin
        sck_cnt <= sck_cnt + 1;
        if (sck_cnt == 1) begin
        spmif.SCK <= ~(spmif.SCK);
        sck_cnt <= 0;
        end
    end //shift
 end //rst
end //always


// sample rising edge (read MISO)
always_ff @(posedge spmif.SCK or posedge clear) begin 
    if (clear == 1) begin 
        counter = 0;
        rx_reg <= 8'h00;
    end
    else begin 
        rx_reg <= {spmif.MISO,rx_reg[DATA_WIDTH-1:1]}; // right shift
        counter <= counter + 1;
    end
end

// setup falling edge (shift MOSI)
always_ff @(negedge spmif.SCK or posedge clear) begin 
    if (clear == 1) begin 
        tx_reg <= 8'h00;
        //spmif.MOSI <= 0;
    end
    else begin 
        if (counter == 0) begin 
            tx_reg <= spmif.d_in; // Load data into tx_reg
            //spmif.MOSI <= tx_reg[0]; //LSB first
        end
        else begin 
            tx_reg <= {1'b0,tx_reg[DATA_WIDTH-1:1]}; // right shift
            //spmif.MOSI <= tx_reg[0];
        end

    end
end

// LSB first output 
assign spmif.MOSI = tx_reg[0];

endmodule

`timescale 1ns/1ps
//-----------------------------------------------------
//  Author: VGT Gayan
//  Design: SPI SLAVE
//  Date:   2018-03-22
//  Project: SPI BUS
//-----------------------------------------------------
/*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  SPI MODE 2 (CPOL = 1, CPHA = 0)
        CHANGE DATA @ NEGEDGE
        read data @posedge
 
 reset-active low asyn reset
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~*/
module spi_slave (spi_if.slave spsif);

//local parameters
parameter DATA_WIDTH = 8;

typedef enum {INIT,ACTIVE,COMPLETE,OPERATION} slave_states;
//typedef enum {} slave_sub_states;
slave_states cur_state,nxt_state;
//slave_sub_states sub_state;

//local variables
integer nbits; // No: of bits recieved
reg [DATA_WIDTH-1 :0] tx_reg,rx_reg;
logic [DATA_WIDTH-1 :0] tr_data; // slave transmit data

// Stimulus for testbench v1
initial begin 
	tr_data = 8'b11001010;  

end


//implementation++++++++++++++++++++++++++++++++++++++++++++++++++++++

assign spsif.MISO = (!spsif.SS) ? tx_reg[0] : 1'bz; // LSB first

// read data @posedge
always@ (posedge spsif.SCK or negedge spsif.reset) begin 
	if (spsif.reset == 0) begin 
		rx_reg <= 0;
		nbits = 0;

	end
	else if (spsif.SS == 0) begin 
		rx_reg <= {spsif.MOSI,rx_reg[DATA_WIDTH-1 :1]}; // right shift
		nbits = nbits + 1;
		if (nbits!= DATA_WIDTH) begin 

		end
		else begin 
			nbits = 0;
		end
	end
end

// CHANGE DATA @ NEGEDGE
always@ (negedge spsif.SCK or negedge spsif.reset) begin 
	if (spsif.reset == 0) begin 
		tx_reg <= 0;
	end
	else if (spsif.SS == 0) begin 
		if(nbits==0) begin 
			tx_reg <= tr_data; // transmit data load
		end
		else begin 
			tx_reg <= {1'b0,tx_reg[DATA_WIDTH-1 :1]};  // right shift
		end
	end
end


endmodule
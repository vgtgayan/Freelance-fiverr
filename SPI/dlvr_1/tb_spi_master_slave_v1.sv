`timescale 1ns/1ps
//-----------------------------------------------------
//  Author: VGT Gayan
//  Design: Test Bench SPI MASTER SLAVE
//  Date:   2018-03-22
//  Project: SPI BUS
//-----------------------------------------------------
//-----------------------------------------------------
//Define Global Parameters
//-----------------------------------------------------
parameter DATA_WIDTH = 8;
parameter CLK_PERIOD = 10; //ns


//+++++++++++++++++++++++++++++++++++++++++++++++++++++
//Define Test Program
//+++++++++++++++++++++++++++++++++++++++++++++++++++++
program test (spi_if.tb_v1 tif);

initial begin 

	tif.reset = 1;
	tif.d_in = 0;
	tif.send_data = 0;
	tif.ext_data = 0;
	#CLK_PERIOD;
	tif.reset = 0;
	#(CLK_PERIOD*10);
	tif.reset = 1;
	#CLK_PERIOD;
	tif.d_in = 8'b00111100;
	tif.send_data = 1;
	#CLK_PERIOD;
	tif.send_data = 0;


	#1000;
	$finish;

end

endprogram : test

//+++++++++++++++++++++++++++++++++++++++++++++++++++++
//Define Test Bench
//+++++++++++++++++++++++++++++++++++++++++++++++++++++
module tb_spi_master_slave_v1 ();

logic clk = 1;
always #((CLK_PERIOD)/2) clk = ~clk;
//----------------------------------
// Instantiate Interface, DUT, and test program
//----------------------------------
spi_if spiif (clk);
spi_master master (spiif);
spi_slave slave (spiif);
test tp (spiif);


endmodule : tb_spi_master_slave_v1
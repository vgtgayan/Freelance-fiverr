`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:51:30 08/15/2015 
// Design Name: 
// Module Name:    PROCE_COMPLETE 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module PROCE_COMPLETE(clk,DATA);

	input clk;
	wire[7:0] ADDRESS,DATA_BUS;
	wire M_read,M_write;
	output [7:0] DATA;
	
	assign DATA = ADDRESS;
	
	PROCE_INS_M PI(clk,ADDRESS,DATA_BUS,M_read,M_write);
	DATA_MEMORY DM(clk,ADDRESS,DATA_BUS,M_write,M_read);
	


endmodule

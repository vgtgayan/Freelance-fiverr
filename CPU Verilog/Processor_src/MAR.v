`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:08:42 07/17/2015 
// Design Name: 
// Module Name:    MAR 
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
module MAR(clk,ALU_out,Address_bus,set);

	input clk,set;     //inputs
	input [7:0] ALU_out;
	output [7:0] Address_bus;  //outputs
	reg [7:0] MA;          //reg
	 
	 
	assign Address_bus = MA;              // Address buss
	
	always @ (posedge clk) begin
		if(set)
			MA = ALU_out;                 // SET
	end

endmodule

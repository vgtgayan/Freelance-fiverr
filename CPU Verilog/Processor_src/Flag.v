`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    01:28:43 07/30/2015 
// Design Name: 
// Module Name:    Flag 
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
module Flag(clk,Z,Z_out,set_F);

   input clk,Z,set_F;
   output Z_out;   
   reg  MZ;
	
	always @ (posedge clk) begin
	  if (set_F)
	     MZ = Z;
	end
	
	assign Z_out = MZ;
	
endmodule

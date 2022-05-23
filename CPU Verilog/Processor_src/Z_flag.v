`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    01:02:18 07/30/2015 
// Design Name: 
// Module Name:    Z_flag 
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
module flag(clk,Z,N,Z_out,N_out);

   input clk,Z,N;
   output Z_out,N_out;   
   reg [1:0] M_NZ;
	
	always @ (posedge clk) begin
	 M_NZ = {N,Z};
	end
	
	assign Z_out = M_NZ[0];
	assign N_out = M_NZ[1];
endmodule

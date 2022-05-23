`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    01:37:17 07/30/2015 
// Design Name: 
// Module Name:    High_bit_MUX 
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
module High_bit_MUX(Z,JAMZ,J_out);

	input Z,JAMZ;
	output reg J_out;
	
	initial begin
		J_out = 1'b0;
	end
	
	always @ (*) begin
	if(JAMZ)
	    J_out = Z;
	else
	    J_out = 1'b0;
	end

endmodule

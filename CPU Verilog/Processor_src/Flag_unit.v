`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    01:55:17 07/30/2015 
// Design Name: 
// Module Name:    Flag_unit 
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
module Flag_unit(clk,Z,JAMZ,J_out,set_F);

    input clk,Z,JAMZ,set_F;
	 output J_out;
	 
	 wire Z_w;
	 
	 Flag F (clk,Z,Z_w,set_F);
	 High_bit_MUX MX (Z_w,JAMZ,J_out);
    
endmodule

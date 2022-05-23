`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:42:43 08/10/2015 
// Design Name: 
// Module Name:    PROCE_CM 
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
module PROCE_CM( input clk);

wire [7:0] INS_BUS,INS_ADDRESS;
 
 
 PROCE_DATA P( clk,INS_BUS,INS_ADDRESS);
 INSTRUCTION_MEMORY IM(INS_ADDRESS,INS_BUS );

endmodule

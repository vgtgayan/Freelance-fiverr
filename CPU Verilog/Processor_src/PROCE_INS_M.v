`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:05:42 08/10/2015 
// Design Name: 
// Module Name:    PROCE_INS_M 
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
module PROCE_INS_M(clk,ADDRESS,DATA_BUS,M_read,M_write);


input clk;
output [7:0] ADDRESS;
output M_write,M_read;
inout [7:0] DATA_BUS;

wire [7:0] INS_ADDRESS,INS_BUS;

PROCE P(INS_BUS,INS_ADDRESS,DATA_BUS,ADDRESS,M_read,M_write,clk);
INSTRUCTION_MEMORY IM(INS_ADDRESS,INS_BUS );

endmodule

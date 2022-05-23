`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:29:24 08/10/2015 
// Design Name: 
// Module Name:    PROCE_DATA 
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
module PROCE_DATA( clk,INS_BUS,INS_ADDRESS);

input [7:0] INS_BUS;
output [7:0] INS_ADDRESS;
input clk;
 
wire [7:0] DATA_BUS,ADDRESS;
wire M_read,M_write;

PROCE P(INS_BUS,INS_ADDRESS,DATA_BUS,ADDRESS,M_read,M_write,clk);
DATA_MEMORY DM(clk,ADDRESS, DATA_BUS,M_write,M_read);

endmodule

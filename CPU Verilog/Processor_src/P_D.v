`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:40:33 08/09/2015 
// Design Name: 
// Module Name:    P_D 
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
module P_D(clk,INS_ADDRESS,INS_BUS);

input [7:0] INS_BUS;
output [7:0] INS_ADDRESS; 
input clk;

wire [7:0] DATA_BUS,ADDRESS;
wire M_read,M_write,clk;

DATA_MEMORY D_M(clk,ADDRESS,DATA_BUS,M_write,M_read);
PROCE P(INS_BUS,INS_ADDRESS,DATA_BUS,ADDRESS,M_read,M_write,clk);


endmodule

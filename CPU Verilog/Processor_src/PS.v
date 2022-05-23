`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:25:23 08/10/2015 
// Design Name: 
// Module Name:    PS 
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
module PS(input clk);

wire [7:0] ADDRESS,DATA_BUS;
wire M_read,M_write;

PROCE_INS_M P (clk,ADDRESS,DATA_BUS,M_read,M_write);
DATA_MEMORY M(clk,ADDRESS,DATA_BUS,M_write,M_read);
endmodule

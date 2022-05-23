`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:46:43 08/09/2015 
// Design Name: 
// Module Name:    PROCE_RAM 
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
module PROCE_RAM(input  clk);

wire [7:0] INS_BUS,INS_ADDRESS,DATA_BUS,ADDRESS;
wire M_read,M_write;

DATA_MEMORY D_M(clk,ADDRESS,DATA_BUS,M_write,M_read);
INSTRUCTION_MEMORY I_M(INS_ADDRESS,INS_BUS );
PROCE P(INS_BUS,INS_ADDRESS,DATA_BUS,ADDRESS,M_read,M_write,clk);

endmodule

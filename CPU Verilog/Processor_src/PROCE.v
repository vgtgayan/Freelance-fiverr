`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:30:16 08/06/2015 
// Design Name: 
// Module Name:    PROCE 
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
module PROCE(INS_BUS,INS_ADDRESS,DATA_BUS,ADDRESS,M_read,M_write,clk);

    input [7:0] INS_BUS;
    input clk;
	 
    output [7:0] ADDRESS;
    output M_read;
    output M_write;
    output [7:0] INS_ADDRESS;
	 
    inout [7:0] DATA_BUS;
	 
	 wire[7:0] CNT_OUT,ADDR,MPC;
	 wire[4:0] C;
	 wire[1:0] B,M,J;
	 wire[3:0] ALU_sig;
	 wire  J_OUT,set_F;
	 
	 assign M_write = M[1];
	 assign M_read = M[0];
	 
	 ALU_REGISTERS AL_REG(INS_BUS,INS_ADDRESS,DATA_BUS,ADDRESS,clk,C,B,M,ALU_sig,J_OUT,CNT_OUT,J[1],set_F);
	 Control_unit CL(J_OUT,MPC,clk,ADDR,J,ALU_sig,C,B,M,set_F);
	 MPC_MUX MP(CNT_OUT,ADDR,MPC,J[0]);
	 
endmodule

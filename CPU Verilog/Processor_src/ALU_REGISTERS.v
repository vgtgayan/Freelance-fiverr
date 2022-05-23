`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:45:41 08/05/2015 
// Design Name: 
// Module Name:    ALU_REGISTERS 
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
module ALU_REGISTERS(INS_BUS,INS_ADDRESS,DATA_BUS,ADDRESS,clk,C,B,M,ALU_sig,J_OUT,CNT_OUT,JAMZ,set_F);

    input [7:0] INS_BUS; 
    input clk,JAMZ;
    input [4:0] C;
    input [1:0] B;
    input [1:0] M;
    input [3:0] ALU_sig;
	 input set_F;
	 
    output J_OUT;
    output [7:0] CNT_OUT;
	 output [7:0] ADDRESS;
	 output [7:0] INS_ADDRESS;
	 
	 inout [7:0] DATA_BUS;
	 
	 wire[7:0] C_BUS,A_BUS,B_BUS;
	 
	 ALU AL(A_BUS,B_BUS,ALU_sig,C_BUS,Z);
	 REGISTER_UNIT registers(clk, M[1],M[0],DATA_BUS,ADDRESS,INS_ADDRESS,INS_BUS,C_BUS,A_BUS,B_BUS,CNT_OUT,C,B);
	 Flag_unit FL(clk,Z,JAMZ,J_OUT,set_F);
	 
	 
endmodule

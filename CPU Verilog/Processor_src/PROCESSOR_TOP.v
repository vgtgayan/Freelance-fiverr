`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:28:14 08/05/2015 
// Design Name: 
// Module Name:    PROCESSOR_TOP 
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
module PROCESSOR_TOP(input clk );

wire[7:0] A_BUS,B_BUS,C_BUS,CNT_BUS,DATA_BUS,DATA_ADDRESS_BUS,INS_ADDRESS_BUS, INS_BUS,MPC,ADDR;
wire[4:0] C_SET_sig;
wire[2:0] ALU_sig,M;
wire[1:0] B_MUX_sig,J;
wire Z,Z_OUT,J_OUT;


ALU ALU1(A_BUS,B_BUS,ALU_sig,C_BUS,Z);
REGISTER_UNIT REGISTERS( clk, M[0], M[1], DATA_BUS,DATA_ADDRESS_BUS,INS_ADDRESS_BUS, INS_BUS, C_BUS, A_BUS, B_BUS, CNT_BUS,C_SET_sig, B_MUX_sig);
Control_unit CNT_UNIT(J_OUT,MPC,clk,ADDR,J,ALU_sig,C_SET_sig,B_MUX_sig,M);
Flag_unit flag(clk,Z,J[0],J_OUT);
MPC_MUX MPC_mux(clk,CNT_BUS,ADDR,MPC,J[1]);
DATA_MEMORY Data_memory(clk,DATA_ADDRESS_BUS,DATA_BUS,M[0],M[1]);
INSTRUCTION_MEMORY Insruction_memory(INS_ADDRESS_BUS,INS_BUS);

endmodule

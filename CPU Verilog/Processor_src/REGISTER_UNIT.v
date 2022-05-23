`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:10:25 08/04/2015 
// Design Name: 
// Module Name:    REGISTER_UNIT 
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
module REGISTER_UNIT(
    input clk,
	 input M_write,
	 input M_read,
    inout [7:0] DATA_BUS,
    output [7:0] DATA_ADDRESS_BUS,
	 output [7:0] INS_ADDRESS_BUS,
    input [7:0] INS_BUS,
    input [7:0] C_BUS,
    output [7:0] A_BUS,
    output [7:0] B_BUS,
	 output [7:0] CNT_OUT,
    input [4:0] SET_sig,
    input [1:0] B_MUX_sig
    );


wire[7:0] PC_w,IR_w,MDR_w,MAR_w,R_w;

PC PC_1(clk,PC_w,C_BUS,INS_ADDRESS_BUS,SET_sig[0]);              //pc
IR IR_(clk,INS_BUS,CNT_OUT,IR_w);                               //IR
MDR MDR_1(clk,C_BUS,DATA_BUS,M_write,M_read,SET_sig[1],MDR_w);  //MDR
MAR MAR_2(clk,C_BUS,DATA_ADDRESS_BUS,SET_sig[2]);               //MAR
R R3(clk, C_BUS,R_w,SET_sig[3]);                                //R
AC AC_4(clk,C_BUS,A_BUS,SET_sig[4]);                            //AC
B_bus_MUX MUX_B( PC_w, MDR_w,IR_w,R_w,B_MUX_sig, B_BUS);        //B_mux


endmodule

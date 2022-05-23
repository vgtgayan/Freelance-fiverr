`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:46:25 07/29/2015 
// Design Name: 
// Module Name:    Control_unit 
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
module Control_unit(J_OUT,MPC,clk,Addr,JAM,ALU,C,B,M,set_F);
   
	input clk,J_OUT;
	input [7:0] MPC;
	
	output [7:0] Addr;
	output [3:0] ALU;
	output [4:0] C;
	output [1:0] B,JAM,M;
	output set_F;
	
	reg [23:0] CL_MEM [511:0];
	reg [23:0] MIR;
	
	reg [9:0] i;
//-----------------------------------------------------------------------------------------	
	initial begin
	
	MIR = 24'b000000000100000000100000;	        
	
	   //for(i=0;i<=10'd511;i=i+1) begin           // Micro Instruction
	   //   CL_MEM[i] = 23'd0;
	  // end
 
 //1 NOP ( No operation- 0000 0000)
      CL_MEM[9'b000000000]= 24'b000000000100000000100000;
		
	//17 ADD (AC <- AC + T -  0000 0001 T)
      CL_MEM[9'b011100000]= 24'b111000010000000000000000;
		CL_MEM[9'b011100001]= 24'b111000100001101000001000;
		CL_MEM[9'b011100010]= 24'b000000000000000000100000;
	
	//18ADDI (AC <- AC + M[T] -  0000 0001 T)
      CL_MEM[9'b011000000]= 24'b110000010000000000000000;
		CL_MEM[9'b011000001]= 24'b110000100010000010001000;
		CL_MEM[9'b011000010]= 24'b110000110000000000100010;
		CL_MEM[9'b011000011]= 24'b000000000001101000010001;

	end
	
//-------------------------------------------------------------------------------------	
	
	always @ (negedge clk) begin
	MIR = CL_MEM[{J_OUT,MPC}];                               //rlease cl sig in posedge
	end
	
	assign {Addr,JAM,ALU,C,B,M,set_F} = MIR;  

endmodule

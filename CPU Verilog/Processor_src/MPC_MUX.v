`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:36:16 08/04/2015 
// Design Name: 
// Module Name:    MPC_MUX 
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
module MPC_MUX(IR,Addr,MPC,JMPC);
	 
	  
	 input[7:0] IR;
	 input[7:0] Addr;
    output reg [7:0] MPC;
    input JMPC;
	 
	 initial begin
		MPC = 8'd0;
	 end
	 
	 always @(*) begin
		if(JMPC)
			MPC = IR;
		else if(~JMPC)
			MPC = Addr;
	end
	 

endmodule

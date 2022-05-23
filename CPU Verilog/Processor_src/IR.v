`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:50:45 08/04/2015 
// Design Name: 
// Module Name:    IR 
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
module IR(
	 input clk,
    input [7:0] INS_BUS,
    output [7:0] CNT_OUT,
    output [7:0] B_BUS
    );

	reg[7:0] IR_M;

	assign CNT_OUT = IR_M;   // control unit 
	assign B_BUS = IR_M;     // B bus
	
	initial begin
		IR_M = 8'd0;
	end
	
   always @ (posedge clk) begin
		IR_M = INS_BUS;       // LOAD INS to IR
	end
      
endmodule

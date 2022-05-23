`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:40:21 07/29/2015 
// Design Name: 
// Module Name:    MUX_C 
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
module MUX_C(sig,PC,MDR,R,IR,C_bus);
  
  input [1:0] sig;
  input [7:0] PC,MDR,IR,R;
  output  reg [7:0] C_bus;
 always @ (*) begin
  case(sig) 
		2'b00 :  C_bus = PC;
		2'b01 :  C_bus = MDR;
		2'b10 :  C_bus = IR;
		2'b11 :  C_bus = R;
	endcase
 end
endmodule

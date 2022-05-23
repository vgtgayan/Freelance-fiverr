`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:34:51 08/01/2015 
// Design Name: 
// Module Name:    B_bus_MUX 
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
module B_bus_MUX(
    input [7:0] PC,
    input [7:0] MDR,
    input [7:0] IR,
    input [7:0] R,
    input [1:0] M,
    output reg [7:0] B_bus
    );
	 
	 always @(*) begin
		case(M) 
			2'b00 : B_bus = PC;
			2'b01 : B_bus = IR;
			2'b10 : B_bus = MDR;
			2'b11 : B_bus = R;
		endcase
	 end
endmodule

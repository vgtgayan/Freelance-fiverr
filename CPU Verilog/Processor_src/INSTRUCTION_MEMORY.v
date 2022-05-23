`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:01:09 07/20/2015 
// Design Name: 
// Module Name:    INSTRUCTION_MEMORY 
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
module INSTRUCTION_MEMORY(Address,Data_out );

	//input fetch;
	input [7:0] Address;
	output [7:0] Data_out;
	
	reg[7:0] Cel[255:0];
	
	initial begin
		Cel[0] = 8'b00000000;    //NOP
		Cel[1] = 8'b11000000;  //  AC <- AC + M[T]
		Cel[2] = 8'b11111111;    // T
	   Cel[4] = 8'b00000001;   // AC <- AC +  T
      Cel[5] = 8'b00000001;	// T	
		Cel[6] = 8'b00000000;   
		
		

	end
	
	assign Data_out = Cel[Address];
	

endmodule

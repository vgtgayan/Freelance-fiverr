`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   12:06:24 08/15/2015
// Design Name:   PROCE_COMPLETE
// Module Name:   D:/CODES/FPGA/Processor/TEST_COMLETE.v
// Project Name:  Processor
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: PROCE_COMPLETE
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module TEST_COMLETE;

	// Inputs
	reg clk;

	// Instantiate the Unit Under Test (UUT)
	PROCE_COMPLETE uut (
		.clk(clk)
	);

	initial begin
		// Initialize Inputs
		  clk      = 0;      
        forever begin
            #5 clk  = ~clk;
        end
		
		#200;
		$finish;

		// Add stimulus here

	end
      
endmodule


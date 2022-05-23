`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:09:22 08/04/2015 
// Design Name: 
// Module Name:    AC 
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
module AC( clk, Data_in,Data_out,set);

                                //inputs
  input[7:0] Data_in;
  input set,clk;
  
                                //outputs
  output[7:0] Data_out;
  
                                // reg
  reg [7:0] AC_M;
 
	 always @ (posedge clk) begin
	   
		   if(set )                 //  SET R in pose edge
		     AC_M = Data_in;
	 end
	 
    assign Data_out = AC_M;     // Data out 

		initial begin
				AC_M = 0;
		end

endmodule

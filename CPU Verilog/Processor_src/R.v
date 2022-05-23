`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:30:49 07/16/2015 
// Design Name: 
// Module Name:    R 
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
module R( clk, Data_in,Data_out,set);

                                //inputs
  input[7:0] Data_in;
  input set,clk;
  
                                //outputs
  output[7:0] Data_out;
  
                                // reg
  reg [7:0] R;
 
	 always @ (posedge clk) begin
	   
		   if(set )                 //  SET R in pose edge
		     R = Data_in;
	 end
	 
    assign Data_out = R;     // Data out 

endmodule
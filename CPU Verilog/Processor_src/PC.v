`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:29:13 07/29/2015 
// Design Name: 
// Module Name:    PC 
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
module PC(clk,Data_out,Data_in,Address_bus,set);
  
  input clk,set;
  input [7:0] Data_in;                    // inputs
  
  output [7:0] Data_out,Address_bus;      //outputs
  
  reg [7:0] PC_M;
  
  initial begin 
     PC_M = 8'b00000;
  end
  
  assign Address_bus = PC_M;         //ASIGN DATA OUT   &  ADDRESS BUS
  assign Data_out = PC_M;
  
  always @ (posedge clk) begin
       
     if(set)
			PC_M = Data_in;               // Set PC
	end
  

endmodule

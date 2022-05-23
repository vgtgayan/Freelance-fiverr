`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:25:27 07/17/2015 
// Design Name: 
// Module Name:    MDR 
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
module MDR(clk,ALU_out,Data_bus,M_write,M_read,set,B_bus);

   input clk,M_write,M_read,set;    //inputs
   input[7:0] ALU_out;
	 
	inout[7:0] Data_bus;            //inouts

	output[7:0] B_bus;             //outputs
	
	reg [7:0] MD;                  //reg
	
   assign Data_bus = (M_write) ? MD : 8'bz;          //Memory write
   
	assign B_bus = MD;                              // DATA out to B bus
	
   always @ (posedge clk) begin
      if(set) 
         MD = ALU_out;                          // SET MDR
      else if(M_read)
         MD = Data_bus;		                   //Memory read
	end
endmodule
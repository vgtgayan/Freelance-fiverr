`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:26:28 07/16/2015 
// Design Name: 
// Module Name:    RAM 
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
module RAM(clk,Address,Databus,Write_en,Read_en);

	                //inputs
	
   
   input[7:0] Address;
   input Write_en,Read_en,clk;
	
 
                  //inour
	inout[7:0] Databus;
           
			         // reg
    reg[7:0] Cel[15:0];
  
                 // Reading data
	 assign Databus = (Read_en) ? Cel[Address]: 8'bz;
  
                // Writing data
  
  always @ (posedge clk) begin
    if(Write_en)
	 Cel[Address] = Databus;  
  end	 	

endmodule

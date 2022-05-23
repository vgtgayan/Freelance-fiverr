`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:36:20 07/17/2015 
// Design Name: 
// Module Name:    DATA_MEMORY 
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
module DATA_MEMORY(clk,Address,Databus,Write_en,Read_en);

	                //inputs
   input[7:0] Address;
   input Write_en,Read_en,clk;
	
 
                  //inour
	inout[7:0] Databus;
           
			         // reg
    reg[7:0] Cel[255:0];
	 
	 initial begin
		Cel[255] = 8'b00000011;
		Cel[254] = 8'b00101010;
	 end
  
                 // Reading data
	 assign Databus = (Read_en) ? Cel[Address]: 8'bz;
  
                // Writing data
  
  always @ (posedge clk) begin
    if(Write_en)
	 Cel[Address] = Databus;  
  end	 	

endmodule
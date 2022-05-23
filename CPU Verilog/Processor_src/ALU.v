`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:15:05 07/16/2015 
// Design Name: 
// Module Name:    ALU 
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
module ALU(A,B,sig,AC,z);

parameter reg_size =8;

input[reg_size-1:0] A,B;

input[3:0] sig;


output reg z;


output reg [reg_size-1:0] AC;

 always @( A or B or sig)
   begin
	   case(sig)		
		   4'b0000 :AC =	B+8'b00000001;       // B+1
         4'b0001 :AC = B|A;                // A or B
			4'b0010 :AC = B-A;                // A-B
			4'b0011 :AC = B^A;	              //  (A xor B)
			4'b0100 :AC = 8'b00000001;					// 1
			4'b0101 :AC = B&A;               //  (A and B)
			4'b0110 :AC = B+A;		         // A+B
			4'b0111 :AC = ~A;              // ~A
			4'b1000 :AC = B;               // B
			4'b1001 :AC = A;               // A
			
			4'b1010 :AC = 8'b00000000;     // 0
			4'b1011 :AC = A;               // A
			4'b1100 :AC = A;               // A
			4'b1101 :AC = A;               // A
			4'b1110 :AC = A;               // A
			4'b1111 :AC = A;               // A
			
			endcase	
			

  
 
  z =~(|AC);
	end
endmodule
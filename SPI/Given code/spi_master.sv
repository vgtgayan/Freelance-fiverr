//this master has no state machine, you must code one on here



module spi_master(reset,SCK,SSB,MOSI,MISO);
  input reset;
  input SCK;
  output logic SSB;
  output logic MOSI;
  input MISO;
  
  logic [7:0] master_reg;
  logic mload;
  logic [7:0] mdata;
  
  always @(posedge SCK)
    begin
      if (SSB == 0)
        begin
          master_reg[7:1] <= master_reg[6:0];
          master_reg[0] <= MISO;
        end
      else if (mload)
        master_reg <= mdata;
    end
  
  assign MOSI = master_reg[7];
  
  initial
  begin
   #40; 
    
   //Command Byte 
   SSB = 1;
    @ (posedge SCK);
      mload = 1;
      mdata = 8'h01;// code can be manipulated here, input data
    @ (posedge SCK);
      mload = 0;
    @ (posedge SCK);
    @ (posedge SCK);
    @ (posedge SCK);//switches from pos to neg 
    @ (negedge SCK);
    
    SSB = 0;
        @ (posedge SCK);
        @ (posedge SCK);
        @ (posedge SCK);
        @ (posedge SCK);
        @ (posedge SCK);
        @ (posedge SCK);
        @ (posedge SCK);
        @ (posedge SCK);
    SSB = 1;
    
    
   //Data Byte 
    @ (posedge SCK);
      mload = 1;
      mdata = 8'h22;
    @ (posedge SCK);
      mload = 0;
    @ (posedge SCK);
    @ (negedge SCK);
    SSB = 0;
        @ (posedge SCK);
        @ (posedge SCK);
        @ (posedge SCK);
        @ (posedge SCK);
        @ (posedge SCK);
        @ (posedge SCK);
        @ (posedge SCK);
        @ (posedge SCK);
    SSB = 1;
    #100;
  end 
  
  
endmodule

 
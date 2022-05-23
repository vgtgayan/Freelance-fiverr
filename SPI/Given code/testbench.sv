`timescale 1ns/1ns

module spi_tb();
  
  logic reset, SCK, SSB, MOSI, MISO;
  
  spi_slave S0(reset, SCK,SSB,MOSI,MISO);
  spi_master M0(reset, SCK,SSB,MOSI,MISO);
  
  always
    begin
      SCK <= 0;
      #5 ;
      SCK <= 1;
      #5 ;
    end
  
  
  initial
  begin
    $dumpfile("dump.vcd");
    $dumpvars;
    
    reset = 1;
    #20;
    reset = 0;
    
  end

  
  
endmodule
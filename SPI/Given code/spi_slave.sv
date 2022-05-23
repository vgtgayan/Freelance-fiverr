//This is the Slave state machine and shift register
`include "spi_master.sv"
//still need all the "reads"
//need to code the RAM
//RAM has the counter mode where, load counter 
//8 bits of data from master to slave
//READ STATUS REGISTER IS REQUIRED, READ STATUS FROM MASTER TO SEE IF BUSY OR NOT. 


module spi_slave(reset, SCK,SSB,MOSI,MISO);
  input reset;
  input SCK;
  input SSB;
  input MOSI;
  output logic MISO;
  
  logic [7:0] slave_reg;
  enum {S0, S1, S2, S3, S4} ps, ns;
  logic [3:0] counter;
  logic load_counter, increment_counter;
  logic spi_valid;
  logic spi_byte; //cmd =0, data = 1
  logic [7:0] slave_command_reg;
  logic [7:0] slave_data_reg;
  
  logic [7:0] AR; //Address Register
  logic [7:0] DATAIN; //DATAIN Register
  
  logic AR_write; //Address Register Write decloration
  logic DATAIN_write; //DATAIN Register Write 
  logic [3:0] command;
  logic commmand_valid; 
  
  always @(posedge SCK)
    begin
      if (AR_write) //if this is true then write data reg into 
        AR <= slave_data_reg;// into data register here
    end  
  
  always @(posedge SCK)
    begin
      if (SSB == 0)
        begin
          slave_reg[7:1] <= slave_reg[6:0];
          slave_reg[0] <= MOSI;
        end
    end
  
  assign MISO = slave_reg[7];
  
  always @(posedge SCK)
    begin
      if (reset)
        ps <=  S0;
      else
        ps <= ns;
    end
  
  always @(posedge SCK)
    begin
      if (reset)
        spi_byte <= 0;
      else if (ps == S3)
        spi_byte <= ~spi_byte;
    end
  
  always @(ps,SSB,spi_valid)
    begin
      AR_write <= 0;
      load_counter <= 0;
      increment_counter <= 0;
      case(ps)
        S0 : begin 
               if (reset)
                 ns <= S0;
               else
                 ns <= S1;
              end
        
        S1 : begin 
               if (SSB == 0)
                begin
                  ns <= S2;
                  load_counter <= 1;
                end
               else
                 ns <= S1;
             end
        S2 : begin
               increment_counter <= 1;
               if (spi_valid)
                 ns <= S3;
               else
                 ns <= S2;
              end
        S3 : begin //we are in state 3
               ns <= S4;
               if (spi_byte &&  (command == 4'b0001) ) 
                 AR_write <= 1;
             end
        S4 : begin 
               ns <= S0;
             end
      endcase
    end
  
  always @(posedge SCK)
    begin
      if (reset || load_counter)
        counter <= 0;
      else if (increment_counter)
        counter <=  counter + 1;
    end
  
  assign spi_valid = 1 ? (counter == 8) : 0;       
 
  always @(posedge SCK)
    begin
      if (spi_valid && ~spi_byte)
        slave_command_reg <= slave_reg;
      
      if (spi_valid && spi_byte)
        slave_data_reg <= slave_reg;
    end
 
  assign command = slave_command_reg[3:0];
  
endmodule
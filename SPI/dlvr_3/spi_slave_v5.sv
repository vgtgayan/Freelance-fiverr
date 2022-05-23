`timescale 1ns/1ns
`include "spi_master_v5.sv"

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
  
  logic [7:0] EXT_DATA;
 
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
  logic [7:0] DATA_OUT; // DATA_OUT register
  logic [7:0] STATUS; //  STATUS  register (STATUS[0] = Busy bit, STATUS[1] = Ready bit)
  logic AR_write; //Address Register Write decloration
  logic DATAIN_write; //DATAIN Register Write 
  logic rd_data_out; // DATA_OUT register READ
  logic rd_status; // STATUS register read
  logic sample_data; // Sample data enable
  logic [7:0] SAMPLE_COUNT; // Sample count register

  logic [3:0] command; 
  
  //RAM
  logic [7 :0] ram [0:255];
  logic wr_en,rd_en,mem_en; // RAM control signals

 // External data assignment
 initial begin 
    EXT_DATA = 0;
    @ (posedge sample_data);
    EXT_DATA = 8'hcc;
  end




 // Shift register (Shift left)     
  always @(posedge SCK)
    begin
      if (SSB == 0)
        begin
          slave_reg[7:1] <= slave_reg[6:0];
          slave_reg[0] <= MOSI;
        end
      else if (rd_data_out) 
        begin 
          slave_reg <= DATA_OUT; // SPI <- DATA_OUT
        end
      else if (rd_status) 
        begin 
          slave_reg <= STATUS; // SPI <- STATUS
        end
    end
  
  // MSB first
  assign MISO = slave_reg[7];
  
  // State transition
  always @(posedge SCK)
    begin
      if (reset)
        ps <=  S0;
      else
        ps <= ns;
    end
  
// FSM combinational logic
  always @ (*)        //(ps,SSB,spi_valid)
    begin
      AR_write <= 0;
      DATAIN_write <= 0;
      load_counter <= 0;
      increment_counter <= 0;
      rd_data_out <= 0;
      rd_status <= 0;
      sample_data <= 0;
      wr_en <= 0;
      mem_en <= 0;
      case(ps)
        S0 : begin // reset state
               if (reset)
                 ns <= S0;
               else
                 ns <= S1;
              end
        
        S1 : begin // Idle state
               if (SSB == 0)
                begin
                  ns <= S2;
                  load_counter <= 1;
                end
               else
                 ns <= S1;
             end
        S2 : begin // SPI active state
               increment_counter <= 1;
               if (spi_valid)
                 ns <= S3;
               else
                 ns <= S2;
              end
        S3 : begin // Data Operation state
                ns <= S4;
                if (spi_byte &&  (command == 4'b0001) ) // Write AR
                    AR_write <= 1;
                if (spi_byte &&  (command == 4'b0010) ) // Write data in
                    DATAIN_write <= 1;
                if (spi_byte &&  (command == 4'b0011) ) // Read data out
                    rd_data_out <= 1;
                if (spi_byte &&  (command == 4'b0101) ) // Read status
                    rd_status <= 1;
                if (spi_byte &&  (command == 4'b0100) ) // Sample data 
                    sample_data <= 1;
                  
             end
        S4 : begin // Sample ext data state
               ns <= S0;
               if (STATUS[1]) begin// Busy == 1
                  ns <= S4;
                  wr_en <= 1;
                  mem_en <= 1;
               end
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
  
  assign spi_valid = (counter == 8) ? 1 : 0;       
 
  // Data or command flag -> cmd =0, data = 1
  always @(posedge SCK)
    begin
      if (reset)
        spi_byte <= 0;
      else if (ps == S3)
        spi_byte <= ~spi_byte;
    end

  always @(posedge SCK)
    begin
      if (spi_valid && ~spi_byte)
        slave_command_reg <= slave_reg;
      
      if (spi_valid && spi_byte)
        slave_data_reg <= slave_reg;
    end
 
  assign command = slave_command_reg[3:0];


  // AR Register & DATAIN Register
  always @(posedge SCK)
    begin
        if (AR_write) //if this is true then write data reg
            AR <= slave_data_reg;// into data register here
        else if (sample_data) // Init sample data
            AR <= 0;
        else if (STATUS[1]) // Busy == 1
            AR <= AR + 1;


        if (DATAIN_write) //if this is true then write data reg 
            DATAIN <= slave_data_reg;// into DATAIN reg here

    end 


  // RAM write logic
  always @ (posedge SCK) begin
      if (wr_en && mem_en) begin
        if (STATUS[1])
          ram [AR] <= EXT_DATA; // Sample external data
        else
          ram [AR] <= DATAIN; // write to RAM
      end 
  end
  
  // RAM read logic
  always @ (posedge SCK) begin
      if(reset) begin
          DATA_OUT <= 0;
      end 
      else if (rd_en && mem_en) begin
          DATA_OUT <= ram [AR]; // read from RAM
      end 
  end
  
  // Sample data
  always @ (posedge SCK) begin 
    if (reset) begin 
      SAMPLE_COUNT <= 8'h00;
      STATUS <= 8'h01; // Busy <- 0, Ready <- 1
    end
    else if (sample_data) begin 
      SAMPLE_COUNT <= slave_data_reg - 8'h01; // counter <- SPI
      STATUS <= 8'h02; // Busy <- 1, Ready <- 0
    end
    else if (SAMPLE_COUNT != 8'h00) begin 
      SAMPLE_COUNT <= SAMPLE_COUNT - 1;
    end
    else if (SAMPLE_COUNT == 8'h00) begin
      STATUS <= 8'h01; // Busy <- 0, Ready <- 1
    end
  end

endmodule
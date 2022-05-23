--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   14:54:05 05/05/2018
-- Design Name:   
-- Module Name:   C:/Users/gayan/Documents/FVR/CPU VHDL/Task1/CPU_Task_1/tb_Decoder.vhd
-- Project Name:  CPU_Task_1
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Decoder
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY tb_Decoder IS
END tb_Decoder;
 
ARCHITECTURE behavior OF tb_Decoder IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Decoder
    PORT(
         instruction_in : IN  std_logic_vector(15 downto 0);
         immediate_out : OUT  std_logic_vector(7 downto 0);
         opcode_bits_out : OUT  std_logic_vector(3 downto 0);
         opcode_out : OUT  std_logic_vector(3 downto 0);
         Rd_addr_out : OUT  std_logic_vector(2 downto 0);
         Rs1_addr_out : OUT  std_logic_vector(2 downto 0);
         Rs2_addr_out : OUT  std_logic_vector(2 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal instruction_in : std_logic_vector(15 downto 0) := (others => '0');

 	--Outputs
   signal immediate_out : std_logic_vector(7 downto 0);
   signal opcode_bits_out : std_logic_vector(3 downto 0);
   signal opcode_out : std_logic_vector(3 downto 0);
   signal Rd_addr_out : std_logic_vector(2 downto 0);
   signal Rs1_addr_out : std_logic_vector(2 downto 0);
   signal Rs2_addr_out : std_logic_vector(2 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   --constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Decoder PORT MAP (
          instruction_in => instruction_in,
          immediate_out => immediate_out,
          opcode_bits_out => opcode_bits_out,
          opcode_out => opcode_out,
          Rd_addr_out => Rd_addr_out,
          Rs1_addr_out => Rs1_addr_out,
          Rs2_addr_out => Rs2_addr_out
        );

   -- Clock process definitions
--   <clock>_process :process
--   begin
--		<clock> <= '0';
--		wait for <clock>_period/2;
--		<clock> <= '1';
--		wait for <clock>_period/2;
--   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
--      wait for 100 ns;	
--
--      wait for <clock>_period*10;

      -- insert stimulus here 
		instruction_in <= b"0000_001_000_000_111";
		wait for 10ns;
		instruction_in <= b"0001_001_000_000_111";
		wait for 10ns;
		instruction_in <= b"0101_001_000_000_111";
		wait for 10ns;
		instruction_in <= b"1000_001_000_000_111";
		wait for 10ns;
		instruction_in <= b"1100_001_000_000_111";
		wait for 10ns;
		instruction_in <= b"1111_001_000_000_111";
		wait for 10ns;
		
      wait;
   end process;

END;

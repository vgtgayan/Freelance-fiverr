--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   11:43:21 05/05/2018
-- Design Name:   
-- Module Name:   C:/Users/gayan/Documents/FVR/CPU VHDL/Task1/CPU_Task_1/tb_top_proccessor.vhd
-- Project Name:  CPU_Task_1
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: top_processor
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
 
ENTITY tb_top_proccessor IS
END tb_top_proccessor;
 
ARCHITECTURE behavior OF tb_top_proccessor IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT top_processor
    PORT(
         clk : IN  std_logic;
         rst : IN  std_logic;
         opcode : OUT  std_logic_vector(3 downto 0);
         operand_1 : OUT  std_logic_vector(7 downto 0);
         operand_2 : OUT  std_logic_vector(7 downto 0);
         result : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal rst : std_logic := '0';

 	--Outputs
   signal opcode : std_logic_vector(3 downto 0);
   signal operand_1 : std_logic_vector(7 downto 0);
   signal operand_2 : std_logic_vector(7 downto 0);
   signal result : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: top_processor PORT MAP (
          clk => clk,
          rst => rst,
          opcode => opcode,
          operand_1 => operand_1,
          operand_2 => operand_2,
          result => result
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
		rst <= '1';
      wait for 100 ns;	
		rst <= '0';
      wait for clk_period*100;

      -- insert stimulus here 

      wait;
   end process;

END;

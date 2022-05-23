--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   10:19:39 05/08/2018
-- Design Name:   
-- Module Name:   C:/Users/gayan/Documents/FVR/CPU VHDL/Bonus_Task1_FPGA/Trace_mode/tb_top_processor.vhd
-- Project Name:  Trace_mode
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
 
ENTITY tb_top_processor IS
END tb_top_processor;
 
ARCHITECTURE behavior OF tb_top_processor IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT top_processor
    PORT(
         clk : IN  std_logic;
         rst : IN  std_logic;
         mode : IN  std_logic;
         reg_addr : IN  std_logic_vector(2 downto 0);
         opcode : OUT  std_logic_vector(3 downto 0);
         operand_1 : OUT  std_logic_vector(7 downto 0);
         operand_2 : OUT  std_logic_vector(7 downto 0);
         result : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal rst : std_logic := '0';
   signal mode : std_logic := '0';
   signal reg_addr : std_logic_vector(2 downto 0) := (others => '0');

 	--Outputs
   signal opcode : std_logic_vector(3 downto 0);
   signal operand_1 : std_logic_vector(7 downto 0);
   signal operand_2 : std_logic_vector(7 downto 0);
   signal result : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
	signal clk_tmp: std_logic := '0';
	signal clk_en: std_logic := '0';
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: top_processor PORT MAP (
          clk => clk,
          rst => rst,
          mode => mode,
          reg_addr => reg_addr,
          opcode => opcode,
          operand_1 => operand_1,
          operand_2 => operand_2,
          result => result
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk_tmp <= '0';
		wait for clk_period/2;
		clk_tmp <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
		rst <= '1';
		clk_en <= '1';
      wait for 100 ns;	
		rst <= '0';
		
      wait for clk_period*5;
		
      -- insert stimulus here 
		clk_en <= '0';
		mode <= '1';
		reg_addr <= "001";
		wait for clk_period;
		reg_addr <= "010";
		wait for clk_period;
		
		
      wait;
   end process;

	clk <= clk_tmp when clk_en = '1' else
				'0';


END;

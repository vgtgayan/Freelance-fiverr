----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:53:19 04/26/2018 
-- Design Name: 
-- Module Name:    Registers - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

use work.common.all;

entity Decoder is
	port ( 
		instruction_in : in STD_LOGIC_VECTOR ((instruction_width - 1) downto 0);
		
		immediate_out  : out STD_LOGIC_VECTOR ((reg_size - 1) downto 0);
		opcode_bits_out: out STD_LOGIC_VECTOR ((opcode_width - 1) downto 0);
		opcode_out	   : out STD_LOGIC_VECTOR ((opcode_width - 1) downto 0);
		Rd_addr_out    : out STD_LOGIC_VECTOR ((reg_addr_width - 1) downto 0);
		Rs1_addr_out   : out STD_LOGIC_VECTOR ((reg_addr_width - 1) downto 0);
		Rs2_addr_out   : out STD_LOGIC_VECTOR ((reg_addr_width - 1) downto 0)

	     );
end Decoder;

architecture Behavioral of Decoder is

		signal opcode : STD_LOGIC_VECTOR ((opcode_width - 1) downto 0);

begin
	
		opcode <= instruction_in(15 downto 12);

		opcode_bits_out <= instruction_in(15 downto 12);
		opcode_out      <= instruction_in(15 downto 12);
		Rd_addr_out     <= instruction_in(11 downto 9);
		Rs1_addr_out    <= instruction_in(8 downto 6);
		Rs2_addr_out    <= instruction_in(5 downto 3);
	
	decoder_process : process (instruction_in, opcode)
	begin
		

		
		-- immediate_out
		case opcode is
			when "0001" => 		immediate_out	<= instruction_in(5) & instruction_in(5) & instruction_in(5 downto 0);
			when "0011" => 		immediate_out	<= instruction_in(5) & instruction_in(5) & instruction_in(5 downto 0);
			when "0101" => 		immediate_out	<= "00" & instruction_in(5 downto 0);
			when "0111" => 		immediate_out	<= "00" & instruction_in(5 downto 0);
			when "1000" => 		immediate_out	<= "00000" & instruction_in(2 downto 0);
			when "1001" => 		immediate_out	<= "00000" & instruction_in(2 downto 0);
			when "1100" => 		immediate_out	<= instruction_in(5) & instruction_in(5) & instruction_in(5 downto 0);
			when "1011" => 		immediate_out	<= instruction_in(11) & instruction_in(11) & instruction_in(11 downto 9) & instruction_in(2 downto 0);
			when "1101" => 		immediate_out	<= instruction_in(11) & instruction_in(11) & instruction_in(11 downto 9) & instruction_in(2 downto 0);
			when "1110" => 		immediate_out	<= instruction_in(11) & instruction_in(11) & instruction_in(11 downto 9) & instruction_in(2 downto 0);
			when "1111" => 		immediate_out	<= instruction_in(11) & instruction_in(11) & instruction_in(11 downto 9) & instruction_in(2 downto 0);
			when others => 		immediate_out	<= (others=>'0');
		end case;
		
	end process;


end Behavioral;


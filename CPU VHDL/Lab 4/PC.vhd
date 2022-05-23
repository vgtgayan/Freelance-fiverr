----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:51:31 04/26/2018 
-- Design Name: 
-- Module Name:    PC - Behavioral 
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

entity PC is
	port ( 	clk : in STD_LOGIC;
		rst: in STD_LOGIC;

		PC_in : in STD_LOGIC_VECTOR ((address_width - 1) downto 0);
		PC_out : out STD_LOGIC_VECTOR ((address_width - 1) downto 0);

		PC_we : in STD_LOGIC;
		PC_incr : in STD_LOGIC
	     );
end PC;

architecture Behavioral of PC is

signal PC_reg : STD_LOGIC_VECTOR ((address_width - 1) downto 0);

begin
	PC_out <= PC_reg;

	PC_process : process (clk, rst)
	begin
		-- asynchronous reset
		if (rst = '1') then
			PC_reg <= (others => '0');

		-- synchronized write
		elsif (rising_edge(clk)) then

			if (PC_we = '1') then
				PC_reg <= PC_in;
			elsif (PC_incr = '1') then
				PC_reg <= std_logic_vector(unsigned(PC_reg) + 1);
			end if;

		end if;
	end process;

end Behavioral;


----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 28.02.2018 18:03:53
-- Design Name: 
-- Module Name: my_dec2to4 - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
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

entity my_dec2to4  is

    port ( 
            j: in std_logic_vector(1 downto 0);
           yj: out std_logic_vector(3 downto 0);
           E_j: in std_logic) ;
           
end my_dec2to4 ;

architecture Behavioral of my_dec2to4  is

begin
        process (j,E_j)
        begin
           
		   yj <="0000";
            if E_j = '1' then
                case j is
                 when "00" =>
                    yj <= "0001";                   
                 when "01" =>
                    yj <= "0010";
                 when "10" =>
                    yj <= "0100";                  
                 when others =>
                    yj <= "1000";                 
                
				
end case;
end if;
end process;

end Behavioral;



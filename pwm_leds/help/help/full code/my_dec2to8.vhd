----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 28.02.2018 18:11:34
-- Design Name: 
-- Module Name: my_dec2to8 - Behavioral
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

entity my_dec2to8 is
    Port ( E_i : in STD_LOGIC;
           i : in STD_LOGIC_VECTOR (2 downto 0);
           yi : out STD_LOGIC_VECTOR (7 downto 0));
end my_dec2to8;

architecture Behavioral of my_dec2to8 is

begin

        process(i,E_i)
        begin
           yi<="00000000";
            if E_i='1' then
                case i is 
                    
                    when "000"=>
                        yi<="00000001";
                   
                    when "001"=>
                        yi<="00000010";
                    
                    when "010"=>
                        yi<="00000100";
                    
                    when "011"=>
                         yi<="00001000";
                    
                    when "100"=>
                         yi<="00010000";
                   
                    
                    when "101"=>
                         yi<="00100000";
                    
                    when "110"=>
                          yi<="01000000";
                    
                    when others=>
                         yi<="10000000";
               end case; 
             end if;
          end process;

end Behavioral;

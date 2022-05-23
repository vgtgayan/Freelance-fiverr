---------------------------------------------------------------------------
-- This VHDL file was developed by Daniel Llamocca (2017).  It may be
-- freely copied and/or distributed at no cost.  Any persons using this
-- file for any purpose do so at their own risk, and are responsible for
-- the results of such use.  Daniel Llamocca does not guarantee that
-- this file is complete, correct, or fit for any particular purpose.
-- NO WARRANTY OF ANY KIND IS EXPRESSED OR IMPLIED.  This notice must
-- accompany any copy of this file.
--------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_arith.all;
--use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;
use ieee.math_real.log2;
use ieee.math_real.ceil;

-- Here, DC is a number between 0 to TPWM.
-- In a higher hierarchy file, you can create a circuit that DC is between 0 and 100% (or 0 to 255).
-- If DC = 0 --> oPWM = 0
-- If DC = TPWM -> oPWM = 1
--   If DC > TPWM --> oPWM = 1 (this can happen by mistake if TPWM is not a power of 2 minus 1).
-- TPWM: Period (in terms of periods of input frequency). If input frequency is 100 MHz, then TPWM = 2000 means 50 KHz

entity mypwm is
	generic (TPWM: INTEGER:= 10); -- Time (in periods of clock) of a period of PWM. It can't be 0 or 1
	port (  resetn, clock: in std_logic;
			DC: in std_logic_vector (integer(ceil(log2(real(TPWM +1)))) - 1 downto 0); -- Number between 0 and TPWM
			oPWM: out std_logic);
end mypwm;

architecture Behavioral of mypwm is

    constant nDC: integer:= integer(ceil(log2(real(TPWM +1))));
	type state is (S1, S2, S3, S4);
	signal y: state;		
	
	signal DCq: std_logic_vector (nDC - 1 downto 0);
	signal Q: integer range 0 to TPWM - 1; -- 0 to TPWM - 1
	signal E_DC: std_logic;
		
begin

fi: if TPWM > 1 generate -- TPWM cannot be 0 or 1	  
    -- Main FSM:
        Transitions: process (resetn, clock, DC)
        begin
            if resetn = '0' then -- asynchronous signal
                y <= S1; Q <= 0; DCq <= (others =>'0');
            elsif (clock'event and clock = '1') then
                case y is
                    when S1 =>
                        Q <= 0; DCq <= DC;
                        y <= S2;
                                            
                    when S2 =>
                        if DCq = conv_std_logic_vector (0, nDC) or DCq >= conv_std_logic_vector (TPWM, nDC) then
                            y <= S2; DCq <= DC;
                        else
                            Q <= Q+1;
                            if DCq = conv_std_logic_vector (1, nDC) then y <= S4; else y <= S3; end if; -- This is for the special case where
                        end if;
                    
                    when S3 =>
                        Q <= Q + 1;
                        if Q = conv_integer(unsigned(DCq)) - 1 then
                            y <= S4;
                        else
                            y <= S3;
                        end if;
                            
                    when S4 =>
                        if Q = TPWM - 1 then
                            Q <= 0; DCq <= DC;
                            y <= S2;
                        else
                            y <= S4;
                            Q <= Q+1;
                        end if;
    
                end case;			
            end if;		
        end process;
        
        Outputs: process (y, DCq)
        begin
            -- Default values for FSM outputs:
            oPWM <= '0';
            
            case y is
                when S1 =>

                   
                when S2 =>
                     if DCq = conv_std_logic_vector (0, nDC) then
                        oPWM <= '0';
                     else
                        oPWM <= '1';
                     end if;
                        
                when S3 =>
                     oPWM <= '1';
                     
                when S4 =>

            end case;
        end process;
    end generate;        
 
end Behavioral;


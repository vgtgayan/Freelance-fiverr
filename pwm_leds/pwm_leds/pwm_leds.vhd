---------------------------------------------------------------------------
-- This VHDL file was developed by Daniel Llamocca (2015).  It may be
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
use ieee.std_logic_unsigned.all;
use ieee.math_real.log2;
use ieee.math_real.ceil;

entity pwm_leds is
	port (resetn, clock: in std_logic;
		  sel: in std_logic_vector (11 downto 0); -- NB=4
	      RLED, GLED, BLED: out std_logic);
end pwm_leds;

architecture Behavioral of pwm_leds is

    component mypwm
        generic (TPWM: INTEGER:= 10); -- Time (in periods of clock) of a period of PWM. It can't be 0 or 1
        port (  resetn, clock: in std_logic;
                DC: in std_logic_vector (integer(ceil(log2(real(TPWM +1)))) - 1 downto 0); -- Number between 0 and TPWM
                oPWM: out std_logic);
    end component;
 

    constant TPWM: INTEGER:= 50000; -- 2 KHz -- This frequency seems to give out good color variations
    --constant TPWM: INTEGER:= 500; -- 200 KHz --> This might be too much, the linearity of PWM might get lost on the leds
    constant NB: INTEGER:= 4; -- If we use 5 bits, there are warnings about DCq being removed from logic.
    constant nTPWM: integer:= integer(ceil(log2(real(TPWM+1))));

	signal RC, GC, BC: std_logic_vector (NB-1 downto 0);
	signal DC_R, DC_G, DC_B: std_logic_vector (nTPWM+NB -1 downto 0);
    	
begin

RC <= sel (3*NB -1 downto 2*NB);
GC <= sel (2*NB -1 downto NB);
BC <= sel (NB-1 downto 0);

DC_R <= RC*(conv_std_logic_vector(TPWM,nTPWM)); -- unsigned multiplication -> use ieee.std_logic_unsigned.all
DC_G <= GC*(conv_std_logic_vector(TPWM,nTPWM)); -- unsigned multiplication -> use ieee.std_logic_unsigned.all
DC_B <= BC*(conv_std_logic_vector(TPWM,nTPWM)); -- unsigned multiplication -> use ieee.std_logic_unsigned.all

--DC_R <= conv_std_logic_vector (TPWM*conv_integer(unsigned(RC)),NB+nTPWM);
--DC_G <= conv_std_logic_vector (TPWM*conv_integer(unsigned(GC)),NB+nTPWM);
--DC_B <= conv_std_logic_vector (TPWM*conv_integer(unsigned(BC)),NB+nTPWM);

rl: mypwm generic map (TPWM => TPWM)
    port map (clock => clock, resetn => resetn, DC => DC_R (nTPWM+NB -1 downto NB), oPWM => RLED);                 

rg: mypwm generic map (TPWM => TPWM)
    port map (clock => clock, resetn => resetn, DC => DC_G (nTPWM+NB -1 downto NB), oPWM => GLED);
    
rb: mypwm generic map (TPWM => TPWM)
    port map (clock => clock, resetn => resetn, DC => DC_B (nTPWM+NB -1 downto NB), oPWM => BLED);
 
end Behavioral;


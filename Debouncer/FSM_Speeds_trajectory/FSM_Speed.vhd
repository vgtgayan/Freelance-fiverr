----------------------------------------------------------------------------------
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity FSM_Speed is
	port(
			clk  : in std_logic;
			reset: in std_logic;
			speed_btn : in std_logic;
			on_off_btn : in std_logic;
			speed_control : out std_logic_vector(1 downto 0);
			LD0			  : out std_logic;
			LD1			  : out std_logic;
			LD2			  : out std_logic;
			LD3			  : out std_logic;
			Ld4			  : out std_logic := '0'
			
	);
end FSM_Speed;

architecture FSM of FSM_Speed is
	constant cnt_max : integer := 1000000;
	signal   count   : integer range 0 to cnt_max := 0;
	signal   count2   : integer range 0 to cnt_max := 0;
	type state_type is ( low_speed, medium_speed, high_speed, zero_speed );
	signal cur_speed : state_type := low_speed;	
	signal on_off_signal : std_logic;
	signal speed_signal : std_logic;


--	COMPONENT debounce
--	GENERIC(counter_size  :  INTEGER := 19); --counter size (19 bits gives 10.5ms with 50MHz clock)
--	  PORT(
--		 clk     : IN  STD_LOGIC;  --input clock
--		 button  : IN  STD_LOGIC;  --input signal to be debounced
--		 result  : OUT STD_LOGIC); --debounced signal
--	END COMPONENT;	

component debouncer 
	port (clk: in std_logic; -- clk frequency = 50Mhz
			pb: in std_logic;
			pb_debounced: out std_logic
			);
end component;
	
begin
--	debounc1 : debounce generic map (counter_size => 24) port map ( clk, on_off_btn, on_off_signal );
--	debounc2 : debounce generic map (counter_size => 26) port map ( clk, speed_btn, speed_signal );
	debouncer1 : debouncer port map (clk, on_off_btn, on_off_signal);
	debouncer2 : debouncer port map ( clk, speed_btn, speed_signal );
	process(clk)
	begin
		if clk'event and clk = '1' then
			case cur_speed is
				when low_speed => 
					speed_control <= "00";
					LD0 <= '1';
					LD1 <= '0';
					LD2 <= '0';	
					if on_off_signal = '1' then
						cur_speed <= zero_speed;
					end if;
					
					if speed_signal = '1' then
						cur_speed <= medium_speed;		
					end if;
					
						
	------------------------------------------------------------------------------------------------			
				when medium_speed =>
					speed_control <= "01";
					LD0 <= '0';
					LD1 <= '1';
					LD2 <= '0';
					
					if on_off_signal = '1' then
						cur_speed <= zero_speed;
					end if;
					
					if speed_signal = '1' then
						cur_speed <= high_speed;		
					end if;
	----------------------------------------------------------------------------------------------------				
				when high_speed =>
					speed_control <= "10";
					LD0 <= '0';
					LD1 <= '0';
					LD2 <= '1';
					
					if on_off_signal = '1' then
						cur_speed <= zero_speed;
					end if;
					
					if speed_signal = '1' then
						cur_speed <= low_speed;		
					end if;
	-------------------------------------------------------------------------------------------------------				
				when zero_speed =>
					speed_control <= "11";
					LD0 <= '1';
					LD1 <= '1';
					LD2 <= '1';
					
					if on_off_signal = '1' then
						cur_speed <= low_speed;
					end if;
					
				
			end case;
		end if;
	end process;

end FSM;


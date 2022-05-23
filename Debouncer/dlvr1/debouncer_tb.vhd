library ieee;
use ieee.std_logic_1164.all;

entity debouncer_tb is
	port (clk, reset: in std_logic; -- clk frequency = 50Mhz
			pb: in std_logic;
			pb_debounced: out std_logic
			);
end entity debouncer_tb;

architecture tb of debouncer_tb is

	component debouncer is
			port (clk, reset: in std_logic; -- clk frequency = 50Mhz
			pb: in std_logic;
			pb_debounced: out std_logic
			);
	end component;

	signal clk : std_logic:='0';
	signal reset : std_logic:='1';
	signal pb : std_logic;
	signal pb_debounced : std_logic;
	-- process termination---
	signal    end_process     :     std_logic   :='0';
begin

uut : debouncer
	port map (
		clk => clk,
		reset => reset,
		pb => pb,
		pb_debounced => pb_debounced
	);

-- clk trigerring
process begin
    clk <= not clk;
    wait for 1 ns;
    if(end_process='1') then
        wait;
    end if;
end process;   
	
-- Initial process
process begin

reset   <= '1';
pb <= '1';
wait for 10 ns;
reset   <= '0';
pb <= '1';
wait for 2 ns;
pb <= '0';
wait for 2 ns;
pb <= '1';
wait for 2 ns;
pb <= '0';
wait for 2 ns;
pb <= '1';
wait for 2 ns;
pb <= '0';
wait for 2 ns;
pb <= '1';
wait for 2 ns;
pb <= '0';
wait for 1000 ns;


wait for 100 ns;
end_process <= '1';
wait;


end process;
	
	
	
end architecture tb;
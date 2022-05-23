library ieee;
use ieee.std_logic_1164.all;

entity debouncer is
	port (clk, reset: in std_logic; -- clk frequency = 50Mhz
			pb: in std_logic;
			pb_debounced: out std_logic
			);
end entity debouncer;

architecture rtl of debouncer is
	signal count : integer range 0 to 5000000;
	signal pb_sampled: std_logic;
begin

debounce_pb: process(clk,reset,pb,pb_sampled,count) is
begin
	if reset ='1' then
		count <= 0;
		pb_debounced <= pb;
		pb_sampled <= pb;
	elsif rising_edge(clk) then
		if pb /= pb_sampled then
			pb_sampled <= pb;
			count <= 0;
		elsif count = 5000000 then -- Change the value here and adjust the debouncing effect.
			pb_debounced <= pb_sampled;
		else
			count <= count + 1;
		end if;
	end if;
end process debounce_pb;

end architecture rtl;
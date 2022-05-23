LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;
USE ieee.std_logic_unsigned.all;

ENTITY trajectory_speeded IS
	PORT(
		reset : in std_logic;
		clk : in std_logic;
		speed_btn : in std_logic;
		on_off_btn : in std_logic;
		motor1 : out std_logic;
		motor2 : out std_logic;
		LD0 : out std_logic;
		LD1 : out std_logic;
		LD2 : out std_logic;
		LD3 : out std_logic;
		LD4 : out std_logic
		);
	END trajectory_speeded;
	
ARCHITECTURE Behavioral OF trajectory_speeded IS
	CONSTANT offset : INTEGER := 112; -- .7 ms
	CONSTANT ending : INTEGER := 3225; -- 20 ms
	SIGNAL tclk : STD_LOGIC := '0';
	SIGNAL a1clk : STD_LOGIC := '0';
	SIGNAL a2clk : STD_LOGIC := '0';
	SIGNAL a3clk : STD_LOGIC := '0';
	SIGNAL aclk : STD_LOGIC := '0';
	SIGNAL int1 : INTEGER := 127;
	SIGNAL count1 : INTEGER := 0;
	SIGNAL int2 : INTEGER := 127;
	SIGNAL count2 : INTEGER := 0;
	signal speed_control : std_logic_vector(1 downto 0) := "00" ;
	CONSTANT array_len : INTEGER := 369;
	type int_array_type is array(0 to array_len) of integer;
	signal int_array1 : int_array_type :=(90,90,90, 90, 90, 90, 90, 90, 90, 90, 90, 90, 91, 91, 91, 91, 91, 91, 92, 92, 92, 92, 92, 93, 93, 93, 94, 94, 94, 95, 95, 95, 96, 96, 96, 97, 97, 98, 98, 99, 99, 100, 100, 101, 101, 102, 102, 103, 103, 104, 104, 105, 105, 106, 107, 107, 108, 109, 109, 110, 110, 111, 112, 113, 113, 114, 115, 115, 116, 117, 117, 118, 119, 120, 120, 121, 122, 123, 123, 124, 125, 126, 126, 127, 128, 129, 130, 130, 131, 132, 133, 133, 134, 135, 136, 137, 137, 138, 139, 140, 140, 141, 142, 143, 144, 144, 145, 146, 147, 147, 148, 149, 150, 150, 151, 152, 153, 153, 154, 155, 155, 156, 157, 158, 158, 159, 160, 160, 161, 161, 162, 163, 163, 164, 165, 165, 166, 166, 167, 167, 168, 168, 169, 169, 170, 170, 171, 171, 172, 172, 173, 173, 174, 174, 174, 175, 175, 175, 176, 176, 176, 177, 177, 177, 178, 178, 178, 178, 178, 179, 179, 179, 179, 179, 179, 180,180, 180, 180, 180, 180, 180, 180, 180, 180, 180, 180,180, 180, 180, 180, 180, 180, 180, 180, 180, 179, 179, 179, 179, 179, 179, 178, 178, 178, 178, 178, 177, 177, 177, 176, 176, 176, 175, 175, 175, 174, 174, 174, 173, 173, 172, 172, 171, 171, 170, 170, 169, 169, 168, 168, 167, 167, 166, 166, 165, 165, 164, 163, 163, 162, 161, 161, 160, 160, 159, 158, 158, 157, 156, 155, 155, 154, 153, 153, 152, 151, 150, 150, 149, 148, 147, 147, 146, 145, 144, 144, 143, 142, 141, 140, 140, 139, 138, 137, 137, 136, 135, 134, 133, 133, 132, 131, 130, 130, 129, 128, 127, 126, 126, 125, 124, 123, 123, 122, 121, 120, 120, 119, 118, 117, 117, 116, 115, 115, 114, 113, 113, 112, 111, 110, 110, 109, 109, 108, 107, 107, 106, 105, 105, 104, 104, 103, 103, 102, 102, 101, 101, 100, 100, 99, 99, 98, 98, 97, 97, 96, 96, 96, 95, 95, 95, 94, 94, 94, 93, 93, 93, 92, 92, 92, 92, 92, 91, 91, 91, 91, 91, 91, 90, 90, 90, 90, 90, 90, 90, 90, 90, 90, 90);
	signal int_array2 : int_array_type :=(0,0,0, 0, 1, 2, 3, 3, 4, 5, 6, 7, 8, 9, 10, 10, 11, 12, 13, 14, 15, 15, 16, 18, 19, 20, 20, 21, 22, 23, 23, 24, 25, 26, 26, 27, 28, 29, 29, 30, 31, 31, 32, 33, 33, 34, 35, 35, 36, 37, 37, 38, 38, 39, 39, 40, 40, 41, 41, 42, 42, 43, 43, 44, 44, 45, 45, 45, 46, 46, 46, 47, 47, 47, 48, 48, 48, 48, 49, 49, 49, 49, 49, 49, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 49, 49, 49, 49, 49, 49, 48, 48, 48, 48, 47, 47, 47, 46, 46, 46, 45, 45, 45, 44, 44, 43, 43, 42, 42, 41, 41, 40, 40, 39, 39, 38, 38, 37, 37, 36, 35, 35, 34, 33, 33, 32, 31, 31, 30, 29, 29, 28, 27, 26, 26, 25, 24, 23, 23, 22, 21, 20, 20, 19, 18, 17, 16, 15, 15, 14, 13, 12, 11, 10, 10, 9, 8, 7, 6, 5, 4, 3, 3, 2, 1, 0, 0, 0, 0,0,0, 0, 1, 2, 3, 3, 4, 5, 6, 7, 8, 9, 10, 10, 11, 12, 13, 14, 15, 15, 16, 17, 18, 19, 20, 21, 22, 23, 23, 24, 25, 26, 26, 27, 28, 29, 29, 30, 31, 31, 32, 33, 33, 34, 35, 35, 36, 37, 37, 38, 38, 39, 39, 40, 40, 41, 41, 42, 42, 43, 43, 44, 44, 45, 45, 45, 46, 46, 46, 47, 47, 47, 48, 48, 48, 48, 49, 49, 49, 49, 49, 49, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 49, 49, 49, 49, 49, 49, 48, 48, 48, 48, 47, 47, 47, 46, 46, 46, 45, 45, 45, 44, 44, 43, 43, 42, 42, 41, 41, 40, 40, 39, 39, 38, 38, 37, 37, 36, 35, 35, 34, 33, 33, 32, 31, 31, 30, 29, 29, 28, 27, 26, 26, 25, 24, 23, 23, 22, 21, 20, 20, 19, 18, 17, 16, 15, 15, 14, 13, 12, 11, 10, 10, 9, 8, 7, 6, 5, 4, 3, 3, 2, 1, 0,0, 0);	
	
	COMPONENT divclk 
	GENERIC(div : INTEGER := 313);
	PORT(
		clkin : in STD_LOGIC;
		clkout : out STD_LOGIC);
	end COMPONENT;
	
	COMPONENT speed_count 
	GENERIC(div1 : INTEGER := 15000);
		port(
		clk_in : in STD_LOGIC;
		clk_out : out STD_LOGIC);
	end COMPONENT;
	
	component FSM_Speed 
	port(
			clk  : in std_logic;
			reset: in std_logic;
			speed_btn : in std_logic;
			on_off_btn : in std_logic;
			speed_control : out std_logic_vector(1 downto 0 );
			LD0			  : out std_logic;
			LD1			  : out std_logic;
			LD2			  : out std_logic;
			LD3			  : out std_logic;
			LD4			  : out std_logic
	);
	end component;

	BEGIN
	divider : divclk PORT MAP(clk, tclk); -- make resolution clk at 6.2 us
	speed_counter1: speed_count generic map( div1 => 4000 ) PORT MAP( tclk, a1clk );
	speed_counter2: speed_count generic map( div1 => 3000 ) PORT MAP( tclk, a2clk );
	speed_counter3: speed_count generic map( div1 => 1500 ) PORT MAP( tclk, a3clk );
	states  : FSM_Speed port map( clk, reset, speed_btn, on_off_btn, speed_control, LD0, LD1, LD2 , LD3, LD4);
	
	process( aclk, int1, int_array1 )
	variable i : integer := 0;
	begin	
			if aclk = '1' and aclk'EVENT then
				int1 <= int_array1(i);	
				if i = array_len then
					i := 0;
				else 
					i := i + 1;
				end if;		 
			end if;
		
	end process;
	process( aclk, int2, int_array2 )
	variable i : integer := 0;
	begin	
			if aclk = '1' and aclk'EVENT then
				int2 <= int_array2(i);	
				if i = array_len then
					i := 0;
				else 
					i := i + 1;
				end if;		 
			end if;
		
	end process;
	
	
	PROCESS(tclk, int1,  count1)
		VARIABLE temp1 : STD_LOGIC := '0';
		BEGIN
		IF tclk = '1' AND tclk'EVENT THEN
			IF count1 = ending THEN --count pulse duration
				temp1 := '0';
				count1 <= 0;
			ELSE
			count1 <= count1 + 1;
			if count1 <= int1 + offset - 1 THEN
				temp1 := '1';
			else
				temp1 := '0';
			end if;
		END IF;
	END IF;
	motor1 <= temp1;
	END PROCESS;
	
	PROCESS(tclk, int2, count2)
	VARIABLE temp2 : STD_LOGIC := '0';
	BEGIN
	IF tclk = '1' AND tclk'EVENT THEN
		IF count2 = ending THEN --count pulse duration
			temp2 := '0';
			count2 <= 0;
		ELSE
		count2 <= count2 + 1;
		if count2 <= int2 + offset - 1 THEN
			temp2 := '1';
		else
			temp2 := '0';
		end if;
	END IF;
END IF;
motor2 <= temp2;
END PROCESS;

  process( speed_control, tclk )
  begin
		if tclk = '1' and tclk'EVENT then
			if speed_control = "00" then
				aclk <= a1clk;
				
				elsif speed_control = "01" then
					aclk <= a2clk;
					
				elsif speed_control = "10" then
					aclk <= a3clk;
					
				elsif speed_control = "11" then
					aclk <= '0';
					
			end if;
		end if;		
  end process;


END Behavioral;

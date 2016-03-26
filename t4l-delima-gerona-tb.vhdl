--Authors:
	--Zydrick Delima
	--Alexandre Gerona

library IEEE; use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity tb_farm_alarm is
	constant MAX_COMB: integer := 63;
	constant DELAY: time := 10 ns;
end entity tb_farm_alarm;

architecture security_alarm of tb_farm_alarm is

	component farm_alarm is
		port( alarm: out std_logic;  inBoggis, inBunce, inBean, outBoggis, outBunce, outBean: in std_logic);
	end component farm_alarm;
	
	signal alarm: std_logic;
	signal inBoggis, inBunce, inBean, outBoggis, outBunce, outBean: std_logic;
	
    begin --architecture

	uut: component farm_alarm port map(alarm, inBoggis, inBunce, inBean, outBoggis, outBunce, outBean);
	main: process is
	
            variable temp           : unsigned(5 downto 0);
            variable expected_alarm  : std_logic;
            variable error_count    : integer   := 0;
			
	begin --process
	
		report "start simulation";
		
		for i in 0 to 63 loop
			temp := TO_UNSIGNED(i, 6);
			--assign each input a value from temp
			inBoggis  <= temp(5);
			inBunce   <= temp(4);
			inBean    <= temp(3);
			outBoggis <= temp(2);
			outBunce  <= temp(1);
			outBean   <= temp(0);
			
            wait for DELAY;
            
            expected_alarm := (inBoggis or inBunce or inBean) and (outBoggis or outBunce or outBean);
			
            wait for DELAY;
			
			assert(expected_alarm = alarm)
				report "ERROR: Expected alarm " & std_logic'image(expected_alarm) & " /= actual valid " & 
					std_logic'image(alarm) & " at time " & time'image(now);
				
			if  (expected_alarm /= alarm)
				then error_count := error_count + 1;
			end if;
            
            temp := temp + 1;
		end loop;
		
		wait for DELAY;
		assert (error_count = 0)
			report "ERROR: There were " &
				integer'image(error_count) & " errors!";
			if(error_count = 0)
				then report "Simulation completed with NO errors.";
			end if;
		wait;
	end process;
end architecture security_alarm;


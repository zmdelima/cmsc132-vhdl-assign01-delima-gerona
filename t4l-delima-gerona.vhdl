--Authors:
	--Zydrick Delima
    --Alexandre Gerona

library IEEE;
use IEEE.std_logic_1164.all;

--declaration of the farm_alarm entity accepting 3 Input Farm Buzzers and 3 Output Farm Buzzers from Boggis,Bunce and Bean 
entity farm_alarm is
	port( alarm: out std_logic;  inBoggis, inBunce, inBean, outBoggis, outBunce, outBean: in std_logic);
end entity farm_alarm;

architecture buzz of farm_alarm is
begin
	process (inBoggis, inBunce, inBean, outBoggis, outBunce, outBean) is
	begin
	    --the boolean function for the given problem
        alarm <= ((inBoggis or inBunce or inBean) and (outBoggis or outBunce or outBean)); 
	end process;
end architecture;

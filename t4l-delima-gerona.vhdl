--Authors:
	--Zydrick Delima
    --Alexandre Gerona

library IEEE;
use IEEE.std_logic_1164.all;

entity farm_alarm is
	port( alarm: out std_logic;  inBoggis, inBunce, inBean, outBoggis, outBunce, outBean: in std_logic);
end entity farm_alarm;

architecture buzz of farm_alarm is
begin
	process (inBoggis, inBunce, inBean, outBoggis, outBunce, outBean) is
	begin
        alarm <= ((inBoggis or inBunce or inBean) and (outBoggis or outBunce or outBean));
	end process;
end architecture;

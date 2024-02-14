library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

ENTITY e1 IS
port(CLK : IN STD_LOGIC;
	  switch : IN STD_LOGIC;
	  pump : OUT STD_LOGIC;
	  led : OUT STD_LOGIC;
	  stage1 : OUT STD_LOGIC;
	  stage2 : OUT STD_LOGIC;
	  servo : OUT STD_LOGIC);
END e1;

ARCHITECTURE a1 of e1 IS
	SIGNAL ticks : integer:=0;
	SIGNAL seconds : integer:=10;
BEGIN
	PROCESS(CLK)
	BEGIN
		IF CLK'EVENT AND CLK = '1' THEN
			IF switch = '1' THEN
				IF ticks = 50000000 THEN
					seconds <= seconds - 1;
					ticks <= 0;
				ELSIF ticks <50000000 THEN
					ticks <= ticks+1;
				END IF;
				
				IF seconds = 0 THEN
					servo <= '1';
					pump <= '1';
					led <= '1';
					stage1 <= '0';
					stage2 <= '1';
					ticks <= 60000000;
				ELSE
					pump <= '0';
					servo <= '0';
					led <= '0';
					stage1 <= '1';
					stage2 <= '0';
				END IF;
			ELSE
				stage1 <= '0';
				stage2 <= '0';
				led <= '0';
				servo <= '0';
				pump <= '1';
				seconds <= 10;
				ticks <= 0;
			END IF;
			
		END IF;
	END PROCESS;
	
END a1;
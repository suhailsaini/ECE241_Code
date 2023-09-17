library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity wimpyalu is
	Port (A,B : IN STD_LOGIC_VECTOR(2 downto 0);
			S : IN STD_LOGIC_VECTOR(1 downto 0);
			Y : OUT STD_LOGIC_VECTOR(2 downto 0));
	end wimpyalu;
	
architecture Behavioral of wimpyalu is

	signal X0, X1, I0, I1, I2, I3 : STD_LOGIC_VECTOR(2 downto 0);

	begin

		I0 <= (A + B);
		I1 <= (A - B);
		I2 <= (A and B);
		I3 <= (A or B);
		
		X0 <= I1 when s(0) = '1' else I0;
		X1 <= I3 when s(0) = '1' else I2;
		Y <= X1 when s(1) = '1' else X0;

end Behavioral;
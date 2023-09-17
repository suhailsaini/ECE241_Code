library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity ldl is

	port (clk, rst, x : in std_logic;
		y : out std_logic_vector(2 downto 0));

end ldl;
	
architecture Behavioral of ldl is

	type state_type is (S0, S1, S2, S3, S4);
	signal state, next_state : state_type;

begin
	FF_PROC: process(clk)

		begin
		if rising_edge(clk) then
			state <= next_state;
		end if;

	end process;
	
	NS_PROC: process(state, rst, x)
	
		begin
		if (rst='1') then next_state <= S0;
		else
			case (state) is
			
				when S0 =>
							if (x='1') then
								next_state <= S1;
							else next_state <= S4;
							end if;

				when S1 =>
							if (x='1') then
								next_state <= S2;
							else next_state <= S4;
							end if;
							
				when S2 =>
							if (x='1') then
								next_state <= S3;
							else next_state <= S4;
							end if;

				when S3 =>
							if (x='1') then
								next_state <= S1;
							else next_state <= S4;
							end if;
							
				when S4 =>
							if (x='1') then
								next_state <= S1;
							else next_state <= S0;
							end if;

			end case;
		end if;
	end process;
	
	OUT_PROC: process(state, x)
	begin
		case (state) is
		
			when S0 =>
						if (x='1') then
							y <= "000";
						else y <= "000";
						end if;

			when S1 =>
						if (x='1') then
							y <= "001";
						else y <= "111";
						end if;

			when S2 =>
						if (x='1') then
							y <= "010";
						else y <= "111";
						end if;

			when S3 =>
						if (x='1') then
							y <= "100";
						else y <= "111";
						end if;

			when S4 =>
						if (x='1') then
							y <= "001";
						else y <= "111";
						end if;
		end case;
	end process;

end Behavioral;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
 
entity pico_cntrl is
Port ( clk : in std_logic; rst : in std_logic; go : in std_logic;
		 ir  : in std_logic_vector(3 downto 0);

ld_in  : out std_logic; ld_out : out std_logic;
sel    : out std_logic; ld_ir  : out std_logic;
ld_a   : out std_logic; ld_b   : out std_logic;
ld_ccr : out std_logic; ld_tmp : out std_logic);

end pico_cntrl;
 
architecture Behavioral of pico_cntrl is

	type state_type is (S0,S1,S2,S3,S4,S5,S6,S7,S8,S9,S10);
	signal state, next_state : state_type;

	begin
		FF_PROC: process(clk)
		
			begin
				if rising_edge(clk) then
					state <= next_state;
				end if;
			end process;
			
		NS_PROC: process(rst, go, ir)

			begin
				if (rst='1') then next_state <= S0;
				else
					case (state) is
					
						when S0 =>
									if (go='1') then
										next_state <= S1;
									else next_state <= S0;
									end if;

						when S1 =>
									if (go='1') then
										next_state <= S2;
									else next_state <= S0;
									end if;

						when S2 =>

									case ir is
									
										when "0000" =>
										next_state <= S3;
										when "0001" =>
										next_state <= S4;
										when "0010" =>
										next_state <= S5;
										when "0011" =>
										next_state <= S6;
										when "0100" =>
										next_state <= S7;
										when "0101" =>
										next_state <= S8;
										when "0110" =>
										next_state <= S9;
										when "0111" =>
										next_state <= S10;
										when "1111" =>
										next_state <= S0;
										when others =>
										next_state <= S0;

									end case;

						when others =>
						next_state <= S0;
						
					end case;
				end if;
			end process;
			
		OU_PROC: process(state, next_state, ir)
		
			begin
			
				case state is
				
					when S0 =>
					
					when S1 =>
					
					when S2 =>
					
					when S3 =>
					
					when S4 =>
					
					when S5 =>
					
					when S6 =>
					
					when S7 =>
					
					when S8 =>
					
					when S9 =>
					
					when S10 =>
					
				end case;
			end process;
			
end Behavioral;
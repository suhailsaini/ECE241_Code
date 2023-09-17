--  
--  This VHDL file provides a slower clock and
--  debounced buttons to facilitate demonstration
--  of your FSM on the FPGA board.
--  
--  To use it, you must add your output ports
--  to the fsm_demo entity, instantiate your
--  fsm in the fsm_demo architecture, and connect
--  the outputs of your fsm component to the ports
--  in the fsm_demo entity.
--  
--  Any questions? :-)
--  

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity fsm_demo is
    Port ( fclk : in std_logic; -- fclk is the fast board clock
           rst_btn, x_btn : in std_logic;

-- add more signals as needed!!!

				y : out std_logic_vector(2 downto 0)

         );
end fsm_demo;

architecture Behavioral of fsm_demo is

-- internal signals

type state_type is (S0, S1, S2, S3, S4);
signal state, next_state : state_type;

signal clk, sclk, rst, x :  std_logic;

-- Declare your FSM component here



begin

-- Instantiate your FSM component here, and connect
-- to signals clk, rst, and x


--       INSERT CODE HERE !!!!!

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


---------------------------------------------------

-- Make no changes below this line!!!! =:-0

clk <= sclk; -- used for demo on board

-- Debounce the buttons

process (sclk) 
variable sreg1, sreg2 : std_logic_vector(2 downto 0);
begin 
   if rising_edge(sclk) then
      if (x_btn = '1') then x <= '1'; 
      else x <= '0';
      end if;
      if (rst_btn = '1') then rst <= '1'; 
      else rst <= '0';
      end if;
   end if;
end process;

-- divide down fclk using an LFSR

process (fclk)
variable sreg : std_logic_vector(1 to 23);
begin  
   if rising_edge(fclk) then
	  if (conv_integer(sreg) = 0) then
       sclk <= not sclk;
	  end if; -- equals zero
	  sreg := (sreg(23) xnor sreg(18)) & sreg(1 to 22);      
   end if; -- rising_edge
end process;

end Behavioral;
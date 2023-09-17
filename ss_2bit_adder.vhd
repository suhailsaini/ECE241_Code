----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:42:43 02/14/2023 
-- Design Name: 
-- Module Name:    ss_2bit_adder - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

---- Uncomment the following library declaration if instantiating
---- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ss_2bit_adder is
    Port ( A : in  STD_LOGIC_VECTOR (1 downto 0);
           B : in  STD_LOGIC_VECTOR (1 downto 0);
           S : out  STD_LOGIC_VECTOR (2 downto 0));
end ss_2bit_adder;

architecture Behavioral of ss_2bit_adder is

begin

	S(2) <= (A(1) and B(1)) or (A(1) and A(0) and B(0)) or (A(0) and B(1) and B(0));
	
	S(1) <= (A(1) and (not B(1)) and (not B(0))) 	
	or (A(1) and (not A(0)) and (not B(1))) 
	or ((not	A(1)) and (not A(0)) and B(1)) 
	or ((not A(1)) and B(1) and (not B(0))) 
	or ((not A(1)) and A(0)	and (not B(1)) and B(0)) 
	or (A(1) and A(0) and B(1) and B(0));
	
	S(0) <= (A(0) and (not B(0))) or ((not A(0)) and B(0));

end Behavioral;


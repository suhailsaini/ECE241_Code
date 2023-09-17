library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity alu is
    Port ( rega : in std_logic_vector(3 downto 0);       -- data from register a
           regb : in std_logic_vector(3 downto 0);       -- data from register b
           controls : in std_logic_vector(3 downto 0);   -- opcode
           alu_out : out std_logic_vector(3 downto 0);   -- alu output
           ccr_out : out std_logic_vector(3 downto 0));  -- data from conditional control register
end alu;

architecture Behavioral of alu is

	signal 

end Behavioral;
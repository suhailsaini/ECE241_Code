--------------------------------------------------------------------------------
-- Copyright (c) 1995-2007 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 9.2.04i
--  \   \         Application : sch2vhdl
--  /   /         Filename : ss3bcounter.vhf
-- /___/   /\     Timestamp : 03/07/2023 12:18:54
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: C:\Xilinx\92i\bin\nt\sch2vhdl.exe -intstyle ise -family spartan3e -flat -suppress -w C:/tmp/suhail_saini/241_lab8/ss3bcounter.sch ss3bcounter.vhf
--Design Name: ss3bcounter
--Device: spartan3e
--Purpose:
--    This vhdl netlist is translated from an ECS schematic. It can be 
--    synthesis and simulted, but it should not be modified. 
--

library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity ss3bcounter is
   port ( CLK      : in    std_logic; 
          up_dwn_b : in    std_logic; 
          N0       : out   std_logic; 
          N1       : out   std_logic; 
          N2       : out   std_logic);
end ss3bcounter;

architecture BEHAVIORAL of ss3bcounter is
   attribute INIT       : string ;
   attribute BOX_TYPE   : string ;
   signal XLXN_1   : std_logic;
   signal XLXN_2   : std_logic;
   signal XLXN_3   : std_logic;
   signal XLXN_4   : std_logic;
   signal XLXN_6   : std_logic;
   signal XLXN_7   : std_logic;
   signal XLXN_8   : std_logic;
   signal XLXN_10  : std_logic;
   signal XLXN_11  : std_logic;
   signal XLXN_12  : std_logic;
   signal XLXN_74  : std_logic;
   signal XLXN_76  : std_logic;
   signal XLXN_77  : std_logic;
   signal N0_DUMMY : std_logic;
   signal N1_DUMMY : std_logic;
   signal N2_DUMMY : std_logic;
   component FD
      -- synopsys translate_off
      generic( INIT : bit :=  '0');
      -- synopsys translate_on
      port ( C : in    std_logic; 
             D : in    std_logic; 
             Q : out   std_logic);
   end component;
   attribute INIT of FD : component is "0";
   attribute BOX_TYPE of FD : component is "BLACK_BOX";
   
   component OR4
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             I3 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of OR4 : component is "BLACK_BOX";
   
   component OR3
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of OR3 : component is "BLACK_BOX";
   
   component AND4B1
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             I3 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND4B1 : component is "BLACK_BOX";
   
   component AND3B1
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND3B1 : component is "BLACK_BOX";
   
   component AND3B2
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND3B2 : component is "BLACK_BOX";
   
   component AND2B1
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND2B1 : component is "BLACK_BOX";
   
begin
   N0 <= N0_DUMMY;
   N1 <= N1_DUMMY;
   N2 <= N2_DUMMY;
   XLXI_2 : FD
      port map (C=>CLK,
                D=>N2_DUMMY,
                Q=>XLXN_74);
   
   XLXI_4 : FD
      port map (C=>CLK,
                D=>N0_DUMMY,
                Q=>XLXN_76);
   
   XLXI_5 : OR4
      port map (I0=>XLXN_4,
                I1=>XLXN_3,
                I2=>XLXN_2,
                I3=>XLXN_1,
                O=>N2_DUMMY);
   
   XLXI_6 : OR3
      port map (I0=>XLXN_8,
                I1=>XLXN_7,
                I2=>XLXN_6,
                O=>N1_DUMMY);
   
   XLXI_7 : OR3
      port map (I0=>XLXN_12,
                I1=>XLXN_11,
                I2=>XLXN_10,
                O=>N0_DUMMY);
   
   XLXI_9 : AND4B1
      port map (I0=>XLXN_74,
                I1=>XLXN_77,
                I2=>XLXN_76,
                I3=>up_dwn_b,
                O=>XLXN_1);
   
   XLXI_10 : AND3B1
      port map (I0=>up_dwn_b,
                I1=>XLXN_77,
                I2=>XLXN_74,
                O=>XLXN_2);
   
   XLXI_11 : AND3B1
      port map (I0=>XLXN_76,
                I1=>XLXN_77,
                I2=>XLXN_74,
                O=>XLXN_3);
   
   XLXI_12 : AND3B1
      port map (I0=>XLXN_77,
                I1=>up_dwn_b,
                I2=>XLXN_74,
                O=>XLXN_4);
   
   XLXI_13 : AND3B1
      port map (I0=>XLXN_76,
                I1=>up_dwn_b,
                I2=>XLXN_77,
                O=>XLXN_6);
   
   XLXI_14 : AND3B1
      port map (I0=>XLXN_77,
                I1=>XLXN_76,
                I2=>up_dwn_b,
                O=>XLXN_7);
   
   XLXI_15 : AND3B2
      port map (I0=>up_dwn_b,
                I1=>XLXN_77,
                I2=>XLXN_74,
                O=>XLXN_8);
   
   XLXI_17 : AND3B1
      port map (I0=>up_dwn_b,
                I1=>XLXN_76,
                I2=>XLXN_77,
                O=>XLXN_11);
   
   XLXI_18 : AND3B1
      port map (I0=>up_dwn_b,
                I1=>XLXN_77,
                I2=>XLXN_74,
                O=>XLXN_12);
   
   XLXI_19 : AND2B1
      port map (I0=>XLXN_76,
                I1=>up_dwn_b,
                O=>XLXN_10);
   
   XLXI_20 : FD
      port map (C=>CLK,
                D=>N1_DUMMY,
                Q=>XLXN_77);
   
end BEHAVIORAL;



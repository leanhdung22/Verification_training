library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity mux_bist is
  port (TEST          : in  std_logic;
        i_Data_TEST   : in  std_logic_vector (15 downto 0);
        i_Data_NORMAL : in  std_logic_vector (15 downto 0);
        o_Data        : out std_logic_vector (15 downto 0));
end mux_bist;

architecture Behavioral of mux_bist is
begin
  o_Data <= i_Data_TEST when (TEST = '1') else i_Data_NORMAL;
  -- if TEST == 0, we use Data from register 
end Behavioral;

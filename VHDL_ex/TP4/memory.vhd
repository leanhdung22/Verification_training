-- Simple VHDL memory model

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_ARITH.all;

entity RAM1024X16 is
  port(
    ADD  : in  std_logic_vector(9 downto 0);   -- Address Bus
    DIN  : in  std_logic_vector(15 downto 0);  -- Data In
    DOUT : out std_logic_vector(15 downto 0);  -- Data Out
    CSn  : in  std_logic;                      -- Chip Select
    WEn  : in  std_logic;                      -- Write Enable
    CLK  : in  std_logic                       -- Clock
    );
end RAM1024X16;

architecture MODEL of RAM1024X16 is

  type data_type is array(1023 downto 0) of std_logic_vector(15 downto 0);
  signal DATA : data_type;

begin

  WRITE_PROC : process(CLK)
  begin
    if (CLK'event and CLK = '1') then
      if (CSn = '0' and WEn = '0') then
        DATA(CONV_INTEGER(unsigned(ADD))) <= DIN;
      end if;
    end if;
  end process WRITE_PROC;


  DOUT <= DATA(CONV_INTEGER(unsigned(ADD))) when CSn = '0' else (others => 'Z');

end MODEL;

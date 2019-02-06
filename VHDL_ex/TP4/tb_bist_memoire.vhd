library ieee;
use ieee.std_logic_1164.all;

library lib_VHDL;

entity tb_bist_memoire is

end entity tb_bist_memoire;

architecture testbench of tb_bist_memoire is

  component RAM1024X16 is
    port(
      ADD  : in  std_logic_vector(9 downto 0);   -- Address Bus
      DIN  : in  std_logic_vector(15 downto 0);  -- Data In
      DOUT : out std_logic_vector(15 downto 0);  -- Data Out
      CSn  : in  std_logic;                      -- Chip Select
      WEn  : in  std_logic;                      -- Write Enable
      CLK  : in  std_logic                       -- Clock
      );
  end component RAM1024X16;

  component BIST is
    port(
      CLK       : in  std_logic;
      MEM_ADD   : out std_logic_vector(9 downto 0);
      MEM_DIN   : out std_logic_vector(15 downto 0);
      MEM_DOUT  : in  std_logic_vector(15 downto 0);
      MEM_CSn   : out std_logic;
      MEM_WEn   : out std_logic;
      TEST_RUN  : in  std_logic;
      TEST_FAIL : out std_logic;
      TEST_SO   : out std_logic
      );
  end component BIST;

  signal sig_clk           : std_logic;
  signal sig_ADD_MEM_ADD   : std_logic_vector(9 downto 0);
  signal sig_DIN_MEM_DIN   : std_logic_vector(15 downto 0);
  signal sig_DIN   				 : std_logic_vector(15 downto 0);
  signal sig_DOUT_MEM_DOUT : std_logic_vector(15 downto 0);
  signal sig_CSn_MEM_CSn   : std_logic;
  signal sig_WEn_MEM_WEn   : std_logic;

  signal sig_FAIL : std_logic;
  signal sig_RUN  : std_logic;
  signal sig_SO   : std_logic;


  constant delay_10 : time := 10 ns;
  constant delay_20 : time := 20 ns;
  constant delay_30 : time := 30 ns;
  constant delay    : time := 400 ns;

  
begin  -- architecture testbench
  tb_BIST : BIST port map (
    CLK       => sig_clk,
    MEM_ADD   => sig_ADD_MEM_ADD,
    MEM_DIN   => sig_DIN,
    MEM_DOUT 	=> sig_DOUT_MEM_DOUT,
    MEM_CSn   => sig_CSn_MEM_CSn,
    MEM_WEn   => sig_WEn_MEM_WEn,
    TEST_RUN  => sig_RUN,
    TEST_FAIL => sig_FAIL,
    TEST_SO   => sig_SO);

  tb_Mem : RAM1024X16 port map (
    ADD  => sig_ADD_MEM_ADD,
    DIN  => sig_DIN_MEM_DIN,
    DOUT => sig_DOUT_MEM_DOUT,
    CSn  => sig_CSn_MEM_CSn,
    WEn  => sig_WEn_MEM_WEn,
    CLK  => sig_clk);


  process
  begin
    sig_Clk <= '0';
    wait for delay_10/2;
    sig_Clk <= '1';
    wait for delay_10/2;
    sig_Clk <= '0';
  end process;
  
  process 
  begin
	sig_RUN <='0','1'after 200ns ;
	wait;
	end process;
	
	process
	begin	
	if(sig_ADD_MEM_ADD="0011101111") then
		sig_DIN_MEM_DIN <= "1111001000001110";
	else
		sig_DIN_MEM_DIN <= sig_DIN;
	end if;
	wait;
	end process;
end architecture testbench;

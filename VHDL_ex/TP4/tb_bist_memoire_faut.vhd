library ieee;
use ieee.std_logic_1164.all;

library lib_VHDL;

entity tb_bist_memoire is

end entity tb_bist_memoire;

architecture testbench_f of tb_bist_memoire is
  component mux_bist is
    port (TEST          : in  std_logic;
          i_Data_TEST   : in  std_logic_vector (15 downto 0);
          i_Data_NORMAL : in  std_logic_vector (15 downto 0);
          o_Data        : out std_logic_vector (15 downto 0));
  end component mux_bist;

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
--signal sig_clk2           : std_logic;
  signal sig_ADD_MEM_ADD   : std_logic_vector(9 downto 0);
  signal sig_DIN_MEM_DIN   : std_logic_vector(15 downto 0);
  signal sig_DOUT_MEM_DOUT : std_logic_vector(15 downto 0);
  signal sig_CSn_MEM_CSn   : std_logic;
  signal sig_WEn_MEM_WEn   : std_logic;

  signal sig_Bist_Mux  : std_logic_vector(15 downto 0);
  signal sig_Mux_Mem   : std_logic_vector(15 downto 0);
  signal sig_TEST      : std_logic;
  signal sig_Data_TEST : std_logic_vector(15 downto 0) := "1111000011110000";

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
    MEM_DIN   => sig_Bist_Mux,
    MEM_CSn   => sig_CSn_MEM_CSn,
    MEM_WEn   => sig_WEn_MEM_WEn,
    MEM_DOUT  => sig_DOUT_MEM_DOUT,
    TEST_RUN  => sig_RUN,
    TEST_FAIL => sig_FAIL,
    TEST_SO   => sig_SO);

  tb_Mux : mux_bist port map (
    TEST          => sig_TEST,
    i_Data_TEST   => sig_Data_TEST,
    i_Data_NORMAL => sig_Bist_Mux,
    o_Data        => sig_Mux_Mem);
    
  tb_Mem : RAM1024X16 port map (
    ADD  => sig_ADD_MEM_ADD,
    DIN  => sig_Mux_Mem,
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
    sig_RUN <= '0';
    wait for 100 ns;
    sig_RUN <= '1';
    wait for delay_10/2;
    wait;
  end process;

  l : process (sig_ADD_MEM_ADD) is
  begin  -- process l
    if sig_ADD_MEM_ADD = "1011100101" then
      sig_TEST <= '1';
    else
      sig_TEST <= '0';
    end if;
  end process l;

end architecture testbench_f;

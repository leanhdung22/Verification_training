-------------------------------------------------------------------------------
-- Title      : vhdl_fsm
-- Project    : 
-------------------------------------------------------------------------------
-- File       : vhdl_fsm.vhd
-- Author     : LE  <le@le-VirtualBox>
-- Company    : 
-- Created    : 2019-02-06
-- Last update: 2019-02-11
-- Platform   : 
-- Standard   : VHDL'93/02
-------------------------------------------------------------------------------
-- Description: cfg cours de VHDL SEI-2A-Phelma
-------------------------------------------------------------------------------
-- Copyright (c) 2019 
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author  Description
-- 2019-02-06  1.0      le      Created
-------------------------------------------------------------------------------

-- C-cth: generating template infomation
-- C-cme:
library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity push_gen is

  port (
    i_clk : in  std_logic;
    i_rst : in  std_logic;
    i_E   : in  std_logic;
    o_S   : out std_logic
    );

end entity push_gen;

architecture structural_2_process of push_gen is
-- Define type state recommend
  type state is (A, B, C);
  signal current_state : state;
  signal next_state    : state;

begin  -- architecture structural_2_process

  -- type   : sequential
  P_STATE : process (i_clk, i_rst) is
  begin  -- process P_STATE
    if(i_rst = '1') then
      current_state <= A;
    elsif (rising_edge(i_clk)) then
      current_state <= next_state;
    end if;
  end process P_STATE;

  -- type   : combinational
  P_FSM: process (current_state) is
  begin  -- process
    case current_state is
      when A =>
        if (i_E = '0') then
          next_state <= A;
        else
          next_state <= B;
        end if;

      when B =>
        if (i_E = '0') then
          next_state <= A;
        else
          next_state <= C;
        end if;

      when C =>
        if (i_E = '0') then
          next_state <= A;
        else
          next_state <= C;
        end if;

      when others => null;
    end case; 
  end process;
end architecture structural_2_process;

-- Simple VHDL memory bist model
-- DA
-- This bist implements the following algorithm:
-- MARCH_C {/(W0);/(R0W1);/(R1W0);\(R0W1);\(R1W0);\(R0)}

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_ARITH.all;
use STD.TEXTIO.all;

entity BIST is
	port(
		CLK				:	in 	std_logic;
		MEM_ADD		:	out	std_logic_vector(9 downto 0);
		MEM_DIN		:	out	std_logic_vector(15 downto 0);
		MEM_DOUT	:	in	std_logic_vector(15 downto 0);
		MEM_CSn		:	out	std_logic;
		MEM_WEn		:	out	std_logic;
		TEST_RUN	: in	std_logic;
		TEST_FAIL	:	out	std_logic;
		TEST_SO		:	out	std_logic
	);
end BIST;

architecture BEHAV of BIST is

signal go_up_down	:	std_logic;
signal upper_limit, lower_limit	:	std_logic;
signal test_wait	:	std_logic;
type fsm_states is (TEST_INIT, SEQ1_W0, SEQ2_R0, SEQ2_W1, SEQ3_R1, SEQ3_W0, SEQ3_WAIT,  SEQ4_R0, SEQ4_W1, SEQ5_R1, SEQ5_W0, SEQ6_R0, TEST_END);
signal crt_state, next_state : fsm_states;
signal comp_enable : std_logic;
signal error_vector : std_logic_vector(15 downto 0);
signal ref_vector : std_logic_vector(15 downto 0);
signal end_error_flag, error_flag, end_error_mix : std_logic;
signal address_vector, diagnostic_vector : std_logic_vector(9 downto 0);
signal shift_vector: std_logic_vector(10 downto 0);

begin

--MEM_CSn <= '0';
--MEM_WEn <= '0';
--MEM_DIN <= "1010101010101010";

Address_Generator : process(CLK, TEST_RUN)

	variable address_counter : integer range 0 to 1023;
	
	begin
		if TEST_RUN = '0' then
			address_counter  := 0;
			lower_limit  <=  '0';
			upper_limit  <=  '0';
		elsif CLK='1' and CLK'event then
			if test_wait = '0' then
				if go_up_down = '0' then
					if address_counter = 1023 then
						address_counter  := 0;
					else
						address_counter  := address_counter + 1;
					end if;
				else
					if go_up_down = '1' then
						if address_counter = 0 then
							address_counter  := 1023;
						else
							address_counter  := address_counter - 1;
						end if;
					end if;
				end if;
			end if;
			
			if address_counter = 1023 and go_up_down = '0' then
				upper_limit  <=  '1';
			else
				upper_limit  <=  '0';
			end if;
			
			if address_counter = 0 and go_up_down = '1' then
				lower_limit  <=  '1';
			else
				lower_limit  <=  '0';
		
		end if;
		end if;

	address_vector <= CONV_STD_LOGIC_VECTOR(address_counter, 10);
	MEM_ADD  <= CONV_STD_LOGIC_VECTOR(address_counter, 10);
	
	end process;
	
Controller_next_state : process(CLK, TEST_RUN)
begin
	if TEST_RUN = '0' then
		crt_state <= TEST_INIT;
	elsif CLK='1' and CLK'event then
		crt_state <= next_state;
	end if;
end process;

Controller_fsm : process(crt_state, TEST_RUN, upper_limit, lower_limit)
begin
	case crt_state is

	when TEST_INIT => 
		test_wait <= '1';
		MEM_CSn <= '1';
		MEM_WEn <= '1';
		MEM_DIN <= (others => '0');
		ref_vector <= (others => '0');
		comp_enable <= '0';
		go_up_down <= '0';
		end_error_mix <= '0';
		if (TEST_RUN = '1') then next_state <= SEQ1_W0;
		end if;
		
		
	when SEQ1_W0 => 
		test_wait <= '0';
		MEM_WEn <= '0';
		MEM_CSn <= '0';
		MEM_DIN <= (others => '0');
		comp_enable <= '0';
		
		if upper_limit = '1' then	
			next_state <= SEQ2_R0;
		else 
			next_state <= SEQ1_W0;
		end if;

	when SEQ2_R0 => 
		next_state <= SEQ2_W1;
		test_wait <= '1';
		MEM_WEn <= '1';
		MEM_CSn <= '0';
		ref_vector <= (others => '0');
		MEM_DIN <= (others => '0');
		comp_enable <= '1';
		
	when SEQ2_W1 => 
		test_wait <= '0';
		MEM_WEn <= '0';
		MEM_CSn <= '0';
		MEM_DIN <= (others => '1');
		comp_enable <= '0';

		if upper_limit = '1' then	
			next_state <= SEQ3_R1;
		else 
			next_state <= SEQ2_R0;
		end if;

	when SEQ3_R1 => 
		next_state <= SEQ3_W0;
		test_wait <= '1';
		MEM_WEn <= '1';
		MEM_CSn <= '0';
		ref_vector <= (others => '1');
		MEM_DIN <= (others => '1');
		comp_enable <= '1';
		
	when SEQ3_W0 => 
		test_wait <= '0';
		MEM_WEn <= '0';
		MEM_CSn <= '0';
		MEM_DIN <= (others => '0');
		comp_enable <= '0';

		if upper_limit = '1' then	
			next_state <= SEQ3_WAIT;
		else 
			next_state <= SEQ3_R1;
		end if;

	when SEQ3_WAIT => 
		go_up_down <= '1';
		next_state <= SEQ4_R0;
	
	when SEQ4_R0 => 
		next_state <= SEQ4_W1;
		test_wait <= '1';
		MEM_WEn <= '1';
		MEM_CSn <= '0';
		ref_vector <= (others => '0');
		MEM_DIN <= (others => '0');
		comp_enable <= '1';
			
	when SEQ4_W1 => 
		test_wait <= '0';
		MEM_WEn <= '0';
		MEM_CSn <= '0';
		MEM_DIN <= (others => '1');
		comp_enable <= '0';

		if lower_limit = '1' then	
			next_state <= SEQ5_R1;
		else 
			next_state <= SEQ4_R0;
		end if;

	when SEQ5_R1 => 
		next_state <= SEQ5_W0;
		test_wait <= '1';
		MEM_WEn <= '1';
		MEM_CSn <= '0';
		ref_vector <= (others => '1');
		MEM_DIN <= (others => '1');
		comp_enable <= '1';
		
	when SEQ5_W0 => 
		test_wait <= '0';
		MEM_WEn <= '0';
		MEM_CSn <= '0';
		MEM_DIN <= (others => '0');
		comp_enable <= '0';

		if lower_limit = '1' then	
			next_state <= SEQ6_R0;
		else 
			next_state <= SEQ5_R1;
		end if;

	when SEQ6_R0 => 
		test_wait <= '0';
		MEM_WEn <= '1';
		MEM_CSn <= '0';
		ref_vector <= (others => '0');
		MEM_DIN <= (others => '0');
		comp_enable <= '1';

		if lower_limit = '1' then	
			next_state <= TEST_END;
		else 
			next_state <= SEQ6_R0;
		end if;

	when TEST_END =>
		test_wait <= '1';
		MEM_CSn <= '1';
		MEM_WEn <= '1';
		MEM_DIN <= (others => '0');
		ref_vector <= (others => '0');
		comp_enable <= '0';

		if end_error_flag = '1' then	
			end_error_mix <= '1';
		end if;
	
	end case;
	
end process;

error_vector <= (ref_vector xor MEM_DOUT) when comp_enable = '1' else (others => '0');
error_flag <= '0' when error_vector = "0000000000000000" else '1';

TEST_FAIL <= error_flag or end_error_mix;

TEST_SO <= '0' when (shift_vector(10 downto 1) and diagnostic_vector) = "0000000000" else '1';


Report_Proc : process(CLK, TEST_RUN)
begin
	if TEST_RUN = '0' then
		end_error_flag <= '0';
		diagnostic_vector <= (others => '0');
		shift_vector <= "00000000001";
	elsif CLK='1' and CLK'event then
		if error_flag = '1' then
			end_error_flag <= '1';
			diagnostic_vector <= address_vector;
		end if;
		if (shift_vector(10) = '0' and shift_vector(0) = '0') or error_flag = '1' then
				shift_vector <= shift_vector(9 downto 0) & '0';
			else shift_vector <= "00000000001";
			end if;

	end if;
end process;

end BEHAV;

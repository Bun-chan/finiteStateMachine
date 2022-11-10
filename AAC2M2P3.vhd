library ieee;
use ieee.std_logic_1164.all;

entity FSM is
port (In1: in std_logic;
   RST: in std_logic; 
   CLK: in std_logic;
   Out1 : inout std_logic);
end FSM;
architecture fsm_arch of FSM is
	type state_type is (a, b, c);
	signal current_state, next_state : state_type;
begin
	state_memory_process : process (CLK, RST)
		begin
			if (RST = '1') then
				current_state <= a; --what is the expected action when reset is applied? I just assumed reset to state 'a'.
			elsif (rising_edge(CLK)) then 
				current_state <= next_state;
			end if; --if RST=1
		end process;
	state_logic_process : process (current_state, In1)
		begin
		end process;
end fsm_arch;

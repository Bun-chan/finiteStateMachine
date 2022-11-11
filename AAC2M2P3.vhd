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
		end process; --state_memory_process
		
	state_logic_process : process (current_state, In1)
		begin
		case (current_state) is
				when a => if (In1 = '1') then
					next_state <= b;
					else
					end if;--if Int=1
				when b => if (In1 = '1') then
					next_state <= b;
					else
					next_state <= c;
					end if; --if Int=1;
				when c => if (In1 = '1') then
					next_state <= a;
					else
					next_state <= c;
					end if; --if Int=1
				when others => next_state <= a; --i do not know what this should be.
					report "state_logic_process: others";
		end case; --current_state
		end process; --state_logic_process
		
	output_process : process (current_state, In1) 
		begin
			case (current_state) is
				when a => if (In1 = '1') then
					out1 <= '0';
					else
					out1 <= '0';
					end if; --if Int1=1
				when b => if (In1 = '1') then
					out1 <= '0';
					else
					out1 <= '0';
					end if; --if Int1=1
				when c => if (In1 = '1') then
					out1 <= '1';
					else
					out1 <= '1';
					end if; --if Int1=1
				when others => out1 <= '0';
					report "output_process: others";
			end case; --current_state
		end process; --output_process
end fsm_arch;

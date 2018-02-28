library ieee;
use ieee.std_logic_1164.all;

library work;

entity alu_tb is
end;

architecture arc of alu_tb is
	signal control_tb 	: std_logic_vector(12 downto 0);
	signal a_tb 			: std_logic_vector(31 downto 0);
	signal b_tb 			: std_logic_vector(31 downto 0);
	signal c_tb 			: std_logic_vector(64 downto 0);
	signal zero_tb 		: std_logic;
	signal carry_tb		: std_logic;
	signal overflow_tb 	: std_logic;
	
	component ALU is
		port(
				control						: in std_logic_vector(12 downto 0);
				A, B     					: in std_logic_vector(31 downto 0);
				C								: out std_logic_vector(64 downto 0);
				zero, carry, overflow	: out std_logic
		);
	end component;

	begin
		DUT1 : ALU port map(
				control	=> control_tb,
				A 			=> a_tb,
				B 			=> b_tb,		
				C 			=> c_tb,	
				zero 		=> zero_tb,
				carry 	=> carry_tb,
				overflow => overflow_tb
			);
			
			sim_process: process
			begin
				wait for 0 ns;
				control_tb	<= "0000000000001";
				a_tb <= "11111111111111111111111111111111";
				b_tb <= "00000000000000000000000000000001";
				wait for 20 ns;
				
				control_tb	<= "0000000000010";
				a_tb <= "11111111111111111111111111111111";
				b_tb <= "00000000000000000000000000000001";
				wait for 20 ns;
				
				control_tb	<= "0000000000100";
				a_tb <= "11111111111111111111111111111111";
				b_tb <= "00000000000000000000000000000001";
				wait for 20 ns;

				control_tb	<= "0000000010000";
				a_tb <= "11111111111111111111111111111111";
				b_tb <= "00000000000000000000000000000001";
				wait for 20 ns;

				control_tb	<= "0000000100000";
				a_tb <= "11111111111111111111111111111111";
				b_tb <= "00000000000000000000000000000001";
				wait for 20 ns;		
			
				control_tb	<= "0000001000000";
				a_tb <= "11111111111111111111111111111111";
				b_tb <= "00000000000000000000000000000001";
				wait for 20 ns;
		
				control_tb	<= "0000010000000";
				a_tb <= "11111111111111111111111111111111";
				b_tb <= "00000000000000000000000000000001";
				wait for 20 ns;
			
				control_tb	<= "0000100000000";
				a_tb <= "11111111111111111111111111111111";
				b_tb <= "00000000000000000000000000000001";
				wait for 20 ns;
			
				control_tb	<= "0001000000000";
				a_tb <= "11111111111111111111111111111111";
				b_tb <= "00000000000000000000000000000001";
				wait for 20 ns;
				
				control_tb	<= "0010000000000";
				a_tb <= "11111111111111111111111111111111";
				b_tb <= "00000000000000000000000000000001";
				wait for 20 ns;			
				
				control_tb	<= "0100000000000";
				a_tb <= "11111111111111111111111111111111";
				b_tb <= "00000000000000000000000000000001";
				wait for 20 ns;			
				
				control_tb	<= "1000000000000";
				a_tb <= "11111111111111111111111111111111";
				b_tb <= "00000000000000000000000000000001";
				wait for 20 ns;				
				
				wait;
			end process sim_process;
end arc;
				
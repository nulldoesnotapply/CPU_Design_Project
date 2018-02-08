LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY encoder32bits IS
	generic(n: positive:=32);
	PORT (
		
		input  : IN STD_LOGIC_VECTOR ((n-1) DOWNTO 0);
		output : OUT STD_LOGIC_VECTOR(4 downto 0)
		
	);
end entity encoder32bits;

architecture behavioural of encoder32bits is
begin
	
	
	
	output <= "00000" when (input(0) = '1')
		else "00001" when (input(1) = '1')
		else "00010" when (input(2) = '1')
		else "00011" when (input(3) = '1')
		else "00100" when (input(4) = '1')
		else "00101" when (input(5) = '1')
		else "00110" when (input(6) = '1')
		else "00111" when (input(7) = '1')
		else "01000" when (input(8) = '1')
		else "01001" when (input(9) = '1')
		else "01010" when (input(10) = '1')
		else "01011" when (input(11) = '1')
		else "01100" when (input(12) = '1')
		else "01101" when (input(13) = '1')
		else "01110" when (input(14) = '1')
		else "01111" when (input(15) = '1')
		else "10000" when (input(16) = '1')
		else "10001" when (input(17) = '1')
		else "10010" when (input(18) = '1')
		else "10011" when (input(19) = '1')
		else "10100" when (input(20) = '1')
		else "10101" when (input(21) = '1')
		else "10110" when (input(22) = '1')
		else "10111" when (input(23) = '1');
	
	
	
	
end architecture behavioural;
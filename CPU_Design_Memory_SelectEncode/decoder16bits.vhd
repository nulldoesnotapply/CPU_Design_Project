LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY decoder16bits IS
	PORT (
		
		input  : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
		output : OUT STD_LOGIC_VECTOR(15 downto 0)
		
	);
end entity decoder16bits;

architecture behavioural of decoder16bits is
begin
	
	output<=x"0001" when input = "0000"
		else x"0002" when input = "0001"
		else x"0004" when input = "0010"
		else x"0008" when input = "0011"
		else x"0010" when input = "0100"
		else x"0020" when input = "0101"
		else x"0040" when input = "0110"
		else x"0080" when input = "0111"
		else x"0100" when input = "1000"
		else x"0200" when input = "1001"
		else x"0400" when input = "1010"
		else x"0800" when input = "1011"
		else x"1000" when input = "1100"
		else x"2000" when input = "1101"
		else x"4000" when input = "1110"
		else x"8000" when input = "1111";

		
end architecture behavioural;
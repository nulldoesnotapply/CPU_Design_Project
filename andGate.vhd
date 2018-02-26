library IEEE;
use ieee.std_logic_1164.all;
 
entity andGate is
 Port(
	A, B	 	: in std_logic_vector(31 downto 0);
	S			: out std_logic_vector(31 downto 0);
end andGate;
 
architecture behaviour of andGate is
 
begin
	for I in 0 to 31 loop
		S(I) = A(I) and B(I);
	end loop;
end behaviour;
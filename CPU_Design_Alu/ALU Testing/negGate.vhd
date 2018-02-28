library IEEE;
use ieee.std_logic_1164.all;
 
entity negGate is
	port(
		B		 	: in std_logic_vector(31 downto 0);
		S			: out std_logic_vector(31 downto 0)
	);
end negGate;
 
architecture behaviour of negGate is
 
begin
	process(B)
	begin
		for I in 0 to 31 loop
			S(I) <= '0';
		end loop;
	end process;
end behaviour;
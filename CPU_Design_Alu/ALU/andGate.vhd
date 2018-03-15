library IEEE;
use ieee.std_logic_1164.all;
 
entity andGate is
	port(
		A, B	 	: in std_logic_vector(31 downto 0);
		S			: out std_logic_vector(31 downto 0)
	);
end andGate;
 
architecture behaviour of andGate is
 
begin
	process(A, B)
	begin
		for I in 0 to 31 loop
			if(A(I) = '1' and B(I) = '1') then
			S(I) <= '1';
			else
			S(I) <='0';
			end if;
		end loop;
	end process;
end behaviour;
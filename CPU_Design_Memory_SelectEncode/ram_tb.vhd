library ieee;
use ieee.std_logic_1164.all;

entity ram_tb is
end;

architecture behaviour of ram_tb is

signal address_tb : std_logic_vector(8 downto 0);
signal clock_tb 	: std_logic;
signal data_tb 	: std_logic_vector(31 downto 0);
signal rden_tb 	: std_logic;
signal wren_tb 	: std_logic;
signal q_tb				: std_logic_vector(31 downto 0);

component ram is
	port(
		address	: IN STD_LOGIC_VECTOR (8 DOWNTO 0);
		clock		: IN STD_LOGIC  := '1';
		data		: IN STD_LOGIC_VECTOR (31 DOWNTO 0);
		rden		: IN STD_LOGIC  := '1';
		wren		: IN STD_LOGIC ;
		q			: OUT STD_LOGIC_VECTOR (31 DOWNTO 0)
	);
end component;
 
begin
	DUT1 : ram port map(
		address => address_tb,
		clock => clock_tb,
		data => data_tb,
		rden => rden_tb,
		wren => wren_tb,
		q => q_tb
	);
	
	sim_process: process
	begin
	
		wait for 1 ns;
		clock_tb <= '0';
		address_tb <= "000000001";
		data_tb <= x"0000ffff";
		rden_tb <= '1';
		wren_tb <= '1';
		wait for 9 ns;		
		clock_tb <= '1';
		wait for 10 ns;
		clock_tb <= '0';
		wren_tb <= '0';
		wait for 10 ns;
		clock_tb <= '1';
		address_tb <= "000000001";
		rden_tb <= '1';
		wait;
	end process sim_process;
end behaviour;
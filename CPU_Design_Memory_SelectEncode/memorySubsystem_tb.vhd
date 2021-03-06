--CONFIRMED TO WORK

library ieee;
use ieee.std_logic_1164.all;

library work;

entity memorySubsystem_tb is
end;

architecture behaviour of memorySubsystem_tb is

signal BusMuxOut_tb, BusMuxInMDR_tb 		: std_logic_vector(31 downto 0);
signal MDRin_tb, MARin_tb, clock_tb, clear_tb, mdrReadSig_tb, readSig_tb, writeSig_tb 	: std_logic;

component memorySubsystem is
	port(
		BusMuxOut		: in std_logic_vector(31 downto 0);
		BusMuxInMDR	: inout std_logic_vector(31 downto 0);
		MDRin, MARin, clock, clear: in std_logic;
		readSig, writeSig, mdrReadSig: in std_logic
	);
end component;
 
begin
	DUT1 : memorySubsystem port map(
		BusMuxOut	=> BusMuxOut_tb,
		BusMuxInMDR	=> BusMuxInMDR_tb,
		MDRin	=> MDRin_tb,
		MARin	=> MARin_tb,	
		clock => clock_tb,
		clear => clear_tb,
		readSig => readSig_tb,
		writeSig => writeSig_tb,
		mdrReadSig => mdrReadSig_tb
	);
	
	sim_process: process
	begin
--		BusMuxOut_tb <= x"00000000";
--Set up MDRMux, MDR and Data Line	
		wait for 1 ns;
		BusMuxOut_tb <= x"ffff0000";
		clock_tb <='0';
		clear_tb <='1';
		mdrReadSig_tb 	<='0';
		MDRin_tb 		<='1';	
		readSig_tb 		<='0';	
		writeSig_tb		<='0';
		MARin_tb 		<='0';
		
		wait for 5 ns;
		clock_tb <= '1';
		
		wait for 5 ns;
		clock_tb <= '1';		
--Set up Address in MAR
		wait for 5 ns;
		clock_tb <= '0';
		mdrReadSig_tb 	<='1';
		MDRin_tb			<='0';
		readSig_tb 		<='0';	
		writeSig_tb		<='0';
		MARin_tb 		<='1';		
		BusMuxOut_tb <= x"00000001";		
		
		wait for 5 ns;
		clock_tb <= '1';

--Write to Ram
		wait for 5 ns;
		clock_tb <= '0';
		mdrReadSig_tb 	<='1';
		MDRin_tb			<='1';
		readSig_tb 		<='0';	
		writeSig_tb		<='1';
		MARin_tb 		<='0';
		
		wait for 5 ns;
		clock_tb <= '1';
		
--Set dataLine to 0		
		wait for 5 ns;
		clock_tb <= '0';
		BusMuxOut_tb <= x"00000000";
		clock_tb <='0';
		clear_tb <='1';
		mdrReadSig_tb 	<='0';
		MDRin_tb 		<='1';	
		readSig_tb 		<='0';	
		writeSig_tb		<='0';
		MARin_tb 		<='0';
		
		wait for 5 ns;
		clock_tb <= '1';
		
--Set up address in MAR		
		wait for 5 ns;
		BusMuxOut_tb <= x"00000001";
		clock_tb <= '0';
		mdrReadSig_tb 	<='1';
		MDRin_tb 		<='0';	
		readSig_tb 		<='0';	
		writeSig_tb		<='0';
		MARin_tb 		<='1';		

		wait for 5 ns;
		clock_tb <= '1';
--Read from RAM		
		wait for 5 ns;
		clock_tb <= '0';
		mdrReadSig_tb 	<='1';
		MDRin_tb			<='0';		
		readSig_tb 		<='1';	
		writeSig_tb		<='0';
		MARin_tb 		<='1';

		wait for 5 ns;
		clock_tb <= '1';		
		
		wait for 10ns;
		
		
		wait;
	end process sim_process;
end behaviour;
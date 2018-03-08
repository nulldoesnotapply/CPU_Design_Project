LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY multiplexerEncoder_tb IS
END;

ARCHITECTURE behaviour OF multiplexerEncoder_tb IS
component encoder32bits IS
	PORT (
		
		input  : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
		output : OUT STD_LOGIC_VECTOR(4 downto 0)
		
	);
end component;

component multiplexer32bits IS
	PORT (
		BusMuxIn_R0, BusMuxIn_R1, BusMuxIn_R2, BusMuxIn_R3, 
		BusMuxIn_R4, BusMuxIn_R5, BusMuxIn_R6, BusMuxIn_R7,
		BusMuxIn_R8, BusMuxIn_R9, BusMuxIn_R10, BusMuxIn_R11,
		BusMuxIn_R12, BusMuxIn_R13, BusMuxIn_R14, BusMuxIn_R15,
		BusMuxIn_HI, BusMuxIn_LO, BusMuxIn_Zhigh, BusMuxIn_Zlow,
		BusMuxIn_PC, BusMuxIn_MDR, BusMuxIn_InPort,
		C_sign_extended: IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		BusMuxOut : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		encoderSignal : IN STD_LOGIC_VECTOR(4 DOWNTO 0) 
	);
end component;


signal input_tb : std_logic_vector(31 downto 0);
signal encoderSignal_tb: std_logic_vector(4 downto 0);
signal BusMuxIn_R0_tb, BusMuxIn_R1_tb, BusMuxIn_R2_tb, BusMuxIn_R3_tb, 
		BusMuxIn_R4_tb, BusMuxIn_R5_tb, BusMuxIn_R6_tb, BusMuxIn_R7_tb,
		BusMuxIn_R8_tb, BusMuxIn_R9_tb, BusMuxIn_R10_tb, BusMuxIn_R11_tb,
		BusMuxIn_R12_tb, BusMuxIn_R13_tb, BusMuxIn_R14_tb, BusMuxIn_R15_tb,
		BusMuxIn_HI_tb, BusMuxIn_LO_tb, BusMuxIn_Zhigh_tb, BusMuxIn_Zlow_tb,
		BusMuxIn_PC_tb, BusMuxIn_MDR_tb, BusMuxIn_InPort_tb, C_sign_extended_tb: STD_LOGIC_VECTOR(31 DOWNTO 0);
signal BusMuxOut_tb : STD_LOGIC_VECTOR(31 DOWNTO 0);


begin

DUT0: encoder32bits port map(
		input => input_tb,
		output=> encoderSignal_tb
);	
DUT1: multiplexer32bits port map(
		BusMuxIn_R0 =>  BusMuxIn_R0_tb, 
		BusMuxIn_R1 =>  BusMuxIn_R1_tb, 
		BusMuxIn_R2 =>  BusMuxIn_R2_tb,
		BusMuxIn_R3 =>  BusMuxIn_R3_tb,
		BusMuxIn_R4 =>  BusMuxIn_R4_tb,
		BusMuxIn_R5 =>  BusMuxIn_R5_tb,
		BusMuxIn_R6 =>  BusMuxIn_R6_tb,
		BusMuxIn_R7 =>  BusMuxIn_R7_tb,
		BusMuxIn_R8 =>  BusMuxIn_R8_tb,
		BusMuxIn_R9 =>  BusMuxIn_R9_tb,
		BusMuxIn_R10=> BusMuxIn_R10_tb,
		BusMuxIn_R11=> BusMuxIn_R11_tb,
		BusMuxIn_R12=> BusMuxIn_R12_tb,
		BusMuxIn_R13=> BusMuxIn_R13_tb,
		BusMuxIn_R14=> BusMuxIn_R14_tb, 
		BusMuxIn_R15=> BusMuxIn_R15_tb,
		BusMuxIn_HI	=> BusMuxIn_HI_tb,
		BusMuxIn_LO	=> BusMuxIn_LO_tb,
		BusMuxIn_Zhigh	=> BusMuxIn_Zhigh_tb,
		BusMuxIn_Zlow	=> BusMuxIn_Zlow_tb,
		BusMuxIn_PC		=> BusMuxIn_PC_tb,
		BusMuxIn_MDR	=> BusMuxIn_MDR_tb,
		BusMuxIn_InPort=> BusMuxIn_InPort_tb,
		C_sign_extended=> C_sign_extended_tb,
		BusMuxOut		=> BusMuxOut_tb,
		encoderSignal	=> encoderSignal_tb
);


sim_process: process
	begin
		BusMuxIn_R1_tb <= x"0000FFFF";
		BusMuxIn_R2_tb <= x"0000FFFF";
		BusMuxIn_R3_tb <= x"0000FFFF";
		wait for 1 ns;
		input_tb <= x"00000001";
		wait for 19 ns;	
		input_tb <= x"00000002";
		wait for 20 ns;	
		input_tb <= x"00000004";
		wait for 20 ns;
		input_tb <= x"00000008";
		wait for 20 ns;
		input_tb <= x"00000001";
		wait for 20 ns;		
		wait;
	end process sim_process;	
	
end architecture;
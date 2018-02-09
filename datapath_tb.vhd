LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY datapath_tb IS
END;

ARCHITECTURE datapath_tb_arc OF datapath_tb IS

SIGNAL	PCout_tb, Zlowout_tb, MDRout_tb, R2out_tb, R3out_tb:	std_logic;
SIGNAL	MARin_tb, Zin_tb, PCin_tb, MDRin_tb, IRin_tb, Yin_tb:	std_logic;
SIGNAL	IncPC_tb, ReadChannel_tb, AND_tb, R1in_tb, R2in_tb, R3in_tb:	std_logic;
SIGNAL	Mdatain_tb, BusMuxOut_tb:								std_logic_vector(31 downto 0);
SIGNAL	Clock_tb:												std_logic;

TYPE	State IS(default, Reg_load1, Reg_load2, Reg_load3, T0, T1, T2, T3, T4, T5);
SIGNAL	Present_state:	State:=defualt;

COMPONENT datapath_tb
	PORT(
		PCout, Zlowout, MDRout, R2out, R3out:					out	std_logic;
		MARin, Zin, PCin, MDRin, IRin, Yin, R1in, R2in, R3in:	out	std_logic;
		IncPC, ReadChannel, AND:								out std_logic;
		Mdatain, BusMuxOut:										out std_logic_vector(31 downto 0);
		Clock:													in 	std_logic	
	);
END COMPONENT datapath;
BEGIN

DUT : datapath
--port mapping: between the dut and the testbench signals
	PORT MAP (
	PCout 		=>	PCout_tb,
	Zlowout 	=>	Zlowout_tb,
	MDRout		=>	MDRout_tb,
	R2out 		=>	R2out_tb,
	R3out 		=>	R3out_tb,
	MARin 		=>	MARin_tb,
	Zin 		=>	Zin_tb,
	PCin 		=>	PCin_tb,
	MDRin 		=>	MDRin_tb,
	IRin 		=>	IRin_tb,
	Yin 		=>	Yin_tb,
	R1in 		=>	R1in_tb,
	R2in 		=>	R2in_tb,
	R3in 		=>	R3in_tb,
	IncPC 		=>	IncPC_tb,
	ReadChannel =>	ReadChannel_tb,
	AND			=>	AND_tb,
	Mdatain 	=>	Mdatain_tb,
	BusMuxOut	=>	BusMuxOut_tb
	Clock 		=> 	Clock_tb);
	
	CLock_process:PROCESS
	BEGIN
		Clock_tb<='1';
		Wait for 10ns;
		Clock_tb <= '0';
		Wait for 10ns;
	END PROCESS Clock_process
	PROCESS(Clock_tb)
	BEGIN
		IF(rising_edge(Clock_tb))THEN
			CASE Present_state IS
				WHEN Default   =>
					Present_state	<=	Reg_load1;
				WHEN Reg_load1 =>
					Present_state	<=	Reg_load2;
				WHEN Reg_load2 =>
					Present_state	<=	Reg_load3;	
				WHEN Reg_load3 =>
					Present_state	<=	T0;	
				WHEN T0 	   =>
					Present_state	<=	T1;		
				WHEN T1 	   =>
					Present_state	<=	T2;			
				WHEN T2 	   =>
					Present_state	<=	T3;			
				WHEN T3 	   =>
					Present_state	<=	T4;			
				WHEN T4 	   =>
					Present_state	<=	T5;
				WHEN OTHERS =>
			END CASE;
		END IF;
	END PROCESS;
			
	PROCESS (Present_state) -- do the required job in each state
	BEGIN
		CASE Present_state IS -- assert the required signals in each clock cycle
			WHEN Default =>
				PCout_tb <= '0'; Zlowout_tb <= '0'; MDRout_tb <= '0'; -- initialize the signals
				R2out_tb <= '0'; R3out_tb 	<= '0'; MARin_tb  <= '0'; Zin_tb <= '0';
				PCin_tb  <=	'0'; MDRin_tb 	<= '0'; IRin_tb   <= '0'; Yin_tb <= '0';
				R1in_tb  <= '0'; IncPC_tb 	<= '0'; Read_tb   <= '0'; AND_tb <= '0';
			
			WHEN Reg_load1 =>
				Mdatain_tb <= x"00000012";
				Read_tb   <= '0', '1' after 10 ns, '0' after 10 ns;
				MDRin_tb  <= '0', '1' after 10 ns, '0' after 10 ns;
				MDRout_tb <= '0', '1' after 10 ns, '0' after 10 ns;
				R1in_tb   <= '0', '1' after 10 ns;
			
			WHEN Reg_load2 =>
				Mdatain_tb <= x"00000014" after 10 ns;
				Read_tb   <= '0', '1' after 10 ns, '0' after 10 ns;
				MDRin_tb  <= '0', '1' after 10 ns, '0' after 10 ns;
				MDRout_tb <= '0', '1' after 10 ns, '0' after 10 ns;
				R2in_tb   <= '0', '1' after 10 ns;
			
			WHEN Reg_load3 =>
				Mdatain_tb <= x"00000016" after 10 ns;
				Read_tb   <= '0', '1' after 10 ns, '0' after 10 ns;
				MDRin_tb  <= '0', '1' after 10 ns, '0' after 10 ns;
				MDRout_tb <= '0', '1' after 10 ns, '0' after 10 ns;
				R3in_tb   <= '0', '1' after 10 ns’
			
			WHEN T0 =>
				PCout_tb <= '1'; MARin_tb <= '1'; IncPC_tb <= '1'; Zin_tb <= '1';
			
			WHEN T1 =>
				Zlowout_tb <= '1'; PCin_tb <= '1'; Read_tb <= '1'; MDRin_tb <= '1';
				Mdatain_tb[31..0] <= x"28918000"; -- opcode for and R1, R2, R3
			
			WHEN T2 =>
			 MDRout_tb <= '1'; IRin_tb <= '1';
			
			WHEN T3 =>
			 R2out_tb <= '1'; Yin_tb <= '1';
			
			WHEN T4 =>
			 R3out_tb <= '1'; AND_tb <= '1'; Zin_tb <= '1';
			
			WHEN T5 =>
			 Zlowout_tb <= '1'; R1in_tb <= '1';
			
			WHEN OTHERS =>
		END CASE;
	END PROCESS;
END ARCHITECTURE datapath_tb_arch;	
				
				
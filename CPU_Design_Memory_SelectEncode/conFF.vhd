library ieee;
use ieee.std_logic_1164.all;

entity conFF is
	port(
		clk										: in std_logic;
		IRout										: in std_logic_vector(31 downto 0);
		BusMuxOut								: in std_logic_vector(31 downto 0);
		CONout									: out std_logic
	);
end entity;

architecture behaviour of conFF is

component decoder4bits is
 	port (
		input  : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
		output : OUT STD_LOGIC_VECTOR(3 downto 0)
	);
end component;

component conFFSubComponent1 is
	port(
		decoderOutput							: in std_logic_vector(3 downto 0);
		BusMuxOut								: in std_logic_vector(31 downto 0);
		conFFOutput								: out std_logic;
		busOrOut									: inout std_logic
	);
end component;

component flipFlop is
   port(
      clk			: in std_logic;
      D 				: in std_logic;
      Q				: out std_logic
   );
end component;

signal decoderInput	: std_logic_vector(1 downto 0);
signal decoderOutput	: std_logic_vector(3 downto 0);
signal orGateToFlipFlop, conFFOutput, busOrOutInternal	: std_logic;

begin
decoderInput <= IRout(20 downto 19);
			  
U0: decoder4bits port map(
		input  => decoderInput,
		output => decoderOutput
);			  

U1: conFFSubComponent1 port map(
		decoderOutput => decoderOutput,
		BusMuxOut => BusMuxOut,
		conFFOutput => orGateToFlipFlop,
		busOrOut => busOrOutInternal 
);

U2: flipFlop port map(
		clk => clk,
		D => orGateToFlipFlop,
		Q => CONout
);
end architecture;
----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    06:23:39 03/06/2025 
-- Design Name: 
-- Module Name:    topmod100 - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity topmod100 is
    Port ( clk,rst : in  STD_LOGIC;
           sevenseg : out  STD_LOGIC_VECTOR (7 downto 0);
           seldigit : out  STD_LOGIC_VECTOR (5 downto 0));
end topmod100;

architecture Behavioral of topmod100 is
	component clkdivmod is
		 Port ( clk,rst : in  STD_LOGIC;
				  clkout : out  STD_LOGIC);
	end component clkdivmod;
	
	component clkdivmux is
		Port ( clk,rst : in  STD_LOGIC;
				 clkout : out  STD_LOGIC);
	end component clkdivmux;
	
	component mod10bit1 is
		Port ( clk,rst,en : in  STD_LOGIC;
				 trig : out std_logic;
				 counter : out  STD_LOGIC_VECTOR (3 downto 0));
	end component mod10bit1;
	
	component mod10bit2 is
		 Port ( clk,rst,en : in  STD_LOGIC;
				  trig : out  STD_LOGIC;
				  counter : out  STD_LOGIC_VECTOR (3 downto 0));
	end component mod10bit2;
	
	component sevenbit1 is
		 Port ( bcd : in  STD_LOGIC_VECTOR (3 downto 0);
				  seg : out  STD_LOGIC_VECTOR (7 downto 0));
	end component sevenbit1;
	
	component sevenbit2 is
		 Port ( bcd : in  STD_LOGIC_VECTOR (3 downto 0);
				  seg : out  STD_LOGIC_VECTOR (7 downto 0));
	end component sevenbit2;
	
	component mux is
		 Port ( clk : in  STD_LOGIC;
				  bcd1,bcd2 : in  STD_LOGIC_VECTOR (7 downto 0);
				  sevenseg : out  STD_LOGIC_VECTOR (7 downto 0);
				  seldig : out  STD_LOGIC_VECTOR (5 downto 0));
	end component mux;
	
	signal clkmod,clkmux,trig1,trig2 : std_logic;
	signal countbit1,countbit2 : std_logic_vector (3 downto 0);
	signal digit1,digit2 : std_logic_vector (7 downto 0);
	
begin
	U1 : clkdivmod
		port map (clk => clk,rst => rst,clkout => clkmod);
	U2 : clkdivmux
		port map (clk => clk,rst => rst,clkout => clkmux);
	U3 : mod10bit1
		port map (clk => clkmod,rst => rst,en => '1',trig => trig1,counter => countbit1);
	U4 : mod10bit2
		port map (clk => clkmod,rst => rst,en => trig1,trig => trig2,counter => countbit2);
	U5 : sevenbit1
		port map (bcd => countbit1,seg => digit1);
	U6 : sevenbit2
		port map (bcd => countbit2,seg => digit2);
	U7 : mux
		port map (clk => clkmux,bcd1 => digit1,bcd2 => digit2,sevenseg => sevenseg,seldig => seldigit);
end Behavioral;


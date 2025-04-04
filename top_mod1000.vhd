----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:41:32 03/13/2025 
-- Design Name: 
-- Module Name:    top_mod1000 - Behavioral 
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

entity top_mod1000 is
    Port ( clk,rst : in  STD_LOGIC;
           sevenseg : out  STD_LOGIC_VECTOR (7 downto 0);
           seldig : out  STD_LOGIC_VECTOR (5 downto 0));
end top_mod1000;

architecture Behavioral of top_mod1000 is
	component clkdiv is
		Port ( clk,rst : in  STD_LOGIC;
				 clkmod,clkmux : out  STD_LOGIC);
	end component clkdiv;
	
	component mod10_1 is
		Port ( clk,rst,en : in  STD_LOGIC;
				 trig : out  STD_LOGIC;
				 count : out  STD_LOGIC_VECTOR (3 downto 0));
	end component mod10_1;
	
	component mod10_2 is 
		Port ( clk,rst,en : in  STD_LOGIC;
             trig : out  STD_LOGIC;
             count : out  STD_LOGIC_VECTOR (3 downto 0));
	end component mod10_2;
	
	component mod10_3 is 
		Port ( clk,rst,en1,en2 : in  STD_LOGIC;
             trig : out  STD_LOGIC;
             count : out  STD_LOGIC_VECTOR (3 downto 0));
	end component mod10_3;
	
	component sevenbcd is
		Port ( clk : in std_logic;
				 bcd1,bcd2,bcd3 : in  STD_LOGIC_VECTOR (3 downto 0);
				 seg1,seg2,seg3 : out  STD_LOGIC_VECTOR (7 downto 0));
	end component sevenbcd;
	
	component mux is
		Port ( clk : in  STD_LOGIC;
             bcd1,bcd2,bcd3 : in  STD_LOGIC_VECTOR (7 downto 0);
			    sevenseg : out  STD_LOGIC_VECTOR (7 downto 0);
             seldig : out  STD_LOGIC_VECTOR (5 downto 0));
	end component mux;
	
	signal clkmod,clkmux,trig1,trig2,waiten : std_logic;
	signal cnt1,cnt2,cnt3 : std_logic_vector (3 downto 0);
	signal bcd1,bcd2,bcd3 : std_logic_vector (7 downto 0);
begin
	U1 : clkdiv
		port map(clk => clk,rst => rst,clkmod => clkmod,clkmux => clkmux);
	U2 : mod10_1
		port map(clk => clkmod,rst =>rst,en => '1',trig => trig1,count => cnt1);
	U3 : mod10_2
		port map(clk => clkmod,rst =>rst,en => trig1,trig => trig2,count => cnt2);
	U4 : mod10_3
		port map(clk => clkmod,rst =>rst,en1 => trig2,en2 => trig1,trig => waiten,count => cnt3);
	U5 : sevenbcd
		port map(clk => clkmux,bcd1 => cnt1,bcd2 => cnt2,bcd3 => cnt3,seg1 => bcd1,seg2 => bcd2,seg3 => bcd3);
	U6 : mux
		port map(clk => clkmux,bcd1 => bcd1,bcd2 => bcd2,bcd3 => bcd3,sevenseg => sevenseg,seldig => seldig);
end Behavioral;


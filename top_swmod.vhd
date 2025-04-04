----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:27:55 03/13/2025 
-- Design Name: 
-- Module Name:    top_swmod - Behavioral 
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity top_swmod is
    Port ( clk,rst,swsev,swled : in  STD_LOGIC;
           led : out  STD_LOGIC_VECTOR (3 downto 0);
           sel : out  STD_LOGIC_VECTOR (5 downto 0);
           sevseg : out  STD_LOGIC_VECTOR (7 downto 0));
end top_swmod;

architecture Behavioral of top_swmod is
	component clkdiv is
		Port ( clk,rst : in  STD_LOGIC;
             clkmod,clkmux : out  STD_LOGIC);
	end component clkdiv;
	
	component mod10 is
		Port ( clk,rst,swled,swsev : in  STD_LOGIC;
             count,led : out  STD_LOGIC_VECTOR (3 downto 0));
	end component mod10;
	
	component sev is
		Port ( bcd : in  STD_LOGIC_VECTOR (3 downto 0);
             seg : out  STD_LOGIC_VECTOR (7 downto 0));
	end component sev;
	
	component mux is
		Port (clk : std_logic;
				bcd : in  STD_LOGIC_VECTOR (7 downto 0);
			   swsev,swled : in STD_LOGIC;
			   sevenseg : out  STD_LOGIC_VECTOR (7 downto 0);
			   ledout : out STD_LOGIC_VECTOR (3 downto 0);
			   ledin : in STD_LOGIC_VECTOR (3 downto 0));
	end component mux;
	
	signal clkmod,clkmux : std_logic;
	signal ledsig,modsig : std_logic_vector (3 downto 0);
	signal sevsig : std_logic_vector (7 downto 0);
begin
	U1 : clkdiv
		port map (clk => clk,rst => rst,clkmod => clkmod,clkmux => clkmux);
	U2 : mod10
		port map (clk => clkmod,rst => rst,swled => swled,swsev => swsev,count => modsig,led => ledsig);
	U3 : sev
		port map (bcd => modsig,seg => sevsig);
	U4 : mux
		port map (clk => clkmux,bcd => sevsig,swled => swled,swsev => swsev,ledin => ledsig,sevenseg => sevseg,ledout => led);
		
	sel <= "111110";
end Behavioral;


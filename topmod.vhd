----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    03:21:59 03/14/2025 
-- Design Name: 
-- Module Name:    topmod - Behavioral 
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

entity topmod is
    Port ( clk,rst : in  STD_LOGIC;
           sevenseg : out  STD_LOGIC_VECTOR (7 downto 0);
           seldigit : out  STD_LOGIC_VECTOR (5 downto 0));
end topmod;

architecture Behavioral of topmod is
	component clk_5Hz is
		Port ( clk,rst : in  STD_LOGIC;
           clkout : out  STD_LOGIC);
	end component clk_5Hz;
	
	component mod13 is 
		Port ( clk,rst : in  STD_LOGIC;
           count  : out  STD_LOGIC_VECTOR (3 downto 0));
	end component mod13;
	
	component sev is 
		Port ( bcd : in  STD_LOGIC_VECTOR (3 downto 0);
           seg : out  STD_LOGIC_VECTOR (7 downto 0));
	end component sev;
	
	signal count13 : std_logic_vector(3 downto 0);
	signal clkmod : std_logic;
begin
	U1 : clk_5Hz
		port map(clk => clk,rst => rst,clkout => clkmod);
	U2 : mod13
		port map(clk => clkmod,rst => rst,count => count13);
	U3 : sev
		port map(bcd => count13,seg => sevenseg);
seldigit <= "111110";

end Behavioral;


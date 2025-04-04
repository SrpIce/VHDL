----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:06:34 03/13/2025 
-- Design Name: 
-- Module Name:    clkdiv - Behavioral 
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

entity clkdiv is
    Port ( clk,rst : in  STD_LOGIC;
           clkmod,clkmux : out  STD_LOGIC);
end clkdiv;

architecture Behavioral of clkdiv is
 signal tmpmod,tmpmux : std_logic;
 signal cntmod : integer range 0 to 12499999 := 0;
 signal cntmux : integer range 0 to 49999 := 0;
begin
	modclk : process (tmpmod,clk,rst,cntmod)
	begin
		if (rst = '0') then
			tmpmod <= '0';
			cntmod <= 0;
		elsif (rising_edge(clk)) then
			if (cntmod = 12499999) then
				cntmod <= 0;
				tmpmod <= not tmpmod;
			else
				cntmod <= cntmod + 1;
				tmpmod <= tmpmod;
			end if;
		end if;
	end process modclk;
	
	muxclk : process (tmpmux,clk,rst,cntmux)
	begin
		if (rst = '0') then
			tmpmux <= '0';
			cntmux <= 0;
		elsif (rising_edge(clk)) then
			if (cntmux = 49999) then
				cntmux <= 0;
				tmpmux <= not tmpmux;
			else
				cntmux <= cntmux + 1;
				tmpmux <= tmpmux;
			end if;
		end if;
	end process muxclk;

	clkmod <= tmpmod;
	clkmux <= tmpmux;
end Behavioral;


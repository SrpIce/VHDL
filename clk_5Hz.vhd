----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    03:08:01 03/14/2025 
-- Design Name: 
-- Module Name:    clk_5Hz - Behavioral 
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

entity clk_5Hz is
    Port ( clk,rst : in  STD_LOGIC;
           clkout : out  STD_LOGIC);
end clk_5Hz;

architecture Behavioral of clk_5Hz is
 signal tmp : std_logic := '0';
	signal cnt : integer range 0 to 4999999 := 0;
begin
	process (clk,rst,tmp,cnt)
	begin
		if (rst = '0') then
			cnt <= 0;
			tmp <= '0';
		else 
			if (rising_edge(clk)) then
				if (cnt = 4999999) then
					cnt <= 0 ;
					tmp <= not tmp;
				else 
					cnt <= cnt + 1;
					tmp <= tmp;
				end if;
			end if;
		end if;
	end process;
	clkout <= tmp;
end Behavioral;


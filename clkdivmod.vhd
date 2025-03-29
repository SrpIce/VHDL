----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    03:58:15 03/06/2025 
-- Design Name: 
-- Module Name:    mod10dig1 - Behavioral 
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

entity clkdivmod is
    Port ( clk,rst : in  STD_LOGIC;
           clkout : out  STD_LOGIC);
end clkdivmod;

architecture Behavioral of clkdivmod is
	signal tmp : std_logic := '0';
	signal cnt : integer range 0 to 12499999 := 0;
begin
	process (clk,rst,tmp,cnt)
	begin
		if (rst = '0') then
			cnt <= 0;
			tmp <= '0';
		else 
			if (rising_edge(clk)) then
				if (cnt = 12499999) then
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


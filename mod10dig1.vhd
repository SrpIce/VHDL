----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    04:11:46 03/06/2025 
-- Design Name: 
-- Module Name:    mod10bit1 - Behavioral 
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

entity mod10bit1 is
    Port ( clk,rst,en : in  STD_LOGIC;
			  trig : out std_logic;
           counter : out  STD_LOGIC_VECTOR (3 downto 0));
end mod10bit1;

architecture Behavioral of mod10bit1 is
 signal cnt : std_logic_vector (3 downto 0); 
begin
	process (clk,rst,cnt,en)
	begin
		if (rst = '0') then
			cnt <= "0000";
		elsif (rising_edge(clk)) then
			if (en = '1') then
				if (cnt = "1001") then
					cnt <= "0000";
				else
					cnt <= cnt + 1;
				end if;
			end if;
		end if;
	end process ;
	trig <= '1' when cnt = "1001" else '0';
	counter <= cnt;

end Behavioral;


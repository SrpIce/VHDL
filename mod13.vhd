----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    03:14:07 03/14/2025 
-- Design Name: 
-- Module Name:    mod13 - Behavioral 
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

entity mod13 is
    Port ( clk,rst : in  STD_LOGIC;
           count  : out  STD_LOGIC_VECTOR (3 downto 0));
end mod13;

architecture Behavioral of mod13 is
signal cnt : std_logic_vector (3 downto 0);
begin
	process (clk,rst,cnt)
	begin
		if (rst = '0') then
			cnt <= "0001";
		elsif (rising_edge(clk)) then
			if (cnt = "1101") then
				cnt <= "0001";
			else 
				cnt <= cnt + 2;
			end if;
		end if;
	end process ;
count <= cnt;
end Behavioral;


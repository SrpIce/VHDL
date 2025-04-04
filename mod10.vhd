----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:16:56 03/13/2025 
-- Design Name: 
-- Module Name:    mod10 - Behavioral 
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

entity mod10 is
    Port ( clk,rst,swled,swsev : in  STD_LOGIC;
           count,led : out  STD_LOGIC_VECTOR (3 downto 0));
end mod10;

architecture Behavioral of mod10 is
	signal cnt,cntled : std_logic_vector (3 downto 0);
begin
	mod_10	: process (clk,rst,cnt,swsev)
	begin
		if (rst = '0') then
			cnt <= "0000";
		elsif (swsev = '0') then
			cnt <= "0000";
		elsif (rising_edge(clk)) then
			if (cnt = "1001") then
				cnt <= "0000";
			else 
				cnt <= cnt + 1;
			end if;
		end if;
	end process mod_10;
	
	ledmod	: process (clk,rst,cnt,swled,swsev)
	begin
		if (rst = '0') then
			cntled <= "0000";
		elsif (swled = '0') then
			cntled <= "0000";
		elsif (rising_edge(clk)) then
			if (cntled = "1001") then
				cntled <= "0000";
			else 
				cntled <= cntled + 1;
			end if;
		end if;
	end process ledmod;
	count <= cnt;
	led <= cntled;
end Behavioral;


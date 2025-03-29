----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    04:32:16 03/06/2025 
-- Design Name: 
-- Module Name:    sevenbit1 - Behavioral 
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

entity sevenbit1 is
    Port ( bcd : in  STD_LOGIC_VECTOR (3 downto 0);
           seg : out  STD_LOGIC_VECTOR (7 downto 0));
end sevenbit1;

architecture Behavioral of sevenbit1 is

begin
 process (bcd)
 begin
	case bcd is
		when "0000" => seg <= "11000000";
		when "0001" => seg <= "11111001";
		when "0010" => seg <= "10100100";
		when "0011" => seg <= "10110000";
		when "0100" => seg <= "10011001";
		when "0101" => seg <= "10010010";
		when "0110" => seg <= "10000010";
		when "0111" => seg <= "11111000";
		when "1000" => seg <= "10000000";
		when "1001" => seg <= "10010000";
		when others => seg <= "11111111";
	end case;
 end process;
end Behavioral;


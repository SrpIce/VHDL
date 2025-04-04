----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:31:43 03/13/2025 
-- Design Name: 
-- Module Name:    seven_1 - Behavioral 
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

entity sevenbcd is
    Port ( clk : std_logic;
			  bcd1,bcd2,bcd3 : in  STD_LOGIC_VECTOR (3 downto 0);
           seg1,seg2,seg3 : out  STD_LOGIC_VECTOR (7 downto 0));
end sevenbcd;

architecture Behavioral of sevenbcd is
 signal digitselect : std_logic_vector(1 downto 0);
 signal sevenseg1,sevenseg2,sevenseg3 : std_logic_vector (3 downto 0);
begin
	toggle : process(clk,digitselect)
	begin
		if (rising_edge(clk)) then
			if (digitselect = "11") then
				digitselect <= "00";
			else 
				digitselect <= digitselect + 1;
			end if;
		end if;
	end process toggle;
	
	dig : process(clk,digitselect,bcd1,bcd2,bcd3)
	begin
		case digitselect is
			when "00" => sevenseg1 <= bcd1;
			when "01" => sevenseg2 <= bcd2;
			when "10" => sevenseg3 <= bcd3;
			when others => sevenseg1 <= "1111"; sevenseg2 <= "1111"; sevenseg3 <= "1111";
		end case;
	end process dig;
	process (sevenseg1)
	begin
		case sevenseg1 is
			when "0000" => seg1 <= "11000000";
			when "0001" => seg1 <= "11111001";
			when "0010" => seg1 <= "10100100";
			when "0011" => seg1 <= "10110000";
			when "0100" => seg1 <= "10011001";
			when "0101" => seg1 <= "10010010";
			when "0110" => seg1 <= "10000010";
			when "0111" => seg1 <= "11111000";
			when "1000" => seg1 <= "10000000";
			when "1001" => seg1 <= "10010000";
			when others => seg1 <= "11111111";
		end case;
	end process;
	
	process (sevenseg2)
	begin
		case sevenseg2 is
			when "0000" => seg2 <= "11000000";
			when "0001" => seg2 <= "11111001";
			when "0010" => seg2 <= "10100100";
			when "0011" => seg2 <= "10110000";
			when "0100" => seg2 <= "10011001";
			when "0101" => seg2 <= "10010010";
			when "0110" => seg2 <= "10000010";
			when "0111" => seg2 <= "11111000";
			when "1000" => seg2 <= "10000000";
			when "1001" => seg2 <= "10010000";
			when others => seg2 <= "11111111";
		end case;
	end process;
	
	process (sevenseg3)
	begin
		case sevenseg3 is
			when "0000" => seg3 <= "11000000";
			when "0001" => seg3 <= "11111001";
			when "0010" => seg3 <= "10100100";
			when "0011" => seg3 <= "10110000";
			when "0100" => seg3 <= "10011001";
			when "0101" => seg3 <= "10010010";
			when "0110" => seg3 <= "10000010";
			when "0111" => seg3 <= "11111000";
			when "1000" => seg3 <= "10000000";
			when "1001" => seg3 <= "10010000";
			when others => seg3 <= "11111111";
		end case;
 end process;

end Behavioral;


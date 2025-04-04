----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:35:15 03/13/2025 
-- Design Name: 
-- Module Name:    mux - Behavioral 
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

entity mux is
    Port ( clk : in  STD_LOGIC;
           bcd1,bcd2,bcd3 : in  STD_LOGIC_VECTOR (7 downto 0);
			  sevenseg : out  STD_LOGIC_VECTOR (7 downto 0);
           seldig : out  STD_LOGIC_VECTOR (5 downto 0));
end mux;

architecture Behavioral of mux is
 signal digitselect : std_logic_vector(1 downto 0);
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
			when "00" => sevenseg <= bcd1;
			when "01" => sevenseg <= bcd2;
			when "10" => sevenseg <= bcd3;
			when others => sevenseg <= "11111111";
		end case;
	end process dig;
	
	sel : process(digitselect,clk)
	begin
		case digitselect is
			when "00" => seldig <= "111110" ;
			when "01" => seldig <= "111101";
			when "10" => seldig <= "111011";
			when "11" => seldig <= "110111";
			when others => seldig <= "111111";
		end case;
	end process sel;
end Behavioral;

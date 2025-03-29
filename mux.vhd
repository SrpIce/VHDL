----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    04:59:44 03/06/2025 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity mux is
    Port ( clk : in  STD_LOGIC;
           bcd1,bcd2 : in  STD_LOGIC_VECTOR (7 downto 0);
			  sevenseg : out  STD_LOGIC_VECTOR (7 downto 0);
           seldig : out  STD_LOGIC_VECTOR (5 downto 0));
end mux;

architecture Behavioral of mux is
 signal digitselect : std_logic;
 signal bcdsig : std_logic_vector (7 downto 0);
 signal selsig : std_logic_vector (5 downto 0);
begin
	toggle : process(clk,digitselect)
	begin
		if (rising_edge(clk)) then
			digitselect <= not digitselect;
		end if;
	end process toggle;
	
	dig : process(clk,digitselect)
	begin
		case digitselect is
			when '0' => sevenseg <= bcd1;
			when '1' => sevenseg <= bcd2;
			when others => sevenseg <= "11111111";
		end case;
	end process dig;
	
	sel : process(digitselect,clk)
	begin
		case digitselect is
			when '0' => seldig <= "111110" ;
			when '1' => seldig <= "111101";
			when others => seldig <= "111111";
		end case;
	end process sel;
end Behavioral;


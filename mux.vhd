----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:39:54 03/13/2025 
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
    Port ( clk : std_logic;
			  bcd : in  STD_LOGIC_VECTOR (7 downto 0);
			  swsev,swled : in STD_LOGIC;
			  sevenseg : out  STD_LOGIC_VECTOR (7 downto 0);
			  ledout : out STD_LOGIC_VECTOR (3 downto 0);
			  ledin : in STD_LOGIC_VECTOR (3 downto 0));
end mux;

architecture Behavioral of mux is
	signal sevsig : std_logic_vector (7 downto 0) ;
	signal ledsig : std_logic_vector (3 downto 0) := "0000";
begin
	le : process (clk,swled,swsev,ledin,ledsig,sevsig,bcd)
	begin
		if (swled = '0') then
			ledsig <= "0000";
		elsif (rising_edge(clk)) then
			ledsig <= ledin;
		else
			ledsig <= ledin;
		end if;
	end process le;
	
	sev : process (clk,swled,swsev,ledin,ledsig,sevsig,bcd)
	begin
		if (swsev = '0') then
			sevsig <= "11111111";
		elsif (rising_edge(clk)) then
			sevsig <= bcd;
		else
			sevsig <= bcd;
		end if;
	end process sev;
	ledout <= ledsig;
	sevenseg <= sevsig;
	
end Behavioral;


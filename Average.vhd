----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:22:09 06/07/2022 
-- Design Name: 
-- Module Name:    Average - Behavioral 
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

entity Average is
    Port ( input1 : in  STD_LOGIC_VECTOR (3 downto 0);
				  input2 : in  STD_LOGIC_VECTOR (3 downto 0);
				  input3 : in  STD_LOGIC_VECTOR (3 downto 0);
				  result : out  STD_LOGIC_VECTOR (15 downto 0);
			  clk : in std_logic);
end Average;

architecture Behavioral of Average is

signal r : integer :=  0 ;
signal count : integer := 3 ;
signal average : integer := 0;
signal result_temp : integer := 0;
signal min_temp : integer := 0;
signal max_temp : integer := 0;
signal range_temp : integer := 0;
signal q : integer := 0;


shared variable in1_int : integer ; 
shared variable in2_int : integer ; 
shared variable in3_int : integer ; 

begin

process(Clock)
variable result_int : integer := 0 ; 
variable n: integer := 0;

begin

if(rising_edge(Clock)) then

		if(average = 0) then
			in1_int := to_integer(unsigned(input1));
			in2_int := to_integer(unsigned(input2));
			in3_int := to_integer(unsigned(input3));
			
			result_int := in1_int + in2_int + in3_int;
			average <= 1;
			
		elsif (average = 1) then
			if (result_int > count) then
				result_int := result_int - count;
				q <= q+1;
			elsif (result_int = count) then
				result_int := result_int - count;
				q <= q+1;
			else
				result_temp <= q;
				q <= 0;
				average <= 0;
			end if;
		end if;
	
end if;
result <= std_logic_vector(to_unsigned(result_temp, 16));
end process;

end Behavioral;
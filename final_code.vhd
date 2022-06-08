----------------------------------------------------------------------------------
-- Company: Koç University
-- Engineer: Demet Tümkaya, Mahmut Esat Pişkin
-- 
-- Create Date:    10:02:05 06/07/2022 
-- Design Name: 
-- Module Name:    final_code - Behavioral 
-- Project Name: Magical LEDs of Statistics
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity final_code is
	Port ( Clock : in STD_LOGIC;
				  enter : in STD_LOGIC;
				  input1 : in  STD_LOGIC_VECTOR (3 downto 0);
				  input2 : in  STD_LOGIC_VECTOR (3 downto 0);
				  input3 : in  STD_LOGIC_VECTOR (3 downto 0);
				  result : out  STD_LOGIC_VECTOR (3 downto 0);
				  mint:  out  STD_LOGIC_VECTOR (3 downto 0);
				  maxt:  out  STD_LOGIC_VECTOR (3 downto 0);
				  medt:  out  STD_LOGIC_VECTOR (3 downto 0);
				  ranget:  out  STD_LOGIC_VECTOR (3 downto 0));
end final_code;

architecture Behavioral of final_code is
signal count : integer := 3 ;
signal average : integer := 0;
shared variable result_temp : integer := 0;
shared variable min_temp : integer := 0;
shared variable max_temp : integer := 0;
shared variable med_temp : integer := 0;
shared variable range_temp : integer := 0;
signal q : integer := 0;

shared variable in1_int : integer ; 
shared variable in2_int : integer ; 
shared variable in3_int : integer ; 

shared variable range_int : integer:= 0 ; 
shared variable min_int : integer := 0;
shared variable max_int : integer := 0;
shared variable med_int : integer := 0;
shared variable result_int : integer := 0; 


begin

process(Clock)
begin
		in1_int := to_integer(unsigned(input1));
		in2_int := to_integer(unsigned(input2));
		in3_int := to_integer(unsigned(input3));
		
if(rising_edge(Clock)) then		

		if(average = 0) then
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
				result_temp := q;
				q <= 0;
				average <= 0;
			end if;
		end if;
end if;


if(rising_edge(Clock)) then
	min_int := in1_int;
	med_int := in2_int;
	max_int := in3_int;
	
	if(min_int > med_int) then
		med_int := in1_int;
		min_int := in2_int;
		
	end if;
	
	if(med_int > max_int) then
		max_int := med_int;
		med_int := in3_int;
		
		if(min_int > med_int) then
			med_int := min_int;
			min_int:= in3_int;
			
		end if;
	end if;
	
	max_temp := max_int;
	min_temp := min_int;
	med_temp := med_int;
	range_int := max_int - min_int;
	range_temp := range_int;
end if;

maxt <= std_logic_vector(to_unsigned(max_temp, 4));
mint <= std_logic_vector(to_unsigned(min_temp, 4));
medt <= std_logic_vector(to_unsigned(med_temp, 4));
ranget <= std_logic_vector(to_unsigned(range_temp, 4));
result <= std_logic_vector(to_unsigned(result_temp, 4));
		
end process;	

end Behavioral;

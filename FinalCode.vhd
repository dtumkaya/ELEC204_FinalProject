----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:46:13 06/07/2022 
-- Design Name: 
-- Module Name:    FinalCode - Behavioral 
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

entity FinalCode is
    Port ( mclk : in  STD_LOGIC;
           sevseg_control : out  STD_LOGIC_VECTOR (7 downto 0);
           sevseg_bus : out  STD_LOGIC_VECTOR (7 downto 0);
			  max : out std_logic_vector (3 downto 0);
			  min : out std_logic_vector (3 downto 0);
			  median : out std_logic_vector (3 downto 0);
			  avg : out std_logic_vector (3 downto 0);
			  ranget : out std_logic_vector (3 downto 0);
           input1 : in  STD_LOGIC_VECTOR (3 downto 0);
           input2 : in  STD_LOGIC_VECTOR (3 downto 0);
           input3 : in  STD_LOGIC_VECTOR (3 downto 0));
end FinalCode;

architecture Behavioral of FinalCode is

component Average is 
	Port ( input1 : in  STD_LOGIC_VECTOR (3 downto 0);
           input2 : in  STD_LOGIC_VECTOR (3 downto 0);
           input3 : in  STD_LOGIC_VECTOR (3 downto 0);
			  clk : in std_logic;
           average : out  STD_LOGIC_VECTOR (3 downto 0));
end component;

begin

	average : Average port map (input1, input2, input3, mclk, avg);
	

end Behavioral;


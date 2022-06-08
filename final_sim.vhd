--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   10:22:33 06/07/2022
-- Design Name:   
-- Module Name:   C:/Users/demet/final_project/final_sim.vhd
-- Project Name:  final_project
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: final_code
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY final_sim IS
END final_sim;
 
ARCHITECTURE behavior OF final_sim IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT final_code
    PORT(
         Clock : IN  std_logic;
         enter : IN  std_logic;
         input1 : IN  std_logic_vector(3 downto 0);
         input2 : IN  std_logic_vector(3 downto 0);
         input3 : IN  std_logic_vector(3 downto 0);
			valid : out std_logic;
         result : OUT  std_logic_vector(15 downto 0);
			mint : OUT  std_logic_vector(15 downto 0);
			maxt : OUT  std_logic_vector(15 downto 0);
			medt : OUT  std_logic_vector(15 downto 0);
			ranget : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Clock : std_logic := '0';
   signal enter : std_logic := '0';
   signal input1 : std_logic_vector(3 downto 0) := (others => '0');
   signal input2 : std_logic_vector(3 downto 0) := (others => '0');
   signal input3 : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
	signal valid : std_logic;
   signal result : std_logic_vector(15 downto 0);
	signal mint : std_logic_vector(15 downto 0);
	signal maxt : std_logic_vector(15 downto 0);
	signal medt : std_logic_vector(15 downto 0);
	signal ranget : std_logic_vector(15 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   constant Clock_period : time := 100 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: final_code PORT MAP (
          Clock => Clock,
          enter => enter,
          input1 => input1,
          input2 => input2,
          input3 => input3,
			 valid => valid,
          result => result,
			 maxt => maxt,
			 mint => mint,
			 medt => medt,
			 ranget => ranget
        );

   -- Clock process definitions
   Clock_process :process
   begin
		Clock <= '0';
		wait for Clock_period/10;
		Clock <= '1';
		wait for Clock_period/10;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
				
		enter <= '1';
		input1 <= "0001";
		input2 <= "0010";
		input3 <= "0011";

		wait for 250 ns;
		
		input1 <= "0100";
		input2 <= "0101";
		input3 <= "0110";
		
		wait for 250 ns;
		
		input1 <= "0111";
		input2 <= "1000";
		input3 <= "1001";

      -- insert stimulus here 

      wait;
   end process;

END;

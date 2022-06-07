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
         hundhz : IN  std_logic;
         enter : IN  std_logic;
         input1 : IN  std_logic_vector(3 downto 0);
         input2 : IN  std_logic_vector(3 downto 0);
         input3 : IN  std_logic_vector(3 downto 0);
         result : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal hundhz : std_logic := '0';
   signal enter : std_logic := '0';
   signal input1 : std_logic_vector(3 downto 0) := (others => '0');
   signal input2 : std_logic_vector(3 downto 0) := (others => '0');
   signal input3 : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal result : std_logic_vector(15 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   constant hundhz_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: final_code PORT MAP (
          hundhz => hundhz,
          enter => enter,
          input1 => input1,
          input2 => input2,
          input3 => input3,
          result => result
        );

   -- Clock process definitions
   hundhz_process :process
   begin
		hundhz <= '0';
		wait for hundhz_period/2;
		hundhz <= '1';
		wait for hundhz_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for hundhz_period*10;
		
		enter <= '1';
		
		wait for hundhz_period*10;
		
		input1 <= "0001";
		input2 <= "0101";
		input3 <= "0011";

		
		wait for hundhz_period*10;
		wait for hundhz_period*10;
		wait for hundhz_period*10;
		
		input1 <= "0010";
		input2 <= "0100";
		input3 <= "0010";
		
		wait for hundhz_period*10;
		wait for hundhz_period*10;
		wait for hundhz_period*10;
		
				
		input1 <= "0001";
		input2 <= "0010";
		input3 <= "0100";
		

      -- insert stimulus here 

      wait;
   end process;

END;

--------------------------------------------------------------------------------
-- Company: Koç University
-- Engineer: Demet Tümkaya, Mahmut Esat Piþkin
-- 
-- Project Name:  ELEC204 - Magical LEDs of Statistics 
-- Description: 	Designed to calculate maximum, minimum, range, median, 
-- 					average for 3 inputs of 4 bits.
--
-- VHDL Test Bench Created by ISE for module: final_code
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
 
ENTITY final_sim IS
END final_sim;
 
ARCHITECTURE behavior OF final_sim IS 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT final_code
    PORT(
         Clock : IN  std_logic;
         input1 : IN  std_logic_vector(3 downto 0);
         input2 : IN  std_logic_vector(3 downto 0);
         input3 : IN  std_logic_vector(3 downto 0);
         result : OUT  std_logic_vector(3 downto 0);
			mint : OUT  std_logic_vector(3 downto 0);
			maxt : OUT  std_logic_vector(3 downto 0);
			medt : OUT  std_logic_vector(3 downto 0);
			ranget : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Clock : std_logic := '0';
   signal input1 : std_logic_vector(3 downto 0) := (others => '0');
   signal input2 : std_logic_vector(3 downto 0) := (others => '0');
   signal input3 : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal result : std_logic_vector(3 downto 0);
	signal mint : std_logic_vector(3 downto 0);
	signal maxt : std_logic_vector(3 downto 0);
	signal medt : std_logic_vector(3 downto 0);
	signal ranget : std_logic_vector(3 downto 0);
 
   constant Clock_period : time := 100 ns;
 
BEGIN
	-- Instantiate the Unit Under Test (UUT)
   uut: final_code PORT MAP (
          Clock => Clock,
          input1 => input1,
          input2 => input2,
          input3 => input3,
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

      wait;
   end process;

END;
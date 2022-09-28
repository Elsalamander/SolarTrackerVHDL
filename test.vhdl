library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_signed.all;

entity test is
end entity test;

architecture impl_test of test is 

  component DriverAsse is
  	port(
		SA  : in std_logic_vector(7 downto 0);
		SB  : in std_logic_vector(7 downto 0);
		
		Diff_max : in std_logic_vector(7 downto 0);
		Diff_min : in std_logic_vector(7 downto 0);
		
		Auto : in  std_logic;
		
		Asse : out std_logic_vector(1 downto 0)
      );
  end component;

	signal Sdx  : std_logic_vector(7 downto 0) := (others => '0');
	signal Ssx  : std_logic_vector(7 downto 0) := (others => '0');
	signal Stop : std_logic_vector(7 downto 0) := (others => '0');
	signal Sbot : std_logic_vector(7 downto 0) := (others => '0');
		
	signal Diff_max : std_logic_vector(7 downto 0) := "00001000";
	signal Diff_min : std_logic_vector(7 downto 0) := "00000010";
		
	signal Auto : std_logic := '0';
		
	signal Asse_x : std_logic_vector(1 downto 0) := (others => '0');
	signal Asse_y : std_logic_vector(1 downto 0) := (others => '0');
	
begin
	
	tracker : DriverAsse port map(Sdx, Ssx, Diff_max, Diff_min, Auto, Asse_x);
	
	process is
		begin
			wait for 10 ns;
			Auto <= '1';
			
			wait for 10 ns;
			Sdx <= "00000100";
			
			wait for 10 ns;
			Sdx <= "01000000";
			
			wait for 10 ns;
			Auto <= '0';
	end process;
end architecture impl_test;
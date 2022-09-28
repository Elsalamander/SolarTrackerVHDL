-- solarTracker.vhdl created on 0:29  2022.8.28
library IEEE;
use IEEE.std_logic_1164.all;

entity SolarTracker is
	port( 
		Sdx  : in std_logic_vector(7 downto 0);
		Ssx  : in std_logic_vector(7 downto 0);
		Stop : in std_logic_vector(7 downto 0);
		Sbot : in std_logic_vector(7 downto 0);
		
		Diff_max : in std_logic_vector(7 downto 0);
		Diff_min : in std_logic_vector(7 downto 0);
		
		Auto : in std_logic;
		
		Asse_x : out std_logic_vector(1 downto 0);
		Asse_y : out std_logic_vector(1 downto 0)
	);
end entity SolarTracker;

architecture Impl_SolarTracker of SolarTracker is 
	
	begin
  		X : entity DriverAsse port map(Sdx,  Ssx,  Diff_max, Diff_min, Auto, Asse_x);
  		Y : entity DriverAsse port map(Stop, Sbot, Diff_max, Diff_min, Auto, Asse_y);
  		
end architecture Impl_SolarTracker;


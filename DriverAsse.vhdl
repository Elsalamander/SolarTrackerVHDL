library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;


entity DriverAsse is
	port( 
		SA  : in std_logic_vector(7 downto 0);
		SB  : in std_logic_vector(7 downto 0);
		
		Diff_max : in std_logic_vector(7 downto 0);
		Diff_min : in std_logic_vector(7 downto 0);
		
		Auto : in  std_logic;
		
		Asse : out std_logic_vector(1 downto 0)
	);
end entity DriverAsse;

architecture impl_DriverAsse of DriverAsse is 
	signal diff : signed(7 downto 0) := (others => '0');
	signal compl: std_logic := '0';
	
	signal maj  : std_logic;
	signal min  : std_logic;
	signal zero : std_logic;
	
	begin
		diff <= signed(SA) - signed(SB);
		maj  <= '1' when abs(diff) > signed(Diff_max) else '0';
		min  <= '1' when abs(diff) > signed(Diff_min) else '0';
		zero <= '1' when diff > 0 else '0';
						
		process(Auto, compl, maj, min, zero) is
			begin
				case? Auto & compl & maj & min & zero is
					when "0----" | "1--0-" | "10011" => Asse <= "00"; compl <= '0';
					when "1-111" | "11011" => Asse <= "10"; compl <= '1';
					when "1-110" | "11010" => Asse <= "01"; compl <= '1';
					when others => Asse <= "11";
				end case?;
		end process;
  	
end architecture impl_DriverAsse;
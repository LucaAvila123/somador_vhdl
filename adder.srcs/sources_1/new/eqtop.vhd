
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity eqtop is
  Port (
        sw: in std_logic_vector(15 downto 0);
        led: out std_logic_vector (15 downto 0)
  );
end eqtop;

architecture Behavioral of eqtop is
begin

    Adder2bit: entity work.Adder2bit(ChainArch)
       port map (
            ain => sw(15 downto 12),
            bin => sw(3 downto 0),
            
            sum => led(10 downto 7),
            cout => led(0)
       ); 


end Behavioral;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity eqtop is
    port(
        
          sw    : in  std_logic_vector(8 downto 0);
          
          led   : out std_logic_vector(5 downto 0)
          );
end eqtop;

architecture arch of eqtop is

begin
    somador4bits : entity work.somador4Bits(arquitetura)
        port map(
            entrada1 => sw(7 downto 4),
            entrada2 => sw(3 downto 0),
            carryin => sw(8),
            saida => led(3 downto 0),
            carryout => led(5) 
        );

end arch;

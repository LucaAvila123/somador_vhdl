library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity eqtop is
    port(
        
          sw    : in  std_logic_vector(13 downto 0);
          
          led   : out std_logic_vector(15 downto 0)
          );
end eqtop;

architecture arch of eqtop is

begin
    somador6bits : entity work.somadorNBits(arquitetura)
        port map(
            entrada1 => sw(11 downto 6),
            entrada2 => sw(5 downto 0),
            opera => sw(13),
            saida => led(5 downto 0),
            carryout => led(15) 
        );

end arch;

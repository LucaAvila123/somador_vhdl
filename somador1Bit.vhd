library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity somadorCompleto1Bit is -- esta entidade e sua arquitetura serão usadas como funções
    port(
        a :          in  std_logic;
        b :          in  std_logic;
        cin:         in  std_logic;
        s:           out std_logic;
        cout:        out std_logic
    );
end somadorCompleto1Bit;

architecture arch of somadorCompleto1Bit is
    
begin

        s <= a xor b xor cin;
        cout <= (a and b) or (a and cin) or (b and cin);
end arch;

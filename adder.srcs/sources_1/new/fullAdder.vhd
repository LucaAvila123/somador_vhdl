library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity fullAdder is
    Port (
        a: in std_logic_vector (1 downto 0);
        ci: in std_logic;
        
        s: out std_logic;
        co: out std_logic
     );
end fullAdder;

architecture GateArch of fullAdder is

begin

    s <= a(0) xor a(1) xor ci;
    co <= (a(0) and a(1))or(a(0) and ci) or (a(1) and ci);

end GateArch;
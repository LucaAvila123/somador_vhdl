library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Adder2bit is
    Port ( 
        ain: in std_logic_vector (3 downto 0);
        bin: in std_logic_vector (3 downto 0);
        op: in std_logic;
        sum: out std_logic_vector (3 downto 0);
        cout: out std_logic
    );
end Adder2bit;

architecture ChainArch of Adder2bit is
    signal c0, c1, c2, cin: std_logic;
    signal nb: std_logic_vector (3 downto 0);
begin

    nb <= not(bin) when (op = '1') else
          bin;
          
    cin <= '1' when (op = '1') else
            '0';

    Adder01: entity work.fullAdder(GateArch)
        port map(
            ci => cin,
            a(0) => ain(0),
            a(1) => nb(0),
            co => c0,
            s => sum(0)
        );
        
    Adder02: entity work.fullAdder(GateArch)
        port map(
            ci => c0,
            a(0) => ain(1),
            a(1) => nb(1),
            co => c1,
            s => sum(1)
        );
        
    Adder03: entity work.fullAdder(GateArch)
        port map(
            ci => c1,
            a(0) => ain(2),
            a(1) => nb(2),
            co => c2,
            s => sum(2)
        );
        
    Adder04: entity work.fullAdder(GateArch)
        port map(
            ci => c2,
            a(0) => ain(3),
            a(1) => nb(3),
            co => cout,
            s => sum(3)
        ); 
        
end ChainArch;
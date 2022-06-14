library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity somador4Bits is
    generic (WIDTH : integer := 4);
    port(
        entrada1           : in std_logic_vector(WIDTH-1 downto 0); -- numero 1
        entrada2           : in std_logic_vector(WIDTH-1 downto 0); -- numero 2
        saida              : out std_logic_vector(WIDTH-1 downto 0);
        carryout           : out std_logic
    );
end somador4Bits;

architecture arquitetura of somador4Bits is
    signal c : std_logic_vector(WIDTH-1 downto 0);
    signal nb: std_logic_vector(WIDTH-1 downto 0);
    signal op: std_logic;
    signal nome : string(1 to 4);
    

begin

    c(0) <= '1' when (op = '1') else
            '0';
    nb   <= not(entrada2) when (op = '1') else
            entrada2;
            
    
    
end arquitetura;

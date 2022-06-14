library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity somador4Bits is
    port(
        entrada1           : in std_logic_vector(3 downto 0);
        entrada2           : in std_logic_vector(3 downto 0);
        saida              : out std_logic_vector(3 downto 0);
        carryin            : in std_logic;
        carryout           : out std_logic
    );
end somador4Bits;

architecture arquitetura of somador4Bits is
    signal c : std_logic_vector(3 downto 0);

begin
    somaPrimeiroBit : entity work.somadorCompleto1Bit(arch) 
    port map(
        a => entrada1(0),
        b => entrada2(0),
        s => saida(0),
        cin => carryin, -- para o primeiro bit isso talvez faça sentido, para os próximos, fica a dúvida
        cout => c(0) -- sera o carryout de todas as somas, exceto a última
    );  

    somaSegundoBit  : entity work.somadorCompleto1Bit(arch)
    port map(
        a => entrada1(1),
        b => entrada2(1),
        s => saida(1),
        cin => c(0), -- o valor que entra é o valor de "vai 1" da primeira soma
        cout => c(1) -- o valor de "vai 1" desta se estabelece como o sinal
    ); 

    somaTerceiroBit : entity work.somadorCompleto1Bit(arch)
    port map(
        a => entrada1(2),
        b => entrada2(2),
        s => saida(2),
        cin => c(1),
        cout => c(2)
    );
    
    somaQuartoBit  : entity work.somadorCompleto1Bit(arch)
    port map(
        a => entrada1(3),
        b => entrada2(3),
        s => saida(3),
        cin => c(2),
        cout => c(3) -- percebe-se que o único caso realmente diferente é o primeiro bit
    );
    carryout <= c(3);
    
end arquitetura;
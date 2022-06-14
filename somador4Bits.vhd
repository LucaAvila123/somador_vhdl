library IEEE;
se IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity somador4Bits is
    port(
        entrada1, entrada2 : in std_logic_vector(3 downto 0);
        saida              : out std_logic_vector(3 downto 0);
        carryin            : in std_logic;
        carryout           : out std_logic
    );
end somador4Bits;

architecture arquitetura of somador4Bits is:
    signal output : std_logic_vector (3 downto 0);
    signal inCode : std_logic;

begin
    somaPrimeiroBit : entity work.somadorCompleto1Bit(arch) 
    port map(
        a => entrada1(0);
        b => entrada2(0);
        s => output(0);
        cin => carryin; -- para o primeiro bit isso talvez faça sentido, para os próximos, fica a dúvida
        cout => inCode; -- sera o carryout de todas as somas, exceto a última
    );  

    somaSegundoBit  : entity work.somadorCompleto1Bit(arch)
    port map(
        a => entrada1(1);
        b => entrada2(1);
        s => output(1);
        cin => inCode; -- o valor que entra é o valor de "vai 1" da primeira soma
        cout => inCode; -- o valor de "vai 1" desta se estabelece como o sinal
    ); 

    somaTerceiroBit : entity work.somadorCompleto1Bit(arch)
    port map(
        a => entrada1(2);
        b => entrada2(2);
        s => output(2);
        cin => inCode;
        cout => inCode;
    );

    somaQuartoBit : entity work.somadorCompleto1Bit(arch)
    port map(
        a => entrada1(3);
        b => entrada2(3);
        s => output(3);
        cin => inCode;
        cout => carryout; -- perceptivel que os únicos códigos diferentes aqui são o primeiro e o último (dá pra aplicar um for)
    );

    saida <= output;
    
end arquitetura;
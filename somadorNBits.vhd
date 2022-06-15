library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity somadorNBits is
    generic (WIDTH : integer := 4);
    port(
        entrada1           : in  std_logic_vector(WIDTH-1 downto 0); -- numero 1
        entrada2           : in  std_logic_vector(WIDTH-1 downto 0); -- numero 2
        saida              : out std_logic_vector(WIDTH-1 downto 0);
        carryout           : out std_logic;
        opera              : in  std_logic
    );
end somadorNBits;

architecture arquitetura of somadorNBits is
    signal c : std_logic_vector(WIDTH downto 0);
    signal nb: std_logic_vector(WIDTH-1 downto 0);
    
begin

    c(0) <= '1' when (opera = '1') else  -- esse valor de entrada é a forma de usar complemento de 2 no código 
            '0';
    nb   <= not(entrada2) when (opera = '1') else
            entrada2;
            
    soma: for i in 0 to (WIDTH-1) generate -- isso daqui é uma forma de escrever linhas de código mais facilmente
        somando_N: entity work.somadorCompleto1Bit(arch)
        port map(
            a => entrada1(i),
            b => nb(i),
            s => saida(i),
            cin => c(i),
            cout => c(i+1)   
        );
    end generate soma;
    
    carryout <= c(WIDTH); -- se esse daqui for 1, é porque deu overflow
    
end arquitetura;  

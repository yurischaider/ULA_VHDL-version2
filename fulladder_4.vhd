LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;


-- SOMADOR COMPLETO DE 4 BITS CHAMANDO O COMPONENTE (MÓDULO) DO SOMADOR DE 1 BIT

ENTITY fulladder_4 IS PORT
(
    x,y     : in  BIT_VECTOR(3 downto 0);
    cin     : in  BIT;
    output  : out BIT_VECTOR(3 downto 0);
    carrys  : out BIT_VECTOR(3 downto 0)
    
);
END fulladder_4;

ARCHITECTURE adder_4 OF fulladder_4 IS

    COMPONENT fulladder_1 IS PORT(
        xi,yi,ci    : in  BIT;
        sum,co      : out BIT
        );
    END COMPONENT;
    
    signal c : BIT_VECTOR(3 downto 0);
    
BEGIN

    x0:    fulladder_1    PORT MAP(x(0), y(0), cin,  output(0), c(0));
    x1:    fulladder_1    PORT MAP(x(1), y(1), c(0), output(1), c(1));
    x2:    fulladder_1    PORT MAP(x(2), y(2), c(1), output(2), c(2));
    x3:    fulladder_1    PORT MAP(x(3), y(3), c(2), output(3), c(3));

    carrys <= c;

END adder_4;

LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

-- OPERAÇÃO DE DESLOCAMENTO PARA DIREITA DE UM 1 BIT

ENTITY shiftright is PORT
(
    x     	: in  bit_vector(3 downto 0);
    output  : out bit_vector(3 downto 0)
    
);
END shiftright;

ARCHITECTURE s_right of shiftright is
    
BEGIN

    output <=  x SRL 1;
    
END s_right;


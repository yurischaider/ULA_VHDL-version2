LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

-- OPERAÇÃO AND ENTRE DOIS NÚMEROS BINÁRIOS DE 4 BITS

ENTITY and_4 is PORT
(
    x,y     : in  BIT_VECTOR(3 downto 0);
    output  : out BIT_VECTOR(3 downto 0)
    
);
END and_4;

ARCHITECTURE and4 of and_4 is
    
BEGIN

    output(0) <= x(0) AND y(0);
	 output(1) <= x(1) AND y(1);
	 output(2) <= x(2) AND y(2);
	 output(3) <= x(3) AND y(3); 
    
END and4;
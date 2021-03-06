LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

-- OPERAÇÃO OR ENTRE DOIS NÚMEROS BINÁRIOS DE 4 BITS

ENTITY or_4 is PORT
(
    x,y     : in  BIT_VECTOR(3 downto 0);
    output  : out BIT_VECTOR(3 downto 0)
    
);
END or_4;

ARCHITECTURE or4 of or_4 is
    
BEGIN

    	 output(0) <= x(0) OR y(0);
	 output(1) <= x(1) OR y(1);
	 output(2) <= x(2) OR y(2);
	 output(3) <= x(3) OR y(3); 
        
END or4;

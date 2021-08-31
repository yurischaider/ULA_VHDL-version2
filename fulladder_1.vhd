LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

ENTITY fulladder_1 is PORT
(
    xi, yi, ci  : in  BIT;                                    -- Entradas do somador
    sum    	: out BIT;
    co  	: OUT BIT                                     -- Saidas do somador
);

END fulladder_1;

ARCHITECTURE adder of fulladder_1 is

BEGIN

    sum  <=  xi XOR yi XOR ci;                                -- Faz a operacao da Soma
    co 	 <= (xi AND yi) OR (xi AND ci) OR (yi AND ci);        -- Logica do carry out

END adder;
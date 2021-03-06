LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

ENTITY subtractor_4 IS PORT
(
    x,y     : in   bit_vector(3 downto 0);
    cin     : in   bit;
    output  : out  bit_vector(3 downto 0);
    cout    : out  bit_vector(3 downto 0)
	 
);
END subtractor_4;

ARCHITECTURE sub of subtractor_4 IS

    COMPONENT fulladder_1 is port(
        xi,yi,ci      :    in bit;
        sum,co        :    out bit
        );
    END COMPONENT;
    
    signal result_aux  : bit_vector(3 downto 0);
    signal carry_aux   : bit_vector(3 downto 0);
    
BEGIN

    x0: fulladder_1  PORT MAP(x(0), y(0), '1'         , result_aux(0), carry_aux(0));
    x1: fulladder_1  PORT MAP(x(1), y(1), carry_aux(0), result_aux(1), carry_aux(1));
    x2: fulladder_1  PORT MAP(x(2), y(2), carry_aux(1), result_aux(2), carry_aux(2));
    x3: fulladder_1  PORT MAP(x(3), y(3), carry_aux(2), result_aux(3), carry_aux(3));
    
    output <= result_aux;
    cout   <= carry_aux;
    
END sub;

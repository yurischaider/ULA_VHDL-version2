--Definicao das bibliotecas usadas no projeto

LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
use ieee.numeric_std.ALL;


--Entidade da ULA com entradas e saidas definidas

ENTITY ula IS PORT
(
    	x_ula, y_ula	: in  STD_LOGIC_VECTOR(3 downto 0);			--entrada x e y de 4 bits cada
    	selector 		: in  STD_LOGIC_VECTOR(2 downto 0);			--seletor de operacao
    	output_ula		: out STD_LOGIC_VECTOR(3 downto 0);			--saida resultante da operacao
    
	zero 	        	: out STD_LOGIC;					--flag de zero     
    	negative 	: out STD_LOGIC;					--flag negativo    
	carryout 		: out STD_LOGIC;				        --flag carry out   
	oflow	 		: out STD_LOGIC					--flag overflow    
	 
);
END ula;

ARCHITECTURE main of ula is 

	signal sum, subC2, incr1, csignal, decr1, op_and, op_or, desloc 	 : STD_LOGIC_VECTOR(3 downto 0); --Atribui um sinal a cada operacao
	signal output_s 		  			  		 : STD_LOGIC_VECTOR(3 downto 0);
	signal zero_s, negative_s, oflow_s 	   	  			 : STD_LOGIC;
	signal carry_vector0, carry_vector1,  carry_vector2,  carry_vector3,  carry_vector4 , carry_vector5 : STD_LOGIC_VECTOR (3 downto 0);
	signal carry_s								 : STD_LOGIC_VECTOR (3 downto 0);
	signal x_ulabarrado, y_ulabarrado 			  		 : STD_LOGIC_VECTOR (3 downto 0);
	
   COMPONENT fulladder_4 is port(
        x,y     : in  STD_LOGIC_VECTOR(3 downto 0);
	cin     : in  STD_LOGIC;
	output  : out STD_LOGIC_VECTOR(3 downto 0);
	carrys  : out STD_LOGIC_VECTOR(3 downto 0)
        );
   END COMPONENT;
	
   COMPONENT and_4 is port(
        x,y     : in  STD_LOGIC_VECTOR(3 downto 0);
	output  : out STD_LOGIC_VECTOR(3 downto 0)
        );
   END COMPONENT;
	
   COMPONENT or_4 is port(
        x,y     : in  STD_LOGIC_VECTOR(3 downto 0);
	output  : out STD_LOGIC_VECTOR(3 downto 0)
        );
   END COMPONENT;
	

BEGIN

	x_ulabarrado <= NOT x_ula;
	y_ulabarrado <= NOT y_ula;

--Faz o mapeamento de cada uma das operacoes de acordo com cada componente

	soma 		: fulladder_4 PORT MAP(x_ula , y_ula , '0' , sum ,  carry_vector0 );     
	subtracao	: fulladder_4 PORT MAP(x_ula , y_ulabarrado , '1' , subC2 ,  carry_vector1 );
	incremento  	: fulladder_4 PORT MAP(x_ula , "0000" , '1' , incr1 ,  carry_vector2 );
	troca_sinal 	: fulladder_4 PORT MAP(x_ulabarrado , "0000" , '1' , csignal , carry_vector3 );
	decremento  	: fulladder_4 PORT MAP(x_ula , "1111" , '0' , decr1 , carry_vector4 ); 
	andBitwise	: and_4 PORT MAP(x_ula , y_ula , op_and);
	orBitwise	: or_4  PORT MAP(x_ula , y_ula , op_or);
	desloc_dir	: fulladder_4 PORT MAP(x_ula , x_ula , '0' , desloc , carry_vector5 );  

	
--Atribui o sinal de saida a cada uma das operacoes de acordo com o seletor
	output_s <= sum when (selector = "000") else
		    subC2    when (selector = "001") else
		    incr1    when (selector = "010") else
		    csignal  when (selector = "011") else
		    decr1    when (selector = "100") else
		    op_and   when (selector = "101") else
		    op_or    when (selector = "110") else
		    desloc   when (selector = "111");
		 
	carry_s <=  carry_vector0  when (selector = "000") else
		    carry_vector1  when (selector = "001") else
		    carry_vector2  when (selector = "010") else
		    carry_vector3  when (selector = "011") else
	    	    carry_vector4  when (selector = "100") else
		    carry_vector5  when (selector = "111"); 
				 
--L�gica das flags

	zero_s       <= '1' when output_s = "0000" else '0';
	
	negative_s   <= '1' when output_s(3) = '1' else '0';
	
	oflow_s	<= carry_s(3) XOR carry_s(2);
	
--Sa�das
	
	output_ula <= output_s;
	zero 	   <= zero_s;
	negative   <= negative_s;
	carryout   <= carry_s(3);
   oflow	   <= oflow_s;
	
END main;
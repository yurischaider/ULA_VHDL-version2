
--TESTE BENCH DA ULA

ENTITY testebench_ula IS END;

--BIBLIOTECAS E PACOTES DO PROJETO

LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE std.textio.ALL;
use IEEE.STD_LOGIC_unsigned.ALL;


ARCHITECTURE testbench OF  testebench_ula IS

COMPONENT ula
	PORT(
		x_ula, y_ula	: in  STD_LOGIC_VECTOR(3 downto 0);			--entrada x e y de 4 bits cada
	 	selector 	: in  STD_LOGIC_VECTOR(2 downto 0);			--seletor de operacao
    		output_ula	: out STD_LOGIC_VECTOR(3 downto 0);			--saida resultante da operacao
    
	 	zero 	 	: out STD_LOGIC;					--flag de zero     
    		negative 	: out STD_LOGIC;					--flag negativo    
	 	carryout 	: out STD_LOGIC;					--flag carry out   
	 	oflow	 	: out STD_LOGIC 					--flag overflow  
	);
END COMPONENT;

--SINAIS AUXILIARES DE ESTÍMULO

	SIGNAL x_1, y_1			: STD_LOGIC_VECTOR(3 downto 0);			--entrada x e y de 4 bits cada
	SIGNAL selec_1 			: STD_LOGIC_VECTOR(2 downto 0);			--seletor de operacao
   	SIGNAL output_1			: STD_LOGIC_VECTOR(3 downto 0);				--saida resultante da operacao
    
	SIGNAL	zero_1 	 		: STD_LOGIC;									--flag de zero     
   	SIGNAL	negative_1 		: STD_LOGIC;										--flag negativo    
	SIGNAL 	carryout_1 		: STD_LOGIC;									--flag carry out   
	SIGNAL 	oflow_1	 		: STD_LOGIC;

BEGIN

--INSTANCIANDO OS COMPONENTES COM PROCESSO DE ESTÍMULO

	ula1: ula PORT MAP ( x_ula => x_1 , y_ula => y_1 , selector => selec_1 , output_ula => open , zero => open , negative => open , carryout => open , oflow => open);


estimulo : PROCESS

BEGIN
wait for 5 ns; selec_1 <= "000"; x_1<= "0000"; y_1 <= "0000";
for I in 0 to 7 loop
	wait for 1 ns;
	for U in 0 to 15 loop
		for W in 0 to 15 loop
		y_1 <= y_1 + "0001";
		wait for 1 ns;
		end loop;
	x_1 <= x_1 + "0001";
	wait for 1 ns;
	end loop;
selec_1 <= selec_1 + "001";
wait for 1 ns;
end loop;	

END PROCESS estimulo;

END testbench;
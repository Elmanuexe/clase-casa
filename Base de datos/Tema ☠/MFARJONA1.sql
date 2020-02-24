SET SERVEROUTPUT ON;
CREATE OR REPLACE FUNCTION
IMC (PESO NUMBER, ALTURA NUMBER)
RETURN NUMBER
IS
IMC NUMBER;
BEGIN
    IMC:=PESO/POWER(ALTURA,2);    
END;

CREATE OR REPLACE PROCEDURE IMC2
IS
BEGIN

MENSAJE:=CASE
    WHEN IMC <16 THEN 'Criterio de ingrso en el hospital'
    WHEN IMC >= 16 AND V_EDAD <17 THEN 
        MENSAJE := 'Infrapeso';
    WHEN IMC >= 17 AND V_EDAD <18 THEN 'Bajo peso'
    WHEN IMC >= 18 AND V_EDAD <25 THEN 'Peso normal'
    WHEN IMC >= 25 AND V_EDAD <30 THEN 'Sobrepeso'
    WHEN IMC >= 30 AND V_EDAD <35 THEN 'Sobrepeso Cr�nico'
    WHEN IMC >= 35 AND V_EDAD <40 THEN 'Obesidad prem�rbida'
    WHEN IMC >40 THEN 'Obesidad m�rbida'
    
    dbms_output.put_line('MENSAJE');

END;
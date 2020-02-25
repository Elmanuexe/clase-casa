CREATE OR REPLACE FUNCTION
IMC (PESO NUMBER, ALTURA NUMBER)
RETURN varchar2
IS
IMC NUMBER;
mensaje varchar2;
BEGIN

    IMC:=PESO/POWER(ALTURA,2);   
    
    MENSAJE:=CASE
    WHEN IMC <16 THEN 'Criterio de ingrso en el hospital'
    WHEN IMC >= 16 AND V_EDAD <17 THEN 'Infrapeso'
    WHEN IMC >= 17 AND V_EDAD <18 THEN 'Bajo peso'
    WHEN IMC >= 18 AND V_EDAD <25 THEN 'Peso normal'
    WHEN IMC >= 25 AND V_EDAD <30 THEN 'Sobrepeso'
    WHEN IMC >= 30 AND V_EDAD <35 THEN 'Sobrepeso Crónico'
    WHEN IMC >= 35 AND V_EDAD <40 THEN 'Obesidad premórbida'
    WHEN IMC >40 THEN 'Obesidad mórbida'
    END;
        DBMS_OUTPUT.PUT_LINE('MENSAJE');
end;

SELECT  IMC(60, 1.69)
from dual
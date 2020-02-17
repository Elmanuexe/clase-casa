SET SERVEROUTPUT ON;
--PARA QUE IMPRIMA

BEGIN
    DBMS_OUTPUT.PUT_LINE('HOLA MUNDO');
END;


--DECLARAR UNA VARIABLE
DECLARE
    n NUMBER :=2;
    n1 NUMBER :=3;
    n2 NUMBER;
    pi CONSTANT NUMBER(9,7):=3.1415927;
BEGIN
    n2 := n*n1;
    DBMS_OUTPUT.PUT_LINE('El valor de n2 es '|| n2);
    DBMS_OUTPUT.PUT_LINE('Pi es igual a '||pi);
END;


--TIPOS DE DATOS
DECLARE
    N1 PLS_INTEGER;
    N2 CONSTANT PLS_INTEGER := 12;
    FEC_NAC DATE;
    DIAS PLS_INTEGER;
    EDAD_JUV CONSTANT PLS_INTEGER := 70;
    EDAD PLS_INTEGER;
    ANYOS PLS_INTEGER;
BEGIN
    FEC_NAC := TO_DATE('05/10/2001','DD/MM/YYYY');
    DIAS := SYSDATE - fec_nac;
    N1 :=18;
    EDAD := MONTHS_BETWEEN(SYSDATE, FEC_NAC)/12;
    ANYOS := EDAD_JUV - EDAD;
    DBMS_OUTPUT.PUT_LINE('El numero de meses que llevo vivo el aproximadamente '||n1*n2);
    DBMS_OUTPUT.PUT_LINE('Los dias que llevo vivo son '||DIAS);
    DBMS_OUTPUT.PUT_LINE('Los meses que me quedan para juvilarme son ' ||ANYOS);
END;


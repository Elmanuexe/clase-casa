SET SERVEROUTPUT ON;
--PARA QUE IMPRIMA

BEGIN
    dbms_output.put_line('HOLA MUNDO');
END;


--DECLARAR UNA VARIABLE

DECLARE
    n    NUMBER := 2;
    n1   NUMBER := 3;
    n2   NUMBER;
    pi   CONSTANT NUMBER(9, 7) := 3.1415927;
BEGIN
    n2 := n * n1;
    dbms_output.put_line('El valor de n2 es ' || n2);
    dbms_output.put_line('Pi es igual a ' || pi);
END;


--TIPOS DE DATOS

DECLARE
    n1         PLS_INTEGER;
    n2         CONSTANT PLS_INTEGER := 12;
    fec_nac    DATE;
    dias       PLS_INTEGER;
    edad_juv   CONSTANT PLS_INTEGER := 70;
    edad       PLS_INTEGER;
    anyos      PLS_INTEGER;
BEGIN
    fec_nac := TO_DATE('05/10/2001', 'DD/MM/YYYY');
    dias := sysdate - fec_nac;
    n1 := 18;
    edad := months_between(sysdate, fec_nac) / 12;
    anyos := edad_juv - edad;
    dbms_output.put_line('El numero de meses que llevo vivo el aproximadamente ' || n1 * n2);
    dbms_output.put_line('Los dias que llevo vivo son ' || dias);
    dbms_output.put_line('Los meses que me quedan para juvilarme son ' || anyos);
END;


--COPIAR TIPOS DE DATOS

CREATE TABLE presona (
    dni         NUMBER(10),
    nombre      VARCHAR2(25),
    apellidos   VARCHAR2(25),
    fecha_nac   DATE,
    CONSTRAINT pk_nfx_clientes PRIMARY KEY ( dni )
);

DECLARE
    v_dni   presona.dni%TYPE;
    var1    PLS_INTEGER;
    var2    var1%TYPE;
BEGIN
    v_dni := '123456789T';
END;

/*
PODEMOS DAR TIPO DE 3 FORMAS

1 DIRECTAMENTE CON  V1 PLS_INTEGER;

2 ATRAVES DE UNA VARIABLE  V2 V1%TYPE;

3 ATRAVES DEL TIPO DE DATO DE UNA COLUMNA DE UNA TABLA  V3 TABLA.COL%TYPE;
*/

DECLARE
    numero PLS_INTEGER;
BEGIN
    numero := MOD(abs(dbms_random.random), 31) + 30;
    dbms_output.put_line('EL NUMERO ES: ' || numero);
END;

DECLARE
    v_firstname    employees.first_name%TYPE;
    v_lastname     employees.last_name%TYPE;
    v_salary       employees.salary%TYPE;
    nuevo_sueldo   v_salary%TYPE;
BEGIN
    SELECT
        first_name,
        last_name,
        salary
    INTO
        v_firstname,
        v_lastname,
        v_salary
    FROM
        employees
    WHERE
        employee_id = 100;

    nuevo_sueldo := v_salary * 1.20;
    dbms_output.put_line('Nombre: '
                         || v_firstname
                         || ' '
                         || v_lastname
                         || ' '
                         || 'Sueldo: '
                         || nuevo_sueldo
                         || ' '
                         || 'Sueldo antiguoo:'
                         || v_salary);

END;

DROP TABLE persona;

CREATE TABLE persona (
    dni         NUMBER(10),
    nombre      VARCHAR2(25),
    apellidos   VARCHAR2(25),
    fecha_nac   DATE,
    edad        DATE,
    CONSTRAINT pk_persona PRIMARY KEY ( dni )
);


DECLARE
    V_DNI PERSONA.DNI%TYPE;
    V_NOMBRE PERSONA.NOMBRE%TYPE;
    V_APELLIDOS PERSONA.APELLIDOS%TYPE;
    V_FECHAN PERSONA.FECHA_NAC%TYPE;
    V_EDAD PERSONA.EDAD%TYPE;
BEGIN
    V_DNI := '123456789T';
    V_NOMBRE := 'Manuel';
    V_APELLIDOS := 'Fernandez Arjona';
    V_FECHAN := TO_DATE('05/10/2001', 'DD/MM/YYYY');
    V_EDAD := MONTHS_BETWEEN(SYSDATE, V_FECHAN)/12;
    
    DELETE
    FROM PERSONA
    WHERE DNI= V_DNI;
    
    INSERT INTO PERSONA (DNI, NOMBRE, APELLIDOS, FECHA_NAC, EDAD)
    VALUES (V_DNI, V_NOMBRE, V_APELLIDOS, V_FECHAN, V_EDAD);
    
    COMMIT;
    
    DBMS_OUTPUT.PUT_LINE(V_DNI || ' ' || V_NOMBRE || ' ' || V_APELLIDOS || ' ' || TO_CHAR(V_FECHAN, 'DD/MM/YYYY'|| ' ' || V_EDAD));
END;

--IF
IF (X) THEN
 COSA PARA HACER
 ELSE
 OTRA COSA
END IF;
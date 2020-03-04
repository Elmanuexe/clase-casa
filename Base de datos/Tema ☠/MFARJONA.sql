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

--2 ATRAVES DE UNA VARIABLE  V2 V1%TYPE;

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

--CASE
CASE selector
WHEN expresion1 THEN resultado1
WHEN expresion2 THEN resultado2
[ELSE resultadoElse]
END;
--Hay que tener en cuenta que la sentencia CASE sirve para devolver un valor y no para ejecutar una instrucción
DECLARE
MENSAJE
begin
MENSAJE := CASE
    WHEN V_EDAD >= 18 AND V_EDAD <25 THEN 'ERES MENOR'
    WHEN V_EDAD >= 25 AND V_EDAD <30 THEN 'YA VAS SIENDO MAYOR'
   
    DBMS_OUTPUT.PUT_LINE('MENSAJE');
END;

--BUCLES
--LOOP
--El loop siempre se ejecuta una vez como mínimo
DECLARE
    cont NUMBER :=1;
BEGIN
    LOOP
        DBMS_OUTPUT.PUT_LINE(cont);
        EXIT WHEN cont=10;
        cont:=cont+1;
    END LOOP;
END;

--WHILE
--Muy parecido a Java
DECLARE
    cont NUMBER :=1;
BEGIN
    WHILE cont<=10 LOOP
        DBMS_OUTPUT.PUT_LINE(cont);
        cont:=cont+1;
    END LOOP;
END;

--FOR
begin
FOR i IN 1..10 LOOP
    dbms_output.put_line(i);
EXIT WHEN i=5;
END LOOP;
end;

--FUNCIONES

CREATE OR REPLACE PROCEDURE
TABLA_MULTIPLICAR(N PLS_INTEGER)
IS
--ZONA DE DECLARACION DE VARIABLES
BEGIN
    DBMS_OUTPUT.PUT_LINE('Tabla de multiplicar numero: ' || N);
    DBMS_OUTPUT.PUT_LINE('====================================');
    FOR I IN 1..10 LOOP
        DBMS_OUTPUT.PUT_LINE( N || ' x ' || I || ' = ' || N*I );
        END LOOP;
        DBMS_OUTPUT.PUT_LINE;
    END;

--ALEATORIO
CREATE OR REPLACE FUNCTION ALEATORIO
RETURN PLS_INTEGER
IS
 N PLS_INTEGER
BEGIN
    N:= DBMS_RANDOM.RANDOM;
    RETURN N;
END;

SELECT ALEATORIO 
FROM DUAL;

--ALEATORIO2
CREATE OR REPLACE FUNCTION
ALEATORIO2(N1 PLS_INTEGER, N2 PLS_INTEGER)
RETURN PLS_INTEGER
IS
 N PLS_INTEGER;
 PEQUENIO PLS_INTEGER;
 GRANDE PLS_INTEGER;
 INTERVALO PLS_INTEGER;
 ALEATORIO1 PLS_INTEGER;
BEGIN
    --1) SABER CUAL ES EL MAS GRANDE Y EL MAS PEQUEÑO
     IF (N1 >= N2)THEN
        GRANDE := N1;
        PEQUENIO := N2;
    ELSE
        GRANDE := N2;
        PEQUENIO := N1;
    END IF;
    --2) SABER EL RANGO
    INTERVALO := GRANDE - PEQUENIO;
    --3) CALCULAR UN Nº ALEATORIO EN EL RANGO
    ALEATORIO1 :=MOD(ABS(DBMS_RANDOM.RANDOM),INTERVALO+1);
    --4) SUMAR ESE ALEATORIO AL Nº MAS PEQUEÑO ENTRE N1, N2
    RETURN PEQUENIO + ALEATORIO1;
    --5) DEVOLVER EL VALOR
END;

SELECT ALEATORIO 
FROM DUAL;

--PARAMETROS IN Y OUT
CREATE OR REPLACE PROCEDURE
INC (V PLS_INTEGER, INCREMENTO PLS_INTEGER, RESULTADO OUT PLS_INTEGER)
IS

BEGIN
    RESULTADO := V + INCREMENTO;
END;

DECLARE
    RES PLS_INTEGER;
BEGIN
     INC(7,10,RES);
     DBMS_OUTPUT.PUT_LINE(RES);
END;

CREATE OR REPLACE PROCEDURE
INC (V IN OUT PLS_INTEGER, INCREMENTO PLS_INTEGER)
IS

BEGIN
    V := V + INCREMENTO;
END;

DECLARE
    NUMERO PLS_INTEGER := 123;
BEGIN
    DBMS_OUTPUT.PUT_LINE(NUMERO);
    INC(NUMERO,10);
    DBMS_OUTPUT.PUT_LINE(NUMERO);
END;

--VARIABLES DE TIPO REGISTRO
DECLARE
EPLOYEE_ID EMPLOYEES.EMPLOYEE_ID%TYPE;
FIRST_NAME EMPLOYEES.FIRST_NAME%TYPE;
LAST_NAME EMPLOYEES.LAST_NAME%TYPE;

REG_EMPLEADO EMPLOYEES%ROWTYPE;
BEGIN
    SELECT * INTO REG_EMPLEADO
    FROM EMPLOYEES
    WHERE EMPLOYEE_ID= 101;
END;

DECLARE
EPLOYEE_ID EMPLOYEES.EMPLOYEE_ID%TYPE;
FIRST_NAME EMPLOYEES.FIRST_NAME%TYPE;
LAST_NAME EMPLOYEES.LAST_NAME%TYPE;


BEGIN
    SELECT EPLOYEE_ID, FIRST_NAME, LAST_NAME 
    INTO EMLOYEE_ID, FIRST_NAME, LAST_NAME
    FROM EMPLOYEES
    WHERE EMPLOYEE_ID= 101;
END;

DECLARE
    TYPE REG_PERSONA IS RECORD(
        NOMBRE VARCHAR2(50),
        APELLIDO1 VARCHAR2(50),
        APELLIDO2 VARCHAR2(50),
        FECHA_NAC DATE
    );
    MANUEL REG_PERSONA;
    ANTONIO REG_PERSONA;
BEGIN

    MANUEL.NOMBRE := 'Manuel';
    MANUEL.APELLIDO1 := 'Fernández';
    
    ANTONIO.NOMBRE := 'Antonio';
    ANTONIO.APELLIDO1 := 'Montero';
    
END;

--CURSORES
SET SERVEROUTPUT ON;
DECLARE 
    CURSOR C1 IS
    SELECT*
    FROM DEPARTMENTS;
BEGIN

    FOR V_REG IN c1 LOOP
        DBMS_OUTPUT.PUT_LINE('NOMBRE: ' || V_REG.DEPARTMENT_NAME);
    END LOOP;
    
END;

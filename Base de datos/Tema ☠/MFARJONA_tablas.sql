SET SERVEROUTPUT ON;

DECLARE
    cont NUMBER :=1;
    num1 NUMBER :=1;
BEGIN
    LOOP
        DBMS_OUTPUT.PUT_LINE( NUM1||'*'|| CONT|| '= ' || cont*num1);
        EXIT WHEN cont=10;
        cont:=cont+1;
    END LOOP;
    
        DBMS_OUTPUT.PUT_LINE(' ');
        
    cont:=1;
    num1:=num1+1;
    WHILE cont<=10 LOOP
        DBMS_OUTPUT.PUT_LINE( NUM1||'*'|| CONT|| '= ' || cont*num1);
        cont:=cont+1;
    END LOOP;
    
        DBMS_OUTPUT.PUT_LINE(' ');

    cont:=1;
    num1:=num1+1;
    FOR i IN 1..10 LOOP
        DBMS_OUTPUT.PUT_LINE( NUM1||'*'|| i|| '= ' || i*num1);
    EXIT WHEN i=10;
    END LOOP;
    
        DBMS_OUTPUT.PUT_LINE(' ');

    
    cont:=1;
    num1:=num1+1;
    LOOP
        DBMS_OUTPUT.PUT_LINE( NUM1||'*'|| CONT|| '= ' || cont*num1);
        EXIT WHEN cont=10;
        cont:=cont+1;
    END LOOP;
    
        DBMS_OUTPUT.PUT_LINE(' ');
        
    cont:=1;
    num1:=num1+1;
    WHILE cont<=10 LOOP
        DBMS_OUTPUT.PUT_LINE( NUM1||'*'|| CONT|| '= ' || cont*num1);
        cont:=cont+1;
    END LOOP;
    
        DBMS_OUTPUT.PUT_LINE(' ');
        
    cont:=1;
    num1:=num1+1;
    FOR i IN 1..10 LOOP
        DBMS_OUTPUT.PUT_LINE( NUM1||'*'|| i|| '= ' || i*num1);
    EXIT WHEN i=10;
    END LOOP;
    
        DBMS_OUTPUT.PUT_LINE(' ');
        
    cont:=1;
    num1:=num1+1;
    LOOP
        DBMS_OUTPUT.PUT_LINE( NUM1||'*'|| CONT|| '= ' || cont*num1);
        EXIT WHEN cont=10;
        cont:=cont+1;
    END LOOP;
    
        DBMS_OUTPUT.PUT_LINE(' ');
        
     cont:=1;
    num1:=num1+1;
    WHILE cont<=10 LOOP
        DBMS_OUTPUT.PUT_LINE( NUM1||'*'|| CONT|| '= ' || cont*num1);
        cont:=cont+1;
    END LOOP;
    
        DBMS_OUTPUT.PUT_LINE(' ');
        
    cont:=1;
    num1:=num1+1;
    FOR i IN 1..10 LOOP
        DBMS_OUTPUT.PUT_LINE( NUM1||'*'|| i|| '= ' || i*num1);
    EXIT WHEN i=10;
    END LOOP;
    
        DBMS_OUTPUT.PUT_LINE(' ');
END;
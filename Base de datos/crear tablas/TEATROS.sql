CREATE TABLE TT_INVITADOS(
    NROLINVITADO            NUMBER(9),
    NOMBRE                  VARCHAR2(200),
    CATEGORIA               VARCHAR2(50),
    ORIGEN                  VARCHAR2(100),
    
    CONSTRAINT PK_TT_INVITADOS PRIMARY KEY (NROLINVITADO),
    CONSTRAINT NN_TT_INVITADOS_N CHECK (NOMBRE IS NOT NULL),
    CONSTRAINT NN_TT_INVITADOS_NR CHECK (CATEGORIA IS NOT NULL)
);

CREATE TABLE TT_TEATROS(
    CODTEAT                 NUMBER(3),
    NOMBRE                  VARCHAR2(200),
    DIRECCION               VARCHAR2(200),
    CANTASIENTOS            NUMBER(5),
    
    CONSTRAINT PK_TT_TEATROS PRIMARY KEY (CODTEAT),
    CONSTRAINT NN_TT_TEATROS_NN CHECK (NOMBRE IS NOT NULL),
    CONSTRAINT NN_TT_TEATROS_CA CHECK (CANTASIENTOS > 0)
);

CREATE TABLE TT_OBRAS(
    CODOBRA                 NUMBER(5),
    DESCRIPCION             CLOB,
    NOMBREOBRA              VARCHAR2(50),
    AUTOR                   VARCHAR2(200),
        
    CONSTRAINT PK_TT_OBRAS PRIMARY KEY (CODOBRA),
    CONSTRAINT NN_TT_OBRAS_NO CHECK (NOMBREOBRA IS NOT NULL),
     CONSTRAINT NN_TT_OBRAS_AU CHECK (AUTOR IS NOT NULL)
);

CREATE TABLE TT_EXHIBE(
    CODTEAT                 NUMBER(9),
    FECHA                   DATE,
    CODOBRA                 NUMBER(9),
    
    CONSTRAINT PK_TT_EXHIBE PRIMARY KEY (CODTEAT, FECHA),
    CONSTRAINT NN_TT_EXHIBE_NN CHECK (CODOBRA IS NOT NULL)
);

CREATE TABLE TT_TIPOS_ASIENTOS(
    TIPO                    VARCHAR2(20),
    NOMBRE                  VARCHAR(50),
    DESCRIPCION             VARCHAR2(300),
    
    CONSTRAINT PK_TT_TIPOS_ASIENTOS PRIMARY KEY (TIPO),
    CONSTRAINT NN_TT_TIPOS_ASIENTOS_NN CHECK (NOMBRE IS NOT NULL)
);

CREATE TABLE TT_ASIENTO_TIPOS(
    NROASIENTO              NUMBER(9),
    TIPO                    NUMBER(5),
    NOMBRE                  VARCHAR2(200),
    DESCRIPCION             CLOB,
    
    CONSTRAINT PK_TT_ASIENTO_TIPOS PRIMARY KEY (NROASIENTO),
    CONSTRAINT NN_TT_ASIENTOS_TIPOS_NN CHECK (TIPO IS NOT NULL)
);

CREATE TABLE TT_PRECIO(
    CODTEAT                 NUMBER(9),
    FECHA                   DATE,
    TIPO                    NUMBER(5),
    PRECIO                  NUMBER(6,2),

    CONSTRAINT PK_TT_PRECIO PRIMARY KEY (CODTEAT, FECHA, TIPO),
    CONSTRAINT NN_TT_PRECIO_NN CHECK (PRECIO IS NOT NULL),
    CONSTRAINT NN_TT_PRECIO_NN CHECK (PRECIO > 0)
);

CREATE TABLE TT_ENTRADAS(
    CODTEAT                 NUMBER(9),
    FECHA                   DATE,
    NROASIENTO              NUMBER(9),
    NROLINVIT                NUMBER(9),

    CONSTRAINT PK_TT_ENTRADAS PRIMARY KEY (CODTEAT, FECHA, NROASIENTO),
    CONSTRAINT NN_TT_ENTRADAS_NN CHECK (FECHA IS NOT NULL)
);

ALTER TABLE TT_EXHIBE
ADD CONSTRAINT FK_TT_EXHIBE_TEATROS_CT FOREIGN KEY (CODTEAT) REFERENCES TT_TEATROS ON DELETE CASCADE;

ALTER TABLE TT_EXHIBE
ADD CONSTRAINT FK_TT_EXHIBE_TEATROS_CB FOREIGN KEY (CODOBRA) REFERENCES TT_OBRAS ON DELETE CASCADE;

ALTER TABLE TT_ASIENTO_TIPOS
ADD CONSTRAINT FK_TT_ASIENTO_PRECIO FOREIGN KEY (TIPO) REFERENCES TT_TIPOS_ASIENTOS;

ALTER TABLE TT_PRECIO
ADD CONSTRAINT FK_TT_PRECIO_EXHIBE FOREIGN KEY (CODTEAT, FECHA) REFERENCES TT_EXHIBE (CODTEAT, FECHA) ON DELETE SET NULL;

ALTER TABLE TT_PRECIO
ADD CONSTRAINT FK_TT_PRECIO_TIPOS_AS FOREIGN KEY (TIPO) REFERENCES TT_TIPOS_ASIENTOS ON DELETE SET NULL;

ALTER TABLE TT_ENTRADAS
ADD CONSTRAINT FK_TT_ENTRADAS_EXHIBE FOREIGN KEY (CODTEAT, FECHA) REFERENCES TT_EXHIBE (CODTEAT, FECHA);

ALTER TABLE TT_ENTRADAS
ADD CONSTRAINT FK_TT_ENTRADAS_ASIENTO_TIPOS FOREIGN KEY (NROASIENTO) REFERENCES TT_ASIENTO_TIPOS;

ALTER TABLE TT_ENTRADAS
ADD CONSTRAINT FK_TT_ENTRADAS_INVITADOS FOREIGN KEY (NROLINVIT) REFERENCES TT_INVITADOS (NROLINVITADO);

CREATE SEQUENCE CODIGO
START WITH 1
INCREMENT BY 1;

INSERT INTO TT_INVITADOS (NROLINVITADO, NOMBRE, CATEGORIA, ORIGEN)
VALUES (CODIGO.NEXTVAL, 'MANUEL', 'PRENSA', 'ESPA�A');
INSERT INTO TT_INVITADOS (NROLINVITADO, NOMBRE, CATEGORIA, ORIGEN)
VALUES (CODIGO.NEXTVAL, 'CAYETANO', 'AUTORIDADES', 'ESPA�A');
INSERT INTO TT_INVITADOS (NROLINVITADO, NOMBRE, CATEGORIA, ORIGEN)
VALUES (CODIGO.NEXTVAL, 'FERNANDO', 'CRITICA', 'ESPA�A');

INSERT INTO TT_TEATROS (CODTEAT, NOMBRE, DIRECCION, CANTASIENTOS)
VALUES (CODIGO.NEXTVAL, 'BOX CARTUJA', 'CALLE ALBERT EINSTEIN', 2000);
INSERT INTO TT_TEATROS (CODTEAT, NOMBRE, DIRECCION, CANTASIENTOS)
VALUES (CODIGO.NEXTVAL, 'TEATRO DE LA MAESTRANZA', 'Paseo de Crist�bal Col�n, 12, 41001 Sevilla', 4000);
INSERT INTO TT_TEATROS (CODTEAT, NOMBRE, DIRECCION, CANTASIENTOS)
VALUES (CODIGO.NEXTVAL, 'TEATRO DE LOS REMEDIOS', 'CALLE JUAN RAMON JIMENEZ, 22, SEVILLA', 2500);

INSERT INTO TT_OBRAS (CODOBRA, DESCRIPCION, NOMBREOBRA, AUTOR)
VALUES (CODIGO.NEXTVAL, NULL, 'ROMEO Y JULIETA', 'WILLIAM SHAKESPEARE');
INSERT INTO TT_OBRAS (CODOBRA, DESCRIPCION, NOMBREOBRA, AUTOR)
VALUES (CODIGO.NEXTVAL, NULL, 'SUE�O DE UNA NOCHE DE VERANO', 'WILLIAM SHAKESPEARE');
INSERT INTO TT_OBRAS (CODOBRA, DESCRIPCION, NOMBREOBRA, AUTOR)
VALUES (CODIGO.NEXTVAL, NULL, 'LA CASA DE BERNARDA ALBA', 'FEDERICO GARCIA LORCA');

INSERT INTO TT_EXHIBE (CODTEAT, FECHA, CODOBRA)
VALUES (CODIGO.NEXTVAL, TO_DATE('22/01/20', 'DD/MM/YY'), CODIGO.NEXTVAL);
INSERT INTO TT_EXHIBE (CODTEAT, FECHA, CODOBRA)
VALUES (CODIGO.NEXTVAL, TO_DATE('23/01/20', 'DD/MM/YY'), CODIGO.NEXTVAL);
INSERT INTO TT_EXHIBE (CODTEAT, FECHA, CODOBRA)
VALUES (CODIGO.NEXTVAL, TO_DATE('24/01/20', 'DD/MM/YY'), CODIGO.NEXTVAL);

INSERT INTO TT_TIPOS_ASIENTOS (TIPO, NOMBRE, DESCRIPCION)
VALUES ('ORQUESTA', 'TIPO 1', 'ASIENTO DE LA ORQUESTA');
INSERT INTO TT_TIPOS_ASIENTOS (TIPO, NOMBRE, DESCRIPCION)
VALUES ('CAVEA SUPERIOR', 'TIPO 2', 'ASIENTO DE LA CAVEA SUPERIOR');
INSERT INTO TT_TIPOS_ASIENTOS (TIPO, NOMBRE, DESCRIPCION)
VALUES ('LATERAL', 'TIPO 3', 'ASIENTO AL LATERAL DEL TEATRO');

INSERT INTO TT_ASIENTO_TIPOS (NROASIENTO, TIPO)
VALUES (CODIGO.NEXTVAL, 'TIPO 1');
INSERT INTO TT_ASIENTO_TIPOS (NROASIENTO, TIPO)
VALUES (CODIGO.NEXTVAL, 'TIPO 2');
INSERT INTO TT_ASIENTO_TIPOS (NROASIENTO, TIPO)
VALUES (CODIGO.NEXTVAL, 'TIPO 3');

INSERT INTO TT_PRECIO (CODTEAT, FECHA, TIPO, PRECIO)
VALUES (CODIGO.NEXTVAL, TO_DATE('22/01/20', 'DD/MM/YY'), 'TIPO1', 20);
INSERT INTO TT_PRECIO (CODTEAT, FECHA, TIPO, PRECIO)
VALUES (CODIGO.NEXTVAL, TO_DATE('23/01/20', 'DD/MM/YY'), 'TIPO2', 25);
INSERT INTO TT_PRECIO (CODTEAT, FECHA, TIPO, PRECIO)
VALUES (CODIGO.NEXTVAL, TO_DATE('24/01/20', 'DD/MM/YY'), 'TIPO3', 30);

INSERT INTO TT_ENTRADAS (CODTEAT, FECHA, NROASIENTO, NROINVIT)
VALUES (CODIGO.NEXTVAL, TO_DATE('22/01/20', 'DD/MM/YY'), CODIGO.NEXTVAL, CODIGO.NEXTVAL);
INSERT INTO TT_ENTRADAS (CODTEAT, FECHA, NROASIENTO, NROINVIT)
VALUES (CODIGO.NEXTVAL, TO_DATE('23S/01/20', 'DD/MM/YY'), CODIGO.NEXTVAL, CODIGO.NEXTVAL);
INSERT INTO TT_ENTRADAS (CODTEAT, FECHA, NROASIENTO, NROINVIT)
VALUES (CODIGO.NEXTVAL, TO_DATE('24/01/20', 'DD/MM/YY'), CODIGO.NEXTVAL, CODIGO.NEXTVAL);
/*
DROP TABLE TT_INVITADOS;
DROP TABLE TT_TEATROS;
DROP TABLE TT_OBRAS;
DROP TABLE TT_EXHIBE;
DROP TABLE TT_TIPOS_ASIENTOS;
DROP TABLE TT_ASIENTOS_TIPO;
DROP TABLE TT_PRECIO;
DROP TABLE TT_ENTRADAS;
*/
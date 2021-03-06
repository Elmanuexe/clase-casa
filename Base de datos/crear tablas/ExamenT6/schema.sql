/*
 Examen de la unidad didáctica 6
 Bases de datos - 1º Desarrollo de Aplicaciones Multiplataforma
 */

CREATE TABLE TA_VENTA (
    ID_VENTA   NUMBER(10),
    FECHA      DATE,
    EMPLEADO   NUMBER(10),
    CLIENTE    VARCHAR2(10),
    CONSTRAINT PK_TA_VENTA PRIMARY KEY ( ID_VENTA ),
    CONSTRAINT NN_TA_VENTA_FECHA CHECK ( FECHA IS NOT NULL ),
    CONSTRAINT NN_TA_VENTA_EMPLEADO CHECK ( EMPLEADO IS NOT NULL )
);


CREATE TABLE TA_PRODUCTO (
    CUP           NUMBER(10),
    NOMBRE        VARCHAR2(100),
    DESCRIPCION   VARCHAR2(4000),
    PVP           NUMBER(10, 2),
    CATEGORIA     NUMBER(10),
    CONSTRAINT PK_TA_PRODUCTO PRIMARY KEY ( CUP ),
    CONSTRAINT NN_TA_PRODUCTO_NOMBRE CHECK ( NOMBRE IS NOT NULL ),
    CONSTRAINT NN_TA_PRODUCTO_PVP CHECK ( PVP IS NOT NULL )
);

CREATE TABLE TA_CATEGORIA (
    ID_CATEGORIA   NUMBER(10),
    NOMBRE         VARCHAR2(100),
    DESCRIPCION    VARCHAR2(4000),
    CONSTRAINT PK_TA_CATEGORIA PRIMARY KEY ( ID_CATEGORIA ),
    CONSTRAINT NN_TA_CATEGORIA_NOMBRE CHECK ( NOMBRE IS NOT NULL )
);
CREATE TABLE CD_CONSULTAS(
    DNI_PACIENTE                    VARCHAR2(9),
    COD_EMPLEADO                    NUMBER(4),
    COD_ASEGURADORA                 NUMBER(4),
    FECHA_CONSULTA                  DATE,
    COD_SALA                        NUMBER(4),
    PRECIO_CONSULTA                 NUMBER(4),
    COD_TRATAMIENTO                 NUMBER(4),
    DESCUENTO                       NUMBER(2),
    DESCRIPCION                     CLOB,
    
    CONSTRAINT PK_CD_CONSULTAS PRIMARY KEY (DNI_PACIENTE, FECHA_CONSULTA, COD_TRATAMIENTO)
);

CREATE TABLE EQUIPO(
    COD_EMPLEADO                    NUMBER(4),
    NOMBRE                          VARCHAR2(30),
    APELLIDOS                       VARCHAR2(000),
    PUESTO                          VARCHAR2(100),
    ESPECIALIDAD                    VARCHAR2(200),
    SALARIO                         NUMBER(6,2),
    
    CONSTRAINT PK_CD_EQUIPO PRIMARY KEY (COD_EMPLEADO)
);

CREATE TABLE CD_ASEGURADORAS(
    COD_ASEGURADORA                 NUMBER(4),
    CIF                             VARCHAR2(9),
    NOMBRE                          VARCHAR2(50),
    WEB                             VARCHAR2(200),
    EMAIL                           VARCHAR2(300),
    TELEFONO                        VARCHAR2(15),
    DESCUENTO                       NUMBER(2),

    CONSTRAINT PK_CD_ASAEGURADORAS PRIMARY KEY (COD_ASEGURADORA)
);

CREATE TABLE SALAS(
    COD_SALA                        NUMBER(4),
    NOMBRE                          VARCHAR2(50),
    ESPECIALIDAD                    VARCHAR2(200),
    
    CONSTRAINT PK_CD_SALAS PRIMARY KEY (COD_SALA)
);

CREATE TABLE CD_PACIENTES(
    DNI                             VARCHAR2(9),
    NOMBRE                          VARCHAR2(50),
    APELLIDOS                       VARCHAR2(200),
    TELEFONO                        VARCHAR2(15),
    EMAIL                           VARCHAR2(300),
    COD_ASEGURADORA                 NUMBER(4),
    FECHA_NAC                       DATE,
    DIRECCION                       VARCHAR2(300),
    
    CONSTRAINT PK_CD_PACIENTES PRIMARY KEY (DNI)
);

CREATE TABLE CD_SERVICIOS(
    COD_SERVICIO                    NUMBER(4),
    NOMBRE                          VARCHAR2(50),
    DESCRIPCION_TRATAMIENTO         CLOB,
    PRECIO                          NUMBER(6,2),
    
    CONSTRAINT PK_CD_SERVICIOS PRIMARY KEY (COD_SERVICIO)
);

CREATE TABLE CD_MATERIALES(
    COD_MATERIAL                    NUMBER(4),
    NOMBRE                          VARCHAR2(50),
    COD_PROVEEDOR                   NUMBER(4),
    PRECIO                          NUMBER(5,2),
    
    CONSTRAINT PK_CD_MATERIALES PRIMARY KEY (COD_MATERIAL)
);

CREATE TABLE CD_PROVEEDORES(
    COD_PROVEEDOR                   NUMBER(4),
    NOMBRE                          VARCHAR2(100),
    EMAIL                           VARCHAR2(300),
    TELEFONO                        VARCHAR2(15),
    
    CONSTRAINT PK_CD_PROVEEDORES PRIMARY KEY (COD_PROVEEDOR)
);

CREATE TABLE CD_DETALLES_TRATAMIENTOS(
    COD_TRATAMIENTO                 NUMBER(4),
    COD_SERVICIO                    NUMBER(4),
    PRECIO_TRATAMIENTO              NUMBER(6,2),
    
    CONSTRAINT PK_CD_DETALLES_TRATAMIENTOS PRIMARY KEY (COD_TRATAMIENTO, COD_SERVICIO)
);
--DROP TABLE

--DROP TABLE CD_CONSULTAS;
--DROP TABLE CD_TRABAJADORES;
--DROP TABLE CD_SALAS;
--DROP TABLE CD_PACIENTES;
--DROP TABLE CD_DETALLES_TRATAMIENTOS;
--DROP TABLE CD_SERVICIOS;
--DROP TABLE CD_ASEGURADORAS;
--DROP TABLE CD_CLINICAS;

--DROP SEQUENCES
--DROP SEQUENCE SEQ_CD_ASEGURADORAS;
--DROP SEQUENCE SEQ_CD_TRABAJADORES;
--DROP SEQUENCE SEQ_CD_SALAS;
--DROP SEQUENCE SEQ_CD_DETALLES_TRATAMIENTOS;
--DROP SEQUENCE SEQ_CD_SERVICIOS;
--DROP SEQUENCE SEQ_CD_CLINICAS;

--CREATE TABLE

CREATE TABLE CD_CONSULTAS(
	DNI_PACIENTE                	VARCHAR2(9),
	COD_EMPLEADO                	NUMBER(4),
    COD_CLINICA                 	NUMBER(2),
	COD_ASEGURADORA             	NUMBER(4),          /*Por ahora será null, se rellenará cuando el cliente visite la clínica*/
	FECHA_CONSULTA              	DATE,
	COD_SALA                    	NUMBER(4),
	PRECIO_CONSULTA             	NUMBER(4),
	COD_TRATAMIENTO             	NUMBER(4),      /*Un cliente puede tener el mismo cod_tratamiento en varias consultas, será porque el servicio necesita más de una consulta*/
	COD_SERVICIO			        NUMBER(4),
	DESCUENTO                   	NUMBER(4,2),    /*Generalmente se le aplicara un 5% cuando sea la 3 visita*/
	DESCRIPCION                 	CLOB,           /*Estará en null hasta llegue la cita y entonces el especialista rellenará lo que se le ha hecho al cliente*/
    
	CONSTRAINT PK_CD_CONSULTAS PRIMARY KEY (DNI_PACIENTE, FECHA_CONSULTA, COD_TRATAMIENTO),
	CONSTRAINT NN_CD_CONSULTAS_COD_EMPLEADO CHECK (COD_EMPLEADO IS NOT NULL),
	CONSTRAINT NN_CD_CONSULTAS_COD_SALA CHECK (COD_SALA IS NOT NULL),
	CONSTRAINT NN_CD_CONSULTAS_COD_CLINICA CHECK (COD_CLINICA IS NOT NULL),
	CONSTRAINT CK_CD_CONSULTAS_COD_SALA CHECK (COD_SALA > 0),
	CONSTRAINT CK_CD_CONSULTAS_PRECIO_CONSUL CHECK (PRECIO_CONSULTA > 0),
	CONSTRAINT CK_CD_CONSULTAS_COD_TRATA CHECK (COD_TRATAMIENTO > 0),
	CONSTRAINT CK_CD_CONSULTAS_DESCUENTO CHECK (DESCUENTO > 0),
	CONSTRAINT CK_CD_CONSULTAS_COD_CLINICA CHECK (COD_CLINICA > 0)
);


CREATE TABLE CD_TRABAJADORES(
	COD_EMPLEADO                	NUMBER(4),
	NOMBRE                      	VARCHAR2(30),
	APELLIDOS                   	VARCHAR2(200),
	PUESTO                      	VARCHAR2(200),
	SALARIO                     	NUMBER(7,2),
    FECHA_ALTA                      DATE,
	COD_CLINICA                 	NUMBER(2),
    
	CONSTRAINT PK_CD_TRABAJADORES PRIMARY KEY (COD_EMPLEADO),
	CONSTRAINT NN_CD_TRABAJADORES_NOMBRE CHECK (NOMBRE IS NOT NULL),
	CONSTRAINT NN_CD_TRABAJADORES_APELLIDOS CHECK (APELLIDOS IS NOT NULL),
	CONSTRAINT NN_CD_TRABAJADORES_PUESTO CHECK (PUESTO IS NOT NULL),
	CONSTRAINT NN_CD_TRABAJADORES_SALARIO CHECK (SALARIO IS NOT NULL),
	CONSTRAINT NN_CD_TRABAJADORES_COD_CLINICA CHECK (COD_CLINICA IS NOT NULL),
	CONSTRAINT CK_CD_TRABAJADORES_SALARIO CHECK (SALARIO > 0),
	CONSTRAINT CK_CD_TRABAJADORES_COD_CLINICA CHECK (COD_CLINICA > 0)
);


CREATE TABLE CD_ASEGURADORAS(
	COD_ASEGURADORA             	NUMBER(4),
	CIF                         	VARCHAR2(9),
	NOMBRE                      	VARCHAR2(50),
	WEB                         	VARCHAR2(200),
	EMAIL                       	VARCHAR2(300),
	TELEFONO                    	VARCHAR2(15),
	DESCUENTO                   	NUMBER(4,2),

	CONSTRAINT PK_CD_ASEGURADORAS PRIMARY KEY (COD_ASEGURADORA),
	CONSTRAINT NN_CD_ASEGURADORAS_CIF CHECK (CIF IS NOT NULL),
	CONSTRAINT NN_CD_ASEGURADORAS_NOMBRE CHECK (NOMBRE IS NOT NULL),
	CONSTRAINT NN_CD_ASEGURADORAS_TELEFONO CHECK (TELEFONO IS NOT NULL),
	CONSTRAINT CK_CD_ASEGURADORAS_DESCUENTO CHECK (DESCUENTO > 0)
);

CREATE TABLE CD_SALAS(
	COD_SALA                    	NUMBER(4),
	NOMBRE                      	VARCHAR2(100),
	COD_CLINICA                 	NUMBER(2),
    
	CONSTRAINT PK_CD_SALAS PRIMARY KEY (COD_SALA),
	CONSTRAINT NN_CD_SALAS CHECK (NOMBRE IS NOT NULL),
	CONSTRAINT NN_CD_SALAS_COD_CLINICA CHECK (COD_CLINICA IS NOT NULL),
	CONSTRAINT CK_CD_SALAS_COD_CLINICA CHECK (COD_CLINICA > 0)
);


CREATE TABLE CD_PACIENTES(
	DNI                         	VARCHAR2(9),
	NOMBRE                      	VARCHAR2(50),
	APELLIDOS                   	VARCHAR2(200),
	DIRECCION                   	VARCHAR2(300),
	TELEFONO                    	VARCHAR2(15),
	EMAIL                       	VARCHAR2(320),
	COD_ASEGURADORA             	NUMBER(4),
	FECHA_NAC                   	DATE,
	COD_CLINICA                 	NUMBER(2),
    
	CONSTRAINT PK_CD_PACIENTES PRIMARY KEY (DNI),
	CONSTRAINT NN_CD_PACIENTES_NOMBRE CHECK (NOMBRE IS NOT NULL),
	CONSTRAINT NN_CD_PACIENTES_APELLIDOS CHECK (APELLIDOS IS NOT NULL),
	CONSTRAINT NN_CD_PACIENTES_TELEFONO CHECK (TELEFONO IS NOT NULL),
	CONSTRAINT NN_CD_PACIENTES_FECHA_NAC CHECK (FECHA_NAC IS NOT NULL),
	CONSTRAINT NN_CD_PACIENTES_COD_CLINIC CHECK (COD_CLINICA IS NOT NULL),
	CONSTRAINT CK_CD_PACIENTES_COD_ASEGURA CHECK (COD_ASEGURADORA > 0),
	CONSTRAINT CK_CD_PACIENTES_COD_CLINIC CHECK (COD_CLINICA > 0)
);


CREATE TABLE CD_SERVICIOS(
	COD_SERVICIO                	NUMBER(4),
	NOMBRE                      	VARCHAR2(50),
	DESCRIPCION_SERVICIO     	    CLOB,
	PRECIO                      	NUMBER(6,2),
    
	CONSTRAINT PK_CD_SERVICIOS PRIMARY KEY (COD_SERVICIO),
	CONSTRAINT NN_CD_SERVICIOS_NOMBRE CHECK (NOMBRE IS NOT NULL),
	CONSTRAINT NN_CD_SERVICIOS_DESC_SERV CHECK (DESCRIPCION_SERVICIO IS NOT NULL),
	CONSTRAINT NN_CD_SERVICIOS_PRECIO CHECK (PRECIO IS NOT NULL),
	CONSTRAINT CK_CD_SERVICIOS_PRECIO CHECK (PRECIO > 0)
);



CREATE TABLE CD_DETALLES_TRATAMIENTOS(
	COD_TRATAMIENTO             	NUMBER(4),
	COD_SERVICIO                	NUMBER(4),
    
	CONSTRAINT PK_CD_DETALLES_TRATAMIENTOS PRIMARY KEY (COD_TRATAMIENTO, COD_SERVICIO)
);



CREATE TABLE CD_CLINICAS(
	COD_CLINICA                 	NUMBER(2),
	NOMBRE                      	VARCHAR2(100),
	DIRECCION                   	VARCHAR2(300),
	TELEFONO                    	VARCHAR2(15),
	COORDENADAS                 	VARCHAR2(30),
    
	CONSTRAINT PK_CD_CLINICAS PRIMARY KEY (COD_CLINICA),
	CONSTRAINT NN_CD_CLINICAS CHECK (NOMBRE IS NOT NULL),
	CONSTRAINT NN_CD_CLINICAS_DIRECCION CHECK (DIRECCION IS NOT NULL),
	CONSTRAINT NN_CD_CLINICAS_TELEFONO CHECK (TELEFONO IS NOT NULL)
);




--CLAVES EXTERNAS

ALTER TABLE CD_CONSULTAS
ADD CONSTRAINT FK_CD_CONSULTAS_CD_ASEG
FOREIGN KEY (COD_ASEGURADORA)
REFERENCES CD_ASEGURADORAS(COD_ASEGURADORA) ON DELETE SET NULL;

ALTER TABLE CD_PACIENTES
ADD CONSTRAINT FK_CD_PACIENTES_CD_ASEG
FOREIGN KEY (COD_ASEGURADORA)
REFERENCES CD_ASEGURADORAS (COD_ASEGURADORA) ON DELETE SET NULL;

ALTER TABLE CD_CONSULTAS
ADD CONSTRAINT FK_CD_CONSULTAS_CD_TRAB
FOREIGN KEY (COD_EMPLEADO)
REFERENCES CD_TRABAJADORES (COD_EMPLEADO);

ALTER TABLE CD_CONSULTAS
ADD CONSTRAINT FK_CD_CONSULT_CD_DET_TRAT
FOREIGN KEY (COD_TRATAMIENTO,COD_SERVICIO)
REFERENCES CD_DETALLES_TRATAMIENTOS (COD_TRATAMIENTO,COD_SERVICIO);

ALTER TABLE CD_CONSULTAS
ADD CONSTRAINT FK_CD_CONSULTAS_CD_PACIENTES
FOREIGN KEY (DNI_PACIENTE)
REFERENCES CD_PACIENTES (DNI);

ALTER TABLE CD_CONSULTAS
ADD CONSTRAINT FK_CD_CONSULTAS_CD_SALAS
FOREIGN KEY (COD_SALA)
REFERENCES CD_SALAS (COD_SALA) ON DELETE SET NULL;

ALTER TABLE CD_DETALLES_TRATAMIENTOS
ADD CONSTRAINT FK_CD_DET_TRAT_CD_SERV
FOREIGN KEY (COD_SERVICIO)
REFERENCES CD_SERVICIOS(COD_SERVICIO);

ALTER TABLE CD_PACIENTES
ADD CONSTRAINT FK_CD_PACIENTES_CD_CLINICAS
FOREIGN KEY (COD_CLINICA)
REFERENCES CD_CLINICAS(COD_CLINICA) ON DELETE SET NULL;

ALTER TABLE CD_TRABAJADORES
ADD CONSTRAINT FK_CD_TRABAJADORES_CD_CLINICAS
FOREIGN KEY (COD_CLINICA)
REFERENCES CD_CLINICAS(COD_CLINICA) ON DELETE SET NULL;

ALTER TABLE CD_CONSULTAS
ADD CONSTRAINT FK_CD_CONSULTAS_CD_CLINICAS
FOREIGN KEY (COD_CLINICA)
REFERENCES CD_CLINICAS(COD_CLINICA) ON DELETE SET NULL;

ALTER TABLE CD_SALAS
ADD CONSTRAINT FK_CD_SALAS_CD_CLINICAS
FOREIGN KEY (COD_CLINICA)
REFERENCES CD_CLINICAS(COD_CLINICA);



--SECUENCIAS

CREATE SEQUENCE SEQ_CD_ASEGURADORAS
START WITH 1
INCREMENT  BY 1;

CREATE SEQUENCE SEQ_CD_TRABAJADORES
START WITH 1
INCREMENT  BY 1;

CREATE SEQUENCE SEQ_CD_SALAS
START WITH 1
INCREMENT  BY 1;

CREATE SEQUENCE SEQ_CD_DETALLES_TRATAMIENTOS
START WITH 1501                     /*Comienza en 1501 porque los números anteriores son de las citas que ya se han dado*/
INCREMENT  BY 1;

CREATE SEQUENCE SEQ_CD_SERVICIOS
START WITH 1
INCREMENT  BY 1;

CREATE SEQUENCE SEQ_CD_CLINICAS
START WITH 1
INCREMENT  BY 1;



--INSERT INTO

	--CLINICAS
--Clínica 1
INSERT INTO CD_CLINICAS
VALUES(SEQ_CD_CLINICAS.NEXTVAL,'Damtix Nervión','Calle Luis de Morales 32, Sevilla','954365258','37.383365,-5.9757744,17');
--Clínica 2
INSERT INTO CD_CLINICAS
VALUES(SEQ_CD_CLINICAS.NEXTVAL,'Damtix Triana','Calle San Jacinto 23, Sevilla','954789635','37.3843181,-6.0065327,17');
--Clínica3
INSERT INTO CD_CLINICAS
VALUES(SEQ_CD_CLINICAS.NEXTVAL,'Damtix Sevilla','Calle Sierpes 10, Sevilla','954122896','37.3921031,-5.9971017,17');

	--ASEGURADORAS
INSERT INTO CD_ASEGURADORAS 
VALUES (SEQ_CD_ASEGURADORAS.NEXTVAL,'A28037042','Sanitas Sociedad Anónima de Seguros','www.sanitas-salud.com','atencioncliente@sanitas.com','902102400',10.00);

INSERT INTO CD_ASEGURADORAS  
VALUES (SEQ_CD_ASEGURADORAS.NEXTVAL,'A99007205','DKV Servicios Sociedad Anónima','www.dkvseguros.com','atencioncliente@dkv.com','976289100',15.00);

INSERT INTO CD_ASEGURADORAS  
VALUES (SEQ_CD_ASEGURADORAS.NEXTVAL,'A79347266','Adeslas Dental Sociedad Anónima','www.seguros.adeslas.es','atencioncliente@adeslas.com','916593088',12.00);

INSERT INTO CD_ASEGURADORAS  
VALUES (SEQ_CD_ASEGURADORAS.NEXTVAL,'A85403814','Asisa Dental SA','www.asisa.es','atencioncliente@asisa.es','915489219',10.00);

INSERT INTO CD_ASEGURADORAS  
VALUES (SEQ_CD_ASEGURADORAS.NEXTVAL,'A08055741','Mapfre SA','www.mapfre.es','atencioncliente@mapfre.es','918669530',20.00);

    --SALAS

INSERT INTO CD_SALAS
VALUES (SEQ_CD_SALAS.NEXTVAL,'Sala de recepción',1);

INSERT INTO CD_SALAS
VALUES (SEQ_CD_SALAS.NEXTVAL,'Sala de despachos y administrativa',1);

INSERT INTO CD_SALAS
VALUES (SEQ_CD_SALAS.NEXTVAL,'Sala de tratamiento 1',1);

INSERT INTO CD_SALAS
VALUES (SEQ_CD_SALAS.NEXTVAL,'Sala de tratamiento 2',1);

INSERT INTO CD_SALAS
VALUES (SEQ_CD_SALAS.NEXTVAL,'Sala de tratamiento 3',1);

INSERT INTO CD_SALAS
VALUES (SEQ_CD_SALAS.NEXTVAL,'Sala de rayos X',1);

INSERT INTO CD_SALAS
VALUES (SEQ_CD_SALAS.NEXTVAL,'Sala de quirófano',1);

INSERT INTO CD_SALAS
VALUES (SEQ_CD_SALAS.NEXTVAL,'Sala de recepción',2);

INSERT INTO CD_SALAS
VALUES (SEQ_CD_SALAS.NEXTVAL,'Sala de despachos y administrativa',2);

INSERT INTO CD_SALAS
VALUES (SEQ_CD_SALAS.NEXTVAL,'Sala de tratamiento 1',2);

INSERT INTO CD_SALAS
VALUES (SEQ_CD_SALAS.NEXTVAL,'Sala de tratamiento 2',2);

INSERT INTO CD_SALAS
VALUES (SEQ_CD_SALAS.NEXTVAL,'Sala de tratamiento 3',2);

INSERT INTO CD_SALAS
VALUES (SEQ_CD_SALAS.NEXTVAL,'Sala de rayos X',2);

INSERT INTO CD_SALAS
VALUES (SEQ_CD_SALAS.NEXTVAL,'Sala de quirófano',2);

INSERT INTO CD_SALAS
VALUES (SEQ_CD_SALAS.NEXTVAL,'Sala de recepción',3);

INSERT INTO CD_SALAS
VALUES (SEQ_CD_SALAS.NEXTVAL,'Sala de despachos y administrativa',3);

INSERT INTO CD_SALAS
VALUES (SEQ_CD_SALAS.NEXTVAL,'Sala de tratamiento 1',3);

INSERT INTO CD_SALAS
VALUES (SEQ_CD_SALAS.NEXTVAL,'Sala de tratamiento 2',3);

INSERT INTO CD_SALAS
VALUES (SEQ_CD_SALAS.NEXTVAL,'Sala de tratamiento 3',3);

INSERT INTO CD_SALAS
VALUES (SEQ_CD_SALAS.NEXTVAL,'Sala de rayos X',3);

INSERT INTO CD_SALAS
VALUES (SEQ_CD_SALAS.NEXTVAL,'Sala de quirófano',3);


    --TRABAJADORES

INSERT INTO CD_TRABAJADORES  
VALUES (SEQ_CD_TRABAJADORES.NEXTVAL, 'Luis', 'Mateo Marte', 'Director', 19660.54,TO_DATE('10/03/2017','DD/MM/YYYY'),1);

INSERT INTO CD_TRABAJADORES
VALUES (SEQ_CD_TRABAJADORES.NEXTVAL, 'Maria', 'Angelina Venegas', 'Directora', 19454.08,TO_DATE('20/05/2018','DD/MM/YYYY'),2);

INSERT INTO CD_TRABAJADORES
VALUES(SEQ_CD_TRABAJADORES.NEXTVAL,'Rocio','Castelló Zapata','Directora',18520.00,TO_DATE('28/02/2019','DD/MM/YYYY'),3);

INSERT INTO CD_TRABAJADORES
VALUES (SEQ_CD_TRABAJADORES.NEXTVAL, 'Diego ', 'Raul Cerezuela', 'Odontólogo', 19241.99,TO_DATE('12/03/2017','DD/MM/YYYY'),1);

INSERT INTO CD_TRABAJADORES
VALUES (SEQ_CD_TRABAJADORES.NEXTVAL, 'Manuela', 'Castro Fernández', 'Odontóloga', 19241.99,TO_DATE('12/06/2017','DD/MM/YYYY'),1);

INSERT INTO CD_TRABAJADORES
VALUES (SEQ_CD_TRABAJADORES.NEXTVAL, 'Joaquin', 'Santiago Llobell', 'Odontólogo', 18670.01,TO_DATE('28/05/2018','DD/MM/YYYY'),2);

INSERT INTO CD_TRABAJADORES
VALUES (SEQ_CD_TRABAJADORES.NEXTVAL, 'Lucia', 'Carmena Pozos', 'Odontóloga', 18710.91,TO_DATE('15/01/2019','DD/MM/YYYY'),2);

INSERT INTO CD_TRABAJADORES  
VALUES (SEQ_CD_TRABAJADORES.NEXTVAL, 'Austin', 'Bernal Fernández', 'Odontólogo',  17337.52,TO_DATE('22/02/2019','DD/MM/YYYY'),3);

INSERT INTO CD_TRABAJADORES
VALUES (SEQ_CD_TRABAJADORES.NEXTVAL, 'Paloma', 'Rivera Campos', 'Odontólogo', 17169.08,TO_DATE('15/03/2019','DD/MM/YYYY'),3);

INSERT INTO CD_TRABAJADORES
VALUES (SEQ_CD_TRABAJADORES.NEXTVAL, 'Manuel', 'Gustavo Morales', 'Maxilofacial', 18986.81,TO_DATE('15/03/2017','DD/MM/YYYY'),1);

INSERT INTO CD_TRABAJADORES  
VALUES (SEQ_CD_TRABAJADORES.NEXTVAL, 'Angela', 'Bernal Olmos', 'Maxilofacial', 18146.43,TO_DATE('30/05/2018','DD/MM/YYYY'),2);

INSERT INTO CD_TRABAJADORES
VALUES (SEQ_CD_TRABAJADORES.NEXTVAL, 'Julio', 'Jorquera Diaz', 'Maxilofacial', 17427.69,TO_DATE('15/03/2019','DD/MM/YYYY'),3);

INSERT INTO CD_TRABAJADORES
VALUES (SEQ_CD_TRABAJADORES.NEXTVAL, 'Lidia', 'Viqueira Salido', 'Higienista Dental', 15327.49,TO_DATE('17/03/2017','DD/MM/YYYY'),1);

INSERT INTO CD_TRABAJADORES
VALUES (SEQ_CD_TRABAJADORES.NEXTVAL, 'Isabel', 'Clemente Bilbao', 'Higienista Dental', 14450.94,TO_DATE('10/04/2017','DD/MM/YYYY'),1);

INSERT INTO CD_TRABAJADORES
VALUES (SEQ_CD_TRABAJADORES.NEXTVAL, 'Ana', 'Olmos Barrera', 'Higienista Dental', 14672.92,TO_DATE('30/05/2018','DD/MM/YYYY'),2);

INSERT INTO CD_TRABAJADORES
VALUES (SEQ_CD_TRABAJADORES.NEXTVAL, 'Eduardo', 'Fabregas de las Casas', 'Higienista Dental', 14886.80,TO_DATE('18/06/2018','DD/MM/YYYY'),2);

INSERT INTO CD_TRABAJADORES
VALUES (SEQ_CD_TRABAJADORES.NEXTVAL, 'Rodrigo','Bernal Gutierrez','Higienista Dental', 14100.92,TO_DATE('21/03/2019','DD/MM/YYYY'),3);

INSERT INTO CD_TRABAJADORES
VALUES (SEQ_CD_TRABAJADORES.NEXTVAL, 'Beatriz', 'Aguirre Gomez', 'Higienista Dental', 14023.43,TO_DATE('04/10/2019','DD/MM/YYYY'),3);


    --SERVICIOS
INSERT INTO CD_SERVICIOS
VALUES (SEQ_CD_SERVICIOS.NEXTVAL, 'Implantología','Un implante dental es el sustituto artificial de un diente o una muela. Tanto la raíz como el diente son sustituidos por piezas fabricadas para lograr un resultado final idéntico al de los naturales, tanto en aspecto como en resistencia. Los implantes dentales se introducen en los huesos de la mandíbula mediante una cirugía sencilla. Al cabo de unos meses se integran en dichas estructuras en un proceso natural conocido como osteointegración. Una vez finalizado este proceso, se recubre con la prótesis definitiva, llamada corona. Entre el implante y la corona, se coloca una pieza intermedia que se llama pilar, que actúa como soporte del nuevo diente. Los implantes dentales están fabricados en titanio biocompatible de máxima calidad.', 1800.0);

INSERT INTO CD_SERVICIOS
VALUES (SEQ_CD_SERVICIOS.NEXTVAL,'Prótesis Dental', 'Una prótesis dental es un elemento artificial destinado a restaurar la anatomía de una o varias piezas dentales perdidas, así como recuperar la altura ideal entre el maxilar superior y la mandíbula. El principal objetivo de las prótesis dentales es devolver la funcionalidad de la boca: Masticación, Deglución, Fonética, Estética', 4500.0);

INSERT INTO CD_SERVICIOS
VALUES (SEQ_CD_SERVICIOS.NEXTVAL,'Ortodoncia','Existen diversos tipos de tratamientos de ortodoncia, según el problema a corregir y la edad del paciente. El tratamiento preventivo tiene como objetivo la eliminación de hábitos en los niños con dentición temporal. El tratamiento interceptivo ayuda a facilitar la erupción de los dientes permanentes y ayuda a mejorar el tamaño y la posición de los huesos maxilares en pacientes en edad de crecimiento. El tratamiento correctivo está indicado en pacientes con dentición permanente completa. De éstos últimos, el más común es la ortodoncia fija que consiste en brackets que se colocan en los dientes unidos entre sí por unos arcos de metal. El ortodoncista periódicamente ajusta estos arcos de forma que ejerzan la tensión necesaria para colocar los dientes  en el lugar que le corresponden.', 2000.0);

INSERT INTO CD_SERVICIOS
VALUES (SEQ_CD_SERVICIOS.NEXTVAL,'Estética Dental','Aclara tus dientes de forma segura y eficaz. Corrige pequeños defectos de la superficie del diente. Luce una sonrisa espectacular gracias a las carillas dentales. Estas finas láminas de porcelana nos permiten corregir la forma y color de los dientes.', 650.0);

INSERT INTO CD_SERVICIOS
VALUES (SEQ_CD_SERVICIOS.NEXTVAL,'Limpieza Dental','La limpieza dental avanzada es el modo más certero de prevenir la aparición de diferentes patologías orales tales como la caries o las enfermedades periodontales. Gracias al polvo de bicarbonato perlado aplicado mediante el dispositivo más moderno del sector para la realización de limpiezas orales profesionales, la limpieza dental avanzada se convierte en la más eficaz del mercado.', 50.0);

INSERT INTO CD_SERVICIOS
VALUES (SEQ_CD_SERVICIOS.NEXTVAL,'Periodoncia','La periodoncia es el campo de la odontología que se encarga de dar tratamiento y solución a las llamadas enfermedades periodontales como la periodontitis y la gingivitis. Estas patologías afectan a más de la mitad de la población mayor de 35 años y es la principal causa de pérdida dental en adultos.', 700.0);

INSERT INTO CD_SERVICIOS
VALUES (SEQ_CD_SERVICIOS.NEXTVAL,'Endodoncia','Una endodoncia es lo que popularmente se conoce como “matar el nervio”, y se refiere al tratamiento de conductos del diente. A través de este tratamiento, el odontólogo elimina, de forma total o parcial, la pulpa del diente para posteriormente proceder a su sellado. La endodoncia se suele realizar cuando la caries ha alcanzado la pulpa causando su infección, pero esta no es la única causa. Otras causas que pueden generar una pulpitis y necesitar por tanto un tratamiento de endodoncia son: Fracturas o traumatismos dentales o desgaste dental provocado, entre otros, por hábitos como el bruxismo.', 230.0);

INSERT INTO CD_SERVICIOS
VALUES (SEQ_CD_SERVICIOS.NEXTVAL,'Empaste','Dicho procedimiento consiste en eliminar la caries de una pieza dental para que esta enfermedad no avance y afecte al nervio del diente, lo que resultaría en tener que realizar una endodoncia o tratamiento de conductos.', 50.0);



    --CLIENTES



INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('52518321Y', 'Francisco', 'Delgado Gómez', 'Av del Doctor Fedriani 61, Sevilla', '753264981', 'delgadogomez@gmail.com', TO_DATE('18/01/1967','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('54784175S', 'Francisco Javier', 'Rodríguez Sánchez', 'C/ Albareda 100, Sevilla', '636320590', 'rodriguezsanchez@gmail.com', TO_DATE('03/05/1945','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('52452302C', 'Ana', 'Gómez Jiménez', 'C/ San Bernardo 25, Sevilla', '675702947', 'gomezjimenez@gmail.com', TO_DATE('25/09/2002','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('16276249T', 'Josefa', 'Martin Ortiz', 'Av de la Borbolla 98, Sevilla', '710398934', 'martinortiz@gmail.com', TO_DATE('15/10/2018','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('40706432C', 'Daniel', 'Ortega Díaz', 'C/ Virgen de Montserrat 22, Sevilla', '688229878', 'ortegadiaz@gmail.com', TO_DATE('23/07/1971','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('44844552A', 'María Pilar', 'Díaz Castro', 'C/ Juan Ramón Jiménez 100, Sevilla', '608350508', 'diazcastro@gmail.com', TO_DATE('18/10/1974','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('56807924V', 'Javier', 'Núñez Ortiz', 'Av de Ramón y Cajal 31, Sevilla', '731628380', 'nunezortiz@gmail.com', TO_DATE('25/05/1966','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('87935242D', 'David', 'Moreno Gutiérrez', 'Av de Grecia 42, Sevilla', '630162125', 'morenogutierrez@gmail.com', TO_DATE('27/07/1973','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('34740335P', 'Ana', 'Núñez Ortiz', 'C/ María Auxiliadora 95, Sevilla', '660258208', 'nunezortiz@gmail.com', TO_DATE('25/06/1989','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('93612234A', 'Juan', 'Rubio Ortega', 'C/ Juan Antonio Cavestany 98, Sevilla', '640182542', 'rubioortega@gmail.com', TO_DATE('07/01/1959','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('56142162J', 'Daniel', 'Delgado Alonso', 'C/ Avicena 86, Sevilla', '678121460', 'delgadoalonso@gmail.com', TO_DATE('25/10/1994','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('16886162E', 'Jesús', 'Martínez Díaz', 'Av de la Constitución 6, Sevilla', '616810942', 'martinezdiaz@gmail.com', TO_DATE('01/05/2015','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('85068306T', 'Carlos', 'Torres Torres', 'Av del Doctor Fedriani 89, Sevilla', '617326335', 'torrestorres@gmail.com', TO_DATE('19/11/1958','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('13754085Q', 'María', 'Fernández Ruiz', 'Av del Alcalde Juan Fernández 16, Sevilla', '715680569', 'fernandezruiz@gmail.com', TO_DATE('04/03/1992','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('98896379J', 'María Teresa', 'Gómez Castro', 'C/ Alfonso XII 25, Sevilla', '614236646', 'gomezcastro@gmail.com', TO_DATE('21/10/1969','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('24946334M', 'María', 'Díaz Sánchez', 'C/ Luis Montoto 8, Sevilla', '746089230', 'diazsanchez@gmail.com', TO_DATE('20/05/2016','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('13721007N', 'José Luis', 'Castro Gutiérrez', 'C/ C/ Amador de Los Ríos 75, Sevilla', '670335390', 'castrogutierrez@gmail.com', TO_DATE('03/09/1953','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('17824281V', 'Alejandro', 'Suarez Alonso', 'C/ Condes de Bustillo 81, Sevilla', '611877827', 'suarezalonso@gmail.com', TO_DATE('22/02/1951','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('32862987N', 'María', 'Ortiz Molina', 'C/ Isaac Newton 51, Sevilla', '619943966', 'ortizmolina@gmail.com', TO_DATE('23/03/1957','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('13542937P', 'Josefa', 'Ramírez Castro', 'C/ Juan Ramón Jiménez 77, Sevilla', '720246692', 'ramirezcastro@gmail.com', TO_DATE('02/11/2013','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('38606397T', 'Antonio', 'García Castro', 'C/ María Auxiliadora 72, Sevilla', '695839577', 'garciacastro@gmail.com', TO_DATE('21/03/1988','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('22258506A', 'Ana', 'Ortega Martin', 'Av Flota de Indias 79, Sevilla', '649274123', 'ortegamartin@gmail.com', TO_DATE('15/07/1963','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('27906189J', 'María', 'Martin Muñoz', 'Av de Eduardo Dato 43, Sevilla', '711856023', 'martinmunoz@gmail.com', TO_DATE('12/01/2011','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('44106587Q', 'Francisco Javier', 'Navarro Blanco', 'C/ Condes de Bustillo 44, Sevilla', '674214465', 'navarroblanco@gmail.com', TO_DATE('05/06/1953','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('25436441M', 'María Dolores', 'Serrano Vázquez', 'Av de Kansas City 21, Sevilla', '716304697', 'serranovazquez@gmail.com', TO_DATE('26/05/1956','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('23321587R', 'José Antonio', 'Pérez Martínez', 'C/ San Bernardo 15, Sevilla', '702370221', 'perezmartinez@gmail.com', TO_DATE('17/09/1948','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('67659103A', 'Javier', 'Fernández Núñez', 'C/ Juan Ramón Jiménez 23, Sevilla', '628898478', 'fernandeznunez@gmail.com', TO_DATE('27/12/1948','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('13727808M', 'Antonio', 'Rubio Castro', 'C/ Virgen de Montserrat 88, Sevilla', '662621711', 'rubiocastro@gmail.com', TO_DATE('17/06/1976','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('96792040J', 'María Pilar', 'Serrano Torres', 'C/ Juan Ramón Jiménez 55, Sevilla', '733135520', 'serranotorres@gmail.com', TO_DATE('16/10/1964','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('24218815E', 'Josefa', 'Torres Sanz', 'C/ San Juan Bosco 31, Sevilla', '712545136', 'torressanz@gmail.com', TO_DATE('15/06/1980','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('79951496T', 'María Pilar', 'Gutiérrez Blanco', 'Av de la Buhaira 39, Sevilla', '708658474', 'gutierrezblanco@gmail.com', TO_DATE('27/03/2016','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('88332167T', 'Daniel', 'Núñez Ortiz', 'C/ Betis 10, Sevilla', '631097175', 'nunezortiz@gmail.com', TO_DATE('11/08/1989','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('36709159D', 'Ana', 'Pérez Delgado', 'C/ Arroyo 37, Sevilla', '699048116', 'perezdelgado@gmail.com', TO_DATE('08/12/1975','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('38157971M', 'Jose', 'Ortega Núñez', 'C/ Arroyo 70, Sevilla', '725853257', 'orteganunez@gmail.com', TO_DATE('27/02/2015','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('74291759B', 'Miguel', 'Blanco Álvarez', 'Av Flota de Indias 76, Sevilla', '605758890', 'blancoalvarez@gmail.com', TO_DATE('19/06/1969','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('13013671H', 'María Pilar', 'Pérez Rubio', 'Av Ciudad de Chiva 86, Sevilla', '740235393', 'perezrubio@gmail.com', TO_DATE('21/10/2003','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('11429720P', 'José Antonio', 'Moreno Ramos', 'Alcalde Juan Fernández 87, Sevilla', '726956756', 'morenoramos@gmail.com', TO_DATE('06/06/2003','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('31045496G', 'María Pilar', 'Torres Ramírez', 'C/ C/ Amador de Los Ríos 4, Sevilla', '740645472', 'torresramirez@gmail.com', TO_DATE('17/11/1985','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('30123660P', 'Javier', 'Ramírez Marín', 'Av Ciudad de Chiva 94, Sevilla', '738757108', 'ramirezmarin@gmail.com', TO_DATE('11/08/1996','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('72025971E', 'Javier', 'Ortiz Ortiz', 'C/ Marqués De Paradas 20, Sevilla', '740235222', 'ortizortiz@gmail.com', TO_DATE('19/09/1980','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('28494762Q', 'María', 'Martínez Domínguez', 'Av Flota de Indias 88, Sevilla', '656912720', 'martinezdominguez@gmail.com', TO_DATE('19/06/2015','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('32767206A', 'Jose', 'Fernández Ramírez', 'C/ C/ Amador de Los Ríos 35, Sevilla', '691406693', 'fernandezramirez@gmail.com', TO_DATE('28/10/2004','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('22158605Z', 'Josefa', 'Delgado Ortiz', 'C/ Isaac Newton 3, Sevilla', '624133370', 'delgadoortiz@gmail.com', TO_DATE('24/11/1991','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('44350129B', 'María Dolores', 'Hernández Pérez', 'C/ Isaac Newton 24, Sevilla', '610959145', 'hernandezperez@gmail.com', TO_DATE('27/02/2009','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('96181868P', 'Francisco', 'Sánchez Ruiz', 'Av de Eduardo Dato 26, Sevilla', '641648878', 'sanchezruiz@gmail.com', TO_DATE('15/10/2014','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('63774921S', 'Laura', 'Sánchez Ramírez', 'Alameda de Hércules 74, Sevilla', '723383653', 'sanchezramirez@gmail.com', TO_DATE('16/07/2005','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('99507686A', 'Francisco Javier', 'Gil Domínguez', 'C/ C/ Amador de Los Ríos 51, Sevilla', '608720703', 'gildominguez@gmail.com', TO_DATE('21/01/1962','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('94235824V', 'Carmen', 'Castro Hernández', 'C/ Betis 81, Sevilla', '694976327', 'castrohernandez@gmail.com', TO_DATE('12/09/1946','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('22146257V', 'María Carmen', 'Fernández Molina', 'C/ Juan Antonio Cavestany 24, Sevilla', '675668583', 'fernandezmolina@gmail.com', TO_DATE('18/06/1965','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('99674024M', 'Miguel', 'Pérez Ramírez', 'C/ Niebla 11, Sevilla', '747713734', 'perezramirez@gmail.com', TO_DATE('03/02/2007','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('61273942X', 'Manuel', 'Martin Sánchez', 'C/ Blanco White 58, Sevilla', '621947209', 'martinsanchez@gmail.com', TO_DATE('05/10/1981','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('33873638C', 'Cristina', 'Ortiz Ramos', 'Av del Doctor Fedriani 39, Sevilla', '729295265', 'ortizramos@gmail.com', TO_DATE('21/01/2011','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('43752723F', 'Ana María', 'López Sanz', 'C/ Avicena 41, Sevilla', '690382571', 'lopezsanz@gmail.com', TO_DATE('26/11/1952','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('65082071Y', 'Laura', 'Hernández Ramírez', 'Alcalde Juan Fernández 39, Sevilla', '687931449', 'hernandezramirez@gmail.com', TO_DATE('24/09/1947','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('75527130Y', 'María Ángeles', 'Ortega Moreno', 'Av de Blas Infante 72, Sevilla', '645359429', 'ortegamoreno@gmail.com', TO_DATE('07/05/1965','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('89894613X', 'José Luis', 'Ramos Delgado', 'C/ Juan Ramón Jiménez 24, Sevilla', '638360574', 'ramosdelgado@gmail.com', TO_DATE('22/07/1959','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('54439193X', 'Francisca', 'Rodríguez Moreno', 'Av de Kansas City 71, Sevilla', '618381848', 'rodriguezmoreno@gmail.com', TO_DATE('15/04/1948','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('49431800Q', 'Miguel', 'Molina Molina', 'Alameda de Hércules 25, Sevilla', '652265067', 'molinamolina@gmail.com', TO_DATE('24/06/2016','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('94254263X', 'Manuel', 'Muñoz Hernández', 'Alameda de Hércules 22, Sevilla', '618623234', 'munozhernandez@gmail.com', TO_DATE('10/05/2011','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('27066216T', 'Laura', 'López López', 'C/ Torres Quevedo 14, Sevilla', '737489124', 'lopezlopez@gmail.com', TO_DATE('04/04/2012','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('55563175M', 'Josefa', 'Ramírez Marín', 'C/ C/ Amador de Los Ríos 84, Sevilla', '718990147', 'ramirezmarin@gmail.com', TO_DATE('07/10/1967','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('67993821W', 'Francisco', 'Pérez Ortega', 'C/ C/ Amador de Los Ríos 74, Sevilla', '668384969', 'perezortega@gmail.com', TO_DATE('16/06/1971','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('46846680G', 'Francisca', 'Gutiérrez Castro', 'Av de la Cruz del Campo 35, Sevilla', '673159047', 'gutierrezcastro@gmail.com', TO_DATE('17/09/2012','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('54358649N', 'Manuel', 'González Gil', 'C/ Juan Ramón Jiménez 46, Sevilla', '615341104', 'gonzalezgil@gmail.com', TO_DATE('23/11/1997','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('78845068X', 'José Luis', 'Fernández Moreno', 'Av de Menéndez Pelayo 22, Sevilla', '714604590', 'fernandezmoreno@gmail.com', TO_DATE('12/10/1962','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('11274975F', 'María Carmen', 'Suarez García', 'Alcalde Manuel del Valle 22, Sevilla', '693660103', 'suarezgarcia@gmail.com', TO_DATE('08/06/2017','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('66353820Q', 'Juan', 'Romero López', 'C/ Republica Argentina 2, Sevilla', '670458297', 'romerolopez@gmail.com', TO_DATE('26/06/1996','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('42037851S', 'Cristina', 'Ortiz López', 'C/ Albareda 6, Sevilla', '656936727', 'ortizlopez@gmail.com', TO_DATE('27/04/2013','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('48659574S', 'Francisco Javier', 'Rubio Marín', 'C/ Torres Quevedo 17, Sevilla', '610597513', 'rubiomarin@gmail.com', TO_DATE('07/04/1973','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('20758700G', 'Manuel', 'Álvarez Suarez', 'Av del Romanticismo 87, Sevilla', '651512668', 'alvarezsuarez@gmail.com', TO_DATE('05/02/1970','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('26050399R', 'Francisco', 'Marín Castro', 'Av de Alemania 88, Sevilla', '753088980', 'marincastro@gmail.com', TO_DATE('18/03/1945','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('98202967M', 'Carmen', 'González Delgado', 'C/ Pureza 30, Sevilla', '624583836', 'gonzalezdelgado@gmail.com', TO_DATE('01/03/1997','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('96265432J', 'Manuel', 'Blanco Romero', 'C/ Avicena 8, Sevilla', '689619898', 'blancoromero@gmail.com', TO_DATE('07/09/2017','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('33564682T', 'María Ángeles', 'Fernández Blanco', 'Av Ciudad de Chiva 67, Sevilla', '676530451', 'fernandezblanco@gmail.com', TO_DATE('12/11/1950','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('36755399L', 'María Carmen', 'González Vázquez', 'C/ Republica Argentina 83, Sevilla', '736355360', 'gonzalezvazquez@gmail.com', TO_DATE('26/02/1980','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('85721547H', 'Laura', 'Vázquez Morales', 'Av de Alemania 78, Sevilla', '694517200', 'vazquezmorales@gmail.com', TO_DATE('05/08/1944','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('76397968H', 'Javier', 'Rubio Moreno', 'C/ San Bernardo 29, Sevilla', '645047797', 'rubiomoreno@gmail.com', TO_DATE('14/02/1948','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('68358507T', 'Carlos', 'Ramírez Domínguez', 'C/ Alfonso XII 36, Sevilla', '700596212', 'ramirezdominguez@gmail.com', TO_DATE('25/04/1979','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('36221165Y', 'Cristina', 'Molina Díaz', 'C/ Virgen de Montserrat 73, Sevilla', '645991298', 'molinadiaz@gmail.com', TO_DATE('13/10/2003','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('41435466T', 'Cristina', 'Muñoz Martin', 'C/ San Bernardo 100, Sevilla', '704301192', 'munozmartin@gmail.com', TO_DATE('06/02/1962','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('23835598P', 'José Luis', 'Díaz Alonso', 'Av de la Cruz del Campo 32, Sevilla', '625038936', 'diazalonso@gmail.com', TO_DATE('09/06/2001','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('65282575L', 'Marta', 'Núñez Pérez', 'Av de la Borbolla 81, Sevilla', '633122652', 'nunezperez@gmail.com', TO_DATE('07/12/1982','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('13877336X', 'Cristina', 'Martin Pérez', 'C/ San Juan Bosco 69, Sevilla', '625896934', 'martinperez@gmail.com', TO_DATE('02/10/1971','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('33609923T', 'Marta', 'Serrano Gutiérrez', 'C/ Torres Quevedo 33, Sevilla', '667634618', 'serranogutierrez@gmail.com', TO_DATE('09/05/2006','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('65353816Y', 'Jose', 'Ortega Hernández', 'Av de la Borbolla 46, Sevilla', '629767617', 'ortegahernandez@gmail.com', TO_DATE('11/11/1969','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('95089220K', 'Jose', 'López González', 'Av de Menéndez Pelayo 12, Sevilla', '737369167', 'lopezgonzalez@gmail.com', TO_DATE('21/07/1965','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('89613464J', 'María Carmen', 'Ortiz Morales', 'C/ Juan Sebastián El Cano 63, Sevilla', '605913419', 'ortizmorales@gmail.com', TO_DATE('17/11/1985','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('53105846L', 'María Ángeles', 'Núñez Romero', 'Av de la Buhaira 86, Sevilla', '716861559', 'nunezromero@gmail.com', TO_DATE('05/07/1954','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('11573247S', 'David', 'Delgado Jiménez', 'C/ Isaac Newton 53, Sevilla', '745306281', 'delgadojimenez@gmail.com', TO_DATE('10/07/2004','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('40412174R', 'Laura', 'Rubio Fernández', 'C/ Niebla 38, Sevilla', '623918831', 'rubiofernandez@gmail.com', TO_DATE('14/11/2016','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('30523566J', 'José Luis', 'Marín López', 'Av Ciudad de Chiva 76, Sevilla', '738404110', 'marinlopez@gmail.com', TO_DATE('25/05/1988','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('11310375X', 'Francisco Javier', 'Sanz Navarro', 'C/ C/ Amador de Los Ríos 25, Sevilla', '715311999', 'sanznavarro@gmail.com', TO_DATE('01/03/2018','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('87672771Z', 'Antonio', 'Rubio Díaz', 'C/ Marqués De Paradas 98, Sevilla', '650673497', 'rubiodiaz@gmail.com', TO_DATE('07/03/2016','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('60761165H', 'Carlos', 'Vázquez Rodríguez', 'Av de la Borbolla 47, Sevilla', '712720200', 'vazquezrodriguez@gmail.com', TO_DATE('02/11/2017','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('84952028X', 'Ana', 'Torres Ramos', 'C/ Marqués de Nervión 93, Sevilla', '714074908', 'torresramos@gmail.com', TO_DATE('21/06/1990','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('57312873R', 'Isabel', 'Díaz Delgado', 'Av del Alcalde Juan Fernández 42, Sevilla', '633991908', 'diazdelgado@gmail.com', TO_DATE('09/02/1953','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('15529781C', 'María Carmen', 'Domínguez Rubio', 'Av de la Borbolla 70, Sevilla', '707555343', 'dominguezrubio@gmail.com', TO_DATE('17/11/1946','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('65404686T', 'María Ángeles', 'Hernández Ramos', 'C/ Luis Montoto 47, Sevilla', '744458135', 'hernandezramos@gmail.com', TO_DATE('06/06/2006','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('78418592T', 'Jesús', 'Ortega Alonso', 'C/ Juan Ramón Jiménez 70, Sevilla', '633985122', 'ortegaalonso@gmail.com', TO_DATE('14/05/1964','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('38435652F', 'María Pilar', 'Sánchez Morales', 'C/ Pureza 88, Sevilla', '605763500', 'sanchezmorales@gmail.com', TO_DATE('12/06/1961','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('39341773C', 'María Ángeles', 'López Gómez', 'C/ Virgen de Montserrat 94, Sevilla', '636698214', 'lopezgomez@gmail.com', TO_DATE('03/07/1961','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('44589463F', 'Manuel', 'Muñoz Hernández', 'C/ Juan Sebastián El Cano 96, Sevilla', '695915789', 'munozhernandez@gmail.com', TO_DATE('06/07/1971','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('77949295H', 'Javier', 'Ortega Delgado', 'Av de Ramón y Cajal 86, Sevilla', '643078685', 'ortegadelgado@gmail.com', TO_DATE('14/07/1959','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('64245104D', 'Ana María', 'Martin Ruiz', 'Av de la Cruz del Campo 19, Sevilla', '743119913', 'martinruiz@gmail.com', TO_DATE('17/10/1958','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('98113656A', 'María Carmen', 'Ortega Hernández', 'C/ Juan Sebastián El Cano 74, Sevilla', '616600536', 'ortegahernandez@gmail.com', TO_DATE('10/02/2014','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('79916906W', 'Jesús', 'Gutiérrez Fernández', 'C/ Juan Antonio Cavestany 81, Sevilla', '669441577', 'gutierrezfernandez@gmail.com', TO_DATE('13/02/1957','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('40114541B', 'Laura', 'Martin Ortega', 'C/ Juan Sebastián El Cano 59, Sevilla', '695771436', 'martinortega@gmail.com', TO_DATE('26/08/1966','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('18756369F', 'María Dolores', 'Pérez Moreno', 'C/ Corral Del Agua 65, Sevilla', '717970454', 'perezmoreno@gmail.com', TO_DATE('01/12/2017','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('47247183P', 'Daniel', 'Ortega Martínez', 'C/ Avicena 30, Sevilla', '722679095', 'ortegamartinez@gmail.com', TO_DATE('25/05/2011','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('30398543H', 'Juan', 'Morales Ruiz', 'Av de la Borbolla 31, Sevilla', '605951766', 'moralesruiz@gmail.com', TO_DATE('21/07/2008','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('24719744B', 'Ana María', 'Marín Romero', 'C/ Pureza 68, Sevilla', '725139705', 'marinromero@gmail.com', TO_DATE('21/03/1957','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('98926724K', 'Carlos', 'Martínez Díaz', 'Alcalde Juan Fernández 33, Sevilla', '751617064', 'martinezdiaz@gmail.com', TO_DATE('18/10/1969','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('95408093E', 'María Dolores', 'Marín Castro', 'Av del Alcalde Juan Fernández 28, Sevilla', '681607701', 'marincastro@gmail.com', TO_DATE('19/01/1999','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('67752158T', 'José Antonio', 'Ruiz Molina', 'Av de Alemania 71, Sevilla', '704031534', 'ruizmolina@gmail.com', TO_DATE('11/02/1947','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('59983340F', 'José Antonio', 'González Martin', 'Av de las Palmeras 13, Sevilla', '653637141', 'gonzalezmartin@gmail.com', TO_DATE('10/08/1993','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('99885442F', 'Francisco Javier', 'Gutiérrez Pérez', 'C/ Marqués de Nervión 32, Sevilla', '668312992', 'gutierrezperez@gmail.com', TO_DATE('27/12/1995','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('57637492K', 'Jose', 'Serrano Pérez', 'C/ Arroyo 83, Sevilla', '627999374', 'serranoperez@gmail.com', TO_DATE('20/11/1973','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('96741875B', 'Francisco', 'Serrano Pérez', 'Av de Menéndez Pelayo 14, Sevilla', '649989823', 'serranoperez@gmail.com', TO_DATE('05/10/1979','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('93186549W', 'Francisco', 'Romero Hernández', 'C/ Republica Argentina 51, Sevilla', '620885164', 'romerohernandez@gmail.com', TO_DATE('05/06/1941','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('62638876D', 'Javier', 'Sánchez Alonso', 'Av de la Borbolla 12, Sevilla', '669870552', 'sanchezalonso@gmail.com', TO_DATE('25/05/1960','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('94736656R', 'José Luis', 'Domínguez González', 'C/ Virgen de Montserrat 5, Sevilla', '712579004', 'dominguezgonzalez@gmail.com', TO_DATE('19/06/2004','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('87755296S', 'María Ángeles', 'Hernández Ortiz', 'C/ Niebla 56, Sevilla', '746933921', 'hernandezortiz@gmail.com', TO_DATE('01/05/1965','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('63477892P', 'María Teresa', 'Rodríguez García', 'Av de Blas Infante 46, Sevilla', '602769799', 'rodriguezgarcia@gmail.com', TO_DATE('20/02/1985','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('17816080G', 'Josefa', 'Ramos Vázquez', 'C/ Juan Ramón Jiménez 82, Sevilla', '642072458', 'ramosvazquez@gmail.com', TO_DATE('22/06/2001','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('75793724F', 'Jose', 'Suarez Sánchez', 'C/ Albareda 61, Sevilla', '684375222', 'suarezsanchez@gmail.com', TO_DATE('01/01/1954','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('51814240R', 'María Pilar', 'Navarro Ruiz', 'Av de Eduardo Dato 60, Sevilla', '619429253', 'navarroruiz@gmail.com', TO_DATE('20/02/1985','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('11408085Q', 'Antonio', 'Hernández Rodríguez', 'Av de la Buhaira 28, Sevilla', '629652871', 'hernandezrodriguez@gmail.com', TO_DATE('11/05/1954','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('41331538D', 'David', 'Romero Jiménez', 'C/ Luis Montoto 85, Sevilla', '621034351', 'romerojimenez@gmail.com', TO_DATE('24/01/1981','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('47125017H', 'Cristina', 'Díaz Díaz', 'Av de Menéndez Pelayo 38, Sevilla', '738952774', 'diazdiaz@gmail.com', TO_DATE('11/09/1980','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('49527790G', 'María Teresa', 'Domínguez Jiménez', 'C/ Albareda 45, Sevilla', '698484961', 'dominguezjimenez@gmail.com', TO_DATE('19/10/2010','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('19431403Z', 'Carmen', 'Torres Martínez', 'C/ María Auxiliadora 72, Sevilla', '710757000', 'torresmartinez@gmail.com', TO_DATE('18/12/1991','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('45752597P', 'María Ángeles', 'Castro Ruiz', 'Alameda de Hércules 89, Sevilla', '641867363', 'castroruiz@gmail.com', TO_DATE('27/04/1977','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('72144259K', 'Javier', 'Castro Suarez', 'Av de la Borbolla 17, Sevilla', '665487185', 'castrosuarez@gmail.com', TO_DATE('05/01/1945','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('80861103A', 'Isabel', 'Ramírez Serrano', 'C/ Luis Montoto 17, Sevilla', '645492585', 'ramirezserrano@gmail.com', TO_DATE('10/11/1971','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('12582478Y', 'Carlos', 'Domínguez Domínguez', 'Alcalde Manuel del Valle 64, Sevilla', '689070058', 'dominguezdominguez@gmail.com', TO_DATE('09/06/1959','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('35709370F', 'María Pilar', 'Domínguez Pérez', 'C/ María Auxiliadora 66, Sevilla', '673158116', 'dominguezperez@gmail.com', TO_DATE('12/01/1973','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('22205909F', 'Francisca', 'Gil Alonso', 'C/ Juan Sebastián El Cano 90, Sevilla', '612967782', 'gilalonso@gmail.com', TO_DATE('24/07/1962','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('62530250N', 'Daniel', 'Torres Sánchez', 'Av Ciudad de Chiva 19, Sevilla', '736071641', 'torressanchez@gmail.com', TO_DATE('26/06/1955','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('69509189S', 'Miguel', 'González López', 'C/ Republica Argentina 93, Sevilla', '677806958', 'gonzalezlopez@gmail.com', TO_DATE('17/05/1982','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('72616409G', 'José Antonio', 'Sanz Vázquez', 'C/ Marqués De Paradas 78, Sevilla', '600911275', 'sanzvazquez@gmail.com', TO_DATE('14/08/1950','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('96708995K', 'José Luis', 'Ramos Rodríguez', 'C/ Marqués de Nervión 84, Sevilla', '629036600', 'ramosrodriguez@gmail.com', TO_DATE('23/07/2011','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('53834761H', 'Francisco', 'Martínez Delgado', 'C/ Amador de Los Ríos 64, Sevilla', '735945874', 'martinezdelgado@gmail.com', TO_DATE('04/04/1996','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('66478147M', 'María Teresa', 'Sanz Álvarez', 'Av de Kansas City 56, Sevilla', '652467793', 'sanzalvarez@gmail.com', TO_DATE('14/10/1948','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('41488866V', 'José Antonio', 'Molina Castro', 'Av de las Palmeras 77, Sevilla', '745256854', 'molinacastro@gmail.com', TO_DATE('27/11/2012','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('61139929H', 'Ana', 'Ramos Morales', 'Av de Blas Infante 9, Sevilla', '628672083', 'ramosmorales@gmail.com', TO_DATE('23/04/1997','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('61692001K', 'Francisco', 'González Alonso', 'Av de Grecia 31, Sevilla', '681419122', 'gonzalezalonso@gmail.com', TO_DATE('20/05/1958','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('68529556K', 'Carmen', 'Molina Gil', 'Av de Blas Infante 28, Sevilla', '676272946', 'molinagil@gmail.com', TO_DATE('08/04/1994','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('81100823V', 'Miguel', 'Martin López', 'Av del Alcalde Juan Fernández 21, Sevilla', '699285954', 'martinlopez@gmail.com', TO_DATE('06/04/2007','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('19564723A', 'Francisco', 'Suarez Alonso', 'C/ Arroyo 21, Sevilla', '674217410', 'suarezalonso@gmail.com', TO_DATE('06/02/1958','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('17427693H', 'Javier', 'Castro Torres', 'C/ Albareda 94, Sevilla', '712511252', 'castrotorres@gmail.com', TO_DATE('07/09/2017','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('43517742V', 'María Teresa', 'Gil Romero', 'C/ Luis Montoto 1, Sevilla', '656128860', 'gilromero@gmail.com', TO_DATE('18/09/1998','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('80398385E', 'Josefa', 'Rubio García', 'Av de Blas Infante 37, Sevilla', '608746610', 'rubiogarcia@gmail.com', TO_DATE('09/06/1964','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('11701514B', 'Ana', 'Núñez Molina', 'Av de Ramón y Cajal 62, Sevilla', '744137659', 'nunezmolina@gmail.com', TO_DATE('07/03/1997','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('57376280C', 'Francisca', 'Torres Serrano', 'Av de Ramón y Cajal 16, Sevilla', '713217653', 'torresserrano@gmail.com', TO_DATE('04/06/1967','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('83369090R', 'Carlos', 'Torres Alonso', 'C/ Alfonso XII 58, Sevilla', '724592300', 'torresalonso@gmail.com', TO_DATE('26/08/1987','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('86782763Z', 'Francisco Javier', 'Sánchez Marín', 'Av de Eduardo Dato 3, Sevilla', '717505969', 'sanchezmarin@gmail.com', TO_DATE('17/03/2000','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('18320630A', 'Ana María', 'González Morales', 'C/ Isaac Newton 39, Sevilla', '624346962', 'gonzalezmorales@gmail.com', TO_DATE('03/07/2013','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('75521462L', 'Antonio', 'González Torres', 'Av de Menéndez Pelayo 97, Sevilla', '618496456', 'gonzaleztorres@gmail.com', TO_DATE('02/04/1940','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('71303542T', 'Jose', 'Vázquez Martínez', 'C/ Amador de Los Ríos 13, Sevilla', '689227830', 'vazquezmartinez@gmail.com', TO_DATE('03/07/1986','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('23244751P', 'Alejandro', 'Morales Delgado', 'Av de la Constitución 42, Sevilla', '630904165', 'moralesdelgado@gmail.com', TO_DATE('24/02/1940','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('56209308E', 'Antonio', 'Gómez Gil', 'C/ Isaac Newton 46, Sevilla', '635020296', 'gomezgil@gmail.com', TO_DATE('03/10/1960','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('97943937R', 'Miguel', 'Ruiz López', 'C/ Torres Quevedo 11, Sevilla', '748047322', 'ruizlopez@gmail.com', TO_DATE('01/01/1949','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('78009334G', 'Francisco', 'Rubio Suarez', 'C/ Virgen de Montserrat 27, Sevilla', '609455235', 'rubiosuarez@gmail.com', TO_DATE('23/11/1942','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('30772581F', 'Francisco Javier', 'Vázquez Moreno', 'C/ Amador de Los Ríos 47, Sevilla', '687693647', 'vazquezmoreno@gmail.com', TO_DATE('15/05/1949','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('32224922J', 'Jesús', 'Gil Gómez', 'C/ Republica Argentina 28, Sevilla', '736841325', 'gilgomez@gmail.com', TO_DATE('19/09/1947','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('79180751P', 'Juan', 'Morales Díaz', 'C/ Republica Argentina 8, Sevilla', '610055058', 'moralesdiaz@gmail.com', TO_DATE('19/07/2018','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('12525487D', 'Marta', 'Molina Ruiz', 'C/ Juan Antonio Cavestany 66, Sevilla', '742407834', 'molinaruiz@gmail.com', TO_DATE('23/02/1992','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('97055316P', 'Ana', 'Torres Martínez', 'C/ Corral Del Agua 26, Sevilla', '747061842', 'torresmartinez@gmail.com', TO_DATE('05/10/1968','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('12208247P', 'Marta', 'Ortiz Gil', 'C/ Juan Antonio Cavestany 87, Sevilla', '608620212', 'ortizgil@gmail.com', TO_DATE('14/09/1995','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('72178298C', 'Laura', 'Gómez Marín', 'Av del Romanticismo 24, Sevilla', '666572836', 'gomezmarin@gmail.com', TO_DATE('22/06/2016','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('73512373A', 'María Ángeles', 'Moreno Fernández', 'Alcalde Juan Fernández 74, Sevilla', '743264930', 'morenofernandez@gmail.com', TO_DATE('14/05/1966','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('52986642R', 'María Ángeles', 'Domínguez Morales', 'Av de la Buhaira 14, Sevilla', '704541825', 'dominguezmorales@gmail.com', TO_DATE('02/10/1978','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('41727561H', 'María Pilar', 'Fernández García', 'Av de Eduardo Dato 73, Sevilla', '627398357', 'fernandezgarcia@gmail.com', TO_DATE('20/12/1955','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('84694465R', 'Daniel', 'Sanz Alonso', 'C/ Albareda 76, Sevilla', '688351952', 'sanzalonso@gmail.com', TO_DATE('19/01/1998','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('28704126B', 'María Dolores', 'Morales Blanco', 'Av de la Borbolla 9, Sevilla', '706019365', 'moralesblanco@gmail.com', TO_DATE('03/06/1942','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('94488345K', 'Javier', 'Castro Blanco', 'C/ Niebla 48, Sevilla', '701866879', 'castroblanco@gmail.com', TO_DATE('27/12/1980','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('13648132R', 'Jose', 'Suarez Jiménez', 'C/ Betis 14, Sevilla', '661573726', 'suarezjimenez@gmail.com', TO_DATE('07/03/1987','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('88479657Z', 'Francisco Javier', 'Núñez Alonso', 'Av Ciudad de Chiva 77, Sevilla', '606001622', 'nunezalonso@gmail.com', TO_DATE('26/12/1996','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('96937190X', 'Javier', 'Delgado Martin', 'C/ Niebla 93, Sevilla', '617237892', 'delgadomartin@gmail.com', TO_DATE('05/12/1945','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('37298672D', 'Carmen', 'Moreno Gil', 'C/ María Auxiliadora 22, Sevilla', '750399718', 'morenogil@gmail.com', TO_DATE('22/05/1944','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('91801284G', 'Javier', 'Marín Álvarez', 'C/ Torres Quevedo 21, Sevilla', '636914076', 'marinalvarez@gmail.com', TO_DATE('23/11/1981','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('61439466A', 'María Ángeles', 'Hernández Núñez', 'Av de Kansas City 56, Sevilla', '665326783', 'hernandeznunez@gmail.com', TO_DATE('19/07/1989','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('81043700A', 'José Antonio', 'Castro Domínguez', 'C/ Isaac Newton 94, Sevilla', '663949689', 'castrodominguez@gmail.com', TO_DATE('14/05/1971','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('96913256L', 'Daniel', 'Moreno Romero', 'C/ Betis 14, Sevilla', '653625331', 'morenoromero@gmail.com', TO_DATE('23/02/2010','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('79508027V', 'María Teresa', 'Domínguez Molina', 'C/ Virgen de Montserrat 38, Sevilla', '614998002', 'dominguezmolina@gmail.com', TO_DATE('14/03/2018','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('74510196V', 'José Luis', 'Álvarez Blanco', 'C/ Alfonso XII 97, Sevilla', '735441494', 'alvarezblanco@gmail.com', TO_DATE('26/08/1990','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('73636328B', 'José Antonio', 'Ruiz Molina', 'Av de Grecia 50, Sevilla', '627975300', 'ruizmolina@gmail.com', TO_DATE('19/06/2005','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('57961499G', 'Jose', 'Sanz Romero', 'Alcalde Juan Fernández 8, Sevilla', '645408108', 'sanzromero@gmail.com', TO_DATE('27/07/1993','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('69021685L', 'María Ángeles', 'Fernández Rubio', 'C/ Pages del Corro 8, Sevilla', '691286005', 'fernandezrubio@gmail.com', TO_DATE('04/07/2006','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('81021509F', 'Daniel', 'Domínguez García', 'Av de la Constitución 32, Sevilla', '736686821', 'dominguezgarcia@gmail.com', TO_DATE('02/10/2005','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('81623999N', 'Francisco Javier', 'Alonso Hernández', 'Av Flota de Indias 24, Sevilla', '649088668', 'alonsohernandez@gmail.com', TO_DATE('18/07/1994','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('17066447X', 'Josefa', 'Muñoz Ramírez', 'C/ Virgen de Montserrat 99, Sevilla', '674249335', 'munozramirez@gmail.com', TO_DATE('16/06/1941','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('86650148V', 'Alejandro', 'Ruiz Blanco', 'Av de las Palmeras 83, Sevilla', '728934648', 'ruizblanco@gmail.com', TO_DATE('06/10/2012','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('61324973G', 'Josefa', 'Serrano Molina', 'C/ San Juan Bosco 85, Sevilla', '683200813', 'serranomolina@gmail.com', TO_DATE('22/02/1983','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('44408239T', 'Jose', 'Torres Torres', 'C/ Pages del Corro 30, Sevilla', '611198239', 'torrestorres@gmail.com', TO_DATE('05/02/1958','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('93967524N', 'Jesús', 'Navarro Navarro', 'Av de Alemania 67, Sevilla', '734608753', 'navarronavarro@gmail.com', TO_DATE('22/04/2011','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('74160174D', 'María Carmen', 'Marín Moreno', 'Av de Ramón y Cajal 10, Sevilla', '630199006', 'marinmoreno@gmail.com', TO_DATE('22/11/1996','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('91774738T', 'Francisco', 'Gómez Alonso', 'C/ Niebla 47, Sevilla', '653790774', 'gomezalonso@gmail.com', TO_DATE('18/04/1961','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('44877411H', 'Javier', 'Pérez López', 'Av de la Borbolla 46, Sevilla', '623526745', 'perezlopez@gmail.com', TO_DATE('19/12/1942','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('43847659E', 'Francisca', 'Alonso Romero', 'Av del Romanticismo 50, Sevilla', '615420383', 'alonsoromero@gmail.com', TO_DATE('27/11/1965','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('91191016H', 'Ana María', 'Martínez Gutiérrez', 'Av del Alcalde Juan Fernández 56, Sevilla', '752274530', 'martinezgutierrez@gmail.com', TO_DATE('16/12/2017','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('94892177L', 'Ana María', 'Ortiz Núñez', 'Alcalde Juan Fernández 44, Sevilla', '719812581', 'ortiznunez@gmail.com', TO_DATE('22/01/1981','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('34276971W', 'Antonio', 'García Domínguez', 'Av del Alcalde Juan Fernández 13, Sevilla', '750279201', 'garciadominguez@gmail.com', TO_DATE('17/01/1963','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('32037298T', 'Francisco', 'García Díaz', 'C/ Alfonso XII 87, Sevilla', '614587406', 'garciadiaz@gmail.com', TO_DATE('11/06/1989','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('41829592K', 'Carmen', 'Domínguez Castro', 'C/ Luis Montoto 36, Sevilla', '636531384', 'dominguezcastro@gmail.com', TO_DATE('16/01/1942','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('16844201J', 'Francisca', 'Pérez Domínguez', 'C/ Pages del Corro 57, Sevilla', '749038209', 'perezdominguez@gmail.com', TO_DATE('22/06/2011','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('67069431M', 'Alejandro', 'Ramos Ramos', 'Av de Menéndez Pelayo 77, Sevilla', '666779308', 'ramosramos@gmail.com', TO_DATE('10/11/1944','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('40003835G', 'María Pilar', 'Sanz Muñoz', 'Alcalde Juan Fernández 23, Sevilla', '720552147', 'sanzmunoz@gmail.com', TO_DATE('01/08/1945','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('50914385K', 'Marta', 'García Ramos', 'Av Flota de Indias 25, Sevilla', '611006981', 'garciaramos@gmail.com', TO_DATE('23/07/1991','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('82133081N', 'Carlos', 'Ramos Ortega', 'Av del Romanticismo 38, Sevilla', '611660132', 'ramosortega@gmail.com', TO_DATE('08/01/1945','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('94103432J', 'María', 'Rubio Delgado', 'Av de Grecia 100, Sevilla', '606291216', 'rubiodelgado@gmail.com', TO_DATE('02/02/1990','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('30843033X', 'Jesús', 'Ramos Morales', 'C/ Marqués de Nervión 82, Sevilla', '733625927', 'ramosmorales@gmail.com', TO_DATE('23/10/1996','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('55577991D', 'María', 'Gómez García', 'C/ Juan Ramón Jiménez 17, Sevilla', '617709415', 'gomezgarcia@gmail.com', TO_DATE('12/08/2005','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('33980291E', 'Juan', 'Álvarez Ramos', 'Av Ciudad de Chiva 14, Sevilla', '722689966', 'alvarezramos@gmail.com', TO_DATE('12/06/1949','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('34975966G', 'Laura', 'Núñez Díaz', 'C/ Republica Argentina 9, Sevilla', '684646557', 'nunezdiaz@gmail.com', TO_DATE('07/08/1991','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('85489188M', 'Daniel', 'Díaz Pérez', 'C/ Pages del Corro 10, Sevilla', '654481626', 'diazperez@gmail.com', TO_DATE('13/03/1999','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('18890305Z', 'María Ángeles', 'García Jiménez', 'Av del Alcalde Juan Fernández 22, Sevilla', '735398097', 'garciajimenez@gmail.com', TO_DATE('18/05/1987','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('39742926F', 'Laura', 'Serrano Ramírez', 'C/ Amador de Los Ríos 79, Sevilla', '694883215', 'serranoramirez@gmail.com', TO_DATE('07/03/1968','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('46757545V', 'Francisco Javier', 'Núñez Gómez', 'Alcalde Manuel del Valle 68, Sevilla', '751644349', 'nunezgomez@gmail.com', TO_DATE('06/12/1980','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('46607078Q', 'José Antonio', 'Moreno García', 'Av Ciudad de Chiva 81, Sevilla', '755134747', 'morenogarcia@gmail.com', TO_DATE('13/06/1953','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('29128561G', 'Ana', 'Delgado Torres', 'Av de Menéndez Pelayo 78, Sevilla', '715006685', 'delgadotorres@gmail.com', TO_DATE('28/06/2016','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('79095377X', 'Jose', 'Pérez López', 'C/ Torres Quevedo 42, Sevilla', '728829224', 'perezlopez@gmail.com', TO_DATE('08/05/1964','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('89428554T', 'María Ángeles', 'Vázquez Ramos', 'Av de Blas Infante 25, Sevilla', '735985946', 'vazquezramos@gmail.com', TO_DATE('06/02/1952','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('27365538T', 'María Ángeles', 'Ortiz Rodríguez', 'C/ Condes de Bustillo 45, Sevilla', '656537924', 'ortizrodriguez@gmail.com', TO_DATE('22/01/2000','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('36461947R', 'María Carmen', 'Castro Álvarez', 'Av Flota de Indias 53, Sevilla', '740734757', 'castroalvarez@gmail.com', TO_DATE('09/11/1953','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('93050167X', 'Manuel', 'Gil Jiménez', 'Av de Blas Infante 64, Sevilla', '739761488', 'giljimenez@gmail.com', TO_DATE('14/05/2010','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('34879580B', 'Francisco Javier', 'González Ramírez', 'C/ Blanco White 64, Sevilla', '620847944', 'gonzalezramirez@gmail.com', TO_DATE('17/06/2007','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('89201086W', 'Jesús', 'Ramos Vázquez', 'C/ Condes de Bustillo 25, Sevilla', '724116654', 'ramosvazquez@gmail.com', TO_DATE('12/10/1964','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('50225700W', 'Francisco Javier', 'Núñez Vázquez', 'Av de Eduardo Dato 26, Sevilla', '710589302', 'nunezvazquez@gmail.com', TO_DATE('22/06/1952','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('57483671R', 'María Pilar', 'Alonso Sánchez', 'C/ Alfonso XII 42, Sevilla', '680740111', 'alonsosanchez@gmail.com', TO_DATE('06/04/1974','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('44525778D', 'Miguel', 'Álvarez Torres', 'C/ Pages del Corro 60, Sevilla', '686771775', 'alvareztorres@gmail.com', TO_DATE('09/06/1999','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('57843056B', 'Francisco', 'Castro Fernández', 'Av del Doctor Fedriani 13, Sevilla', '662768078', 'castrofernandez@gmail.com', TO_DATE('17/02/1948','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('25841396E', 'José Antonio', 'Serrano Rodríguez', 'Alcalde Manuel del Valle 8, Sevilla', '670087237', 'serranorodriguez@gmail.com', TO_DATE('18/05/1947','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('51351080S', 'Marta', 'Marín Domínguez', 'Av de Alemania 64, Sevilla', '724259042', 'marindominguez@gmail.com', TO_DATE('23/03/2000','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('56720574K', 'Cristina', 'Ramos Morales', 'C/ San Bernardo 86, Sevilla', '720022313', 'ramosmorales@gmail.com', TO_DATE('09/09/1948','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('74852280E', 'Miguel', 'Moreno Vázquez', 'Av de las Palmeras 31, Sevilla', '621042122', 'morenovazquez@gmail.com', TO_DATE('28/05/1992','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('62318118D', 'Antonio', 'Ramírez Díaz', 'Av Flota de Indias 11, Sevilla', '613238246', 'ramirezdiaz@gmail.com', TO_DATE('16/05/1953','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('73451275Q', 'Javier', 'Rodríguez Delgado', 'Av de Grecia 17, Sevilla', '682851296', 'rodriguezdelgado@gmail.com', TO_DATE('02/02/2014','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('22138163L', 'Laura', 'Ramírez Martin', 'C/ Isaac Newton 68, Sevilla', '730455645', 'ramirezmartin@gmail.com', TO_DATE('28/02/2016','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('16155647X', 'Alejandro', 'Ruiz Álvarez', 'Av de Kansas City 49, Sevilla', '729260440', 'ruizalvarez@gmail.com', TO_DATE('23/11/1950','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('43006440M', 'Laura', 'Marín Hernández', 'C/ Isaac Newton 92, Sevilla', '717838004', 'marinhernandez@gmail.com', TO_DATE('28/03/1958','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('49541782N', 'Francisca', 'Gutiérrez Blanco', 'Av de la Constitución 49, Sevilla', '700304514', 'gutierrezblanco@gmail.com', TO_DATE('16/09/1980','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('29529681G', 'Juan', 'Gil Pérez', 'Av de la Buhaira 92, Sevilla', '630449339', 'gilperez@gmail.com', TO_DATE('02/05/1952','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('61698937B', 'María Teresa', 'Vázquez Suarez', 'Av de Ramón y Cajal 70, Sevilla', '658608954', 'vazquezsuarez@gmail.com', TO_DATE('18/01/1974','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('70002251A', 'Carmen', 'Marín Martin', 'C/ Avicena 99, Sevilla', '718300734', 'marinmartin@gmail.com', TO_DATE('15/12/1974','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('44262289P', 'María Dolores', 'Jiménez González', 'C/ Torres Quevedo 65, Sevilla', '680635576', 'jimenezgonzalez@gmail.com', TO_DATE('27/06/1958','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('44408034W', 'Francisco Javier', 'Delgado Gutiérrez', 'Av Ciudad de Chiva 18, Sevilla', '640582068', 'delgadogutierrez@gmail.com', TO_DATE('19/07/1953','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('46993167G', 'Miguel', 'Núñez Hernández', 'C/ Arroyo 75, Sevilla', '702391041', 'nunezhernandez@gmail.com', TO_DATE('01/05/1998','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('63095901R', 'Juan', 'Pérez López', 'C/ Isaac Newton 8, Sevilla', '675931750', 'perezlopez@gmail.com', TO_DATE('15/10/2017','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('96651594M', 'Francisco', 'Ortiz Sánchez', 'Av de Ramón y Cajal 39, Sevilla', '696603883', 'ortizsanchez@gmail.com', TO_DATE('06/03/1997','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('64944754E', 'Marta', 'Martin Molina', 'Av Flota de Indias 42, Sevilla', '646474176', 'martinmolina@gmail.com', TO_DATE('09/02/1966','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('89676199G', 'María', 'Romero Moreno', 'Alcalde Juan Fernández 74, Sevilla', '644286238', 'romeromoreno@gmail.com', TO_DATE('09/05/1985','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('81401189A', 'Miguel', 'Alonso Serrano', 'C/ Condes de Bustillo 55, Sevilla', '737062438', 'alonsoserrano@gmail.com', TO_DATE('11/09/2014','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('84661045T', 'Jose', 'Alonso Serrano', 'C/ Betis 34, Sevilla', '616594633', 'alonsoserrano@gmail.com', TO_DATE('28/06/1961','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('95071281E', 'Marta', 'Blanco Delgado', 'C/ Marqués De Paradas 92, Sevilla', '743797047', 'blancodelgado@gmail.com', TO_DATE('03/05/1976','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('34938182D', 'Antonio', 'Navarro González', 'Av de Eduardo Dato 19, Sevilla', '727815126', 'navarrogonzalez@gmail.com', TO_DATE('27/06/2015','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('80939283Y', 'Ana María', 'Gómez Blanco', 'C/ Juan Antonio Cavestany 89, Sevilla', '602059670', 'gomezblanco@gmail.com', TO_DATE('22/03/1950','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('45922366Z', 'María Dolores', 'González Torres', 'Av de Alemania 97, Sevilla', '600154647', 'gonzaleztorres@gmail.com', TO_DATE('21/08/1988','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('59929014F', 'Jesús', 'Pérez Gil', 'Av de Menéndez Pelayo 88, Sevilla', '740939512', 'perezgil@gmail.com', TO_DATE('28/09/2003','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('25381041N', 'Daniel', 'Sánchez Castro', 'Av de Grecia 71, Sevilla', '752941624', 'sanchezcastro@gmail.com', TO_DATE('09/07/1974','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('84811199X', 'Francisca', 'Molina Álvarez', 'C/ Juan Antonio Cavestany 7, Sevilla', '623394144', 'molinaalvarez@gmail.com', TO_DATE('04/10/1979','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('11898133A', 'María Pilar', 'Sánchez Ramírez', 'C/ Betis 8, Sevilla', '683653931', 'sanchezramirez@gmail.com', TO_DATE('20/10/1951','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('52459966W', 'José Antonio', 'Martin Gómez', 'Av del Romanticismo 35, Sevilla', '640179656', 'martingomez@gmail.com', TO_DATE('10/01/1959','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('58898142H', 'Josefa', 'Sánchez Gutiérrez', 'Av de Eduardo Dato 29, Sevilla', '680606541', 'sanchezgutierrez@gmail.com', TO_DATE('18/05/1970','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('38271790C', 'Javier', 'Domínguez Torres', 'Av de Alemania 18, Sevilla', '605496865', 'domingueztorres@gmail.com', TO_DATE('25/01/1947','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('26646959X', 'Francisco Javier', 'Serrano Rubio', 'Av Flota de Indias 69, Sevilla', '713142667', 'serranorubio@gmail.com', TO_DATE('12/02/1943','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('60295385B', 'Francisca', 'Blanco Rodríguez', 'C/ Blanco White 42, Sevilla', '747632411', 'blancorodriguez@gmail.com', TO_DATE('01/03/1965','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('26415387W', 'José Antonio', 'Ortega Molina', 'Av de las Palmeras 36, Sevilla', '725900592', 'ortegamolina@gmail.com', TO_DATE('07/04/1941','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('63482944T', 'José Luis', 'Álvarez González', 'Av del Romanticismo 22, Sevilla', '730806102', 'alvarezgonzalez@gmail.com', TO_DATE('23/04/1990','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('49686718W', 'Alejandro', 'Ortiz Ramírez', 'C/ San Juan Bosco 56, Sevilla', '614510446', 'ortizramirez@gmail.com', TO_DATE('22/01/2005','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('63694131R', 'Jesús', 'Navarro Ortiz', 'C/ Niebla 38, Sevilla', '642450943', 'navarroortiz@gmail.com', TO_DATE('22/06/1968','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('37590949W', 'Carmen', 'Pérez Ramírez', 'C/ Avicena 77, Sevilla', '688492883', 'perezramirez@gmail.com', TO_DATE('07/12/1970','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('57754283H', 'Daniel', 'Díaz Alonso', 'Av de Blas Infante 72, Sevilla', '638481898', 'diazalonso@gmail.com', TO_DATE('17/08/1995','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('96434251N', 'Marta', 'Suarez Ortega', 'C/ Juan Antonio Cavestany 77, Sevilla', '726822006', 'suarezortega@gmail.com', TO_DATE('01/10/2003','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('50366504T', 'María Dolores', 'García Fernández', 'C/ Corral Del Agua 72, Sevilla', '738236690', 'garciafernandez@gmail.com', TO_DATE('26/08/1989','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('52229531G', 'Cristina', 'López Muñoz', 'C/ Avicena 67, Sevilla', '605436902', 'lopezmunoz@gmail.com', TO_DATE('21/03/1960','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('80933748Z', 'Francisco', 'Morales Blanco', 'Av de Kansas City 70, Sevilla', '751778801', 'moralesblanco@gmail.com', TO_DATE('06/03/2008','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('81082132W', 'Javier', 'Rodríguez Morales', 'Alcalde Manuel del Valle 96, Sevilla', '733053742', 'rodriguezmorales@gmail.com', TO_DATE('23/05/1987','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('26894648N', 'Laura', 'Sanz Ramírez', 'Av de la Constitución 83, Sevilla', '680563455', 'sanzramirez@gmail.com', TO_DATE('12/01/1994','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('40175692M', 'Daniel', 'Torres Marín', 'Av del Alcalde Juan Fernández 94, Sevilla', '601462000', 'torresmarin@gmail.com', TO_DATE('13/09/1960','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('45326568P', 'José Antonio', 'Jiménez Alonso', 'C/ Condes de Bustillo 23, Sevilla', '726993737', 'jimenezalonso@gmail.com', TO_DATE('03/08/2018','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('73750583W', 'Francisco Javier', 'Ruiz González', 'C/ Juan Sebastián El Cano 23, Sevilla', '660266050', 'ruizgonzalez@gmail.com', TO_DATE('12/07/1988','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('36242843H', 'Cristina', 'Ramírez Hernández', 'Av del Doctor Fedriani 91, Sevilla', '643630777', 'ramirezhernandez@gmail.com', TO_DATE('04/04/1987','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('56118550E', 'Miguel', 'Martin Martin', 'C/ Republica Argentina 70, Sevilla', '604588282', 'martinmartin@gmail.com', TO_DATE('20/04/1990','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('20700110H', 'María Ángeles', 'Vázquez Gil', 'Av de Alemania 20, Sevilla', '698763747', 'vazquezgil@gmail.com', TO_DATE('19/04/1960','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('48698687M', 'José Luis', 'Pérez Gutiérrez', 'C/ Blanco White 5, Sevilla', '713509469', 'perezgutierrez@gmail.com', TO_DATE('25/08/1966','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('20326969Y', 'Marta', 'Navarro González', 'Av de Ramón y Cajal 21, Sevilla', '666707608', 'navarrogonzalez@gmail.com', TO_DATE('08/03/1989','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('69058020Z', 'María Carmen', 'Torres Delgado', 'Av de la Constitución 70, Sevilla', '668051060', 'torresdelgado@gmail.com', TO_DATE('18/07/1944','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('57659750S', 'Antonio', 'Ortiz Díaz', 'Av del Romanticismo 82, Sevilla', '689130780', 'ortizdiaz@gmail.com', TO_DATE('23/08/1941','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('57148596J', 'Francisca', 'Navarro Blanco', 'C/ San Juan Bosco 35, Sevilla', '730042755', 'navarroblanco@gmail.com', TO_DATE('22/02/1955','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('13808594S', 'Miguel', 'Martin Álvarez', 'C/ Isaac Newton 35, Sevilla', '626108632', 'martinalvarez@gmail.com', TO_DATE('18/11/1958','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('37741104J', 'Francisca', 'Díaz González', 'Av de la Cruz del Campo 90, Sevilla', '753687415', 'diazgonzalez@gmail.com', TO_DATE('23/04/1959','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('81251728L', 'Francisca', 'García López', 'Av de Kansas City 98, Sevilla', '744093513', 'garcialopez@gmail.com', TO_DATE('02/04/1981','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('88590218Z', 'Carlos', 'Gutiérrez Marín', 'C/ Niebla 45, Sevilla', '681780956', 'gutierrezmarin@gmail.com', TO_DATE('05/03/1946','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('67252845V', 'Isabel', 'Ramírez Núñez', 'C/ Marqués De Paradas 84, Sevilla', '663959463', 'ramireznunez@gmail.com', TO_DATE('16/08/1997','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('58416386C', 'María Pilar', 'Blanco García', 'C/ San Juan Bosco 70, Sevilla', '652529406', 'blancogarcia@gmail.com', TO_DATE('02/03/1992','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('38510226S', 'Daniel', 'Ramírez Muñoz', 'C/ Corral Del Agua 77, Sevilla', '617990776', 'ramirezmunoz@gmail.com', TO_DATE('07/08/1987','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('60706463X', 'María Teresa', 'Ortega Ortiz', 'C/ San Juan Bosco 61, Sevilla', '674370291', 'ortegaortiz@gmail.com', TO_DATE('14/10/2014','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('28235749Y', 'Carmen', 'Martin Serrano', 'C/ Condes de Bustillo 83, Sevilla', '719286035', 'martinserrano@gmail.com', TO_DATE('13/03/1999','DD/MM/YYYY'), 1);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('13238782M', 'Jesús', 'Delgado González', 'C/ Pages del Corro 6, Sevilla', '680820729', 'delgadogonzalez@gmail.com', TO_DATE('07/02/1947','DD/MM/YYYY'), 1);




INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('11431489Y', 'Ana', 'Suarez Gómez', 'C/ Corral Del Agua 25, Sevilla', '702016169', 'suarezgomez@gmail.com', TO_DATE('07/01/1973','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('99341958J', 'Cristina', 'Ortiz Hernández', 'Av de Menéndez Pelayo 33, Sevilla', '729422999', 'ortizhernandez@gmail.com', TO_DATE('13/08/1966','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('42620392N', 'Manuel', 'Sanz Navarro', 'C/ Albareda 9, Sevilla', '700216831', 'sanznavarro@gmail.com', TO_DATE('25/10/1991','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('42882940S', 'Carlos', 'Vázquez Romero', 'C/ Juan Sebastián El Cano 92, Sevilla', '721131738', 'vazquezromero@gmail.com', TO_DATE('28/06/1942','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('11201584D', 'Jose', 'Domínguez Rubio', 'C/ Marqués De Paradas 98, Sevilla', '701006912', 'dominguezrubio@gmail.com', TO_DATE('09/10/1941','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('19544590H', 'Ana María', 'Vázquez Serrano', 'Av Ciudad de Chiva 10, Sevilla', '649029630', 'vazquezserrano@gmail.com', TO_DATE('27/08/2001','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('85335046D', 'José Luis', 'Vázquez Jiménez', 'C/ Torres Quevedo 46, Sevilla', '742971779', 'vazquezjimenez@gmail.com', TO_DATE('03/03/2004','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('73072075V', 'David', 'García Ramírez', 'Av de la Cruz del Campo 77, Sevilla', '668859998', 'garciaramirez@gmail.com', TO_DATE('13/07/1942','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('25234561L', 'María Ángeles', 'Pérez González', 'C/ Condes de Bustillo 69, Sevilla', '668483317', 'perezgonzalez@gmail.com', TO_DATE('10/12/1944','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('42450405H', 'Alejandro', 'Gutiérrez Torres', 'C/ Torres Quevedo 21, Sevilla', '692667285', 'gutierreztorres@gmail.com', TO_DATE('18/11/1954','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('19099166N', 'Josefa', 'Vázquez Díaz', 'C/ Isaac Newton 40, Sevilla', '747859914', 'vazquezdiaz@gmail.com', TO_DATE('14/02/1977','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('66587302W', 'Laura', 'Gutiérrez Vázquez', 'C/ Torres Quevedo 35, Sevilla', '716853569', 'gutierrezvazquez@gmail.com', TO_DATE('14/08/1947','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('50523323M', 'Josefa', 'Molina Ortega', 'Av de Kansas City 58, Sevilla', '628792367', 'molinaortega@gmail.com', TO_DATE('03/11/1940','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('67007295S', 'María Ángeles', 'Gutiérrez García', 'C/ Marqués De Paradas 59, Sevilla', '622651267', 'gutierrezgarcia@gmail.com', TO_DATE('06/11/2015','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('95319811Z', 'Ana', 'González Hernández', 'C/ Isaac Newton 25, Sevilla', '615132385', 'gonzalezhernandez@gmail.com', TO_DATE('21/05/2004','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('77421522A', 'Carmen', 'Martínez Domínguez', 'Av del Alcalde Juan Fernández 56, Sevilla', '684260811', 'martinezdominguez@gmail.com', TO_DATE('14/11/1983','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('65733592Y', 'Carmen', 'Núñez Núñez', 'Alameda de Hércules 2, Sevilla', '690003230', 'nuneznunez@gmail.com', TO_DATE('26/03/1972','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('22928589G', 'Juan', 'Romero Hernández', 'C/ Corral Del Agua 87, Sevilla', '628603871', 'romerohernandez@gmail.com', TO_DATE('17/08/1950','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('39728700H', 'Carlos', 'Sanz Jiménez', 'Av de la Constitución 8, Sevilla', '736796010', 'sanzjimenez@gmail.com', TO_DATE('20/01/1984','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('26291765M', 'Jesús', 'Blanco Rubio', 'Av del Doctor Fedriani 75, Sevilla', '669444516', 'blancorubio@gmail.com', TO_DATE('26/11/2000','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('15827325J', 'Carmen', 'Ortiz Rodríguez', 'Av de Grecia 26, Sevilla', '707245728', 'ortizrodriguez@gmail.com', TO_DATE('25/07/1993','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('54464635Z', 'Carmen', 'Torres Álvarez', 'C/ Pages del Corro 92, Sevilla', '683374307', 'torresalvarez@gmail.com', TO_DATE('01/03/2002','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('24233890D', 'Josefa', 'Gutiérrez Castro', 'C/ Alfonso XII 86, Sevilla', '682936892', 'gutierrezcastro@gmail.com', TO_DATE('15/09/2012','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('51293566R', 'Laura', 'Gómez Moreno', 'C/ Juan Ramón Jiménez 77, Sevilla', '653221134', 'gomezmoreno@gmail.com', TO_DATE('04/04/1994','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('44547243S', 'María Carmen', 'Ortiz Torres', 'C/ Virgen de Montserrat 45, Sevilla', '732447729', 'ortiztorres@gmail.com', TO_DATE('09/03/1946','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('34693729T', 'Francisca', 'Álvarez Romero', 'C/ Blanco White 16, Sevilla', '737626331', 'alvarezromero@gmail.com', TO_DATE('28/03/1970','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('63558189N', 'Alejandro', 'Castro Navarro', 'Av Ciudad de Chiva 98, Sevilla', '671319828', 'castronavarro@gmail.com', TO_DATE('25/04/2007','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('29764506E', 'Marta', 'Marín Gutiérrez', 'C/ Marqués de Nervión 69, Sevilla', '656747841', 'maringutierrez@gmail.com', TO_DATE('21/09/2001','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('59981111D', 'María Dolores', 'López Vázquez', 'C/ Luis Montoto 91, Sevilla', '692122306', 'lopezvazquez@gmail.com', TO_DATE('26/06/1964','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('11485326T', 'Daniel', 'Alonso Gutiérrez', 'Av de Menéndez Pelayo 55, Sevilla', '685679806', 'alonsogutierrez@gmail.com', TO_DATE('18/02/1983','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('60393711N', 'José Luis', 'Moreno Martin', 'C/ Arroyo 70, Sevilla', '713812714', 'morenomartin@gmail.com', TO_DATE('22/02/2016','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('34010374K', 'Manuel', 'Ruiz López', 'C/ Juan Antonio Cavestany 66, Sevilla', '640178913', 'ruizlopez@gmail.com', TO_DATE('23/01/1955','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('89598631S', 'Laura', 'Ramírez Núñez', 'Av del Doctor Fedriani 38, Sevilla', '685344402', 'ramireznunez@gmail.com', TO_DATE('01/09/1972','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('51333855V', 'Isabel', 'Gómez Gutiérrez', 'Av Ciudad de Chiva 6, Sevilla', '658949423', 'gomezgutierrez@gmail.com', TO_DATE('11/03/1947','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('83015775N', 'José Antonio', 'Jiménez Muñoz', 'Av Flota de Indias 25, Sevilla', '736194985', 'jimenezmunoz@gmail.com', TO_DATE('04/05/1949','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('84783110G', 'José Luis', 'Díaz Suarez', 'Av de la Borbolla 39, Sevilla', '703447110', 'diazsuarez@gmail.com', TO_DATE('04/04/1962','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('60686299V', 'Josefa', 'González Gil', 'C/ Amador de Los Ríos 50, Sevilla', '673445344', 'gonzalezgil@gmail.com', TO_DATE('04/01/1959','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('63184683A', 'Jose', 'Ramírez Delgado', 'Av de Grecia 23, Sevilla', '712768767', 'ramirezdelgado@gmail.com', TO_DATE('08/01/1955','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('66488635M', 'Jesús', 'Alonso Sánchez', 'C/ Blanco White 4, Sevilla', '628047296', 'alonsosanchez@gmail.com', TO_DATE('08/10/1973','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('95855341N', 'Miguel', 'Álvarez Morales', 'C/ Luis Montoto 81, Sevilla', '603751273', 'alvarezmorales@gmail.com', TO_DATE('15/05/2015','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('90135868H', 'Marta', 'Moreno Suarez', 'Av de la Borbolla 77, Sevilla', '661235079', 'morenosuarez@gmail.com', TO_DATE('14/08/1978','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('86098824A', 'Carmen', 'Sánchez González', 'C/ Amador de Los Ríos 83, Sevilla', '622916814', 'sanchezgonzalez@gmail.com', TO_DATE('01/08/1963','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('12008883P', 'Manuel', 'Blanco Alonso', 'Alcalde Manuel del Valle 73, Sevilla', '686562152', 'blancoalonso@gmail.com', TO_DATE('17/09/2008','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('32161938A', 'Daniel', 'Castro Moreno', 'Av de Grecia 2, Sevilla', '702457754', 'castromoreno@gmail.com', TO_DATE('11/04/1973','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('93921496F', 'Laura', 'Jiménez Domínguez', 'C/ Juan Ramón Jiménez 77, Sevilla', '611786989', 'jimenezdominguez@gmail.com', TO_DATE('10/04/2013','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('25759281V', 'María Teresa', 'Fernández Torres', 'Av de la Cruz del Campo 8, Sevilla', '622869134', 'fernandeztorres@gmail.com', TO_DATE('19/05/2002','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('98754135R', 'Marta', 'Vázquez Gil', 'Av del Doctor Fedriani 40, Sevilla', '604641920', 'vazquezgil@gmail.com', TO_DATE('05/04/1956','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('63038880C', 'María Dolores', 'Jiménez Muñoz', 'C/ Pureza 32, Sevilla', '705586143', 'jimenezmunoz@gmail.com', TO_DATE('25/03/1944','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('16812666B', 'Manuel', 'Álvarez Domínguez', 'Alcalde Juan Fernández 20, Sevilla', '645342057', 'alvarezdominguez@gmail.com', TO_DATE('06/02/1964','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('97227638Z', 'Francisco', 'Fernández Sanz', 'C/ Marqués de Nervión 58, Sevilla', '654816250', 'fernandezsanz@gmail.com', TO_DATE('12/04/1995','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('28749877S', 'María Carmen', 'Rubio Morales', 'Av de la Buhaira 41, Sevilla', '642687695', 'rubiomorales@gmail.com', TO_DATE('28/02/1989','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('30821367X', 'María Carmen', 'Ramos Domínguez', 'Av de Alemania 65, Sevilla', '659477601', 'ramosdominguez@gmail.com', TO_DATE('24/07/1983','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('74762013F', 'David', 'Domínguez Martínez', 'C/ Luis Montoto 95, Sevilla', '651677692', 'dominguezmartinez@gmail.com', TO_DATE('24/08/1942','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('75298388E', 'María Pilar', 'Moreno Morales', 'Av del Alcalde Juan Fernández 73, Sevilla', '737114895', 'morenomorales@gmail.com', TO_DATE('19/01/1986','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('97984246Z', 'José Luis', 'Alonso Álvarez', 'C/ Niebla 98, Sevilla', '654363595', 'alonsoalvarez@gmail.com', TO_DATE('05/08/2018','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('37601284X', 'María Ángeles', 'Álvarez Domínguez', 'Av de la Borbolla 17, Sevilla', '608412575', 'alvarezdominguez@gmail.com', TO_DATE('15/03/1951','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('33652565T', 'Carlos', 'Moreno Martin', 'Av de la Borbolla 64, Sevilla', '602030979', 'morenomartin@gmail.com', TO_DATE('20/11/1964','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('45657284F', 'Javier', 'Núñez Morales', 'Av de la Buhaira 50, Sevilla', '732530929', 'nunezmorales@gmail.com', TO_DATE('18/11/2003','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('45772530T', 'María Teresa', 'Martin Torres', 'C/ Corral Del Agua 53, Sevilla', '680457745', 'martintorres@gmail.com', TO_DATE('07/02/2000','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('75656862H', 'Daniel', 'Morales Gil', 'C/ San Bernardo 16, Sevilla', '733576712', 'moralesgil@gmail.com', TO_DATE('24/02/2017','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('25039418P', 'María Dolores', 'Sánchez Vázquez', 'Alcalde Juan Fernández 55, Sevilla', '701608569', 'sanchezvazquez@gmail.com', TO_DATE('15/02/1985','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('81537585D', 'José Luis', 'Torres Marín', 'C/ Juan Antonio Cavestany 3, Sevilla', '630701473', 'torresmarin@gmail.com', TO_DATE('10/01/1940','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('35784232G', 'María Ángeles', 'Marín Jiménez', 'C/ Virgen de Montserrat 11, Sevilla', '648300295', 'marinjimenez@gmail.com', TO_DATE('25/11/1981','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('66148710C', 'María Teresa', 'Álvarez Ortiz', 'Av de la Buhaira 40, Sevilla', '665586726', 'alvarezortiz@gmail.com', TO_DATE('03/11/1940','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('75086586G', 'María Pilar', 'Jiménez Blanco', 'C/ Betis 63, Sevilla', '745392933', 'jimenezblanco@gmail.com', TO_DATE('23/08/1955','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('49505879N', 'Laura', 'Gómez Navarro', 'Av de la Buhaira 15, Sevilla', '610105113', 'gomeznavarro@gmail.com', TO_DATE('02/06/1957','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('19346872P', 'Miguel', 'Torres Morales', 'C/ Virgen de Montserrat 54, Sevilla', '630693654', 'torresmorales@gmail.com', TO_DATE('16/03/1949','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('51230452E', 'José Luis', 'Rubio García', 'C/ Juan Ramón Jiménez 75, Sevilla', '729703628', 'rubiogarcia@gmail.com', TO_DATE('20/07/1982','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('84374349E', 'Antonio', 'Serrano Jiménez', 'Av de Alemania 14, Sevilla', '631410906', 'serranojimenez@gmail.com', TO_DATE('09/04/1957','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('17415738T', 'Ana', 'Jiménez Pérez', 'Av de Menéndez Pelayo 4, Sevilla', '739672026', 'jimenezperez@gmail.com', TO_DATE('26/11/1972','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('75976569W', 'Cristina', 'Ortiz Gómez', 'C/ Avicena 40, Sevilla', '742883291', 'ortizgomez@gmail.com', TO_DATE('19/04/1993','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('93627147N', 'Jesús', 'Díaz Delgado', 'Av de Menéndez Pelayo 49, Sevilla', '739117128', 'diazdelgado@gmail.com', TO_DATE('03/05/1962','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('80893303A', 'Antonio', 'Ortiz Marín', 'Alcalde Manuel del Valle 58, Sevilla', '629018394', 'ortizmarin@gmail.com', TO_DATE('05/01/1951','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('24360177A', 'Jesús', 'Pérez Sanz', 'C/ Avicena 95, Sevilla', '655559489', 'perezsanz@gmail.com', TO_DATE('17/09/2005','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('35973410F', 'Cristina', 'Gómez Molina', 'C/ San Juan Bosco 28, Sevilla', '675189532', 'gomezmolina@gmail.com', TO_DATE('10/03/1997','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('40203520A', 'José Luis', 'Vázquez Gil', 'C/ María Auxiliadora 39, Sevilla', '706081487', 'vazquezgil@gmail.com', TO_DATE('21/10/1960','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('89158364Z', 'Daniel', 'Fernández Martin', 'C/ Alfonso XII 84, Sevilla', '642864821', 'fernandezmartin@gmail.com', TO_DATE('10/05/1949','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('63761707A', 'Laura', 'Díaz Hernández', 'C/ Pureza 19, Sevilla', '654468711', 'diazhernandez@gmail.com', TO_DATE('02/08/1973','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('15339310N', 'José Antonio', 'Castro Rubio', 'C/ Republica Argentina 70, Sevilla', '702032724', 'castrorubio@gmail.com', TO_DATE('02/12/1948','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('61321132G', 'David', 'Hernández Marín', 'C/ Albareda 42, Sevilla', '656601923', 'hernandezmarin@gmail.com', TO_DATE('19/09/1993','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('50471760P', 'Cristina', 'Blanco Díaz', 'C/ Avicena 44, Sevilla', '627375043', 'blancodiaz@gmail.com', TO_DATE('19/04/1994','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('19500632J', 'María Pilar', 'Torres Rubio', 'C/ Arroyo 70, Sevilla', '669004775', 'torresrubio@gmail.com', TO_DATE('17/10/1985','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('12991484A', 'Ana', 'Morales Moreno', 'C/ Amador de Los Ríos 16, Sevilla', '747922695', 'moralesmoreno@gmail.com', TO_DATE('23/10/1954','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('79209955W', 'Cristina', 'Vázquez Domínguez', 'Av de las Palmeras 90, Sevilla', '630347687', 'vazquezdominguez@gmail.com', TO_DATE('16/06/1974','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('22102377K', 'Francisco Javier', 'Rodríguez Delgado', 'Av de Ramón y Cajal 35, Sevilla', '734211660', 'rodriguezdelgado@gmail.com', TO_DATE('22/06/1942','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('99398342R', 'Ana', 'Álvarez Pérez', 'Av Flota de Indias 20, Sevilla', '629516022', 'alvarezperez@gmail.com', TO_DATE('16/04/1982','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('16726071B', 'Isabel', 'Castro Pérez', 'C/ Juan Antonio Cavestany 14, Sevilla', '718575242', 'castroperez@gmail.com', TO_DATE('14/08/1998','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('17452498Y', 'Miguel', 'Ramos Alonso', 'C/ Blanco White 43, Sevilla', '696833337', 'ramosalonso@gmail.com', TO_DATE('25/06/2017','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('39240194D', 'Jesús', 'Rubio Suarez', 'Av de Ramón y Cajal 1, Sevilla', '670877250', 'rubiosuarez@gmail.com', TO_DATE('01/07/2000','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('15308326D', 'Jesús', 'Serrano Blanco', 'Av de la Constitución 86, Sevilla', '745698226', 'serranoblanco@gmail.com', TO_DATE('20/02/1998','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('40202691W', 'Ana', 'Ortiz Rubio', 'C/ Blanco White 59, Sevilla', '642178432', 'ortizrubio@gmail.com', TO_DATE('02/08/2006','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('75326842W', 'María Pilar', 'Gómez Delgado', 'Av del Alcalde Juan Fernández 79, Sevilla', '741272368', 'gomezdelgado@gmail.com', TO_DATE('08/10/1950','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('37901443L', 'Alejandro', 'González Torres', 'C/ Pureza 35, Sevilla', '742173164', 'gonzaleztorres@gmail.com', TO_DATE('19/03/1987','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('87940027X', 'Francisco', 'Molina Núñez', 'C/ Juan Antonio Cavestany 21, Sevilla', '631310422', 'molinanunez@gmail.com', TO_DATE('08/06/2008','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('46915325V', 'María Pilar', 'Alonso Álvarez', 'C/ Luis Montoto 95, Sevilla', '740939519', 'alonsoalvarez@gmail.com', TO_DATE('25/05/2002','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('39443491D', 'Francisco Javier', 'Fernández Suarez', 'C/ San Juan Bosco 6, Sevilla', '614388989', 'fernandezsuarez@gmail.com', TO_DATE('13/07/2000','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('40117411Y', 'Juan', 'Rubio Morales', 'C/ Pureza 42, Sevilla', '633183117', 'rubiomorales@gmail.com', TO_DATE('12/01/1968','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('24225099G', 'Francisco Javier', 'Morales Ramos', 'Av de las Palmeras 77, Sevilla', '625442600', 'moralesramos@gmail.com', TO_DATE('14/03/1985','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('32011204B', 'Jose', 'Núñez Pérez', 'C/ Corral Del Agua 66, Sevilla', '612896420', 'nunezperez@gmail.com', TO_DATE('04/11/2000','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('23577871L', 'Daniel', 'Serrano Núñez', 'Av del Doctor Fedriani 91, Sevilla', '724124698', 'serranonunez@gmail.com', TO_DATE('06/06/1979','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('84812386R', 'Daniel', 'Núñez Delgado', 'C/ Virgen de Montserrat 96, Sevilla', '751816127', 'nunezdelgado@gmail.com', TO_DATE('05/02/2018','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('41704474T', 'Ana María', 'Romero Romero', 'C/ Torres Quevedo 15, Sevilla', '617904993', 'romeroromero@gmail.com', TO_DATE('14/04/1988','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('43287270M', 'Francisco', 'Martin Ruiz', 'C/ Marqués de Nervión 18, Sevilla', '633799057', 'martinruiz@gmail.com', TO_DATE('24/06/1995','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('42572915F', 'Ana María', 'Ramírez Martin', 'C/ Amador de Los Ríos 2, Sevilla', '701923843', 'ramirezmartin@gmail.com', TO_DATE('27/04/1952','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('46487669T', 'María Teresa', 'Hernández Romero', 'C/ Isaac Newton 69, Sevilla', '683456454', 'hernandezromero@gmail.com', TO_DATE('18/10/1996','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('35508487Y', 'Jose', 'Suarez Gutiérrez', 'C/ Juan Antonio Cavestany 46, Sevilla', '748227689', 'suarezgutierrez@gmail.com', TO_DATE('11/06/2007','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('36202576R', 'Carlos', 'Rubio Ramírez', 'Alameda de Hércules 16, Sevilla', '633069339', 'rubioramirez@gmail.com', TO_DATE('11/05/1978','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('54124832J', 'María', 'Rodríguez Moreno', 'C/ Pages del Corro 77, Sevilla', '754384688', 'rodriguezmoreno@gmail.com', TO_DATE('19/03/1942','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('33078151B', 'María Pilar', 'Sánchez Rubio', 'C/ Pages del Corro 48, Sevilla', '711500895', 'sanchezrubio@gmail.com', TO_DATE('21/04/1947','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('91870267X', 'Cristina', 'Castro Gutiérrez', 'C/ Isaac Newton 91, Sevilla', '629672344', 'castrogutierrez@gmail.com', TO_DATE('23/04/2006','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('25780239E', 'María Pilar', 'Ruiz García', 'C/ Arroyo 100, Sevilla', '754743485', 'ruizgarcia@gmail.com', TO_DATE('13/10/1958','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('87934447L', 'Daniel', 'Rubio Martínez', 'C/ Avicena 41, Sevilla', '629116688', 'rubiomartinez@gmail.com', TO_DATE('02/12/2005','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('26200403E', 'Alejandro', 'Díaz Torres', 'C/ Condes de Bustillo 42, Sevilla', '688165422', 'diaztorres@gmail.com', TO_DATE('25/08/1956','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('35542296M', 'José Luis', 'Ruiz Delgado', 'Av de las Palmeras 98, Sevilla', '670539152', 'ruizdelgado@gmail.com', TO_DATE('20/10/1971','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('69887946P', 'Laura', 'Suarez Pérez', 'Av de la Buhaira 96, Sevilla', '740947419', 'suarezperez@gmail.com', TO_DATE('15/09/1958','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('35207821L', 'Jesús', 'Blanco Ortega', 'Av Flota de Indias 65, Sevilla', '631960895', 'blancoortega@gmail.com', TO_DATE('21/01/1976','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('72390329Z', 'Cristina', 'Molina Romero', 'Av del Doctor Fedriani 6, Sevilla', '620442157', 'molinaromero@gmail.com', TO_DATE('05/06/1980','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('29207548D', 'Carmen', 'Castro Molina', 'C/ Betis 65, Sevilla', '748719524', 'castromolina@gmail.com', TO_DATE('04/08/2011','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('60292819K', 'José Luis', 'Muñoz Marín', 'Av de Eduardo Dato 82, Sevilla', '648787398', 'munozmarin@gmail.com', TO_DATE('28/05/2005','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('94538590B', 'Daniel', 'Ramírez Jiménez', 'C/ Luis Montoto 43, Sevilla', '752073325', 'ramirezjimenez@gmail.com', TO_DATE('14/09/2012','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('61012141H', 'Carlos', 'Suarez Domínguez', 'C/ Betis 11, Sevilla', '610744830', 'suarezdominguez@gmail.com', TO_DATE('03/06/2018','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('13611242A', 'Manuel', 'Molina Moreno', 'Av de Eduardo Dato 21, Sevilla', '641669257', 'molinamoreno@gmail.com', TO_DATE('17/01/1973','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('80842754P', 'Josefa', 'Suarez Blanco', 'Av Flota de Indias 2, Sevilla', '607840605', 'suarezblanco@gmail.com', TO_DATE('18/06/2006','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('86438137C', 'María Ángeles', 'López Rodríguez', 'Av del Doctor Fedriani 80, Sevilla', '627735412', 'lopezrodriguez@gmail.com', TO_DATE('27/10/1985','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('67125525W', 'Jose', 'Fernández Vázquez', 'Av Ciudad de Chiva 11, Sevilla', '673228179', 'fernandezvazquez@gmail.com', TO_DATE('02/10/1956','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('65244980Y', 'Miguel', 'Marín Ramos', 'C/ Albareda 100, Sevilla', '639334145', 'marinramos@gmail.com', TO_DATE('26/08/1980','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('73527965R', 'Javier', 'Castro Díaz', 'Av de Ramón y Cajal 40, Sevilla', '732257422', 'castrodiaz@gmail.com', TO_DATE('25/10/2003','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('66225659B', 'Daniel', 'Moreno Castro', 'C/ Pureza 48, Sevilla', '619352420', 'morenocastro@gmail.com', TO_DATE('20/06/1960','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('73196954Y', 'Antonio', 'Vázquez Álvarez', 'C/ Arroyo 71, Sevilla', '614369868', 'vazquezalvarez@gmail.com', TO_DATE('04/04/1978','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('12872446J', 'Carlos', 'Morales Jiménez', 'Av del Doctor Fedriani 43, Sevilla', '696047851', 'moralesjimenez@gmail.com', TO_DATE('28/04/1999','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('65799704Q', 'Francisco', 'Blanco Domínguez', 'C/ Niebla 79, Sevilla', '678947862', 'blancodominguez@gmail.com', TO_DATE('24/08/1980','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('67274837K', 'Juan', 'Muñoz Alonso', 'C/ San Bernardo 7, Sevilla', '667236888', 'munozalonso@gmail.com', TO_DATE('10/05/2016','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('40131060Q', 'Marta', 'Rodríguez Ruiz', 'C/ Juan Sebastián El Cano 88, Sevilla', '700812191', 'rodriguezruiz@gmail.com', TO_DATE('26/05/1964','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('39953803C', 'Francisca', 'Molina Sánchez', 'C/ Marqués de Nervión 49, Sevilla', '634480206', 'molinasanchez@gmail.com', TO_DATE('25/02/2009','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('43272196L', 'José Antonio', 'Martínez Rubio', 'Av de la Borbolla 46, Sevilla', '742316837', 'martinezrubio@gmail.com', TO_DATE('28/04/2005','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('16623803R', 'Jesús', 'García Sánchez', 'Av de la Cruz del Campo 19, Sevilla', '605578435', 'garciasanchez@gmail.com', TO_DATE('05/08/2014','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('68525253L', 'Daniel', 'Castro Blanco', 'C/ Isaac Newton 18, Sevilla', '753066700', 'castroblanco@gmail.com', TO_DATE('18/11/1987','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('39790578A', 'Francisco', 'Ramos Jiménez', 'C/ Juan Sebastián El Cano 47, Sevilla', '664251105', 'ramosjimenez@gmail.com', TO_DATE('06/11/1946','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('92155072Y', 'José Luis', 'Martin Sánchez', 'C/ Torres Quevedo 73, Sevilla', '640042422', 'martinsanchez@gmail.com', TO_DATE('04/11/1990','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('43764621Z', 'María', 'Marín Gil', 'C/ Betis 60, Sevilla', '720353047', 'maringil@gmail.com', TO_DATE('08/11/1961','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('59222193E', 'Jesús', 'Díaz Sánchez', 'C/ María Auxiliadora 81, Sevilla', '674283666', 'diazsanchez@gmail.com', TO_DATE('09/12/1949','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('22591834S', 'Jesús', 'Ruiz Marín', 'C/ Amador de Los Ríos 9, Sevilla', '632286259', 'ruizmarin@gmail.com', TO_DATE('25/04/1948','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('38780944T', 'Antonio', 'Rubio Ortiz', 'C/ Luis Montoto 20, Sevilla', '703305641', 'rubioortiz@gmail.com', TO_DATE('22/04/1969','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('49432238V', 'María Pilar', 'López Rubio', 'Av Ciudad de Chiva 52, Sevilla', '644393769', 'lopezrubio@gmail.com', TO_DATE('24/06/1944','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('17031101S', 'Javier', 'Blanco Gutiérrez', 'C/ Amador de Los Ríos 45, Sevilla', '640190113', 'blancogutierrez@gmail.com', TO_DATE('21/07/2000','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('26242369J', 'Jesús', 'Blanco González', 'Av del Alcalde Juan Fernández 40, Sevilla', '680883415', 'blancogonzalez@gmail.com', TO_DATE('02/12/2003','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('37216305M', 'Francisco Javier', 'Molina Moreno', 'Av de la Constitución 16, Sevilla', '686837310', 'molinamoreno@gmail.com', TO_DATE('27/02/1952','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('17885506Q', 'Manuel', 'Pérez Núñez', 'Av de Eduardo Dato 37, Sevilla', '684261885', 'pereznunez@gmail.com', TO_DATE('03/02/1956','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('60810473Z', 'Jesús', 'Rubio Molina', 'C/ San Bernardo 85, Sevilla', '731954010', 'rubiomolina@gmail.com', TO_DATE('11/10/2002','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('76103614H', 'Cristina', 'Pérez Ruiz', 'Av del Romanticismo 38, Sevilla', '752131425', 'perezruiz@gmail.com', TO_DATE('11/01/1945','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('59287976W', 'Juan', 'Ruiz González', 'C/ Marqués De Paradas 57, Sevilla', '684916888', 'ruizgonzalez@gmail.com', TO_DATE('08/12/2010','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('23787561H', 'Isabel', 'Vázquez Díaz', 'C/ Pureza 33, Sevilla', '703998915', 'vazquezdiaz@gmail.com', TO_DATE('10/01/1988','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('63457151J', 'Antonio', 'Castro Alonso', 'C/ Niebla 67, Sevilla', '714958706', 'castroalonso@gmail.com', TO_DATE('02/12/1951','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('94927248S', 'Josefa', 'Sanz Moreno', 'Av de la Constitución 26, Sevilla', '642088824', 'sanzmoreno@gmail.com', TO_DATE('19/04/2006','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('31513315A', 'Francisco', 'Gómez Hernández', 'C/ Marqués de Nervión 56, Sevilla', '730546730', 'gomezhernandez@gmail.com', TO_DATE('17/07/2001','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('75937283T', 'Carmen', 'Martínez Navarro', 'Av de Kansas City 14, Sevilla', '706075561', 'martineznavarro@gmail.com', TO_DATE('18/08/1964','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('42408394M', 'Miguel', 'Romero Castro', 'C/ Niebla 87, Sevilla', '620070389', 'romerocastro@gmail.com', TO_DATE('28/05/1983','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('62594826G', 'Jesús', 'Martin López', 'Av de Eduardo Dato 80, Sevilla', '667033606', 'martinlopez@gmail.com', TO_DATE('12/06/1943','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('69527667R', 'Jesús', 'Rodríguez Rodríguez', 'C/ Pureza 98, Sevilla', '662393585', 'rodriguezrodriguez@gmail.com', TO_DATE('19/08/1990','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('59004208P', 'Josefa', 'Ramos Torres', 'C/ Amador de Los Ríos 76, Sevilla', '694074546', 'ramostorres@gmail.com', TO_DATE('23/05/2014','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('73237078H', 'María Teresa', 'Ramos Serrano', 'C/ Pages del Corro 97, Sevilla', '650050346', 'ramosserrano@gmail.com', TO_DATE('15/04/1954','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('89334295H', 'David', 'Gutiérrez Pérez', 'C/ Amador de Los Ríos 7, Sevilla', '673849803', 'gutierrezperez@gmail.com', TO_DATE('11/07/1940','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('13899786N', 'Jesús', 'Núñez Rodríguez', 'Av de la Buhaira 39, Sevilla', '697442553', 'nunezrodriguez@gmail.com', TO_DATE('25/06/1989','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('16931857Q', 'María Dolores', 'Sánchez Pérez', 'Av de las Palmeras 95, Sevilla', '704348943', 'sanchezperez@gmail.com', TO_DATE('02/12/1952','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('37123363Y', 'Isabel', 'Álvarez Moreno', 'C/ Condes de Bustillo 78, Sevilla', '674528191', 'alvarezmoreno@gmail.com', TO_DATE('04/03/2005','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('48840310V', 'María Teresa', 'Moreno Castro', 'Alcalde Manuel del Valle 89, Sevilla', '721023954', 'morenocastro@gmail.com', TO_DATE('15/09/1990','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('75289736H', 'José Antonio', 'Martin Delgado', 'C/ Juan Sebastián El Cano 58, Sevilla', '649119548', 'martindelgado@gmail.com', TO_DATE('10/02/1954','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('56297057A', 'Ana', 'González Hernández', 'C/ San Bernardo 99, Sevilla', '626333324', 'gonzalezhernandez@gmail.com', TO_DATE('16/12/1965','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('38653375N', 'Alejandro', 'Martínez Pérez', 'C/ Juan Sebastián El Cano 29, Sevilla', '641080679', 'martinezperez@gmail.com', TO_DATE('24/08/1956','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('12635113V', 'Francisca', 'Ramírez Ramírez', 'Av de las Palmeras 56, Sevilla', '620268776', 'ramirezramirez@gmail.com', TO_DATE('10/06/1969','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('64818166A', 'María Pilar', 'Blanco Rodríguez', 'C/ Niebla 68, Sevilla', '611686969', 'blancorodriguez@gmail.com', TO_DATE('06/02/1950','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('67640765L', 'Francisco Javier', 'Molina Suarez', 'C/ Pureza 98, Sevilla', '752438050', 'molinasuarez@gmail.com', TO_DATE('22/08/1977','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('18277043R', 'Daniel', 'Gómez Ramírez', 'C/ Blanco White 89, Sevilla', '702815290', 'gomezramirez@gmail.com', TO_DATE('02/10/1943','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('82655157B', 'Francisco Javier', 'Rodríguez Muñoz', 'C/ Marqués de Nervión 12, Sevilla', '730637758', 'rodriguezmunoz@gmail.com', TO_DATE('05/09/1943','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('15477961L', 'Laura', 'Díaz Ortega', 'C/ Marqués De Paradas 35, Sevilla', '721178127', 'diazortega@gmail.com', TO_DATE('06/12/1978','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('92487196X', 'Javier', 'Ortiz Castro', 'C/ Juan Ramón Jiménez 81, Sevilla', '717570988', 'ortizcastro@gmail.com', TO_DATE('13/10/1988','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('40797203X', 'Miguel', 'García Álvarez', 'Av de las Palmeras 19, Sevilla', '724418753', 'garciaalvarez@gmail.com', TO_DATE('05/06/2017','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('91471977B', 'Josefa', 'Vázquez Ramírez', 'C/ Juan Antonio Cavestany 82, Sevilla', '615255553', 'vazquezramirez@gmail.com', TO_DATE('19/02/1969','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('18463454C', 'Isabel', 'Martin Martínez', 'Av de Alemania 79, Sevilla', '739181378', 'martinmartinez@gmail.com', TO_DATE('19/11/2007','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('51417187C', 'María Teresa', 'Moreno Rubio', 'C/ Pages del Corro 20, Sevilla', '751933917', 'morenorubio@gmail.com', TO_DATE('10/05/1940','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('20550499E', 'María Pilar', 'Ortega Hernández', 'Av del Doctor Fedriani 42, Sevilla', '629273751', 'ortegahernandez@gmail.com', TO_DATE('25/12/2005','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('42550429S', 'María Dolores', 'Romero Blanco', 'Av de la Constitución 83, Sevilla', '648715570', 'romeroblanco@gmail.com', TO_DATE('27/09/1961','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('69324619C', 'Francisco Javier', 'Moreno Gutiérrez', 'Av Flota de Indias 98, Sevilla', '674584494', 'morenogutierrez@gmail.com', TO_DATE('15/07/1986','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('65726299G', 'María Teresa', 'Suarez Núñez', 'C/ María Auxiliadora 36, Sevilla', '638959450', 'suareznunez@gmail.com', TO_DATE('17/12/2016','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('41140469R', 'Francisco Javier', 'Jiménez Pérez', 'C/ Albareda 89, Sevilla', '679328431', 'jimenezperez@gmail.com', TO_DATE('11/02/1943','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('15843960L', 'David', 'Morales González', 'C/ Alfonso XII 79, Sevilla', '675721232', 'moralesgonzalez@gmail.com', TO_DATE('19/06/1974','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('60160318T', 'Jose', 'Ruiz López', 'C/ Marqués de Nervión 23, Sevilla', '689080838', 'ruizlopez@gmail.com', TO_DATE('03/12/1999','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('62257516N', 'Cristina', 'Martin Delgado', 'Av de Kansas City 68, Sevilla', '732499579', 'martindelgado@gmail.com', TO_DATE('09/07/1951','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('58700325R', 'Francisco', 'Ortiz Martin', 'C/ María Auxiliadora 56, Sevilla', '696381829', 'ortizmartin@gmail.com', TO_DATE('20/12/1982','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('18133900X', 'Juan', 'Serrano Sánchez', 'C/ Arroyo 7, Sevilla', '743973645', 'serranosanchez@gmail.com', TO_DATE('13/09/1995','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('14962570N', 'Francisca', 'Fernández Domínguez', 'C/ Corral Del Agua 80, Sevilla', '704530143', 'fernandezdominguez@gmail.com', TO_DATE('21/07/1956','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('68784312Y', 'Miguel', 'Romero Romero', 'Av de Ramón y Cajal 41, Sevilla', '691254698', 'romeroromero@gmail.com', TO_DATE('28/09/1942','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('55098988G', 'Marta', 'Navarro Ruiz', 'C/ Niebla 7, Sevilla', '619862251', 'navarroruiz@gmail.com', TO_DATE('14/03/1943','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('88483674Y', 'Ana', 'Gómez Torres', 'C/ Albareda 22, Sevilla', '623679148', 'gomeztorres@gmail.com', TO_DATE('20/02/1986','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('36279910D', 'Juan', 'Molina Muñoz', 'C/ Alfonso XII 22, Sevilla', '668574653', 'molinamunoz@gmail.com', TO_DATE('14/08/2006','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('78838771S', 'Francisco Javier', 'Vázquez Ruiz', 'Av de Alemania 36, Sevilla', '747133511', 'vazquezruiz@gmail.com', TO_DATE('12/10/1975','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('15658752F', 'Javier', 'Marín Núñez', 'Alameda de Hércules 30, Sevilla', '609855146', 'marinnunez@gmail.com', TO_DATE('05/04/2014','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('35439590V', 'José Antonio', 'Ramos Sánchez', 'Av de Blas Infante 36, Sevilla', '676537286', 'ramossanchez@gmail.com', TO_DATE('18/11/2000','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('68419970F', 'Francisco', 'Jiménez Martin', 'Alcalde Manuel del Valle 94, Sevilla', '670739998', 'jimenezmartin@gmail.com', TO_DATE('28/08/1981','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('86748794Q', 'Isabel', 'Delgado Castro', 'C/ Pureza 59, Sevilla', '608188792', 'delgadocastro@gmail.com', TO_DATE('28/11/1944','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('78120820D', 'Miguel', 'Sánchez Torres', 'Av del Romanticismo 20, Sevilla', '735405454', 'sancheztorres@gmail.com', TO_DATE('18/12/2013','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('85840048T', 'Isabel', 'Muñoz Núñez', 'Av de la Cruz del Campo 63, Sevilla', '679386806', 'munoznunez@gmail.com', TO_DATE('16/01/1954','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('29235168Y', 'Juan', 'Romero Suarez', 'C/ Marqués de Nervión 98, Sevilla', '700048714', 'romerosuarez@gmail.com', TO_DATE('18/12/1964','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('91618366M', 'Daniel', 'Moreno Núñez', 'C/ Luis Montoto 68, Sevilla', '731528178', 'morenonunez@gmail.com', TO_DATE('23/12/2000','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('92072549F', 'Francisco', 'Martínez Marín', 'Av de Blas Infante 76, Sevilla', '720859084', 'martinezmarin@gmail.com', TO_DATE('02/10/2010','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('38596226H', 'María Carmen', 'Muñoz Serrano', 'Av del Alcalde Juan Fernández 30, Sevilla', '686789608', 'munozserrano@gmail.com', TO_DATE('23/08/1985','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('90894743P', 'Antonio', 'Ortega González', 'Av de Eduardo Dato 90, Sevilla', '610869400', 'ortegagonzalez@gmail.com', TO_DATE('11/10/1963','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('22010370Z', 'Ana María', 'Ruiz Moreno', 'Av de las Palmeras 50, Sevilla', '619973317', 'ruizmoreno@gmail.com', TO_DATE('06/06/1999','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('44564032Z', 'Alejandro', 'Pérez Gutiérrez', 'Alameda de Hércules 36, Sevilla', '702157521', 'perezgutierrez@gmail.com', TO_DATE('27/08/1989','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('75467409Q', 'María', 'Marín Núñez', 'Av de Blas Infante 38, Sevilla', '611924174', 'marinnunez@gmail.com', TO_DATE('12/08/2004','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('47943521K', 'Isabel', 'Torres Ruiz', 'Av de Kansas City 22, Sevilla', '637923665', 'torresruiz@gmail.com', TO_DATE('22/04/1953','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('50472503S', 'Francisco Javier', 'Ortiz Sánchez', 'Av de la Cruz del Campo 95, Sevilla', '600197508', 'ortizsanchez@gmail.com', TO_DATE('04/09/1973','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('80207762T', 'Carlos', 'Gutiérrez Molina', 'C/ Republica Argentina 84, Sevilla', '735659468', 'gutierrezmolina@gmail.com', TO_DATE('24/02/2012','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('93705054H', 'Francisco Javier', 'Molina Moreno', 'Av del Doctor Fedriani 32, Sevilla', '617155467', 'molinamoreno@gmail.com', TO_DATE('17/04/1983','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('50355958B', 'Josefa', 'López Rubio', 'C/ Pages del Corro 33, Sevilla', '677699603', 'lopezrubio@gmail.com', TO_DATE('14/01/1949','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('42257076G', 'Ana', 'Ramírez Gutiérrez', 'Av de la Constitución 76, Sevilla', '613988023', 'ramirezgutierrez@gmail.com', TO_DATE('07/03/1964','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('54958599F', 'Antonio', 'Ramos Sanz', 'Av de las Palmeras 81, Sevilla', '711317091', 'ramossanz@gmail.com', TO_DATE('04/04/1991','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('93445275R', 'Laura', 'Domínguez González', 'Alcalde Juan Fernández 49, Sevilla', '677549065', 'dominguezgonzalez@gmail.com', TO_DATE('26/07/1992','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('98514697Q', 'María Dolores', 'Ramos Romero', 'Av de la Borbolla 4, Sevilla', '743596454', 'ramosromero@gmail.com', TO_DATE('12/12/1983','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('23718806X', 'Laura', 'Vázquez Delgado', 'Av del Romanticismo 26, Sevilla', '721273227', 'vazquezdelgado@gmail.com', TO_DATE('17/01/1983','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('85070450M', 'Carlos', 'Fernández Martin', 'C/ Arroyo 85, Sevilla', '615187991', 'fernandezmartin@gmail.com', TO_DATE('11/04/1956','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('66887795T', 'Jose', 'Álvarez Gutiérrez', 'Av del Doctor Fedriani 14, Sevilla', '687663053', 'alvarezgutierrez@gmail.com', TO_DATE('16/08/1991','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('82625864C', 'Manuel', 'Hernández Ruiz', 'C/ Virgen de Montserrat 47, Sevilla', '605617927', 'hernandezruiz@gmail.com', TO_DATE('06/05/1941','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('88779129A', 'Jose', 'Ortiz Romero', 'Av del Doctor Fedriani 38, Sevilla', '684324699', 'ortizromero@gmail.com', TO_DATE('24/05/1993','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('65374602T', 'David', 'Martin Morales', 'Av de la Constitución 80, Sevilla', '605012264', 'martinmorales@gmail.com', TO_DATE('01/02/1984','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('91695616K', 'Javier', 'Fernández Romero', 'C/ Marqués De Paradas 74, Sevilla', '640712843', 'fernandezromero@gmail.com', TO_DATE('03/09/2017','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('27884273Q', 'María Teresa', 'Alonso Martin', 'C/ Torres Quevedo 31, Sevilla', '683986944', 'alonsomartin@gmail.com', TO_DATE('01/10/1954','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('13020787G', 'María Dolores', 'López Delgado', 'Av de Alemania 36, Sevilla', '658396166', 'lopezdelgado@gmail.com', TO_DATE('16/07/1988','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('24576283R', 'Miguel', 'Marín Gil', 'Av de las Palmeras 90, Sevilla', '715223420', 'maringil@gmail.com', TO_DATE('28/01/1974','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('57681164Q', 'Miguel', 'Alonso Romero', 'C/ Torres Quevedo 43, Sevilla', '725905897', 'alonsoromero@gmail.com', TO_DATE('05/05/1956','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('38019076F', 'Laura', 'Alonso Ortega', 'C/ Isaac Newton 16, Sevilla', '695046153', 'alonsoortega@gmail.com', TO_DATE('19/04/1978','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('88457016M', 'Jesús', 'Gil Domínguez', 'C/ Condes de Bustillo 60, Sevilla', '686125619', 'gildominguez@gmail.com', TO_DATE('20/09/1989','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('72719920S', 'Antonio', 'Gutiérrez Serrano', 'Av de la Cruz del Campo 79, Sevilla', '660454499', 'gutierrezserrano@gmail.com', TO_DATE('22/03/2007','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('81032237V', 'Francisco Javier', 'Ruiz González', 'C/ Betis 28, Sevilla', '702097550', 'ruizgonzalez@gmail.com', TO_DATE('02/11/2009','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('18500993T', 'Josefa', 'Fernández Torres', 'C/ Condes de Bustillo 27, Sevilla', '726504990', 'fernandeztorres@gmail.com', TO_DATE('09/03/1972','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('98696063G', 'Jose', 'Jiménez Ortega', 'C/ Niebla 61, Sevilla', '698142269', 'jimenezortega@gmail.com', TO_DATE('15/06/2017','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('44456996C', 'Carlos', 'Muñoz Navarro', 'Av de las Palmeras 59, Sevilla', '753117926', 'munoznavarro@gmail.com', TO_DATE('09/12/1956','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('19245343R', 'Miguel', 'Alonso Alonso', 'C/ Virgen de Montserrat 92, Sevilla', '657921549', 'alonsoalonso@gmail.com', TO_DATE('17/03/1996','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('23097819T', 'José Luis', 'Ramírez Domínguez', 'C/ San Bernardo 68, Sevilla', '693657815', 'ramirezdominguez@gmail.com', TO_DATE('11/04/1941','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('19018872B', 'Ana', 'Vázquez Blanco', 'C/ Torres Quevedo 100, Sevilla', '695637139', 'vazquezblanco@gmail.com', TO_DATE('27/12/1965','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('32821988E', 'Carlos', 'Jiménez Jiménez', 'Av de la Cruz del Campo 70, Sevilla', '693409308', 'jimenezjimenez@gmail.com', TO_DATE('09/01/1940','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('55734006S', 'Francisco Javier', 'Rubio Gómez', 'Av de la Cruz del Campo 52, Sevilla', '691781137', 'rubiogomez@gmail.com', TO_DATE('23/03/1940','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('81605558V', 'Francisco', 'Muñoz Ramírez', 'Av de Grecia 70, Sevilla', '703978183', 'munozramirez@gmail.com', TO_DATE('25/05/1961','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('93094596A', 'María', 'Álvarez Gil', 'C/ Virgen de Montserrat 85, Sevilla', '725351954', 'alvarezgil@gmail.com', TO_DATE('27/06/1964','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('71539461P', 'María Pilar', 'Gómez Díaz', 'C/ Pages del Corro 12, Sevilla', '657568381', 'gomezdiaz@gmail.com', TO_DATE('09/06/1970','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('82070870Q', 'Laura', 'Sánchez Vázquez', 'Alcalde Juan Fernández 84, Sevilla', '601222615', 'sanchezvazquez@gmail.com', TO_DATE('10/11/1948','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('11849367C', 'Jose', 'Díaz Núñez', 'C/ Republica Argentina 42, Sevilla', '749979212', 'diaznunez@gmail.com', TO_DATE('21/08/1968','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('42274248H', 'Josefa', 'Gutiérrez Alonso', 'Av del Alcalde Juan Fernández 96, Sevilla', '667303888', 'gutierrezalonso@gmail.com', TO_DATE('14/02/2006','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('99641220E', 'María Dolores', 'Hernández Díaz', 'C/ Isaac Newton 37, Sevilla', '672509132', 'hernandezdiaz@gmail.com', TO_DATE('19/03/2004','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('46285099Z', 'Alejandro', 'Hernández Delgado', 'C/ Betis 5, Sevilla', '636921867', 'hernandezdelgado@gmail.com', TO_DATE('08/04/1976','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('76058436N', 'Juan', 'Muñoz Ramírez', 'C/ Corral Del Agua 39, Sevilla', '681855380', 'munozramirez@gmail.com', TO_DATE('20/07/1989','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('39526584A', 'Carmen', 'Gil Sánchez', 'Alcalde Manuel del Valle 19, Sevilla', '631373364', 'gilsanchez@gmail.com', TO_DATE('18/03/1947','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('62426569S', 'Daniel', 'Rubio Gómez', 'C/ María Auxiliadora 60, Sevilla', '646596792', 'rubiogomez@gmail.com', TO_DATE('13/12/1985','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('23517017T', 'Carmen', 'Fernández Moreno', 'C/ Virgen de Montserrat 26, Sevilla', '650102987', 'fernandezmoreno@gmail.com', TO_DATE('12/05/2008','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('11791200C', 'José Antonio', 'Ortiz Hernández', 'C/ Juan Sebastián El Cano 34, Sevilla', '645023107', 'ortizhernandez@gmail.com', TO_DATE('12/03/1973','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('73726287V', 'Antonio', 'Gil López', 'Av de Grecia 29, Sevilla', '673794607', 'gillopez@gmail.com', TO_DATE('27/03/1987','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('11695005B', 'José Luis', 'Gutiérrez Rodríguez', 'Alcalde Manuel del Valle 31, Sevilla', '656146034', 'gutierrezrodriguez@gmail.com', TO_DATE('14/08/1980','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('21218589P', 'Josefa', 'Moreno Suarez', 'C/ Virgen de Montserrat 56, Sevilla', '708845076', 'morenosuarez@gmail.com', TO_DATE('05/02/1986','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('22899139V', 'José Antonio', 'Pérez Rodríguez', 'C/ Republica Argentina 8, Sevilla', '666030814', 'perezrodriguez@gmail.com', TO_DATE('07/10/1970','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('18256766X', 'María Teresa', 'Molina Ortiz', 'C/ Alfonso XII 54, Sevilla', '677699295', 'molinaortiz@gmail.com', TO_DATE('15/01/1957','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('63302156S', 'Jose', 'Ortega López', 'Av de la Borbolla 95, Sevilla', '667933505', 'ortegalopez@gmail.com', TO_DATE('27/11/1967','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('87806187F', 'David', 'Domínguez Vázquez', 'Av de la Cruz del Campo 38, Sevilla', '618872502', 'dominguezvazquez@gmail.com', TO_DATE('20/03/1960','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('66128522A', 'Francisco Javier', 'García Romero', 'C/ Condes de Bustillo 57, Sevilla', '683656627', 'garciaromero@gmail.com', TO_DATE('18/06/2000','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('41791214F', 'Jesús', 'Ramírez Jiménez', 'C/ Pages del Corro 43, Sevilla', '693473155', 'ramirezjimenez@gmail.com', TO_DATE('03/08/1967','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('96633273S', 'José Antonio', 'Blanco Blanco', 'Alcalde Manuel del Valle 82, Sevilla', '645816800', 'blancoblanco@gmail.com', TO_DATE('03/03/1972','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('85551763C', 'José Luis', 'Romero Sanz', 'Av del Alcalde Juan Fernández 71, Sevilla', '615669317', 'romerosanz@gmail.com', TO_DATE('03/09/1950','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('16551282E', 'Carmen', 'Castro Domínguez', 'C/ Condes de Bustillo 90, Sevilla', '631268934', 'castrodominguez@gmail.com', TO_DATE('23/03/1944','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('74920519C', 'María Pilar', 'Navarro Ruiz', 'Av Ciudad de Chiva 6, Sevilla', '753033011', 'navarroruiz@gmail.com', TO_DATE('26/07/2011','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('59316499M', 'Juan', 'Suarez Sánchez', 'Alcalde Juan Fernández 91, Sevilla', '627099573', 'suarezsanchez@gmail.com', TO_DATE('10/06/1942','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('68488279Y', 'José Antonio', 'Sanz Sanz', 'Av Flota de Indias 99, Sevilla', '609808145', 'sanzsanz@gmail.com', TO_DATE('09/07/1970','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('86736345X', 'María Teresa', 'Sanz Gómez', 'Av del Romanticismo 85, Sevilla', '718327568', 'sanzgomez@gmail.com', TO_DATE('19/08/2018','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('19741532B', 'Francisco Javier', 'Delgado Vázquez', 'C/ Marqués de Nervión 3, Sevilla', '641126346', 'delgadovazquez@gmail.com', TO_DATE('07/03/1944','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('72917855N', 'María Pilar', 'Suarez Martin', 'C/ Avicena 65, Sevilla', '644815889', 'suarezmartin@gmail.com', TO_DATE('08/02/2005','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('45634517X', 'Laura', 'Rodríguez Gómez', 'Av de la Buhaira 10, Sevilla', '682291538', 'rodriguezgomez@gmail.com', TO_DATE('07/07/1963','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('69786105B', 'Francisca', 'Sánchez García', 'Av de Ramón y Cajal 68, Sevilla', '644570183', 'sanchezgarcia@gmail.com', TO_DATE('18/03/1947','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('90132995C', 'Laura', 'Jiménez Morales', 'Av de la Borbolla 22, Sevilla', '751542643', 'jimenezmorales@gmail.com', TO_DATE('01/03/1968','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('23733238K', 'Juan', 'González Marín', 'C/ María Auxiliadora 96, Sevilla', '677095204', 'gonzalezmarin@gmail.com', TO_DATE('07/01/2006','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('42708036A', 'Josefa', 'Morales Molina', 'Av del Alcalde Juan Fernández 28, Sevilla', '718781761', 'moralesmolina@gmail.com', TO_DATE('12/04/1953','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('77728676S', 'David', 'Serrano Sánchez', 'C/ Juan Ramón Jiménez 3, Sevilla', '706338141', 'serranosanchez@gmail.com', TO_DATE('25/04/2000','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('49671133B', 'Juan', 'Díaz Díaz', 'C/ Amador de Los Ríos 92, Sevilla', '600117546', 'diazdiaz@gmail.com', TO_DATE('07/04/1984','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('36796239B', 'Josefa', 'Sánchez Torres', 'C/ Marqués de Nervión 2, Sevilla', '741201457', 'sancheztorres@gmail.com', TO_DATE('19/04/1965','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('19016125R', 'María Teresa', 'Ruiz Blanco', 'C/ Betis 34, Sevilla', '651821810', 'ruizblanco@gmail.com', TO_DATE('26/09/1992','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('54114618B', 'Cristina', 'Navarro Blanco', 'Av de la Constitución 76, Sevilla', '751812299', 'navarroblanco@gmail.com', TO_DATE('06/04/1950','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('59051268X', 'Jose', 'Gutiérrez Navarro', 'Av de Menéndez Pelayo 73, Sevilla', '648360042', 'gutierreznavarro@gmail.com', TO_DATE('17/07/1972','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('90791385N', 'Daniel', 'García Serrano', 'C/ Arroyo 66, Sevilla', '601080984', 'garciaserrano@gmail.com', TO_DATE('18/03/1990','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('81547552V', 'Juan', 'Hernández Molina', 'Av de las Palmeras 77, Sevilla', '668738318', 'hernandezmolina@gmail.com', TO_DATE('17/08/1990','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('25449264V', 'Isabel', 'Blanco Hernández', 'C/ San Bernardo 22, Sevilla', '679813082', 'blancohernandez@gmail.com', TO_DATE('24/11/1940','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('17498858K', 'Cristina', 'Suarez Jiménez', 'C/ Juan Ramón Jiménez 53, Sevilla', '627011216', 'suarezjimenez@gmail.com', TO_DATE('04/11/1974','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('50866597G', 'Jesús', 'Alonso López', 'C/ Arroyo 87, Sevilla', '668475712', 'alonsolopez@gmail.com', TO_DATE('04/12/1950','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('49117999G', 'Ana María', 'Gil Pérez', 'C/ Avicena 16, Sevilla', '752296524', 'gilperez@gmail.com', TO_DATE('13/01/2002','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('53165296Z', 'María', 'Ortega García', 'C/ Condes de Bustillo 66, Sevilla', '631393793', 'ortegagarcia@gmail.com', TO_DATE('22/06/1947','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('37371038V', 'Carmen', 'Ortiz Torres', 'Av de las Palmeras 96, Sevilla', '704206790', 'ortiztorres@gmail.com', TO_DATE('26/12/1949','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('38868096M', 'Ana María', 'Gutiérrez Gil', 'Av de la Cruz del Campo 91, Sevilla', '606540472', 'gutierrezgil@gmail.com', TO_DATE('08/05/1966','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('37305046N', 'Marta', 'Díaz Núñez', 'C/ Juan Sebastián El Cano 69, Sevilla', '631423976', 'diaznunez@gmail.com', TO_DATE('24/11/1940','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('80731041Y', 'Francisco', 'García Delgado', 'C/ Juan Sebastián El Cano 26, Sevilla', '711471566', 'garciadelgado@gmail.com', TO_DATE('10/11/1951','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('77479806M', 'José Antonio', 'Romero Alonso', 'C/ San Bernardo 44, Sevilla', '619194261', 'romeroalonso@gmail.com', TO_DATE('22/07/1943','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('98984031N', 'Miguel', 'Díaz Pérez', 'Av de la Constitución 21, Sevilla', '638364606', 'diazperez@gmail.com', TO_DATE('14/07/1993','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('12735423R', 'María Carmen', 'Ramos Ruiz', 'C/ Republica Argentina 6, Sevilla', '715684897', 'ramosruiz@gmail.com', TO_DATE('06/08/1962','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('19731530Z', 'Javier', 'González Gil', 'C/ Virgen de Montserrat 15, Sevilla', '693806482', 'gonzalezgil@gmail.com', TO_DATE('07/08/1968','DD/MM/YYYY'), 2);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('40589301M', 'Marta', 'Hernández Fernández', 'C/ Torres Quevedo 44, Sevilla', '632563527', 'hernandezfernandez@gmail.com', TO_DATE('27/06/1980','DD/MM/YYYY'), 2);




INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('50604455Q', 'Ana', 'Castro Romero', 'C/ Republica Argentina 56, Sevilla', '738714745', 'castroromero@gmail.com', TO_DATE('20/02/2014','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('81469975L', 'Marta', 'Delgado Sanz', 'C/ Virgen de Montserrat 6, Sevilla', '665070633', 'delgadosanz@gmail.com', TO_DATE('03/08/1994','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('74454980R', 'Juan', 'Suarez Domínguez', 'C/ Pages del Corro 90, Sevilla', '700075811', 'suarezdominguez@gmail.com', TO_DATE('20/07/2010','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('57198253J', 'Francisco', 'Pérez Ortiz', 'C/ Juan Antonio Cavestany 83, Sevilla', '706274659', 'perezortiz@gmail.com', TO_DATE('28/01/1948','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('56720493D', 'Javier', 'Rubio Jiménez', 'Alcalde Manuel del Valle 94, Sevilla', '682521583', 'rubiojimenez@gmail.com', TO_DATE('05/02/1940','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('60041999Q', 'David', 'Hernández Torres', 'Av de Alemania 12, Sevilla', '695278825', 'hernandeztorres@gmail.com', TO_DATE('16/09/1994','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('39618157J', 'José Antonio', 'Muñoz Núñez', 'C/ Marqués De Paradas 88, Sevilla', '617115795', 'munoznunez@gmail.com', TO_DATE('18/01/1956','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('94954517Y', 'David', 'Ortiz Ramírez', 'Av de la Constitución 83, Sevilla', '612275901', 'ortizramirez@gmail.com', TO_DATE('06/01/1993','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('65300284H', 'Jesús', 'Castro Marín', 'Av de Blas Infante 2, Sevilla', '736454322', 'castromarin@gmail.com', TO_DATE('01/10/1993','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('56865277P', 'Laura', 'Delgado Marín', 'Av de la Borbolla 32, Sevilla', '700636722', 'delgadomarin@gmail.com', TO_DATE('13/08/1969','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('74194781R', 'Francisco Javier', 'Serrano Martínez', 'C/ Betis 72, Sevilla', '663899541', 'serranomartinez@gmail.com', TO_DATE('11/02/1961','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('89320078S', 'Cristina', 'Romero Suarez', 'C/ Juan Ramón Jiménez 13, Sevilla', '633786243', 'romerosuarez@gmail.com', TO_DATE('21/06/1997','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('37666626D', 'Cristina', 'Martínez Gil', 'C/ Luis Montoto 78, Sevilla', '677786962', 'martinezgil@gmail.com', TO_DATE('18/01/1992','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('15821921Z', 'María Teresa', 'Hernández Núñez', 'Av de Grecia 95, Sevilla', '708829263', 'hernandeznunez@gmail.com', TO_DATE('23/07/1973','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('61702081G', 'María Pilar', 'Romero Fernández', 'Av de la Borbolla 21, Sevilla', '694735985', 'romerofernandez@gmail.com', TO_DATE('03/04/1995','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('83533697C', 'José Luis', 'Gil Ruiz', 'C/ Blanco White 41, Sevilla', '681244212', 'gilruiz@gmail.com', TO_DATE('24/11/1944','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('15403970L', 'Carlos', 'Ramírez Ortiz', 'C/ Marqués De Paradas 100, Sevilla', '650710503', 'ramirezortiz@gmail.com', TO_DATE('25/12/1986','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('66030293F', 'Isabel', 'Vázquez Díaz', 'C/ Betis 8, Sevilla', '645563587', 'vazquezdiaz@gmail.com', TO_DATE('15/04/1990','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('87842710Y', 'Ana María', 'Sanz Ortega', 'C/ Avicena 82, Sevilla', '655164541', 'sanzortega@gmail.com', TO_DATE('02/06/1944','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('53715787T', 'Francisco Javier', 'Martin Martin', 'Av de Grecia 40, Sevilla', '673447711', 'martinmartin@gmail.com', TO_DATE('08/02/2008','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('90304706J', 'María Carmen', 'Ortega Alonso', 'C/ Luis Montoto 10, Sevilla', '735254965', 'ortegaalonso@gmail.com', TO_DATE('22/07/1946','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('75908128D', 'María Teresa', 'Castro Domínguez', 'Alcalde Manuel del Valle 4, Sevilla', '610653448', 'castrodominguez@gmail.com', TO_DATE('12/04/1965','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('32829325E', 'Francisco', 'Serrano Moreno', 'C/ Niebla 38, Sevilla', '721467216', 'serranomoreno@gmail.com', TO_DATE('27/08/1961','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('61724099B', 'Jesús', 'Fernández Blanco', 'C/ Juan Sebastián El Cano 22, Sevilla', '636841827', 'fernandezblanco@gmail.com', TO_DATE('05/05/1991','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('69390999E', 'María Dolores', 'Suarez Pérez', 'Av de Menéndez Pelayo 50, Sevilla', '736126845', 'suarezperez@gmail.com', TO_DATE('25/10/1966','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('73612386N', 'Marta', 'Muñoz Gómez', 'C/ Condes de Bustillo 99, Sevilla', '662236827', 'munozgomez@gmail.com', TO_DATE('10/12/2013','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('46754034W', 'María Pilar', 'Álvarez Martin', 'Av Ciudad de Chiva 85, Sevilla', '686603424', 'alvarezmartin@gmail.com', TO_DATE('01/04/1988','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('28583226E', 'María Ángeles', 'Ruiz García', 'C/ Republica Argentina 76, Sevilla', '626688534', 'ruizgarcia@gmail.com', TO_DATE('04/04/1947','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('93662881G', 'Francisco Javier', 'Álvarez González', 'C/ San Bernardo 98, Sevilla', '747987919', 'alvarezgonzalez@gmail.com', TO_DATE('23/12/2008','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('27405923C', 'Juan', 'Martínez Sánchez', 'C/ Blanco White 88, Sevilla', '745245514', 'martinezsanchez@gmail.com', TO_DATE('06/05/1954','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('31905473B', 'Francisco', 'Núñez Ruiz', 'C/ Pureza 27, Sevilla', '730658508', 'nunezruiz@gmail.com', TO_DATE('13/10/1945','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('48714445P', 'Marta', 'Núñez Serrano', 'Av de la Constitución 48, Sevilla', '609242339', 'nunezserrano@gmail.com', TO_DATE('05/08/1968','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('38422531L', 'Miguel', 'Ortega Ramos', 'C/ Juan Ramón Jiménez 22, Sevilla', '723490626', 'ortegaramos@gmail.com', TO_DATE('13/01/1967','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('23495328T', 'María', 'Moreno Moreno', 'C/ Niebla 48, Sevilla', '659195696', 'morenomoreno@gmail.com', TO_DATE('04/04/1970','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('48429020J', 'Isabel', 'Ortiz Gutiérrez', 'C/ Luis Montoto 52, Sevilla', '735045569', 'ortizgutierrez@gmail.com', TO_DATE('09/01/1950','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('94340490X', 'María Pilar', 'Suarez Moreno', 'Av de Kansas City 81, Sevilla', '615691848', 'suarezmoreno@gmail.com', TO_DATE('22/10/1996','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('54436834C', 'Francisco', 'Suarez Morales', 'C/ Republica Argentina 41, Sevilla', '697483595', 'suarezmorales@gmail.com', TO_DATE('17/06/1980','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('17660025G', 'María Teresa', 'Blanco Álvarez', 'C/ Marqués de Nervión 71, Sevilla', '604435983', 'blancoalvarez@gmail.com', TO_DATE('10/10/1969','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('63173408K', 'Juan', 'Ruiz Gómez', 'C/ Isaac Newton 30, Sevilla', '676220484', 'ruizgomez@gmail.com', TO_DATE('09/09/1942','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('80732267J', 'María Dolores', 'Vázquez González', 'Av de Menéndez Pelayo 13, Sevilla', '668213204', 'vazquezgonzalez@gmail.com', TO_DATE('15/06/2003','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('99379823C', 'José Luis', 'González Suarez', 'C/ Betis 94, Sevilla', '649445365', 'gonzalezsuarez@gmail.com', TO_DATE('18/01/1956','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('22746237L', 'Ana', 'Ramírez Ortiz', 'Av de las Palmeras 32, Sevilla', '654416535', 'ramirezortiz@gmail.com', TO_DATE('10/08/2001','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('49703584D', 'David', 'Delgado Alonso', 'Alameda de Hércules 83, Sevilla', '602847408', 'delgadoalonso@gmail.com', TO_DATE('20/10/2014','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('97166568D', 'María Dolores', 'Ortega López', 'C/ Marqués de Nervión 78, Sevilla', '621790775', 'ortegalopez@gmail.com', TO_DATE('21/10/2007','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('36695089S', 'David', 'Sánchez Romero', 'C/ Niebla 3, Sevilla', '722477888', 'sanchezromero@gmail.com', TO_DATE('20/05/1941','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('87045695X', 'Jose', 'Martínez Alonso', 'C/ Arroyo 51, Sevilla', '630548616', 'martinezalonso@gmail.com', TO_DATE('03/01/2013','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('76908078B', 'María Ángeles', 'Rodríguez Fernández', 'Av de Menéndez Pelayo 72, Sevilla', '709036593', 'rodriguezfernandez@gmail.com', TO_DATE('17/07/1987','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('39196356D', 'Cristina', 'Martin Núñez', 'C/ Condes de Bustillo 6, Sevilla', '750127913', 'martinnunez@gmail.com', TO_DATE('14/10/1962','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('26565051M', 'Carmen', 'Ortega Martínez', 'C/ Pages del Corro 56, Sevilla', '706396880', 'ortegamartinez@gmail.com', TO_DATE('26/04/2013','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('65646507E', 'Alejandro', 'Fernández Sanz', 'Av de la Buhaira 71, Sevilla', '703684212', 'fernandezsanz@gmail.com', TO_DATE('24/06/2000','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('82274994S', 'Francisca', 'Muñoz Díaz', 'C/ Alfonso XII 58, Sevilla', '630197287', 'munozdiaz@gmail.com', TO_DATE('27/07/1999','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('83978785N', 'Manuel', 'Ruiz Marín', 'Av del Romanticismo 4, Sevilla', '634704102', 'ruizmarin@gmail.com', TO_DATE('01/03/1986','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('99076215N', 'Ana', 'Rubio Moreno', 'C/ Condes de Bustillo 69, Sevilla', '662391200', 'rubiomoreno@gmail.com', TO_DATE('24/09/1973','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('45284745E', 'Isabel', 'Molina Jiménez', 'Av del Doctor Fedriani 51, Sevilla', '664653706', 'molinajimenez@gmail.com', TO_DATE('01/03/1944','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('88664075H', 'Juan', 'Rubio Blanco', 'C/ Albareda 3, Sevilla', '655443813', 'rubioblanco@gmail.com', TO_DATE('22/09/1992','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('16900812K', 'María Carmen', 'Martínez Sanz', 'C/ Amador de Los Ríos 71, Sevilla', '691359383', 'martinezsanz@gmail.com', TO_DATE('15/12/1971','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('53980773A', 'Isabel', 'Vázquez Domínguez', 'C/ San Bernardo 20, Sevilla', '714215088', 'vazquezdominguez@gmail.com', TO_DATE('15/01/1941','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('77840248Z', 'Jesús', 'Gil Rubio', 'C/ Condes de Bustillo 87, Sevilla', '690360306', 'gilrubio@gmail.com', TO_DATE('22/11/1967','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('35447199J', 'Miguel', 'Gil Martínez', 'C/ Juan Sebastián El Cano 35, Sevilla', '654279769', 'gilmartinez@gmail.com', TO_DATE('21/02/2006','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('88167305W', 'María', 'Álvarez Sanz', 'C/ San Bernardo 21, Sevilla', '625270262', 'alvarezsanz@gmail.com', TO_DATE('13/07/1965','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('34452786M', 'Daniel', 'Hernández Ramos', 'C/ San Juan Bosco 37, Sevilla', '724775315', 'hernandezramos@gmail.com', TO_DATE('10/12/1974','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('36924901B', 'María Dolores', 'Gómez Torres', 'Alcalde Juan Fernández 56, Sevilla', '742546944', 'gomeztorres@gmail.com', TO_DATE('19/12/1940','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('97294666C', 'Marta', 'Sánchez Delgado', 'C/ Blanco White 91, Sevilla', '602504614', 'sanchezdelgado@gmail.com', TO_DATE('02/07/1948','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('58682924B', 'Alejandro', 'López Pérez', 'Av de Eduardo Dato 6, Sevilla', '660556246', 'lopezperez@gmail.com', TO_DATE('01/05/1946','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('76856003P', 'Alejandro', 'Serrano Ortega', 'C/ San Bernardo 34, Sevilla', '680593046', 'serranoortega@gmail.com', TO_DATE('18/04/1956','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('84486358K', 'Jose', 'García Martínez', 'C/ Corral Del Agua 69, Sevilla', '704241032', 'garciamartinez@gmail.com', TO_DATE('02/06/1995','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('82085747N', 'Josefa', 'Domínguez Ortega', 'C/ Luis Montoto 83, Sevilla', '723907857', 'dominguezortega@gmail.com', TO_DATE('17/10/1969','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('41977491F', 'María Carmen', 'Sánchez Vázquez', 'Av de Blas Infante 18, Sevilla', '726482822', 'sanchezvazquez@gmail.com', TO_DATE('17/01/1960','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('87197619L', 'David', 'Gil Gutiérrez', 'C/ Isaac Newton 48, Sevilla', '727790180', 'gilgutierrez@gmail.com', TO_DATE('06/05/1979','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('78277700Y', 'Francisco', 'Moreno Navarro', 'C/ Betis 74, Sevilla', '738612851', 'morenonavarro@gmail.com', TO_DATE('18/10/1969','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('26462764E', 'Manuel', 'Ruiz Núñez', 'C/ Torres Quevedo 17, Sevilla', '702442834', 'ruiznunez@gmail.com', TO_DATE('07/04/1995','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('39238794N', 'María Carmen', 'Navarro Martínez', 'C/ San Bernardo 67, Sevilla', '603088114', 'navarromartinez@gmail.com', TO_DATE('20/03/1947','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('32025841C', 'Carlos', 'Alonso Martin', 'C/ Betis 28, Sevilla', '751853423', 'alonsomartin@gmail.com', TO_DATE('17/12/1955','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('98256456L', 'Ana', 'Sánchez Marín', 'C/ Albareda 4, Sevilla', '683962565', 'sanchezmarin@gmail.com', TO_DATE('14/11/1984','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('78287593D', 'José Luis', 'Rodríguez Molina', 'C/ Condes de Bustillo 9, Sevilla', '708666042', 'rodriguezmolina@gmail.com', TO_DATE('14/11/1994','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('48029436P', 'David', 'Hernández Serrano', 'Av de Alemania 8, Sevilla', '750614494', 'hernandezserrano@gmail.com', TO_DATE('18/08/2000','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('33529524D', 'Jose', 'Delgado Suarez', 'Av de Alemania 78, Sevilla', '601622656', 'delgadosuarez@gmail.com', TO_DATE('18/09/2016','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('84775227X', 'Isabel', 'Navarro Delgado', 'C/ Amador de Los Ríos 97, Sevilla', '662267548', 'navarrodelgado@gmail.com', TO_DATE('22/09/2002','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('29488709H', 'Jesús', 'Gómez López', 'C/ Alfonso XII 25, Sevilla', '709998447', 'gomezlopez@gmail.com', TO_DATE('26/01/1969','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('77129108B', 'María Teresa', 'Pérez Muñoz', 'Alcalde Manuel del Valle 23, Sevilla', '636546738', 'perezmunoz@gmail.com', TO_DATE('09/03/1994','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('25276790C', 'Ana', 'Martin Alonso', 'C/ Marqués de Nervión 87, Sevilla', '709988267', 'martinalonso@gmail.com', TO_DATE('18/10/1972','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('21089007P', 'José Luis', 'Ortega Morales', 'C/ Amador de Los Ríos 95, Sevilla', '645163351', 'ortegamorales@gmail.com', TO_DATE('26/12/1973','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('76500654D', 'Daniel', 'Delgado Rubio', 'C/ Isaac Newton 73, Sevilla', '721153580', 'delgadorubio@gmail.com', TO_DATE('04/09/1968','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('89801467Z', 'Marta', 'Sánchez Torres', 'Av de Ramón y Cajal 95, Sevilla', '731816544', 'sancheztorres@gmail.com', TO_DATE('23/10/1994','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('67090784Z', 'Laura', 'González Romero', 'Av de Kansas City 6, Sevilla', '678807418', 'gonzalezromero@gmail.com', TO_DATE('25/07/1974','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('98892013V', 'Laura', 'Delgado Jiménez', 'C/ Marqués De Paradas 53, Sevilla', '735223179', 'delgadojimenez@gmail.com', TO_DATE('02/06/1965','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('85356737B', 'Francisco Javier', 'Delgado Alonso', 'C/ Pages del Corro 97, Sevilla', '732878140', 'delgadoalonso@gmail.com', TO_DATE('23/02/1983','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('79785330D', 'María Carmen', 'Álvarez Ramírez', 'Av de Ramón y Cajal 16, Sevilla', '630057270', 'alvarezramirez@gmail.com', TO_DATE('23/07/1959','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('69170678H', 'Josefa', 'Martínez Domínguez', 'Av de Kansas City 96, Sevilla', '681980956', 'martinezdominguez@gmail.com', TO_DATE('24/07/1990','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('61638639L', 'María Teresa', 'López Morales', 'C/ Condes de Bustillo 50, Sevilla', '636654491', 'lopezmorales@gmail.com', TO_DATE('10/05/1989','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('93463086X', 'Carlos', 'Delgado Navarro', 'Av de Ramón y Cajal 65, Sevilla', '600618413', 'delgadonavarro@gmail.com', TO_DATE('18/11/1983','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('99655774V', 'Laura', 'Vázquez Ruiz', 'C/ San Bernardo 57, Sevilla', '737925319', 'vazquezruiz@gmail.com', TO_DATE('10/03/1955','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('93161570R', 'Jesús', 'Vázquez López', 'C/ Condes de Bustillo 90, Sevilla', '666587408', 'vazquezlopez@gmail.com', TO_DATE('09/02/1988','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('76441024H', 'María Pilar', 'Ramos Jiménez', 'C/ María Auxiliadora 66, Sevilla', '740930161', 'ramosjimenez@gmail.com', TO_DATE('03/03/1989','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('20787367J', 'Manuel', 'Torres Sanz', 'Av de Ramón y Cajal 23, Sevilla', '683924880', 'torressanz@gmail.com', TO_DATE('07/02/1990','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('16022350K', 'María Carmen', 'Moreno Marín', 'Av de Menéndez Pelayo 88, Sevilla', '713758409', 'morenomarin@gmail.com', TO_DATE('10/04/1959','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('57087193C', 'Cristina', 'Marín Gutiérrez', 'C/ Marqués de Nervión 7, Sevilla', '655460043', 'maringutierrez@gmail.com', TO_DATE('21/08/1981','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('20351748Z', 'José Antonio', 'Blanco Suarez', 'Av de Menéndez Pelayo 57, Sevilla', '616577699', 'blancosuarez@gmail.com', TO_DATE('17/06/2007','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('63728591F', 'Josefa', 'Núñez Rubio', 'Av de la Constitución 77, Sevilla', '673313569', 'nunezrubio@gmail.com', TO_DATE('20/10/2007','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('53003400S', 'Francisco', 'Navarro González', 'C/ Juan Antonio Cavestany 45, Sevilla', '754523424', 'navarrogonzalez@gmail.com', TO_DATE('03/04/2007','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('36563716H', 'Javier', 'Castro Rodríguez', 'Av de Menéndez Pelayo 34, Sevilla', '683156468', 'castrorodriguez@gmail.com', TO_DATE('19/02/1964','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('37447935W', 'Carmen', 'Delgado Alonso', 'C/ Amador de Los Ríos 9, Sevilla', '716204190', 'delgadoalonso@gmail.com', TO_DATE('16/12/2012','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('14429008G', 'Juan', 'Martin Navarro', 'C/ San Bernardo 32, Sevilla', '709585516', 'martinnavarro@gmail.com', TO_DATE('26/06/2005','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('49276359D', 'Jesús', 'García Serrano', 'Av del Alcalde Juan Fernández 11, Sevilla', '635364959', 'garciaserrano@gmail.com', TO_DATE('15/01/1940','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('31433516Z', 'María Carmen', 'Martin Gutiérrez', 'Av de Menéndez Pelayo 20, Sevilla', '736700454', 'martingutierrez@gmail.com', TO_DATE('13/10/2018','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('20213706H', 'Alejandro', 'Ortega Castro', 'Av de la Cruz del Campo 96, Sevilla', '740863180', 'ortegacastro@gmail.com', TO_DATE('18/02/1959','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('67498104G', 'David', 'Jiménez Castro', 'C/ Albareda 34, Sevilla', '666916144', 'jimenezcastro@gmail.com', TO_DATE('07/10/1957','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('62226777R', 'María', 'Ramos Fernández', 'C/ Juan Ramón Jiménez 79, Sevilla', '602870445', 'ramosfernandez@gmail.com', TO_DATE('05/07/1999','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('41219787S', 'Jose', 'Ortiz Suarez', 'C/ Alfonso XII 39, Sevilla', '635403977', 'ortizsuarez@gmail.com', TO_DATE('23/12/1953','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('80050755Z', 'Marta', 'Marín Gutiérrez', 'C/ Juan Sebastián El Cano 66, Sevilla', '740029528', 'maringutierrez@gmail.com', TO_DATE('04/04/1955','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('80791317E', 'Laura', 'Alonso Romero', 'Av Ciudad de Chiva 98, Sevilla', '628086467', 'alonsoromero@gmail.com', TO_DATE('15/08/1993','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('32247893F', 'María Pilar', 'Martínez Muñoz', 'Av Ciudad de Chiva 88, Sevilla', '646651945', 'martinezmunoz@gmail.com', TO_DATE('01/11/2009','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('57628477E', 'Josefa', 'Morales Gil', 'Av de la Cruz del Campo 16, Sevilla', '608573704', 'moralesgil@gmail.com', TO_DATE('20/03/1944','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('68740663B', 'Marta', 'García Delgado', 'Av de la Borbolla 39, Sevilla', '637878753', 'garciadelgado@gmail.com', TO_DATE('22/10/1998','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('47292802H', 'Daniel', 'García Gutiérrez', 'C/ Virgen de Montserrat 28, Sevilla', '692254915', 'garciagutierrez@gmail.com', TO_DATE('06/06/1994','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('28363684S', 'Francisca', 'García Morales', 'C/ Alfonso XII 60, Sevilla', '602433056', 'garciamorales@gmail.com', TO_DATE('25/08/1978','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('28479378L', 'Francisca', 'Castro Navarro', 'C/ Juan Antonio Cavestany 15, Sevilla', '645452195', 'castronavarro@gmail.com', TO_DATE('20/04/1969','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('72868467M', 'Jose', 'Blanco Ortega', 'Av de Blas Infante 2, Sevilla', '677009597', 'blancoortega@gmail.com', TO_DATE('12/05/1986','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('63265863Q', 'Miguel', 'Gutiérrez Martin', 'C/ Pureza 66, Sevilla', '661780368', 'gutierrezmartin@gmail.com', TO_DATE('12/02/2007','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('16645812E', 'Antonio', 'Martin Martínez', 'C/ Blanco White 46, Sevilla', '712450579', 'martinmartinez@gmail.com', TO_DATE('02/04/2014','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('59174165H', 'María Pilar', 'Morales Fernández', 'C/ Virgen de Montserrat 20, Sevilla', '637774375', 'moralesfernandez@gmail.com', TO_DATE('04/12/1962','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('78415819X', 'Ana', 'Marín González', 'C/ Isaac Newton 19, Sevilla', '649056769', 'maringonzalez@gmail.com', TO_DATE('20/09/1963','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('88179041P', 'Daniel', 'Romero Suarez', 'C/ Marqués de Nervión 84, Sevilla', '675596474', 'romerosuarez@gmail.com', TO_DATE('08/02/2000','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('34093096N', 'José Antonio', 'Jiménez Delgado', 'Av Flota de Indias 25, Sevilla', '716906971', 'jimenezdelgado@gmail.com', TO_DATE('28/07/1976','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('31357705B', 'María Ángeles', 'Pérez Rubio', 'C/ Juan Ramón Jiménez 21, Sevilla', '751914713', 'perezrubio@gmail.com', TO_DATE('06/03/1940','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('16500425H', 'Alejandro', 'Díaz Domínguez', 'C/ Juan Antonio Cavestany 62, Sevilla', '685130796', 'diazdominguez@gmail.com', TO_DATE('01/12/1974','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('43229187C', 'María Carmen', 'Ruiz Ramírez', 'Av de Blas Infante 86, Sevilla', '722254949', 'ruizramirez@gmail.com', TO_DATE('08/09/1973','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('55308438Q', 'María Teresa', 'González Núñez', 'C/ Marqués de Nervión 74, Sevilla', '694248354', 'gonzaleznunez@gmail.com', TO_DATE('12/09/1994','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('74505876K', 'María Dolores', 'Díaz Ruiz', 'C/ Corral Del Agua 8, Sevilla', '696362076', 'diazruiz@gmail.com', TO_DATE('25/03/1965','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('28119702V', 'María Ángeles', 'Álvarez Rubio', 'Alcalde Juan Fernández 78, Sevilla', '654991888', 'alvarezrubio@gmail.com', TO_DATE('13/04/1993','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('32392027T', 'Marta', 'Serrano Pérez', 'Av de Ramón y Cajal 86, Sevilla', '638905029', 'serranoperez@gmail.com', TO_DATE('24/07/1947','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('84411100L', 'Carlos', 'Suarez Díaz', 'C/ Corral Del Agua 18, Sevilla', '716201246', 'suarezdiaz@gmail.com', TO_DATE('08/01/2007','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('11253114L', 'Jose', 'García Sanz', 'C/ San Bernardo 57, Sevilla', '664650411', 'garciasanz@gmail.com', TO_DATE('27/01/1952','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('47542540E', 'María Carmen', 'Sánchez Muñoz', 'Av de la Cruz del Campo 51, Sevilla', '600257195', 'sanchezmunoz@gmail.com', TO_DATE('15/04/1955','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('18754077S', 'María', 'Fernández Hernández', 'C/ Amador de Los Ríos 41, Sevilla', '719306386', 'fernandezhernandez@gmail.com', TO_DATE('12/11/1948','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('86048099Q', 'Francisca', 'Morales Fernández', 'C/ Marqués de Nervión 33, Sevilla', '600595925', 'moralesfernandez@gmail.com', TO_DATE('12/06/1987','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('18594067Q', 'Juan', 'Gil Gutiérrez', 'C/ Torres Quevedo 51, Sevilla', '665875076', 'gilgutierrez@gmail.com', TO_DATE('03/10/1970','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('52391062Y', 'Francisco Javier', 'Delgado Núñez', 'Av del Doctor Fedriani 72, Sevilla', '632229347', 'delgadonunez@gmail.com', TO_DATE('17/12/1941','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('91911917F', 'Ana María', 'Ramírez Moreno', 'Av de Alemania 7, Sevilla', '699098612', 'ramirezmoreno@gmail.com', TO_DATE('21/06/1981','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('67371887B', 'José Antonio', 'Ramos Gil', 'Av del Doctor Fedriani 56, Sevilla', '620490051', 'ramosgil@gmail.com', TO_DATE('05/04/2013','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('88924181V', 'Cristina', 'González González', 'C/ Marqués De Paradas 35, Sevilla', '743738891', 'gonzalezgonzalez@gmail.com', TO_DATE('14/04/2002','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('55433895P', 'Laura', 'González González', 'C/ Torres Quevedo 77, Sevilla', '645969634', 'gonzalezgonzalez@gmail.com', TO_DATE('19/08/1960','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('45026896A', 'Ana María', 'Ortiz Ruiz', 'C/ San Bernardo 75, Sevilla', '631097933', 'ortizruiz@gmail.com', TO_DATE('28/06/1953','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('82293549D', 'Jesús', 'Castro Ortiz', 'Av de la Borbolla 2, Sevilla', '681131825', 'castroortiz@gmail.com', TO_DATE('22/04/1997','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('86211762B', 'Manuel', 'Fernández Álvarez', 'C/ Virgen de Montserrat 15, Sevilla', '659944252', 'fernandezalvarez@gmail.com', TO_DATE('03/11/1979','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('60419620T', 'Ana María', 'Ortiz Vázquez', 'C/ Pages del Corro 19, Sevilla', '739973432', 'ortizvazquez@gmail.com', TO_DATE('11/03/2000','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('55539867L', 'María', 'Alonso Martínez', 'C/ Republica Argentina 46, Sevilla', '659511283', 'alonsomartinez@gmail.com', TO_DATE('04/12/1959','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('47502762B', 'Juan', 'Pérez Delgado', 'Av de la Cruz del Campo 55, Sevilla', '626775357', 'perezdelgado@gmail.com', TO_DATE('06/02/1949','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('40355741X', 'María Teresa', 'González Pérez', 'C/ Juan Ramón Jiménez 45, Sevilla', '746734481', 'gonzalezperez@gmail.com', TO_DATE('25/02/2007','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('77131621V', 'Francisca', 'Ramírez Ortega', 'C/ Pages del Corro 57, Sevilla', '613729880', 'ramirezortega@gmail.com', TO_DATE('15/08/1994','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('67423965V', 'Laura', 'Ramírez Fernández', 'C/ Blanco White 6, Sevilla', '682371844', 'ramirezfernandez@gmail.com', TO_DATE('11/02/2016','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('82841555V', 'Manuel', 'Morales Romero', 'Av de Grecia 100, Sevilla', '740531345', 'moralesromero@gmail.com', TO_DATE('16/08/2014','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('27228719P', 'Laura', 'Rubio Romero', 'C/ Pureza 60, Sevilla', '617465723', 'rubioromero@gmail.com', TO_DATE('18/10/1952','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('34997642Z', 'Laura', 'Sánchez Sánchez', 'Av de la Buhaira 52, Sevilla', '718259037', 'sanchezsanchez@gmail.com', TO_DATE('20/12/2011','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('76519813D', 'Ana', 'Morales Moreno', 'Alcalde Juan Fernández 87, Sevilla', '697668519', 'moralesmoreno@gmail.com', TO_DATE('12/10/1994','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('71025889A', 'Miguel', 'Díaz Serrano', 'Av de Eduardo Dato 55, Sevilla', '743349087', 'diazserrano@gmail.com', TO_DATE('05/06/2005','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('15023567J', 'Francisca', 'Navarro Torres', 'Av de la Constitución 34, Sevilla', '701978473', 'navarrotorres@gmail.com', TO_DATE('04/06/2005','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('44703257C', 'Cristina', 'Sanz Torres', 'Av de Menéndez Pelayo 17, Sevilla', '686692778', 'sanztorres@gmail.com', TO_DATE('08/12/1998','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('93811300G', 'María Teresa', 'Morales Hernández', 'C/ Blanco White 14, Sevilla', '611151188', 'moraleshernandez@gmail.com', TO_DATE('28/07/1990','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('95380032K', 'Francisco Javier', 'García Blanco', 'Av de la Borbolla 68, Sevilla', '608445300', 'garciablanco@gmail.com', TO_DATE('10/06/1980','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('32955321R', 'María', 'Rubio Martínez', 'Av de Kansas City 48, Sevilla', '652535844', 'rubiomartinez@gmail.com', TO_DATE('05/11/1963','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('14189470B', 'Carmen', 'Romero Gutiérrez', 'Av Ciudad de Chiva 87, Sevilla', '650423778', 'romerogutierrez@gmail.com', TO_DATE('27/12/2008','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('37095179C', 'Ana María', 'Gil Núñez', 'Av de la Constitución 24, Sevilla', '646621527', 'gilnunez@gmail.com', TO_DATE('01/10/1986','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('82030598V', 'Cristina', 'López Martínez', 'C/ San Bernardo 10, Sevilla', '613498108', 'lopezmartinez@gmail.com', TO_DATE('16/10/2011','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('66152728J', 'Josefa', 'Ramírez Martínez', 'C/ Albareda 99, Sevilla', '680121717', 'ramirezmartinez@gmail.com', TO_DATE('11/03/2005','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('51085500Q', 'José Antonio', 'Rodríguez Moreno', 'Av del Doctor Fedriani 45, Sevilla', '706342668', 'rodriguezmoreno@gmail.com', TO_DATE('20/02/1950','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('23669999D', 'Alejandro', 'Navarro Rubio', 'C/ Pages del Corro 62, Sevilla', '736023448', 'navarrorubio@gmail.com', TO_DATE('20/05/1940','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('60644511C', 'María Dolores', 'Muñoz Ortega', 'C/ Niebla 8, Sevilla', '746109613', 'munozortega@gmail.com', TO_DATE('19/09/1941','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('68277532P', 'Carlos', 'Fernández Rubio', 'C/ Blanco White 4, Sevilla', '640179580', 'fernandezrubio@gmail.com', TO_DATE('09/02/1973','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('61423058V', 'Cristina', 'Fernández Gutiérrez', 'C/ Arroyo 35, Sevilla', '697367003', 'fernandezgutierrez@gmail.com', TO_DATE('09/11/1955','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('15610534C', 'Manuel', 'Sanz Molina', 'Av de Alemania 15, Sevilla', '651015397', 'sanzmolina@gmail.com', TO_DATE('27/06/1980','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('15810276F', 'Carlos', 'Torres Torres', 'C/ Juan Ramón Jiménez 81, Sevilla', '661832790', 'torrestorres@gmail.com', TO_DATE('27/09/1959','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('40242012Q', 'Isabel', 'Rubio Vázquez', 'Av del Doctor Fedriani 11, Sevilla', '637939823', 'rubiovazquez@gmail.com', TO_DATE('18/04/1962','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('60649846L', 'Daniel', 'Pérez Molina', 'C/ Blanco White 87, Sevilla', '640492754', 'perezmolina@gmail.com', TO_DATE('21/04/1952','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('71914601H', 'Ana María', 'Serrano Hernández', 'Av Ciudad de Chiva 5, Sevilla', '613114520', 'serranohernandez@gmail.com', TO_DATE('22/01/1967','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('28169513X', 'María Teresa', 'Gil Martin', 'C/ San Bernardo 6, Sevilla', '637805600', 'gilmartin@gmail.com', TO_DATE('22/12/1961','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('64292714D', 'María Dolores', 'Ramírez Ortiz', 'C/ Arroyo 11, Sevilla', '731754622', 'ramirezortiz@gmail.com', TO_DATE('11/10/1943','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('38515158W', 'José Luis', 'Martínez Sanz', 'C/ Blanco White 73, Sevilla', '720534193', 'martinezsanz@gmail.com', TO_DATE('07/11/2004','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('77669329P', 'María Pilar', 'Rubio Jiménez', 'C/ Virgen de Montserrat 57, Sevilla', '754870981', 'rubiojimenez@gmail.com', TO_DATE('09/01/1981','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('22862834Y', 'Ana', 'Morales Domínguez', 'C/ Torres Quevedo 91, Sevilla', '658095436', 'moralesdominguez@gmail.com', TO_DATE('07/08/1981','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('79815212Z', 'María Dolores', 'Moreno Ramos', 'Av de Eduardo Dato 59, Sevilla', '694052516', 'morenoramos@gmail.com', TO_DATE('13/08/1997','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('16331462J', 'Juan', 'Martínez Muñoz', 'C/ San Juan Bosco 63, Sevilla', '671014803', 'martinezmunoz@gmail.com', TO_DATE('23/02/2014','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('93473096S', 'Daniel', 'Delgado Muñoz', 'C/ Betis 74, Sevilla', '631411054', 'delgadomunoz@gmail.com', TO_DATE('09/02/1953','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('68302097D', 'María Dolores', 'Delgado López', 'Av del Romanticismo 76, Sevilla', '677927770', 'delgadolopez@gmail.com', TO_DATE('19/03/1972','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('38889276W', 'Francisco', 'Hernández Muñoz', 'Av de Eduardo Dato 44, Sevilla', '675217754', 'hernandezmunoz@gmail.com', TO_DATE('04/07/2005','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('66714315D', 'Josefa', 'Blanco Gómez', 'Av de la Borbolla 63, Sevilla', '711781610', 'blancogomez@gmail.com', TO_DATE('20/09/2010','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('52410804Z', 'Francisco', 'Hernández Moreno', 'C/ Niebla 37, Sevilla', '716438241', 'hernandezmoreno@gmail.com', TO_DATE('26/06/1989','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('21513547Z', 'Laura', 'Muñoz Moreno', 'C/ Juan Sebastián El Cano 88, Sevilla', '640491239', 'munozmoreno@gmail.com', TO_DATE('02/09/1961','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('12900344N', 'Ana', 'Vázquez Marín', 'C/ Albareda 50, Sevilla', '749852017', 'vazquezmarin@gmail.com', TO_DATE('24/03/2002','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('21339885W', 'María Dolores', 'Blanco Morales', 'C/ Betis 7, Sevilla', '672771569', 'blancomorales@gmail.com', TO_DATE('24/06/1983','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('17641703J', 'Francisca', 'Torres Pérez', 'Alameda de Hércules 58, Sevilla', '604478813', 'torresperez@gmail.com', TO_DATE('28/01/1986','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('97596435Y', 'Marta', 'Núñez Pérez', 'Av de la Cruz del Campo 34, Sevilla', '747923928', 'nunezperez@gmail.com', TO_DATE('17/04/1957','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('89996401T', 'Jose', 'Sánchez Marín', 'C/ Alfonso XII 34, Sevilla', '752200270', 'sanchezmarin@gmail.com', TO_DATE('17/02/1954','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('72556627E', 'Francisca', 'Ruiz Moreno', 'Av de la Buhaira 44, Sevilla', '731745537', 'ruizmoreno@gmail.com', TO_DATE('26/10/1991','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('60714776C', 'Francisco Javier', 'Navarro Ortiz', 'C/ Albareda 84, Sevilla', '730604226', 'navarroortiz@gmail.com', TO_DATE('13/07/1976','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('25155358M', 'María Dolores', 'Navarro Gómez', 'Av de Eduardo Dato 77, Sevilla', '734720565', 'navarrogomez@gmail.com', TO_DATE('22/04/1942','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('61839002Y', 'María Carmen', 'Serrano Gil', 'Av de Blas Infante 2, Sevilla', '683738077', 'serranogil@gmail.com', TO_DATE('19/10/1955','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('77242251V', 'Miguel', 'Ruiz Rubio', 'C/ San Bernardo 61, Sevilla', '744521992', 'ruizrubio@gmail.com', TO_DATE('14/08/1980','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('71929507C', 'David', 'Morales García', 'C/ Marqués de Nervión 96, Sevilla', '651726659', 'moralesgarcia@gmail.com', TO_DATE('24/04/2018','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('41396091R', 'David', 'Gutiérrez López', 'C/ Luis Montoto 84, Sevilla', '717728991', 'gutierrezlopez@gmail.com', TO_DATE('25/09/1953','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('19838330W', 'María Pilar', 'Gutiérrez Martínez', 'C/ Alfonso XII 83, Sevilla', '652744107', 'gutierrezmartinez@gmail.com', TO_DATE('02/01/1989','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('30634145P', 'Carlos', 'Martin Núñez', 'C/ Juan Ramón Jiménez 18, Sevilla', '684132678', 'martinnunez@gmail.com', TO_DATE('25/01/1945','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('21937070S', 'Francisco Javier', 'Ortega Alonso', 'Av Ciudad de Chiva 66, Sevilla', '644532351', 'ortegaalonso@gmail.com', TO_DATE('20/03/1990','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('86428737G', 'José Luis', 'López Ortiz', 'C/ Albareda 51, Sevilla', '737335640', 'lopezortiz@gmail.com', TO_DATE('28/10/1951','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('45518273P', 'David', 'Romero Moreno', 'C/ Virgen de Montserrat 81, Sevilla', '665205285', 'romeromoreno@gmail.com', TO_DATE('27/04/2015','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('48120492F', 'Juan', 'Vázquez Martínez', 'C/ Amador de Los Ríos 9, Sevilla', '697003026', 'vazquezmartinez@gmail.com', TO_DATE('21/03/1967','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('35918741D', 'José Luis', 'Sánchez López', 'Av de la Constitución 54, Sevilla', '689199774', 'sanchezlopez@gmail.com', TO_DATE('20/12/2006','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('13239897Q', 'Francisca', 'Torres Rodríguez', 'Av de las Palmeras 1, Sevilla', '747519959', 'torresrodriguez@gmail.com', TO_DATE('07/08/1978','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('88229069B', 'María Carmen', 'Martínez González', 'C/ Juan Ramón Jiménez 47, Sevilla', '632267549', 'martinezgonzalez@gmail.com', TO_DATE('17/09/1940','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('90409569L', 'Cristina', 'Suarez Gómez', 'C/ Isaac Newton 72, Sevilla', '713585442', 'suarezgomez@gmail.com', TO_DATE('26/12/1977','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('65918642K', 'María Dolores', 'Alonso García', 'Av de Kansas City 61, Sevilla', '740377995', 'alonsogarcia@gmail.com', TO_DATE('15/11/1996','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('98750614E', 'José Antonio', 'Álvarez Ramos', 'Av de Alemania 42, Sevilla', '688578365', 'alvarezramos@gmail.com', TO_DATE('01/05/1996','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('81401054Y', 'Laura', 'Martínez Jiménez', 'Av de las Palmeras 41, Sevilla', '636484600', 'martinezjimenez@gmail.com', TO_DATE('10/08/1984','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('96255449N', 'Javier', 'Pérez Álvarez', 'C/ San Juan Bosco 61, Sevilla', '644978880', 'perezalvarez@gmail.com', TO_DATE('03/02/2008','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('42428351K', 'Carmen', 'Rodríguez Rubio', 'Av Flota de Indias 77, Sevilla', '712150927', 'rodriguezrubio@gmail.com', TO_DATE('12/02/1941','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('39616827V', 'María Carmen', 'Sánchez Castro', 'Av de Alemania 37, Sevilla', '751708004', 'sanchezcastro@gmail.com', TO_DATE('14/08/1998','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('22104907K', 'Laura', 'Moreno Gómez', 'Av del Romanticismo 64, Sevilla', '637431401', 'morenogomez@gmail.com', TO_DATE('05/05/2012','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('43343034V', 'Miguel', 'Sanz Ramos', 'Av de la Borbolla 78, Sevilla', '642417158', 'sanzramos@gmail.com', TO_DATE('16/05/1981','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('91297936B', 'Jose', 'Gómez Domínguez', 'Av del Doctor Fedriani 63, Sevilla', '611102342', 'gomezdominguez@gmail.com', TO_DATE('17/10/1986','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('60835710C', 'Jesús', 'Rubio Rodríguez', 'Av Flota de Indias 95, Sevilla', '679475470', 'rubiorodriguez@gmail.com', TO_DATE('06/08/2013','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('78135205L', 'Josefa', 'Muñoz Ortiz', 'Av de Blas Infante 33, Sevilla', '746880989', 'munozortiz@gmail.com', TO_DATE('08/12/1941','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('15273821G', 'Alejandro', 'Moreno Núñez', 'Alcalde Juan Fernández 49, Sevilla', '729167537', 'morenonunez@gmail.com', TO_DATE('12/05/1972','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('95095615E', 'Jesús', 'Gómez Martínez', 'C/ Isaac Newton 76, Sevilla', '721476449', 'gomezmartinez@gmail.com', TO_DATE('01/12/1944','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('53986456M', 'Jesús', 'Gómez Ruiz', 'C/ Blanco White 31, Sevilla', '726070497', 'gomezruiz@gmail.com', TO_DATE('19/08/1994','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('65899579W', 'Laura', 'Navarro Rodríguez', 'Av de la Constitución 83, Sevilla', '664203733', 'navarrorodriguez@gmail.com', TO_DATE('23/01/1960','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('90945114D', 'Francisco', 'Gutiérrez Sánchez', 'Av de Menéndez Pelayo 95, Sevilla', '674341827', 'gutierrezsanchez@gmail.com', TO_DATE('08/07/1959','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('42529699P', 'David', 'Álvarez Pérez', 'C/ Virgen de Montserrat 70, Sevilla', '623774855', 'alvarezperez@gmail.com', TO_DATE('25/03/1990','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('83428353Q', 'Javier', 'Ortega Núñez', 'C/ Virgen de Montserrat 33, Sevilla', '718690018', 'orteganunez@gmail.com', TO_DATE('23/10/1990','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('73954870A', 'María Dolores', 'Blanco Morales', 'C/ Corral Del Agua 39, Sevilla', '647526259', 'blancomorales@gmail.com', TO_DATE('24/03/1967','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('96919003Q', 'Laura', 'Alonso Ortega', 'C/ María Auxiliadora 58, Sevilla', '674889670', 'alonsoortega@gmail.com', TO_DATE('20/04/1992','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('47974276W', 'Manuel', 'Molina Serrano', 'C/ Betis 13, Sevilla', '741849781', 'molinaserrano@gmail.com', TO_DATE('22/10/1944','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('95570062W', 'María Carmen', 'Castro Núñez', 'C/ San Juan Bosco 74, Sevilla', '741016533', 'castronunez@gmail.com', TO_DATE('04/09/1942','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('18634892Q', 'María Pilar', 'Ramos Gutiérrez', 'C/ Blanco White 57, Sevilla', '695513694', 'ramosgutierrez@gmail.com', TO_DATE('15/08/2006','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('81257162W', 'Ana', 'Álvarez Álvarez', 'C/ San Juan Bosco 26, Sevilla', '696423581', 'alvarezalvarez@gmail.com', TO_DATE('02/12/2010','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('47734458M', 'Cristina', 'Díaz Marín', 'C/ Juan Antonio Cavestany 62, Sevilla', '628232913', 'diazmarin@gmail.com', TO_DATE('04/07/1946','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('49118821K', 'Cristina', 'Rodríguez Álvarez', 'C/ Condes de Bustillo 26, Sevilla', '730735292', 'rodriguezalvarez@gmail.com', TO_DATE('06/11/1943','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('47706023K', 'Francisco Javier', 'Díaz Serrano', 'Av de la Constitución 18, Sevilla', '714450502', 'diazserrano@gmail.com', TO_DATE('28/07/1992','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('44314792W', 'David', 'Domínguez Marín', 'C/ Arroyo 17, Sevilla', '661264112', 'dominguezmarin@gmail.com', TO_DATE('26/12/1957','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('68416815A', 'José Antonio', 'Ortiz Rodríguez', 'C/ Republica Argentina 23, Sevilla', '671025363', 'ortizrodriguez@gmail.com', TO_DATE('05/12/1982','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('25602670J', 'Juan', 'Romero Ruiz', 'C/ Juan Sebastián El Cano 2, Sevilla', '601837937', 'romeroruiz@gmail.com', TO_DATE('16/06/1997','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('21444581W', 'Ana', 'Castro Molina', 'Av de Grecia 91, Sevilla', '616257788', 'castromolina@gmail.com', TO_DATE('03/04/1941','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('39694027Y', 'Laura', 'López Morales', 'C/ Juan Sebastián El Cano 18, Sevilla', '665687529', 'lopezmorales@gmail.com', TO_DATE('20/09/1967','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('29485942B', 'Antonio', 'Vázquez Ortega', 'Av de la Constitución 56, Sevilla', '610794748', 'vazquezortega@gmail.com', TO_DATE('23/11/2015','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('20585126B', 'Ana', 'Romero Rodríguez', 'Av de Ramón y Cajal 56, Sevilla', '688468413', 'romerorodriguez@gmail.com', TO_DATE('27/11/1989','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('25201214E', 'Carmen', 'Suarez Ruiz', 'C/ Isaac Newton 86, Sevilla', '648745636', 'suarezruiz@gmail.com', TO_DATE('05/04/1946','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('92831988D', 'Francisco', 'Álvarez Ramos', 'Av del Doctor Fedriani 90, Sevilla', '704611186', 'alvarezramos@gmail.com', TO_DATE('26/05/1946','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('54068616D', 'Javier', 'Gómez Muñoz', 'C/ San Juan Bosco 42, Sevilla', '686711279', 'gomezmunoz@gmail.com', TO_DATE('15/11/2002','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('91614265K', 'Ana', 'Gutiérrez Ortega', 'C/ Corral Del Agua 96, Sevilla', '640175326', 'gutierrezortega@gmail.com', TO_DATE('06/01/1987','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('33201963Z', 'Daniel', 'Blanco Martin', 'C/ Betis 91, Sevilla', '738113354', 'blancomartin@gmail.com', TO_DATE('21/04/2007','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('27204986B', 'Jose', 'Sánchez Fernández', 'Av Ciudad de Chiva 90, Sevilla', '635650817', 'sanchezfernandez@gmail.com', TO_DATE('03/06/2001','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('70930163A', 'Francisco Javier', 'Fernández Vázquez', 'Av de la Buhaira 9, Sevilla', '676149242', 'fernandezvazquez@gmail.com', TO_DATE('09/06/1955','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('45297611P', 'María Dolores', 'Rodríguez Díaz', 'Av de Alemania 86, Sevilla', '618891433', 'rodriguezdiaz@gmail.com', TO_DATE('09/02/1994','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('63057321S', 'David', 'Navarro Morales', 'Av de Eduardo Dato 32, Sevilla', '755206819', 'navarromorales@gmail.com', TO_DATE('21/10/1979','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('18524515Q', 'Carlos', 'Delgado Martínez', 'Av de la Borbolla 83, Sevilla', '732363113', 'delgadomartinez@gmail.com', TO_DATE('19/09/2004','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('86980193N', 'Isabel', 'Castro Ramírez', 'C/ María Auxiliadora 53, Sevilla', '658696941', 'castroramirez@gmail.com', TO_DATE('13/05/1951','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('35420802C', 'Francisca', 'Muñoz Suarez', 'Av de la Cruz del Campo 32, Sevilla', '752124814', 'munozsuarez@gmail.com', TO_DATE('02/01/1974','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('57290126R', 'Francisca', 'Núñez Vázquez', 'Av del Romanticismo 29, Sevilla', '743827050', 'nunezvazquez@gmail.com', TO_DATE('05/04/1954','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('60143781T', 'David', 'Molina Sánchez', 'C/ Marqués De Paradas 63, Sevilla', '649183397', 'molinasanchez@gmail.com', TO_DATE('18/11/1961','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('37967028P', 'Juan', 'Torres Molina', 'C/ María Auxiliadora 24, Sevilla', '744897374', 'torresmolina@gmail.com', TO_DATE('03/06/2016','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('99379770J', 'Jesús', 'Ortega Gómez', 'Alameda de Hércules 66, Sevilla', '656008857', 'ortegagomez@gmail.com', TO_DATE('24/05/1974','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('43499639S', 'Francisca', 'Castro Gómez', 'C/ Marqués de Nervión 95, Sevilla', '618588285', 'castrogomez@gmail.com', TO_DATE('22/06/1981','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('99657122P', 'Francisco', 'Rubio Martin', 'C/ Amador de Los Ríos 80, Sevilla', '717997734', 'rubiomartin@gmail.com', TO_DATE('22/02/1947','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('15850962Y', 'María', 'Romero Ortiz', 'C/ Virgen de Montserrat 48, Sevilla', '703015979', 'romeroortiz@gmail.com', TO_DATE('13/05/2014','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('58058260G', 'Francisca', 'Marín Álvarez', 'C/ Amador de Los Ríos 86, Sevilla', '659485602', 'marinalvarez@gmail.com', TO_DATE('26/04/1941','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('75365969Y', 'Cristina', 'Sanz Marín', 'C/ Pureza 67, Sevilla', '678329525', 'sanzmarin@gmail.com', TO_DATE('04/10/2013','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('72777336T', 'José Luis', 'Molina López', 'Av Ciudad de Chiva 4, Sevilla', '662277167', 'molinalopez@gmail.com', TO_DATE('05/06/1964','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('84984749W', 'Marta', 'López Castro', 'C/ Juan Antonio Cavestany 22, Sevilla', '653851970', 'lopezcastro@gmail.com', TO_DATE('18/01/1969','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('13602219L', 'María Teresa', 'Rubio Núñez', 'C/ Alfonso XII 18, Sevilla', '754779686', 'rubionunez@gmail.com', TO_DATE('14/07/1988','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('11546879M', 'Laura', 'Ortiz Pérez', 'C/ Albareda 94, Sevilla', '657863522', 'ortizperez@gmail.com', TO_DATE('09/12/2004','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('42774779T', 'Jesús', 'Núñez Rodríguez', 'C/ Juan Sebastián El Cano 85, Sevilla', '709875652', 'nunezrodriguez@gmail.com', TO_DATE('09/12/1970','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('56336303B', 'Carmen', 'Rodríguez Navarro', 'C/ Blanco White 25, Sevilla', '738958038', 'rodrigueznavarro@gmail.com', TO_DATE('07/07/2011','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('69514753J', 'Jose', 'Rubio Hernández', 'C/ Pureza 71, Sevilla', '651652414', 'rubiohernandez@gmail.com', TO_DATE('26/11/1962','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('65794170W', 'Isabel', 'Blanco Suarez', 'C/ Republica Argentina 13, Sevilla', '690305154', 'blancosuarez@gmail.com', TO_DATE('05/12/1987','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('80965349J', 'Cristina', 'Rodríguez Muñoz', 'C/ Arroyo 49, Sevilla', '670420723', 'rodriguezmunoz@gmail.com', TO_DATE('20/02/1980','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('65647676H', 'María Teresa', 'Ortega Muñoz', 'Av de Alemania 73, Sevilla', '742471274', 'ortegamunoz@gmail.com', TO_DATE('03/01/1979','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('64887287D', 'David', 'Núñez Martin', 'Av de Kansas City 55, Sevilla', '664178342', 'nunezmartin@gmail.com', TO_DATE('24/12/1955','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('51041230K', 'María Dolores', 'Ramos Serrano', 'Av de Grecia 26, Sevilla', '617368877', 'ramosserrano@gmail.com', TO_DATE('14/01/1958','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('44244806M', 'José Luis', 'Núñez Gil', 'C/ Marqués de Nervión 36, Sevilla', '713974840', 'nunezgil@gmail.com', TO_DATE('04/11/1940','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('83895436S', 'María Teresa', 'Torres Rodríguez', 'C/ Niebla 37, Sevilla', '682702497', 'torresrodriguez@gmail.com', TO_DATE('10/06/2004','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('42865939B', 'Josefa', 'Díaz Ramos', 'C/ María Auxiliadora 77, Sevilla', '617283681', 'diazramos@gmail.com', TO_DATE('10/03/2008','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('68347885G', 'Marta', 'Sánchez Gutiérrez', 'Av de Grecia 21, Sevilla', '642510614', 'sanchezgutierrez@gmail.com', TO_DATE('08/10/2017','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('57794242A', 'José Antonio', 'Moreno Ortiz', 'C/ Marqués de Nervión 14, Sevilla', '605090415', 'morenoortiz@gmail.com', TO_DATE('04/04/1946','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('18239689E', 'Francisco Javier', 'García Muñoz', 'C/ Albareda 52, Sevilla', '604162584', 'garciamunoz@gmail.com', TO_DATE('14/11/1949','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('67025813H', 'Daniel', 'Alonso Sanz', 'C/ Republica Argentina 90, Sevilla', '657864578', 'alonsosanz@gmail.com', TO_DATE('11/03/1987','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('69106816G', 'María', 'Sánchez Álvarez', 'Av de Menéndez Pelayo 45, Sevilla', '712026500', 'sanchezalvarez@gmail.com', TO_DATE('12/11/1949','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('70351510F', 'Laura', 'Ramírez Navarro', 'C/ Pureza 96, Sevilla', '666481658', 'ramireznavarro@gmail.com', TO_DATE('07/07/2013','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('90476010J', 'José Antonio', 'Torres Rodríguez', 'C/ Republica Argentina 75, Sevilla', '705307966', 'torresrodriguez@gmail.com', TO_DATE('09/03/1965','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('39813071W', 'Carlos', 'Suarez Serrano', 'C/ San Bernardo 90, Sevilla', '741118656', 'suarezserrano@gmail.com', TO_DATE('01/08/1963','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('35343088T', 'Alejandro', 'Rodríguez Moreno', 'Av de Kansas City 16, Sevilla', '607512234', 'rodriguezmoreno@gmail.com', TO_DATE('12/10/1994','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('47229593J', 'Carmen', 'Díaz Serrano', 'C/ Amador de Los Ríos 84, Sevilla', '693362221', 'diazserrano@gmail.com', TO_DATE('15/05/1995','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('33836964P', 'Laura', 'Álvarez Castro', 'C/ Arroyo 86, Sevilla', '685988548', 'alvarezcastro@gmail.com', TO_DATE('22/03/2011','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('24150589Z', 'Francisca', 'Molina Molina', 'C/ Juan Sebastián El Cano 42, Sevilla', '730501286', 'molinamolina@gmail.com', TO_DATE('25/05/2011','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('15160819R', 'María Teresa', 'Blanco Suarez', 'C/ Corral Del Agua 59, Sevilla', '742163455', 'blancosuarez@gmail.com', TO_DATE('14/09/2002','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('28686850P', 'Juan', 'Rubio Núñez', 'C/ Torres Quevedo 78, Sevilla', '655730640', 'rubionunez@gmail.com', TO_DATE('24/09/1968','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('54549415Q', 'Marta', 'Gutiérrez Álvarez', 'Alcalde Juan Fernández 39, Sevilla', '631326402', 'gutierrezalvarez@gmail.com', TO_DATE('19/09/1948','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('44045451Z', 'David', 'Gutiérrez Blanco', 'Av Flota de Indias 89, Sevilla', '668384537', 'gutierrezblanco@gmail.com', TO_DATE('25/02/1962','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('12930955X', 'María Ángeles', 'Gil Suarez', 'C/ Isaac Newton 27, Sevilla', '749345578', 'gilsuarez@gmail.com', TO_DATE('18/04/1948','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('62450342Y', 'Juan', 'Navarro Sánchez', 'C/ Condes de Bustillo 67, Sevilla', '755133085', 'navarrosanchez@gmail.com', TO_DATE('23/02/1978','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('76846375V', 'Marta', 'Jiménez Suarez', 'Av de la Constitución 80, Sevilla', '711431017', 'jimenezsuarez@gmail.com', TO_DATE('04/05/1983','DD/MM/YYYY'), 3);
INSERT INTO CD_PACIENTES (DNI, NOMBRE, APELLIDOS, DIRECCION, TELEFONO, EMAIL, FECHA_NAC, COD_CLINICA) VALUES ('59452053C', 'Miguel', 'Marín Morales', 'Av del Doctor Fedriani 86, Sevilla', '643773353', 'marinmorales@gmail.com', TO_DATE('22/04/1941','DD/MM/YYYY'), 3);

CREATE INDEX NombreCompleto
ON CD_PACIENTES (NOMBRE, APELLIDOS);


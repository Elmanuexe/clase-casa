/*
 Examen de la unidad didáctica 6
 Bases de datos - 1º Desarrollo de Aplicaciones Multiplataforma
 */
 INSERT INTO TA_EMPLEADO VALUES (
    1,
    'ANGEL',
    'NARANJO',
    'ANGEL.NARANJO@MITIENDA.ES',
    'ES1234567890123456789012',
    '12345'
);

INSERT INTO TA_EMPLEADO VALUES (
    2,
    'MIGUEL',
    'CAMPOS',
    'MIGUEL.CAMPOS@MITIENDA.ES',
    'ES9087564312213465780937',
    'USER1234'
);

INSERT INTO TA_CLIENTE VALUES (
    '12345678A',
    'JESÚS',
    'CASANOVA',
    'JESUS.CASANOVA@CORREO.COM',
    'C/ CONDES DE BUSTILLO S/N',
    SYSDATE
);

INSERT INTO TA_CATEGORIA VALUES (
    1,
    'Macbook',
    'Todos los modelos de Macbook'
);

INSERT INTO TA_CATEGORIA VALUES (
    2,
    'Iphone',
    'Todos los modelos de Iphone'
);

INSERT INTO TA_CATEGORIA VALUES (
    3,
    'Apple Watch',
    'Todos los modelos de Apple Watch'
);

-- CUP, NOMBRE, DESCRIPCION, PVP, CATEGORIA

INSERT INTO TA_PRODUCTO VALUES (
    1,
    'Macbook Pro 13" 8GB/128GB',
    'Procesador de doble núcleo a 2,3 GHz 
128 GB de almacenamiento',
    1505.59,
    1
);

INSERT INTO TA_PRODUCTO VALUES (
    2,
    'Macbook Pro 13" 8GB/256GB',
    'Procesador de doble núcleo a 2,3 GHz 
256 GB de almacenamiento',
    1755.59,
    1
);

INSERT INTO TA_PRODUCTO VALUES (
    3,
    'Macbook Pro 13" Touch Bar 8GB/256GB',
    'Touch Bar y Touch ID
Procesador de cuatro núcleos a 2,3 GHz 256 GB de almacenamiento',
    1999,
    1
);

INSERT INTO TA_PRODUCTO VALUES (
    4,
    'iPhone Xs 5,8" 64GB',
    'Acabado en plata',
    1159,
    2
);

INSERT INTO TA_PRODUCTO VALUES (
    5,
    'iPhone Xs 6,5" 64GB',
    'Acabado en plata',
    1259,
    2
);

INSERT INTO TA_PRODUCTO VALUES (
    6,
    'iPhone Xr 6,1" 64GB',
    'Acabado en blanco',
    859,
    2
);

INSERT INTO TA_PRODUCTO VALUES (
    7,
    'Apple Watch Serie 4 GPS',
    'Caja de aluminio en plata y correa deportiva blanca',
    429,
    3
);

INSERT INTO TA_PRODUCTO VALUES (
    8,
    'Apple Watch Serie 4 GPS + Cellular',
    'Caja de aluminio en plata y correa Loop deportiva en color nácar',
    529,
    3
);

INSERT INTO TA_PRODUCTO VALUES (
    9,
    'Apple Watch Nike+',
    'Caja de aluminio en plata y correa Nike Sport platino puro/negra',
    429,
    3
);

COMMIT;

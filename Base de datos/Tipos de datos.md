# Tipos de datos
## Textos
- VARCHAR2: Utilizado para textos de longitud variable se debe de indicar un número entre paréntesis que indicará el tamaño máximo.
- CHAR: Longitud fija, los valores siempre ocuparán el mismo tamaño.
- NCHAR permite utilizar un segundo juego de caracteres para almacenar textos con la configuración de cada país.
- NVARCHAR2: Igual que en el caso anterior pero pensando en el almacenamiento de longitud variable.
A la hora de introducir texto hay que tener en cuenta que los textos se entrecomillan con comillas simples. 
Para introducir las comillas como texto usamos el operador q'[O'hara]'.

## Números
Los números en oracle tienen un rango de entre 10-130 y 9.9999999 * 10128 si añadimos un numero fuera del rango da error.
### Coma fija
Permite almacenar números con decimales de forma exacta pero ocupan mas que os numeros de coma flotante.
- NUMBER(p,s): Ej. NUMBER(8.3)	

### Enteros
Para numeros enteros solo se pone el numero sin la coma.

### Coma flotante
Para numeros con coma flotante so lo se usa el NUMBER sin el parentesis.

#### Precición y escala
La precisión indica el numero de cifras que se guardan y la escala el numero de decimales, si es negativa se añaden ceros a la izq del decimal.

## Fechas y horas
### Almacenamiento de fechas y horas
Oracle guarda las fechas de manera diferente pero al pasarlas por pantalla las transforma a formato legible.
Hay cuatro tipos de formatos de fecha:
- DATE: Almacena la fecha sin horas minutos y segundos, usando la funcion sysdate obtienes la fecha actaual.Las fechas no se pueden manipular sin usar la funcion TO_DATE.
- TIMESTAMP: Almacena hasta horas minutos y segundos con decimales.
- Intervalos: Existen largos y cortos 
	- YEAR TO MONTH(largo): Se utiliza la palabra INTERVAL  seguida del intervalo y a continuacion YEAR TO MONTH
	- DAY TO SECOND(corto): Representa intervalos en días, horas, minutos y/o segundos. Se utiliza la palabra INTERVAL  seguida del intervalo y la terminación varía en funcion de los datos del intervalo. Se pueden utilizar DAY, HOUR, MINUTE y SECOND.


Por Manuel Fernandez y Fernando Carrascal.
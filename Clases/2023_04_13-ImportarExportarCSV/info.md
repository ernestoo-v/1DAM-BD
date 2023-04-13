CREAR FICHERO CSV
Para crear un fichero con extension .csv tenemos que tener en cuenta lo siguiente:
-   Elementos separados por comas
-   Tener cuidado con los espacios.
-   No dejar lineas en blanco


IMPORTAR FICHERO CSV
Para importar un fichero CSV tengo que tener en cuenta varias cosas:
-   ¿Donde esta el fichero?
-   Delimitador de campos.
-   Delimitador de lineas.
-   A que tabla importar datos.
-   (opcional) ignorar la primera linea.

Sintaxis:
LOAD DATA INFILE 'ruta'  -- Ubicacion del fichero
INTO TABLE tabla         -- Table donde importar datos
FIELDS TERMINATED BY ',' -- Delimitador de campos
LINES TERMINATED BY '\n' -- Delimitador de lineas
IGNORE 1 ROWS;           -- Ignorar la primera fila

EXPORTAR FICHERO CSV
Para exportar un fichero CSV tengo que ter en cuenta varias cosas:
-   Ubicacion del fichero
-   Delimitador de campos
-   Delimitador de lineas

SELECT * FROM tabla
INTO OUTFILE 'ruta'
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n';


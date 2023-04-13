CREATE DATABASE IF NOT EXISTS abr13;

USE abr13;

CREATE TABLE IF NOT EXISTS personas (
	id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(30),
    fecha DATE
);

SELECT * FROM personas;

/* 
Cargar datos desde fichero
-	A la hora de porner la ubicacion del fichero cada barra la tengo que duplicar
 */
LOAD DATA INFILE 'D:\\2022-23 IMF\\GITHUB\\MP01. Bases de Datos\\GrupoA\\Clases\\2023_04_13-ImportarExportarCSV\\personas.csv'  -- Ubicacion del fichero
INTO TABLE personas         -- Table donde importar datos
FIELDS TERMINATED BY ',' -- Delimitador de campos
LINES TERMINATED BY '\n' -- Delimitador de lineas
IGNORE 5 ROWS;

/* 
	Exportar fichero
*/
SELECT * INTO OUTFILE 'D:\\2022-23 IMF\\GITHUB\\MP01. Bases de Datos\\GrupoA\\Clases\\2023_04_13-ImportarExportarCSV\\exportar2.csv'
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
FROM personas;

CREATE TABLE IF NOT EXISTS coches (
	id INT PRIMARY KEY AUTO_INCREMENT,
    modelo VARCHAR(30),
    marca VARCHAR(30),
    precio int(10)
);

SELECT * FROM coches;

LOAD DATA INFILE 'D:\\2022-23 IMF\\GITHUB\\MP01. Bases de Datos\\GrupoA\\Clases\\2023_04_13-ImportarExportarCSV\\coches.csv'  -- Ubicacion del fichero
INTO TABLE coches         -- Table donde importar datos
FIELDS TERMINATED BY ',' -- Delimitador de campos
LINES TERMINATED BY '\n' -- Delimitador de lineas
IGNORE 1 ROWS;

TRUNCATE TABLE coches;
CREATE DATABASE IF NOT EXISTS imf;
USE imf;

CREATE TABLE IF NOT EXISTS alumno (
	id INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    NOTA DECIMAL(5,2),
    PRIMARY KEY (id)
);

SELECT * FROM alumno;
INSERT INTO alumno VALUES (1, 'Antonio', 9.2), (2, 'Carlos', 7), (3, 'Inmaculada', 5.5), (4, 'David', 4.99), (5, 'Sergio', null);

/*
	IF
    
    SINTAXIS:
    IF(condicion, verdadero, falso)
    
    -	Entiende que es falso cuando el campo es NULL y no puede compararlo con el valor de la condicion.
*/
SELECT nombre, IF(nota > 5, 'Aprobado', 'Suspenso') AS 'Calificacion'
FROM alumno;

/*
	CASE
    
    SINTAXIS:
    CASE
		WHEN condicion1 THEN sentencia
        WHEN condicion2 THEN sentencia
        ...
        ELSE sentencia
    END
    
    -	Si la condicion1 del WHEN se cumple, salta su sentencia y no compara el resto (parecido al IF-ELSE)
    -	La clausula ELSE se ejecuta si no existe ninguna condicion del WHEN que se pueda satisfacer.
    -	Si existe algun campo en NULL lo evalua en la clausula ELSE
*/

SELECT nombre, 
	(CASE
		WHEN nota >= 9 THEN 'SB'
        WHEN nota >= 7 THEN 'NT'
        WHEN nota >= 5 THEN 'SF'
        ELSE 'IN'
    END) AS 'Calificacion', nota
FROM alumno;

/*
	IFNULL
    
    SINTAXIS:
    IFNULL(campo, sentencia)
    
    -	Los valores de los campos que NO SEAN NULL los muestra tal cual.
    -	Solo actua para los que tienen valor NULL.
*/

SELECT nombre, IFNULL(nota, 'No presentado') AS 'Calificacion'
FROM alumno;

/* Consulta con las notas lo mas completa posible */
SELECT nombre,
	CASE
		WHEN nota >= 9 THEN 'SB'
        WHEN nota >= 7 THEN 'NT'
        WHEN nota >= 5 THEN 'SF'
		WHEN nota >= 0 THEN 'IN'
        ELSE IFNULL(nota, 'No presentado')
    END AS 'Calificacion', nota
FROM alumno;

/*
	VARIABLES
    Las utilizaremos en la realizacion de funciones de usuario y de procedimientos.
    
    CLAUSULA DECLARE
    Se utiliza para declarar variables y especificar su tamaño y tipo de contenido.
    Es posible agregar un valor por defecto con la clausula DEFAULT.
    
    SINTAXIS:
	DECLARE nombre TIPO DEFAULT valor;
    
    Ejemplo:
    DECLARE nota DECIMAL(3,2) DEFAULT 0;
    DECLARE nombre VARCHAR(20) DEFAULT null;
    
    CLAUSULA SET
    Se utiliza para dar valor a las variables.
    Existen dos sintaxis distintas en funcion del tipo de uso:
    
    SINTAXIS 1:
		SET variable = valor;
        
        -	Se utiliza cuando la variable ya esta declarada para asignar o actualizar un valor
        
        Ejemplo:
        SET nota = 5;
        SET nombre = 'Pepe';
    
    SINTAXIS 2:
		SET @variable = valor;
        
        -	Se utiliza para asignar valor a una variable NO DECLARADA en una sola linea.
        -	Es importante que el simbolo @ este ubicado delante del nombre de la variable.
        
        Ejemplo:
        SET @apellido = 'Fontan'
        SET @nota_rec = 5.00
    
*/


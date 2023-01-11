/*
	Introduccion
    
    MySQL gestor de base de datos (SGBD).
    Utilizamos una serie de clausulas para manipular los datos.
    
    1. Clausulas de creacion de base de datos (estructura)
    CREATE
    ALTER
    DROP
    DEFAULT
    
    1.1. Creacion de las claves
    - Claves primarias (PK)     ---> las PK pueden estar compuestas de dos claves foraneas (relacion n:m o similar que crea tabla)
    - Claves foraneas (FK) 		---> completar la configuracion agregando detalles
	  (CONSTRAINT utilizada para crear restricciones)
    - Claves unicas (UK)
    
    2. Insercion de datos
    INSERT
    INTO
    VALUES
    
    La sintaxis que podemos utilizar para insertar valores es la siguiente:
    - INSERT INTO tabla VALUES (NULL, valor1, valor2, valor3,...);
    - INSERT INTO tabla (campo1, campo2, campo3, ... ) VALUES (valor1, valor2, valor3);
    
    3. Extraccion de datos (consultas)
    SELECT
    FROM
    WHERE
    
    La sintaxis para realizar una consulta es la siguiente:
    SELECT campo1, campo2, ... FROM tabla WHERE condiciones (filtros);
	SELECT * FROM tabla WHERE condiciones (filtros);
    
    3.1. Operadores 
    - Aritmeticos: 				= < > <= >=
    - Rango:					BETWEEN valorMinimo AND valorMaximo;
    - Lista:					IN (valor1, valor2, valor3, ...)
								NOT IN (valor1, valor2, valor3, ...)
    - Logicos:					AND (&&)
								OR (||)
                                NOT (!)
                                LIKE ('similar a')
	
    3.2. Otras clausulas
    - LIMIT						LIMIT 3;
    - AS						campoTabla AS nombreNuevo;
    
    3.3. Funciones predefinidas
    - AVG ()
    - SUM ()
    - MIN ()
    - MAX ()
    - COUNT()
    
*/

/*
	CLAUSULAS NUEVAS
 */ 
 /*
    - DISTINCT: permite eliminar registros repetidos en la consulta.
	  Sintaxis:
      SELECT DISTINCT campo1, campo2, ...
      
	- LIKE: clausula que me proporciona flexibilidad a la hora de filtrar los datos del campo que quiero recibir. Utiliza dos caracteres importantes:
		+ el signo % ----> equivale a cualquier numero de caracteres (incluido ningun caracter).
        + el signo _ ----> equivale a cualquier caracter (solamente uno).
*/
use nba;

SELECT * 
FROM equipos;

SELECT DISTINCT * 
FROM equipos
WHERE conferencia = 'East';

/* Ejercicio: dame todas las ciudades de los equipos de la conferencia oeste de la NBA. No se pueden repetir los nombres de las ciudades */
SELECT DISTINCT ciudad
FROM equipos
WHERE conferencia = 'West';

/* Ejercicio: dame todos los equipos que su ciudad comience por 'L' */
SELECT DISTINCT ciudad
FROM equipos
WHERE ciudad LIKE ('L%');

/* Ejercicio: dame todos los equipos que su ciudad termine por 'D' */
SELECT ciudad
FROM equipos
WHERE ciudad LIKE ('%D');

/* seleccionar los equipos que su ciudad tenga dos 'nn' */
SELECT ciudad
FROM equipos
WHERE ciudad LIKE ('%nn%');

/* seleccionar los equipos que su ciudad tenga 'orl' y que acabe en 's' */
SELECT ciudad
FROM equipos
WHERE ciudad LIKE('%orl%s');

SELECT ciudad
FROM equipos
WHERE ciudad LIKE('%orl___s');

/* Ejercicio: seleccionar todos los jugadores que empiecen por 'ja' */
SELECT nombre
FROM jugadores
WHERE nombre LIKE ('ja%');

/* Ejercicio: seleccionar todos los jugadores que su posicion sea 'C' y que su procedencia empiece por 'o' */
SELECT *
FROM jugadores
WHERE posicion LIKE ('c') AND procedencia LIKE ('o%'); 

SELECT *
FROM jugadores
WHERE posicion = 'c' AND procedencia LIKE ('o%'); 

SELECT *
FROM jugadores
WHERE posicion IN ('c') AND procedencia LIKE ('o%'); 

/* Selecciona los jugadores que pesen mas de 100 kg y que su peso acabe en 4 */
SELECT *
FROM jugadores
WHERE peso > 100 AND peso LIKE ('%4');

SELECT *
FROM jugadores
WHERE peso LIKE ('__4');

/*
	ORDER BY
    Especifica el orden en el que recibo los resultados.
    
    Para especificar el orden se utilizan dos clausulas mas:
    - ASC: para orden ascendente
    - DESC: para orden descentente
*/

/* Numeros */
SELECT * 
FROM jugadores 
ORDER BY id ASC;

SELECT * 
FROM jugadores 
ORDER BY id DESC;

/* Caracteres */
SELECT procedencia
FROM jugadores
ORDER BY procedencia ASC;

/* Seleccionar jugadores que su numbre contenga 'X' y ordenados por nombre descendente */
SELECT *
FROM jugadores
WHERE nombre LIKE('%x%') 
ORDER BY nombre DESC;

/* Seleccionar el id de los jugadores que promedian mas de 20 puntos en la temporada mas reciente (la mas reciente de la base de datos).
Tienen que salir en orden descendente  */
SELECT jugador_id
FROM estadisticas
WHERE puntos > 20 AND temporada_id = (
	SELECT MAX(temporada_id)
    FROM estadisticas
)
ORDER BY jugador_id DESC;

SELECT jugador_id
FROM estadisticas
WHERE puntos > 20 AND temporada_id = (
	SELECT MAX(id)
    FROM temporadas
) -1
ORDER BY jugador_id DESC;

/* 
	Seleccionar:
	 - los jugadores que 
	 - tienen un promedio de puntos mayor a la media 
	 - en la temporada mas antigua (la mas antigua de la base de datos)
*/
 SELECT *
 FROM estadisticas 
 WHERE puntos > (SELECT AVG(puntos) FROM estadisticas) 
		AND temporada_id = (SELECT MIN(temporada_id) FROM estadisticas);

/*
	Seleccionar:
	- los jugadores que tienen 
	- promedio de puntos superior a 15
	- promedio de rebotes inferior a la media 
	- promedio de tapones interior a la media o un promedio de asistencias inferior a la media
*/
SELECT DISTINCT jugador_id
FROM estadisticas
WHERE puntos > 15 
	AND rebotes < (SELECT AVG(rebotes) FROM estadisticas) 
    AND (tapones < (SELECT AVG(tapones) FROM estadisticas) OR asistencias < (SELECT AVG(asistencias) FROM estadisticas))
ORDER BY jugador_id ASC;

/*
	FECHAS
    - NOW()					---> devuelve una fecha y hora actual. ----> datetime
    - CURDATE()				---> devuelve una fecha actual.		   ----> date
    
    - YEAR()				---> devuelve el año
    - MONTH()				---> devuelve el mes
    - DAYOFMONTH()			---> devuelve el dia del mes
    
    - DATEDIFF(date1, date2)---> calcula la cantidad de dias entre dos fechas. La operacion es date1 - date2
    - DATE_SUB(date1, int)	--->
    - DATE_ADD(date1, int)	--->
    
*/
SELECT NOW();
SELECT CURDATE();

SELECT YEAR(CURDATE()) AS anio;
SELECT YEAR(NOW()) AS anio;

SELECT MONTH(CURDATE()) AS mes;
SELECT MONTH(NOW()) AS mes;

SELECT DATEDIFF(CURDATE(), '2022-01-09');

SELECT DAYOFMONTH(CURDATE()) AS dia_del_mes;
SELECT DAYOFMONTH(NOW()) AS dia_del_mes;

/* En la base de datos fecha_ejemplo:
 - Selecciona los pedidos realizados en el ultimo año
 */
use fecha_ejemplo;
SELECT *
FROM pedidos
WHERE DATEDIFF(CURDATE(), fecha_pedido)<384;



use actividad14;

/* Ejercicio : Obtener el total de ventas por día:*/
SELECT fecha, SUM(monto) AS 'Total recaudado'
FROM ventas
GROUP BY fecha
ORDER BY SUM(monto) ASC;

/* Ejercicio : ¿Que 3 dias han sido los de mayor venta? */
SELECT fecha, SUM(monto) AS 'Total recaudado'
FROM ventas
GROUP BY fecha
ORDER BY SUM(monto) DESC LIMIT 3;

/* Ejercicio : ¿Cual ha sido el dia con mayor y menor venta? */

SELECT fecha /* Mayor venta */
FROM ventas
GROUP BY fecha
ORDER BY SUM(monto) DESC LIMIT 1;

SELECT fecha /* Menor venta */
FROM ventas
GROUP BY fecha
ORDER BY SUM(monto) ASC LIMIT 1;

SELECT fecha, SUM(monto) AS 'Total'
FROM ventas
WHERE fecha = (SELECT fecha FROM ventas GROUP BY fecha ORDER BY SUM(monto) DESC LIMIT 1)
	OR fecha = (SELECT fecha FROM ventas GROUP BY fecha ORDER BY SUM(monto) ASC LIMIT 1)
GROUP BY fecha
ORDER BY SUM(monto) DESC;

/* Ejercicio : Obtener el número de ventas por día:*/
SELECT fecha, COUNT(*) AS 'numero de ventas'
FROM ventas
GROUP BY fecha;

/* Ejercicio : Obtener el promedio de ventas por día:*/
/* Usamos CAST para quitar la parte decimal ---> CAST(VALOR_A_MOSTRAR AS TIPO_DE_SALIDA)  */
SELECT fecha, CAST(AVG(monto) AS DECIMAL(10,0)) AS 'promedio'
FROM ventas
GROUP BY fecha;

SELECT fecha, AVG(monto) AS 'promedio'
FROM ventas
GROUP BY fecha;

/* Ejercicio : Obtener el número de empleados por departamento:*/
SELECT departamento, COUNT(*) AS 'Numero de empleados'
FROM empleados
GROUP BY departamento;

/* Ejercicio : Obtener el total de salarios por departamento:*/
SELECT departamento, SUM(salario) AS 'Total'
FROM empleados
GROUP BY departamento;

/* Ejercicio : Obtener el promedio de edad por departamento:*/

/* Ejercicio : Obtener el número de ventas por mes:*/

/* Ejercicio : Obtener el total de ventas por mes:*/

/* Ejercicio : Obtener el promedio de ventas por mes:*/

/* Ejercicio : Obtener el número de empleados por edad:*/
SELECT edad, COUNT(*) 'Total'
FROM empleados
GROUP BY edad;

/* Ejercicio : Obtener el número de ventas por día de la semana:*/
/* DAYNAME(fecha) ---> el NOMBRE del dia de la semana */
SELECT DAYNAME(fecha), SUM(monto)
FROM ventas
GROUP BY DAYNAME(fecha);

/* DAYOFWEEK(fecha) ---> el NUMERO del dia de la semana */
SELECT DAYOFWEEK(fecha), SUM(monto)
FROM ventas
GROUP BY DAYOFWEEK(fecha);

/* Ejercicio : Obtener el total de ventas por día de la semana:*/

/* Ejercicio : Obtener el promedio de ventas por día de la semana:*/

/* Ejercicio : Obtener el número de ventas por mes y año:*/

/* Ejercicio : Obtener el total de ventas por mes y año:*/
/* 
	MONTH(fecha) ---> el mes de la fecha
    YEAR(fecha)	---> el año de la fecha
*/
SELECT MONTH(fecha) AS 'Mes', YEAR(fecha) AS 'Año', SUM(monto) AS 'Total'
FROM ventas
GROUP BY MONTH(fecha), YEAR(fecha);

/* Ejercicio : Obtener el promedio de ventas por mes y año:*/
SELECT MONTH(fecha) AS 'Mes', YEAR(fecha) AS 'Año', AVG(monto) AS 'Total'
FROM ventas
GROUP BY MONTH(fecha), YEAR(fecha);


/* Ejercicio : Obtener el número de empleados por género y departamento:*/
SELECT departamento, genero, COUNT(*) AS 'Total'
FROM empleados
GROUP BY departamento, genero;

/* Ejercicio : Obtener el número de empleados por género femenino y departamento:*/
SELECT departamento, genero, COUNT(*) AS 'Total'
FROM empleados
WHERE genero = 'F'
GROUP BY departamento, genero;

/* Ejercicio : Obtener el total de salarios por género y departamento:*/


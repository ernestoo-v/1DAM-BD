use actividad15;

/* Ejercicio : Muestra el número de clientes por ciudad y sólo aquellas ciudades que tengan más de 5 clientes.*/
SELECT ciudad, COUNT(*)
FROM clientes
GROUP BY ciudad
HAVING COUNT(*) > 5;

/* Ejercicio : Muestra el número de productos vendidos por cada vendedor, y sólo aquellos vendedores que hayan vendido más de 50 productos.*/
SELECT vendedor, SUM(cantidad)
FROM ventas
GROUP BY vendedor
HAVING SUM(cantidad) > 50;

/* Ejercicio : Muestra el número de pedidos realizados por cada cliente en el último año, y sólo aquellos clientes que hayan realizado más de 10 pedidos.*/
SELECT cliente, COUNT(*)
FROM pedidos
WHERE YEAR(fecha) = YEAR(NOW()) - 1
GROUP BY cliente
HAVING COUNT(*) > 10;

/*
	DATEDIFF(fecha1, fecha2) proporciona diferencia en dias entre la fecha1 y la fecha2
*/
SELECT cliente, COUNT(*)
FROM pedidos
WHERE DATEDIFF(NOW(), fecha) <= 366
GROUP BY cliente
HAVING COUNT(*) > 10;

/* Ejercicio : Muestra el número de productos vendidos por cada categoría, y sólo aquellas categorías que hayan tenido más de 100 ventas.*/

/* Ejercicio : Muestra el número de empleados por departamento y sólo aquellos departamentos que tengan más de 5 empleados.*/

/* Ejercicio : Muestra el total de ventas por vendedor y sólo aquellos vendedores que hayan generado más de $1,000 en ventas.*/

/* Ejercicio : Muestra el total de ventas por vendedor y sólo aquellos vendedores que hayan generado más de $500 en ventas en el último mes.*/

/* Ejercicio : Muestra el número de clientes por ciudad y sólo aquellas ciudades que tengan más de 3 clientes y menos de 8 clientes.*/

/* Ejercicio : Muestra el total de ventas por categoría y sólo aquellas categorías que hayan generado más de $200 en ventas en el último año.*/

/* Ejercicio : Muestra el número de empleados por departamento y sólo aquellos departamentos que tengan menos de 6 empleados.*/

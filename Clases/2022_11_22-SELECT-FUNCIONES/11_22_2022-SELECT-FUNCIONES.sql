use concesionario;

SELECT * FROM clientes;

SELECT nombre FROM clientes WHERE fecha = '1993-10-10';

SELECT nombre, apellidos FROM clientes WHERE vendedor_id = '2';

/* LIMIT limitar los elementos a mostrar */
SELECT * FROM clientes WHERE vendedor_id = 3 LIMIT 3;

/* IN comprueba que el dato esta en una lista de elementos */
SELECT * FROM vendedores WHERE cargo IN ("Jefe de ventas", "Operario", "Practicas"); 
SELECT * FROM vendedores WHERE cargo = "Jefe de ventas" OR cargo = "Operario" || cargo = "Practicas";
SELECT * FROM vendedores WHERE cargo = "Jefe de ventas" || "Operario" || "Practicas";

/* BETWEEN establace un rango numerico 
La sintaxis debe ser BETWEEN numero AND numero */
SELECT * FROM vendedores WHERE sueldo BETWEEN 30000 AND 46000;
SELECT * FROM vendedores WHERE cargo IN ("Jefe de ventas", "Operario", "Practicas") && sueldo BETWEEN 30000 AND 46000 LIMIT 2;

/* 
SUM() es una funcion que retorna la suma total del campo seleccionado (solo numericos)
SUM() no acepta LIMIT pero si acepta condiciones con el WHERE 
*/
SELECT * FROM vendedores;
SELECT sueldo FROM vendedores;
SELECT SUM(sueldo) FROM vendedores;
SELECT SUM(sueldo) FROM vendedores WHERE cargo IN ("Jefe de ventas"); 

/* AVG() funcion que retorna el promedio de una serie de datos. SOLO PERMITE NUMEROS */
SELECT * FROM vendedores;
SELECT AVG(sueldo) FROM vendedores;
SELECT AVG(sueldo) AS total FROM vendedores WHERE cargo IN ("Jefe de ventas");

/* COUNT() contar el numero total de ocurrencias */
SELECT * FROM vendedores WHERE cargo IN ("Jefe de ventas");
SELECT COUNT(*) AS total FROM vendedores WHERE cargo IN ("Jefe de ventas");

/* AS es un alias. Personaliza el  nombre del campo que me aparece en los valores retornados */
SELECT nombre AS nombre_vendedor, apellidos AS apellidos_vendedor, dni, fecha_inicio AS fecha FROM vendedores;

/* MAX() funcion que retorna el numero maximo de una serie de valores */
SELECT * FROM vendedores;
SELECT MAX(sueldo) FROM vendedores WHERE cargo IN ("Vendedor");

/* MIN() funcion que retorna el numero minimo de una serie de valores */
SELECT * FROM vendedores;
SELECT MIN(sueldo) FROM vendedores WHERE cargo IN ("Vendedor");
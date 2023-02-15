/* Ejercicio: Obtener todos los empleados y sus departamentos, incluyendo aquellos que no tienen empleado asignado:*/
SELECT e.id, e.nombre, d.nombre
FROM empleados e
RIGHT JOIN departamentos d ON e.departamento_id = d.id;

/* Ejercicio: Obtener todos los departamentos y sus empleados, incluyendo aquellos empleados que no tienen departamento asignado:*/
SELECT d.id, d.nombre, e.nombre
FROM departamentos d
RIGHT JOIN empleados e ON d.id = e.departamento_id;

/* Ejercicio: Obtener el salario total de cada departamento:*/
SELECT d.nombre, SUM(e.salario)
FROM empleados e
RIGHT JOIN departamentos d ON e.departamento_id = d.id
GROUP BY d.nombre;

/* Ejercicio: Obtener el número de empleados en cada departamento:*/
SELECT d.nombre, COUNT(e.id)
FROM empleados e
RIGHT JOIN departamentos d ON e.departamento_id = d.id
GROUP BY d.nombre;

/* Ejercicio: Obtener el salario promedio de cada departamento:*/
SELECT d.nombre, AVG(e.salario)
FROM empleados e
RIGHT JOIN departamentos d ON e.departamento_id;

/* Ejercicio: Obtener el salario promedio de cada departamento:*/
SELECT d.nombre, AVG(e.salario)
FROM empleados e
RIGHT JOIN departamentos d ON e.departamento_id = d.id
GROUP BY d.nombre;

/* Ejercicio: Obtener el salario máximo de cada departamento:*/
SELECT d.nombre, MAX(e.salario)
FROM empleados e
RIGHT JOIN departamentos d ON e.departamento_id = d.id
GROUP BY d.nombre;

/* Ejercicio: Obtener el salario mínimo de cada departamento:*/
SELECT d.nombre, MIN(e.salario)
FROM empleados e
RIGHT JOIN departamentos d ON e.departamento_id = d.id
GROUP BY d.nombre;

/* Ejercicio: Obtener el número de empleados con salario superior a $60,000 por departamento:*/
SELECT d.nombre, COUNT(e.id)
FROM empleados e
RIGHT JOIN departamentos d ON e.departamento_id = d.id
WHERE e.salario > 60000
GROUP BY d.nombre;

/* Ejercicio: Obtener el número de empleados con salario inferior a $60,000 por departamento:*/
SELECT d.nombre, COUNT(e.id)
FROM empleados e
RIGHT JOIN departamentos d ON e.departamento_id = d.id
WHERE e.salario < 60000
GROUP BY d.nombre;

/* Ejercicio: Obtener el número de empleados por departamento y género:*/
SELECT d.nombre, e.genero_id, COUNT(e.id)
FROM empleados e
RIGHT JOIN departamentos d ON e.departamento_id = d.id
GROUP BY d.nombre, e.genero_id;
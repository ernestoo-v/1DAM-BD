/*
	SUBCONSULTAS
    Hallar una serie de valores para utilizar en otra consulta
    
    ¿Que clientes han comprado lomo? / ¿A que clientes se ha vendido el producto lomo?
    NECESITO SABER EL NOMBRE
    Respuesta:
    - cliente_id --> una lista de mas de un cliente
    
    Hacer consulta sobre la tabla de cliente ----> nombre
*/

select nombre 
from clientes
where id IN (select cliente_id from ventas where productos like ('lomo'));

select * from recetas;

/*
	Cuales son las recetas con tiempo de preparacion de menos de 30 minutos
    
    1. Necesitamos el nombre de la receta.
    2. Necesito tiempo preparacion comparando dos elementos distintos:
		- dentro de tiempo_preparacion debe estar la palabra 'minutos'
        - dentro de tiempo_preparacion debe estar un numero menor o igual a 30
        - dentro de tiempo_prepraracion no debe haber una palabra 'hora'
*/
select * from recetas;

SELECT nombre
FROM recetas
WHERE nombre IN (SELECT DISTINCT nombre
FROM recetas
WHERE tiempo_preparacion LIKE ('%minutos') AND substring(tiempo_preparacion, 1 ,2) < 30);

SELECT nombre
FROM recetas
WHERE tiempo_preparacion NOT LIKE ('%horas%') 
	AND tiempo_preparacion LIKE ('%minutos%') 
    AND substring(tiempo_preparacion, 1 ,2) < 30;
    

/* 
	30. Cuantas recetas tienen un tiempo de preparacion de mas de 1 hora
    - COUNT(*)
    - substring con el tiempo 1h
    - like con palabra hora
    - like con horas y minutos (OK)
    - para cumplir con la receta con id = 2 necesitamos utilizar el length
    
    - CASO ESPECIAL: 
		+ no existe palabra horas
        + la suma de los minutos es mayor a 60
        
*/

SELECT COUNT(*)
FROM recetas
WHERE tiempo_preparacion LIKE ('%hora%')
	AND LENGTH(tiempo_preparacion) > 6;

/*
	Con esta consulta hallamos la posicion del signo + para aquellas recetas que tengan dos tramos distintos de minutos
*/

SELECT POSITION('+' IN tiempo_preparacion)
FROM recetas
WHERE tiempo_preparacion LIKE ('%minutos%') 
	AND tiempo_preparacion NOT LIKE ('%hora%') 
    AND tiempo_preparacion LIKE ('%+%');
    
/*
	Con esta consulta tenemos el segundo tramo de minutos una vez partimos del simbolo +
*/
SELECT SUBSTRING(tiempo_preparacion, 13, 3)
FROM recetas
WHERE tiempo_preparacion LIKE ('%minutos%') 
	AND tiempo_preparacion NOT LIKE ('%hora%') 
	AND tiempo_preparacion LIKE ('%+%');
    
/*
	Con esta consulta tenemos los primeros numeros
*/
SELECT SUBSTRING(tiempo_preparacion, 1, 3)
FROM recetas
WHERE tiempo_preparacion LIKE ('%minutos%') 
	AND tiempo_preparacion NOT LIKE ('%hora%') 
	AND tiempo_preparacion LIKE ('%+%');
    
/*
	SUMA de ambos substrings
*/
SELECT nombre
FROM recetas
WHERE tiempo_preparacion LIKE ('%minutos%') 
	AND tiempo_preparacion NOT LIKE ('%hora%') 
	AND tiempo_preparacion LIKE ('%+%')
	AND SUBSTRING(tiempo_preparacion, 1, 3) + SUBSTRING(tiempo_preparacion, 13, 3) > 60;



/*
	13. ¿Cuáles son los tipos de carne más vendidos en el mes de enero?
	a) Res y Cerdo                // Correcto           
	b) Res y Cordero              // Correcto                       
	c) Cerdo y Ave                // Correcto                       
	d) Res y Ave                  // Correcto 
    
    - En la tabla productos, existe un campo tipo que DEBERIA LLAMARSE NOMBRE.
    - Si no existe un tipo_id que se relacione con otra tabla donde tenamos los tipos de los productos desglosados por carne, pesado, molusco, marisco, etc
      Realizar la consulta e intepretar.
      
*/
select * from ventas;

SELECT productos, COUNT(*) 
FROM VENTAS
WHERE fecha LIKE ('____-01-__')
GROUP BY productos
ORDER BY COUNT(*) DESC; 

/* Opcion teniendo en cuenta la cantidad de productos por campo cantidad */
SELECT productos, SUM(cantidad) 
FROM VENTAS
WHERE fecha LIKE ('____-01-__')
GROUP BY productos
ORDER BY cantidad DESC; 

/*
	16. ¿Cuáles son los 3 productos más vendidos en el mes de enero?
	a) Salchicha, ave, cordero      // Correcta 
	b) Ave, cordero, cerdo           
	c) Conejo, ave, cerdo
	d) Chorizo, salchicha, cordero
    e) Salchicha, ave, cerdo 		// Correcta
*/

SELECT productos, SUM(cantidad) 
FROM ventas
WHERE fecha LIKE ('____-01-__')
GROUP BY productos
ORDER BY cantidad DESC; 

/*
	6. ¿A que proveedor se le compra mas de 1 productos con una fecha de vencimiento en diciembre de 2022?
	a) Granja S.A.    				// Correcta                  
	b) Pescaderia S.A.              // Pescaderia
	c) Proveedor1 S.L.
	d) Ganaderia S.A.   			// Correcta
    
    - De proveedores interesa coger el campo nombre.
    - de compras interesa saber el producto comprado.
    - de productos interesa saber la fecha de vencimiento // ok
    
*/
SELECT * FROM COMPRAS;

/* Con esta consulta tenemos los productos con fecha de vencimiento indicada */
SELECT tipo
FROM productos
WHERE fecha_vencimiento LIKE('2022-12-__');

/* Con esta consulta comparo los valores del campo de productos con los de la consulta anterior */
SELECT proveedor_id
FROM compras
	WHERE productos IN (SELECT tipo
	FROM productos
	WHERE fecha_vencimiento LIKE('2022-12-__'))
GROUP BY proveedor_id 
HAVING COUNT(*) > 1;

/* Una vez he hallado el id de los proveedores, solo queda comparar con la tabla de proveedores */
SELECT nombre_empresa 
FROM proveedores
WHERE id IN (SELECT proveedor_id
FROM compras
	WHERE productos IN (SELECT tipo
	FROM productos
	WHERE fecha_vencimiento LIKE('2022-12-__'))
GROUP BY proveedor_id 
HAVING COUNT(*) > 1);

/*
	21. ¿Cuáles son los empleados contratados mas reciente y mas antiguamente?
	a) Juan Perez, Maria Gomez
	b) Maria Gomez, Andres Rodriguez
	c) Andres Rodriguez, Maria Gomez         
	d) Juan Perez, Andres Rodriguez  		Correcta
    
    - Subconsulta 1: recoger el empleado mas antiguo ---> comparar con fecha
    - Subconsulta 2: recoger el empleado mas reciente ---> comparar con fecha
    
*/

/* Empleado mas reciente */
SELECT id
FROM empleados
ORDER BY fecha_contratacion DESC LIMIT 1;

/* Empleado mas antiguo */
SELECT id
FROM empleados
ORDER BY fecha_contratacion ASC LIMIT 1;

/* Respuesta total */
SELECT nombre
FROM empleados
WHERE id IN((SELECT id
	FROM empleados
	ORDER BY fecha_contratacion DESC LIMIT 1), (SELECT id
	FROM empleados
	ORDER BY fecha_contratacion ASC LIMIT 1));

/* Dos opciones mas de respuesta */
SELECT nombre
FROM empleados
WHERE id = (SELECT id FROM empleados ORDER BY fecha_contratacion DESC LIMIT 1)
	OR id = (SELECT id FROM empleados ORDER BY fecha_contratacion ASC LIMIT 1);
    
SELECT nombre, fecha_contratacion
FROM empleados
WHERE fecha_contratacion = (SELECT MAX(fecha_contratacion) FROM empleados)
	OR fecha_contratacion = (SELECT MIN(fecha_contratacion) FROM empleados);
    

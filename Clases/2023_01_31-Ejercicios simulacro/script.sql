use supermercado;
/*GRUPO A INCOMPLETO*/
/*
    1. ¿Cuántos productos hay con inventario inferior a 50 unidades?
        a) 1
        b) 3
        c) 4
        d) 5    			// Correcta
*/
SELECT COUNT(*) FROM productos WHERE inventario < 50;

/*
    2. ¿Cuáles son los clientes que han comprado al menos 2 productos diferentes?
        a) Juan Perez, Carlos Rodriguez				// Correcta
        b) Juan Perez, Maria Gomez					// Correcta
        c) No hay datos en la respuesta     
        d) Carlos Rodriguez, Andres Rodriguez
*/
SELECT nombre 
FROM clientes 
WHERE id IN (SELECT cliente_id FROM ventas GROUP BY cliente_id HAVING COUNT(DISTINCT productos) >=2);

/*
    3. ¿Cual es la media de salario de empleados por puesto teniendo en cuenta solo aquellos que 
    tienen salarios mayores a $2000?
        a) Gerente, 2500
        b) Gerente, 3000         // Correcta
        c) Carnicero, 2000
        d) Carnicero, 2500
*/
SELECT CAST(AVG(salario) AS DECIMAL(10,0)) AS 'salario medio', puesto
FROM empleados
WHERE salario > 2000
GROUP BY puesto; 

SELECT CAST(AVG(salario) AS DECIMAL(10,0)) AS 'salario medio', puesto
FROM empleados
GROUP BY puesto
HAVING CAST(AVG(salario) AS DECIMAL(10,0)) > 2000; 

/*
    4. ¿Cuáles son las fechas en las que se registraron ventas de más de 3 unidades de algún producto?
        a) 2022-01-01, 2022-01-02
        b) 2022-01-03, 2022-01-04
        c) 2022-01-03, 2022-01-06       		// Correcta
        d) 2022-01-07, 2022-01-08
*/
SELECT fecha
FROM ventas 
WHERE cantidad > 3 
GROUP BY fecha;

SELECT fecha
FROM ventas 
WHERE cantidad > 3;


/*
    5. ¿Cuáles son los productos más vendidos en el mes de enero?
        a) Salchicha, cordero, ave          // Correcto
        b) Salchicha, longaniza, res
        c) Salchicha, ave, codero			// Correcto
        d) Longaniza, cordero, mortadela
*/
SELECT productos, cantidad
FROM ventas
WHERE fecha LIKE ('2022-01%') 
ORDER BY cantidad DESC;

SELECT productos, SUM(cantidad)
FROM ventas WHERE fecha LIKE('2022-01%')
GROUP BY productos
ORDER BY SUM(cantidad) DESC;

/*
    6. ¿A que proveedor se le compra mas de 1 productos con una fecha de vencimiento en diciembre de 2022?
        a) Granja S.A.                      // Correcta
        b) Pescaderia S.A.                  // Correcta
        c) Proveedor1 S.L.	
        d) Ganaderia S.A.   				// Correcta                
*/
SELECT nombre_empresa
FROM proveedores
WHERE id IN (
	SELECT proveedor_id FROM compras WHERE productos IN (
		SELECT tipo FROM productos WHERE fecha_vencimiento LIKE '2022-12-__') GROUP BY proveedor_id HAVING COUNT(*) > 1);

/*
    7. ¿Cuáles son los empleados que han sido contratados en el año 2022?
        a) Juan Perez, Maria Gomez                  // Correcta
        b) Carlos Rodriguez, Andres Rodriguez       // Correcta
        c) Ana Lopez, Pedro Garcia                  // Correcta
        d) Juana Martinez, Luis Gonzalez            // Correcta
*/
SELECT nombre
FROM empleados
WHERE fecha_contratacion LIKE '2022%';


/*
    8. ¿Cuáles son las recetas con tiempo de preparación de menos de 30 minutos?
        a) Pizza casera, espagueti ala boloñesa     		// Correcta
        b) Pollo a la parrilla, hamburguesas caseras		
        c) Espagueti ala boloñesa, arroz frito      		// Correcta
        d) Asado de cordero, hamburguesas caseras
*/

/*INCOMPLETA, NO COMPARA CON 30*/
SELECT *
FROM recetas
WHERE tiempo_preparacion LIKE '__ minutos'
ORDER BY tiempo_preparacion;

/* HACMOS CAST PARA ASEGURARNOS COMPARAR CON UN NUMERO EL SUBSTRING */
SELECT nombre 
FROM recetas 
WHERE tiempo_preparacion LIKE ('%minuto%') 
	AND tiempo_preparacion NOT LIKE ('%hora%')
	AND CAST(substring(tiempo_preparacion,1,2) AS DECIMAL(10,2)) < 30;

/*
    9. ¿Cuáles son los tipos de carne que ha comprado el cliente con ID 2?
        a) Chorizo y cangrejo       
        b) Chorizo y cordero
        c) cangrejo y ave
        d) Res y ave
*/
/* La consulta es correcta. No aparece ninguna respuesta coincidente */
SELECT *
FROM ventas
WHERE cliente_id = 2;

SELECT historial_compras
FROM clientes
WHERE id = 2;

/* SOBRA GROUP BY PORQUE NO APORTA NADA */
SELECT productos, cliente_id
FROM ventas
WHERE cliente_id IN (2)
GROUP BY productos;

/*
    10. ¿Cuáles son los nombres de los empleados que tienen un salario mayor a 2000?
        a) Juan Perez 
        b) Carlos Rodriguez                     // Correcta
        c) Juan Perez 
        d) Maria Gomez 
*/
SELECT nombre
FROM empleados
WHERE salario > 2000;

/*
    11. ¿Cuáles son los productos que se han vendido en el mes de enero?
        a) Res, cerdo, pollo
        b) Res, cerdo, cordero                  // Correcto
        c) Res, ave, pollo
        d) Cerdo, ave, cordero                  // Correcto
*/
SELECT productos
FROM ventas
WHERE fecha LIKE '%-01-%';

/*
    12. ¿Cuál es el precio total de las ventas realizadas el día 2 de Enero?
        a) Entre 20 y 30 
        b) Entre 30 y 40            // Correcta             
        c) Entre 40 y 50 
        d) Entre 50 y 60 
*/
SELECT SUM(precio)
FROM ventas
WHERE fecha LIKE '____-01-02';

/*Seria correcta aunque no salga ningun resultado posible en las respuestas*/
SELECT SUM(precio * cantidad)
FROM ventas
WHERE fecha LIKE '____-01-02';


/*
    13. ¿Cuáles son los tipos de carne más vendidos en el mes de enero?
        a) Res y Cerdo                          
        b) Res y Cordero                        
        c) Cerdo y Ave                          
        d) Res y Ave                            
*/
/* La respuesta mas correcta puede ser la 'c' aunque no aparezca salchicha */
SELECT SUM(cantidad), productos
FROM ventas
WHERE fecha LIKE '____-01-__'
GROUP BY productos
ORDER BY cantidad DESC;

/*
    14. ¿Cuáles son los nombres de los clientes que han comprado carne de res?
        a) Juan Perez y Maria Gomez
        b) Carlos Rodriguez y Ana Lopez
        c) Juan Perez y Juana Martinez          // Correcta    
        d) Maria Gomez y Ana Lopez
*/
/*Parcialmente correcta*/
SELECT nombre
FROM clientes
WHERE id IN (SELECT cliente_id FROM ventas WHERE productos LIKE 'res');

SELECT nombre
FROM clientes
WHERE historial_compras LIKE '%res%';

/*
    15. ¿Cuánto es el total de ventas del mes de marzo?
        a) $500
        b) $1000
        c) $1500
        d) No hay datos                      // Correcta        
*/
SELECT SUM(precio) 
FROM ventas 
WHERE fecha BETWEEN '2022-03-01' AND '2022-03-31';

/*
    16. ¿Cuáles son los 3 productos más vendidos en el mes de enero?
        a) Salchicha, ave, cordero       // Correcta
        b) Ave, cordero, cerdo           
        c) Conejo, ave, cerdo
        d) Chorizo, salchicha, cordero
*/
SELECT productos, SUM(cantidad) as total_vendido 
FROM ventas 
WHERE fecha BETWEEN '2022-01-01' AND '2022-01-31' 
GROUP BY productos 
ORDER BY total_vendido DESC;


/*
    17. ¿Cuáles son los empleados que tienen un salario mayor a $1000?
        a) Juan Perez, Maria Gomez			// Correcta
        b) Carlos Rodriguez, Ana Lopez	
        c) Juan Perez, Carlos Rodriguez		// Correcta
        d) Maria Gomez, Ana Lopez
*/
SELECT nombre 
FROM empleados 
WHERE salario > 1000;

/*
    18. ¿Cuales son los puesto que tienen algun empleados por puesto con un salario mayor a $1200?
        a) Carnicero                    // Correcta    
        b) Encargado                    
        c) Encargado de compras         // Correcta 
        d) Cocinero                         
*/
SELECT puesto, COUNT(*) 
FROM empleados 
WHERE salario > 1200 
GROUP BY puesto 
HAVING COUNT(*) > 0;

SELECT puesto, COUNT(*) 
FROM empleados 
WHERE salario > 1200 
GROUP BY puesto 
ORDER BY salario DESC;

/*
    19. ¿Cuál es el cliente que hizo mas compras en el mes de febrero?
        a) Juan Perez
        b) Carlos Rodriguez
        c) No existen datos                     // Correcta
        d) Juan Perez, Carlos Rodriguez
*/
/*Parcialmente correcto puesto que necesito el nombre del cliente y no el id*/
SELECT cliente_id, count(*) 
FROM ventas 
WHERE fecha BETWEEN '2022-02-01' AND '2022-02-28' 
GROUP BY cliente_id 
ORDER BY count(*) DESC;

SELECT nombre 
FROM clientes
WHERE id IN (SELECT cliente_id FROM ventas WHERE MONTH(fecha) = 2 GROUP BY cliente_id ORDER BY COUNT(*) DESC);

SELECT nombre 
FROM clientes
WHERE id IN (SELECT DISTINCT cliente_id FROM ventas WHERE MONTH(fecha) = 2 ORDER BY COUNT(*) DESC);
/*
    20. ¿Cuál es el empleado contratado más recientemente?
        a) Juan Perez
        b) Maria Gomez
        c) Andres Rodriguez         // Correcta 
        d) Ana Lopez
*/
SELECT nombre, fecha_contratacion
FROM empleados 
ORDER BY fecha_contratacion DESC;

/*
    21. ¿Cuáles son los empleados contratados mas reciente y mas antiguamente?
        a) Juan Perez, Maria Gomez
        b) Maria Gomez, Andres Rodriguez
        c) Andres Rodriguez, Maria Gomez         
        d) Juan Perez, Andres Rodriguez             // Correcta
*/
select nombre 
from empleados 
where id = (select id from empleados order by fecha_contratacion desc limit 1)
	 OR id = (select id from empleados order by fecha_contratacion asc limit 1);

/*
    22. ¿Cuál es el producto con fecha de vencimiento más cercana?
        a) Cangrejo                                 // Correcta
        b) Cerdo									// Correcta	
        c) Ave										// Correcta
        d) Cordero									// Correcta
*/
select tipo, fecha_vencimiento
from productos 
order by fecha_vencimiento desc;

/*Mas correcta*/
SELECT tipo
FROM productos
WHERE fecha_vencimiento = (SELECT MAX(fecha_vencimiento) FROM productos);

/*
    23. ¿Cuántos tipos de productos diferentes hay en el inventario?
        a) 15						// Correcto
        b) 17
        c) 19
        d) 20                       
*/
/*OJO ERROR. NO ES ESTA LA TABLA*/
SELECT COUNT(DISTINCT productos) 
FROM compras;

/*ESTA SI*/
SELECT COUNT(DISTINCT tipo) 
FROM productos;

/*
    24. ¿Cuál es el precio promedio de los productos?
        a) $12
        b) $13                          
        c) $14
        d) $15
*/

/*
    25. ¿Cuál es el producto con el inventario más alto?
        a) Salchicha                 
        b) Cerdo
        c) Ave
        d) Cordero
*/

/*
    26. ¿Cuántos clientes han comprado carne de res?
        a) 1
        b) 2                            
        c) 3
        d) 4
*/

/*
    27. ¿Cuántos empleados ganan más de $2000 al mes?
        a) 1                                    
        b) 2
        c) 3
        d) 4
*/

/*
    28. ¿Cuál es el producto más vendido en el mes de enero?
        a) Salchicha                        
        b) Ave
        c) Cordero
        d) No hay dato disponibles
*/

/*
    29. ¿Cuántas ventas se hicieron en el mes de febrero?
        a) 0                                
        b) 2
        c) 3
        d) 4
*/

/*
    30. ¿Cuántas recetas tienen un tiempo de preparación de más de 1 hora?
        a) 2
        b) 3                                    
        c) 4
        d) 5
*/

/*
    31. ¿Cuántas recetas requieren de cebolla para su preparacion?
        a) 2
        b) 4
        c) 6
        d) 8                                
*/

/*
    32. ¿Cuáles son los nombres de las recetas que contienen la palabra "BBQ" en los ingredientes?
        a) Costillas BBQ                        
        b) Asado BBQ
        c) Hamburguesa BBQ
        d) Pollo BBQ
*/

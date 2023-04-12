USE carniceria;

SELECT * FROM ventas;

-- Crear una transaccion que suba 3€ a todos los precios de los productos comprados por el cliente_id 3
-- Ademas subir en 1 la cantidad de todos los productos
SHOW ENGINES;
/*
	TODA TRANSACCION ES POSIBLE REALIZARLA CON EL MOTOR InnoDB y no con el motor MyISAM (el que viene por defecto)
	
    ROLLBACK CANCELA LA TRANSACCION Y DEUVELVE LOS VALORES ORIGINALES
    COMMIT CONFIRMA LA TRANSACCION Y APLICA DEFINITIVAMENTE LOS CAMBIOS REALIZADOS.
    
    ANTES DE LA TRANSACCION
    3	2022-01-03	Ave		5	46.96	3
    13	2022-01-13	Conejo	3	28.98	3
    
    DESPUES DE LA TRANSACCION (TODOS LOS PRODUCTOS SUMAN 1 EN CANTIDAD PERO ESTOS DOS SUMAN TAMBIEN EN PRECIO)
    3	2022-01-03	Ave		6	49.96	3
    13	2022-01-13	Conejo	4	31.98	3
*/
START TRANSACTION;
BEGIN;
	-- Sentencias
    UPDATE ventas SET precio = precio + 3 WHERE cliente_id = 3;
    UPDATE ventas SET cantidad = cantidad + 1;
ROLLBACK;

/*
	FUNCIONES DE USUARIO
    Crear porciones de codigo reutilizables en tareas sencillas. 
    Ej: total (pasta) de compras realizadas, numero de clientes registrados, ventas superiores a 50€, productos en oferta

	Todas las funciones de usuario tienen RETURN
    
    No es obligatorio que tengan parametros las funciones.
    
    SINTAXIS
		CREATE FUNCTION nombre (
			parametro1 TIPO,
            parametro2 TIPO
            ...
        ) RETURNS TIPO
        BEGIN
			// Declaracion de variable
            DECLARE variable TIPO [DEFAULT valor];
            
            // Instrucciones
            ¿?
            
            // Zona de retorno
            RETURN variable;
        END;
        
	COMO REALIZAR LA FUNCION EN WORKBENCH
    -	Mediante un script (este mismo fichero).
    -	Mediante el espacio reservado para crear funciones de usuario.
*/

-- Ejemplo: realiza una funcion que se llame getClientes que retorne el total de clientes que hay registrados
DELIMITER /
CREATE FUNCTION getClientes()
RETURNS INTEGER
BEGIN
	-- Declaro variable
    DECLARE total INTEGER DEFAULT 0;
    
    -- Realizo las instrucciones
    -- SET total = (SELECT COUNT(*) FROM clientes);
    SELECT COUNT(*) INTO total FROM clientes;
    
    -- Zona return
    RETURN total;
END /
DELIMITER ;

DROP FUNCTION getClientes;
SELECT getClientes();

-- Realiza una funcion que devuelva cuantos productos cuestan mas de un valor introducido (nuestro ejemplo con 15€)
SELECT * FROM productos;

DELIMITER $$
CREATE FUNCTION getProduct (
	precio_producto INTEGER
) RETURNS INTEGER
BEGIN 
	DECLARE resultado INTEGER DEFAULT 0;
    
    SELECT COUNT(*) INTO resultado FROM productos WHERE precio >= precio_producto; 
    
    RETURN resultado;
END $$
DELIMITER ;

DROP FUNCTION getProduct;
SELECT getProduct(15) AS 'Total';
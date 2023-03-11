use trimestre2examen2;

/*
	START TRANSACTION
    BEGIN
		// SENTENCIAS DE LA TRANSACCION
	COMMIT / ROLLBACK;
*/

/*
	BLOQUEOS EN SQL
    El bloqueo en SQL es una medida de control de concurrencia (acceso compartido de datos).
    Se utiliza para evitar que varias transacciones accedan simultanamiente a los datos y evitar asi posibles conflictos.
    Por tanto, garantizan acceso exclusivo a un recurso especifico.
    
    Existen dos tipos de bloqueos:bloqueo explicito e implicito.
	
    SINTAXIS 
		
		SELECT ... FOR [ UPDATE | SHARE ]
        
        -	FOR UPDATE: realiza un bloqueo exclusivo. Ninguna transaccion puede modificar o leer esas filas o columnas hasta que temine 
						la transaccion actual.
		-	FOR SHARE: realiza un bloqueo que permite leer las filas pero NO PERMITE MODIFICARLAS hasta que termine la transaccion actual.
        
        NOTA: los bloqueos finalizan cuando se ejecutan las sentencias COMMIT o ROLLBACK para confirmar o deshacer los cambios realizados.

		Ejemplo: 
			SELECT * FROM productos FOR UPDATE; 		---> bloquea el acceso de lectura y escritura a la tabla productos
			SELECT * FROM productos FOR SHARE;			---> bloquea el acceso de escritura pero no lectura a la tabla productos.
*/


/*
	Ejercicio 1:
	Realice una transacción que:
    -	inserte un nuevo usuario en la tabla 'users', 
    -	un nuevo pedido en la tabla 'pedidos'
    -	nuevo registro en la tabla 'pedidos_has_productos' con un producto existente (el que sea) y el pedido recién creado.
*/

/*
START TRANSACTION;
    BEGIN;
		-- Primera insercion 
		INSERT INTO users VALUES (NULL, 'nombre', 'apellidos', 'email', 'pass', 'dniiip');
        -- Almaceno en una variable el ultimo id insertado, es decir, el maximo 
        SET @user_id = (SELECT MAX(id) FROM users);
        -- Segunda insercion 
        INSERT INTO pedidos VALUES (NULL, @user_id, CURDATE());
        -- Almaceno en una variable el ultimo id insertado en pedidos, es decir, el maximo 
        SET @pedido_id = (SELECT MAX(id) FROM pedidos);
        -- Tercera insercion 
        INSERT INTO pedidos_has_productos VALUES (@pedido_id, 2, 1, 1);
	ROLLBACK;
*/
/*
	Ejercicio 2:
    Cree una transacción que:
    -	actualice el precio de un producto en la tabla 'productos' (el que sea)
    -	actualice el precio de todos los registros en la tabla 'pedidos_has_productos' que contienen ese producto. (el precio de antes)
*/
SELECT * FROM productos WHERE id = 10; -- 1 fila
SELECT * FROM pedidos_has_productos WHERE producto_id = 10; -- 5 filas

START TRANSACTION;
BEGIN;
	-- UPDATE tabla SET campo = valor WHERE condiciones
    -- Actualizo el precio del producto con id 10 al precio 0.02
    UPDATE productos SET precio = 0.02 WHERE id = 10;
    -- Busco todos los registros con pedido_id 10 y le cambio el precio al producto
    UPDATE pedidos_has_productos SET precio = 0.02 WHERE producto_id = 10;
COMMIT;

/*
	Ejercicio 3:
    Realice una transacción que:
    -	seleccione y bloquee todos los registros en la tabla 'pedidos_has_productos' para un pedido específico (el que sea) 
    -	actualice los valores de unidades y precio de cada registro 
    -	actualice el stock del producto correspondiente en la tabla 'productos'.
*/

START TRANSACTION;
BEGIN;
	-- Bloqueamos la tabla pedidos_has_productos con todos los campos. (Agregar FOR UPDATE al final).
    SELECT * FROM pedidos_has_productos FOR UPDATE;
    -- Actualizar valores de unidades y precio de cada registro (pedidos_has_productos) con un id de producto cualquiera
    UPDATE pedidos_has_productos SET unidades = unidades - 5, precio = precio - 0.99 WHERE producto_id = 15;
    -- Actualizar stock del producto en la tabla productos (OJO, antes bloqueo la tabla para evitar problemas)
    SELECT * FROM productos FOR UPDATE;
    UPDATE productos SET stock = stock -5 WHERE id = 15;
ROLLBACK;

/*
	EJERCICIOS EXTRA
    
    Ejercicio 4.  
    Cree una transacción que seleccione y bloquee todos los registros en la tabla 'pedidos_has_productos' para un pedido específico y elimine el pedido y todos los registros asociados en las tablas 'pedidos_has_produ
ctos' y 'pedidos'.

	Ejercicio 5.  
    Realice una transacción que seleccione y bloquee todos los registros en la tabla 'pedidos_has_productos' para un pedido específico, actualice el stock de cada producto correspondiente en la tabla 'productos', elimine todos los registros de la tabla 'pedidos_has_productos' asociados con el pedido y, a continuación, elimine el pedido de la tabla 'pedidos'.

	Ejercicio 6.  
    Cree una transacción que seleccione y bloquee todos los registros en la tabla 'pedidos_has_productos' para un pedido específico, sume los precios de cada registro y actualice el precio total del pedido en la tabla 'pedidos'.
*/
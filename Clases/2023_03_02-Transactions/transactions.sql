USE imf;

/*
	TRANSACTION
    Una transaccion es una agrupacion de una o varias sentencias que se ejecutan como una unico bloque de sentencia.
    Esto quiere decir que las sentencias que esten en la transaccion se ejecutan TODAS o ninguna.
    
    El objetivo de una transaccion en base de datos es garantizar que se realizan una serie de operaciones de manera segura y consistente. 
    
    Las transacciones  se utilizan comunmente en aplicaciones de bases de datos que requieren operaciones  criticas como la actualizacion de datos, transferencias 
    de fondos u operaciones similares.
    
    NOTA: NO FUNCIONA PARA EL MOTOR POR DEFECTO MyISAM. ES NECESARIO VERIFICAR QUE TENEMOS EL MOTOR INNODB U OTRO QUE SOPORTE LAS TRANSACCIONES
    
    Pasos:
	-	Para iniciar una transaccion utilizamos la instruccion BEGIN.
    -	Realizamos todas las operaciones necesarias en la transaccion.
    -	Si se realizan correctamente las operaciones, utilizamos la instruccion COMMIT para confirmar la transaccion.
    -	Si NO se realizan correctamente las operaciones, podemos cancelar las opearciones con la instruccion ROLLBACK.
    
    SINTAXIS:
    -	Con confirmacion
		START TRANSACTION;
		BEGIN;
			INSERT...
			UPDATE...
			DELETE...
		COMMIT;
	
    - Con cancelacion
		START TRANSACION;
        BEGIN;
			INSERT...
            UPDATE...
            DELETE..
		ROLLBACK;
*/
START TRANSACTION;
BEGIN;
    INSERT INTO alumno VALUES (20, 'Luis', 3.5);
ROLLBACK;

SELECT * FROM alumno;
/*SHOW ENGINES;*/
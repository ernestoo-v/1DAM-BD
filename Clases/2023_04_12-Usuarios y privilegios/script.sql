CREATE USER 'sergio'@'localhost' IDENTIFIED BY '1234';
DROP user 'sergio'@'localhost';
ALTER USER 'sergio'@'localhost' IDENTIFIED BY '5678';
-- PENDIENTE OPCION B PARA ACTUALIZAR CONTRASEÑA

/*
	CREACION DE USUARIO
    Al crear un usuario, este tiene acceso unicamente para autenticarse y no le aparece ninguna base de datos.
*/

USE MYSQL;
CREATE USER 'sergio'@'localhost' IDENTIFIED BY '1234';
SELECT CURRENT_USER();
SELECT DATABASE();
SELECT * FROM USER;

/*
	DAR PERMISOS
    Utilizamos la palabra reservada GRANT
    
    GRANT permiso, permiso2 ON bd.table TO 'usuario'@'host'
    
    QUITAR PERMISO
    Utilizamos la palbra reservada REVOKE
    REVOKE permiso ON bd.tabla FROM 'usuario'@'host'
*/

GRANT select ON carniceria.clientes TO 'sergio'@'localhost';
GRANT select, insert, update ON carniceria.ventas TO 'sergio'@'localhost';
SHOW GRANTS FOR 'sergio'@'localhost'; 
REVOKE insert, update ON carniceria.ventas FROM 'sergio'@'localhost';

GRANT ALL PRIVILEGES ON *.* TO 'sergio'@'localhost';

SHOW PRIVILEGES;

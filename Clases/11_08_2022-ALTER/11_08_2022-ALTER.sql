CREATE DATABASE IF NOT EXISTS clase_ocho_nov;

USE clase_ocho_nov;

CREATE TABLE IF NOT EXISTS alumnos(
	id INT AUTO_INCREMENT,
    nombreeeeee VARCHAR (45),
    numero_matricula VARCHAR (20),
    fecha_nacimiento DATETIME,
    grupo_id INT,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS grupos(
	id INT AUTO_INCREMENT,
    nombre INT,
    nota_media INT,
    PRIMARY KEY(id)
);

/* Sentencia que elimina grupo_id de la tabla alumnos */
ALTER TABLE alumnos DROP grupo_id;

/* Sentencia que agrega grupo_id a la tabla alumnos */
ALTER TABLE alumnos ADD grupo_id INT;

/* Sentencia que modifica el tipo de nota_media de INT a DECIMAL */
ALTER TABLE grupos MODIFY nota_media DECIMAL(4,2);

/* Sentencia que modifica el tipo de fecha_nacimiento de DATETIME a DATE */
ALTER TABLE alumnos MODIFY fecha_nacimiento DATE;

/* Sentencia que cambia el nombre de la columna nombreeeeee a nombre */
ALTER TABLE alumnos CHANGE nombreeeeee nombre VARCHAR(45);

/* Sentencia que crea una restriccion de clave foranea sobre grupo_id en referencia al id de la tabla grupos */
ALTER TABLE alumnos ADD CONSTRAINT FOREIGN KEY (grupo_id) REFERENCES grupos(id);

/* Sentencia que eliminar la clave foranea de una tabla */
ALTER TABLE alumnos DROP FOREIGN KEY alumnos_ibfk_1;

/* Sentencia que agrega clave unica a numero_matricula */
ALTER TABLE alumnos ADD UNIQUE (numero_matricula);

/* Sentencia que cambia el motor de mi tabla a InnoDB */
ALTER TABLE alumnos ENGINE = InnoDB;
ALTER TABLE grupos ENGINE = InnoDB;
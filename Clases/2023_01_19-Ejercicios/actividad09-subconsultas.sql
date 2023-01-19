CREATE DATABASE actividad09;

USE actividad09;

CREATE TABLE clientes (
  id INT PRIMARY KEY AUTO_INCREMENT,
  nombre VARCHAR(255) NOT NULL,
  ciudad VARCHAR(255) NOT NULL,
  edad INT NOT NULL
);

INSERT INTO clientes (nombre, ciudad, edad) VALUES 
('Juan', 'Madrid', 32),
('Ana', 'Barcelona', 28),
('Luis', 'Madrid', 45),
('María', 'Barcelona', 35),
('Pablo', 'Madrid', 23);

CREATE TABLE productos (
  id INT PRIMARY KEY AUTO_INCREMENT,
  nombre VARCHAR(255) NOT NULL,
  precio DECIMAL(10,2) NOT NULL,
  stock INT NOT NULL
);

INSERT INTO productos (nombre, precio, stock) VALUES 
('Libro', 15.50, 5),
('Bolígrafo', 0.99, 50),
('Cuaderno', 3.99, 10),
('Lápiz', 0.50, 100),
('Goma de borrar', 0.20, 200);

CREATE TABLE ventas (
  id INT PRIMARY KEY AUTO_INCREMENT,
  id_cliente INT NOT NULL,
  id_producto INT NOT NULL,
  fecha DATE NOT NULL,
  cantidad INT NOT NULL,
  FOREIGN KEY (id_cliente) REFERENCES clientes(id),
  FOREIGN KEY (id_producto) REFERENCES productos(id)
);

INSERT INTO ventas (id_cliente, id_producto, fecha, cantidad) VALUES 
(1, 1, '2022-01-01', 2),
(2, 2, '2022-01-02', 5),
(3, 3, '2022-01-03', 1),
(4, 4, '2022-01-04', 3),
(5, 5, '2022-01-05', 2);

use actividad09;

/*
	SUBCONSULTAS
    Consulta dentro de otra consulta.
    Utilizar en el WHERE
*/

/* Ejercicio: Obtener el nombre de todos los clientes que hayan realizado alguna compra*/
SELECT nombre
FROM clientes
WHERE id IN (SELECT id_cliente FROM ventas);


/*  ERROR. FALTA CAMPO CIUDADES EN TABLA VENTAS.. Ejercicio: Obtener el nombre y la ciudad de todos los clientes que hayan realizado alguna compra en Madrid*/


/* SI. Ejercicio: Obtener el nombre y el precio de todos los productos que no hayan sido comprados*/
SELECT nombre, precio
FROM productos
WHERE id NOT IN (SELECT id_producto FROM ventas);

/* SI. Ejercicio: Obtener el nombre de todos los clientes que hayan realizado alguna compra de más de 2 productos
 Ejercicio modificado: Obtener el nombre de todos los clientes que hayan realizado alguna compra con cantidad mayor a 2 
*/
SELECT nombre
FROM clientes
WHERE id IN (SELECT id_cliente FROM ventas WHERE cantidad > 2);

/* ¿SI? Ejercicio: Obtener el nombre y el precio de los productos que han sido comprados por al menos un cliente*/
SELECT nombre, precio
FROM productos
WHERE id IN(SELECT id_producto FROM ventas);

/* SI Ejercicio: Obtener el nombre de los clientes que no han realizado compras*/
SELECT nombre
FROM clientes
WHERE id NOT IN(SELECT id_cliente FROM ventas);

/* SI. Ejercicio: Obtener el nombre y el stock de los productos que tienen un stock mayor al promedio*/
SELECT nombre, stock
FROM productos
WHERE stock > (SELECT AVG(stock) FROM productos);

/* ERROR. FALTA CAMPO CIUDADES EN TABLA VENTAS. Ejercicio: Obtener el nombre de los clientes que han realizado compras en todas las ciudades*/

/* ¿REVISAR? SI Ejercicio: Obtener el nombre y el precio de los productos que han sido comprados por todos los clientes*/
SELECT nombre, precio
FROM productos
WHERE (SELECT count(id_producto) FROM ventas) = (SELECT count(id_cliente) FROM ventas);

/* ERROR. FALTA CAMPO CIUDADES EN TABLA VENTAS. Ejercicio: Obtener el nombre y la ciudad de los clientes que han realizado compras en todas las ciudades (de clientes)*/

/* SI. Ejercicio: Obtener el nombre de los productos que han sido comprados por al menos un cliente de Madrid*/
SELECT nombre
FROM productos
WHERE id IN(
	SELECT id_producto FROM ventas WHERE id_cliente IN(
		SELECT DISTINCT id FROM clientes WHERE ciudad = 'Madrid'));

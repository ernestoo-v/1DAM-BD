CREATE DATABASE actividad7;
USE actividad7;
CREATE TABLE Clientes (
  ID int NOT NULL AUTO_INCREMENT,
  Nombre varchar(255) NOT NULL,
  Apellidos varchar(255) NOT NULL,
  Direccion varchar(255) NOT NULL,
  Telefono varchar(255) NOT NULL,
  PRIMARY KEY (ID)
);
INSERT INTO Clientes (Nombre, Apellidos, Direccion, Telefono)
VALUES ('Juan', 'Perez', 'Calle 123', '555-5555'),
       ('Ana', 'Rodriguez', 'Avenida 456', '555-4444'),
       ('Pedro', 'Gonzalez', 'Calle 789', '555-3333'),
       ('Roberto', 'Martinez', 'Calle 321', '555-2222'),
       ('Sandra', 'Rodriguez', 'Avenida 654', '555-1111'),
       ('Javier', 'Gonzalez', 'Calle 987', '555-0000'),
       ('Laura', 'Perez', 'Calle 147', '555-7777'),
       ('Mario', 'Rodriguez', 'Avenida 258', '555-6666'),
       ('Andrea', 'Gonzalez', 'Calle 369', '555-5555'),
       ('Sofia', 'Perez', 'Calle 159', '555-4444'),
       ('Pablo', 'Rodriguez', 'Avenida 357', '555-3333'),
       ('Isabel', 'Gonzalez', 'Calle 741', '555-2222'),
       ('Miguel', 'Perez', 'Calle 852', '555-1111'),
       ('Cristina', 'Rodriguez', 'Avenida 963', '555-0000'),
       ('Sara', 'Gonzalez', 'Calle 159', '555-7777'),
       ('Daniel', 'Perez', 'Calle 753', '555-6666'),
       ('Adriana', 'Rodriguez', 'Avenida 951', '555-5555'),
       ('Carlos', 'Gonzalez', 'Calle 842', '555-4444');
CREATE TABLE Productos (
  ID int NOT NULL AUTO_INCREMENT,
  Nombre varchar(255) NOT NULL,
  Precio decimal(10,2) NOT NULL,
  Stock int NOT NULL,
  PRIMARY KEY (ID)
);
INSERT INTO Productos (Nombre, Precio, Stock)
VALUES ('Lapices', 1.50, 100),
       ('Borradores', 0.50, 50),
       ('Gomas de borrar', 0.75, 75),
       ('Cuadernos', 3.25, 25),
       ('Libretas', 2.50, 50),
       ('Marcadores', 3.00, 25),
       ('Pegamento', 1.00, 50),
       ('Tijeras', 2.50, 25),
       ('Reglas', 1.50, 10),
       ('Compases', 3.00, 5),
       ('Lupas', 5.00, 2),
       ('Pinceles', 1.75, 15),
       ('Papel de colores', 0.50, 50),
       ('Rotuladores', 2.25, 25),
       ('Marcadores de texto', 4.00, 10),
       ('Resaltadores', 2.50, 20),
       ('Crayones', 1.25, 50),
       ('Lapiceros', 0.75, 25),
       ('Correctores', 1.00, 10),
       ('Marcadores de pizarra', 2.50, 5),
       ('Pinturas', 4.00, 2),
       ('Grapadoras', 3.75, 15),
       ('Tijeras de corte', 4.00, 20),
       ('Papel milimetrado', 0.50, 50),
       ('Cuadernos', 2.25, 25),
       ('Resaltadores fluorescentes', 4.00, 10),
       ('Lapices de colores', 2.50, 20),
       ('Cartulinas', 0.75, 25),
       ('Papel de regalo', 1.00, 10),
       ('Cinta adhesiva', 3.00, 5),
       ('Papel decorado', 4.50, 2),
       ('Portaminas', 1.75, 15),
       ('Marcadores de colores', 2.25, 25),
       ('Marcadores permanentes', 3.00, 10),
       ('Papel de dibujo', 1.50, 50),
       ('Gomas de borrar', 0.50, 25),
       ('Sacapuntas', 0.75, 10),
       ('Compases', 2.00, 5);
CREATE TABLE Ventas (
  ID int NOT NULL AUTO_INCREMENT,
  IDCliente int NOT NULL,
  IDProducto int NOT NULL,
  Fecha date NOT NULL,
  Cantidad int NOT NULL,
  PRIMARY KEY (ID),
  FOREIGN KEY (IDCliente) REFERENCES Clientes(ID),
  FOREIGN KEY (IDProducto) REFERENCES Productos(ID)
);
INSERT INTO Ventas (IDCliente, IDProducto, Fecha, Cantidad)
VALUES (1, 1, '2022-01-01', 10),
       (2, 2, '2022-01-02', 5),
       (3, 3, '2022-01-03', 3),
       (1, 4, '2022-01-03', 4),
       (1, 5, '2022-01-13', 2),
       (1, 6, '2022-01-04', 2),
       (2, 7, '2022-01-05', 4),
       (3, 8, '2022-01-06', 3),
       (1, 9, '2022-01-07', 1),
       (2, 10, '2022-01-08', 5),
       (1, 26, '2022-02-01', 2),
       (2, 27, '2022-02-02', 4),
       (3, 28, '2022-02-03', 3),
       (1, 29, '2022-02-04', 1),
       (2, 30, '2022-02-05', 5),
       (3, 31, '2022-02-06', 2),
       (1, 32, '2022-02-07', 4),
       (2, 33, '2022-02-08', 3),
       (3, 34, '2022-02-09', 1),
       (1, 35, '2022-02-10', 5),
       (2, 36, '2022-02-11', 2),
       (3, 37, '2022-02-12', 4),
       (1, 38, '2022-02-13', 3),
       (1, 26, '2022-02-16', 2),
       (2, 27, '2022-02-17', 4),
       (3, 28, '2022-02-18', 3),
       (1, 29, '2022-02-19', 1),
       (2, 30, '2022-02-20', 5),
       (3, 31, '2022-02-21', 2),
       (1, 32, '2022-02-22', 4),
       (2, 33, '2022-02-23', 3),
       (1, 35, '2022-02-24', 1),
       (2, 36, '2022-02-25', 5),
       (3, 37, '2022-02-26', 2),
       (1, 38, '2022-02-27', 4),
       (1, 26, '2022-03-01', 5),
       (2, 27, '2022-03-02', 2),
       (3, 28, '2022-03-03', 4),
       (1, 29, '2022-03-04', 3),
       (2, 30, '2022-03-05', 1),
       (3, 31, '2022-03-06', 5),
       (1, 32, '2022-03-07', 2),
       (2, 33, '2022-03-08', 4),
       (3, 34, '2022-03-09', 3),
       (1, 35, '2022-03-10', 1),
       (2, 36, '2022-03-11', 5),
       (3, 37, '2022-03-12', 2),
       (1, 38, '2022-03-13', 4),
       (1, 26, '2022-03-16', 5),
       (2, 27, '2022-03-17', 2),
       (3, 28, '2022-03-18', 4),
       (1, 29, '2022-03-19', 3),
       (2, 30, '2022-03-20', 1),
       (3, 31, '2022-03-21', 5),
       (1, 32, '2022-03-22', 2),
       (2, 33, '2022-03-23', 4),
       (3, 34, '2022-03-24', 3),
       (1, 35, '2022-03-25', 1),
       (2, 36, '2022-03-26', 5),
       (3, 37, '2022-03-27', 2),
       (1, 38, '2022-03-28', 4),
       (1, 26, '2022-03-31', 5);


use actividad7;

/* Ejercicio: Selecciona todos los nombres de productos únicos de la tabla "Productos".*/
SELECT DISTINCT nombre
FROM productos;

/* Ejercicio: Selecciona todos los apellidos de clientes únicos de la tabla "Clientes".*/
SELECT DISTINCT apellidos
FROM clientes;

/* Ejercicio: Selecciona todas las direcciones de clientes únicas de la tabla "Clientes".*/
SELECT DISTINCT direccion
FROM clientes;

/* Ejercicio: Selecciona todos los nombres y apellidos de clientes únicos de la tabla "Clientes".*/
SELECT DISTINCT nombre, apellidos
FROM clientes;

/* Ejercicio: Selecciona todos los nombres y direcciones de clientes únicos de la tabla "Clientes".*/

/* Ejercicio: Selecciona todos los nombres y precios de productos únicos de la tabla "Productos".*/

/* Ejercicio: Selecciona todos los nombres, apellidos y direcciones de clientes únicos de la tabla "Clientes".*/
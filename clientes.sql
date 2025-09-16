CREATE DATABASE IF NOT EXISTS clientes;
USE clientes;
-- Este un comentario de una linea
/* 
Esto es un comentario multilinea
DROP DATABASE clientes; 

*/

-- Creación de una tabla
CREATE TABLE IF NOT EXISTS clientes (
id_cliente int AUTO_INCREMENT NOT NULL PRIMARY KEY,
nombre_cliente varchar(40) NOT NULL,
apellido_cliente varchar(40) NOT NULL,
telefono_cliente varchar(15),
poblacion_cliente varchar(40),
fecha_alta DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- Para añadir datos a una tabla --> INSERT INTO
INSERT INTO clientes(nombre_cliente, apellido_cliente) 
VALUES("Peter", "Parker");

-- Para leer o consultar los datos --> SELECT
SELECT * 
FROM clientes;

INSERT INTO clientes (nombre_cliente, apellido_cliente, telefono_cliente, poblacion_cliente)
VALUES ("Jane", "Lane", "+1 12345678", "Metrópolis" ), 
("Clark", "Kent", "+1 23456789", "Metropolis" );

SELECT COUNT(*) AS "número de registros" FROM clientes;

INSERT INTO clientes (nombre_cliente, apellido_cliente, telefono_cliente, poblacion_cliente)
VALUES ("Bruce", "Wayne", "+1 34567890", "Los Angeles" ), 
("Robin", "Hood", "+2 23456789", "Sherwood" );

SELECT * 
FROM clientes
WHERE poblacion_cliente = "Metropolis";

SELECT nombre_cliente as nombre, apellido_cliente as apellido
FROM clientes
WHERE poblacion_cliente = "Metropolis";

-- ¿Cuántos clientes viven en Metropolis?
SELECT count(*)
FROM clientes
WHERE poblacion_cliente = "Metropolis";

DELETE FROM clientes
WHERE id_cliente > 6; 

INSERT INTO clientes(nombre_cliente, apellido_cliente, telefono_cliente) VALUES
("Michael", "Corleone", "+34 98765654");

UPDATE clientes SET poblacion_cliente = "Marbella" 
WHERE nombre_cliente = "Michael" and apellido_cliente = "Corleone";

select * from clientes;

SELECT * 
FROM clientes
WHERE poblacion_cliente LIKE "M%";

SELECT * 
FROM clientes
WHERE apellido_cliente LIKE "_an%";

SELECT * 
FROM clientes
WHERE id_cliente NOT BETWEEN 2 and 4;
USE clientes3;

/*
Necesitamos una tabla llamada productos
con estos campos, todos obligatorios:
id_producto autoincremental primary key
nombre_producto varchar 30
precio_producto decimal(10, 2)
*/

CREATE table productos (
id_producto int auto_increment not null primary key,
nombre_producto varchar(30) not null,
precio_producto decimal(10, 2) not null
);

insert into productos(nombre_producto, precio_producto) VALUES
("Iphone 16", 750.25);

alter table productos
add column referencia varchar(10) null;

update productos -- actualizar tabla productos
set referencia = "12345" -- asignar el valor
where nombre_producto = "Iphone 16"; -- indicar el registro a actualizar

/*
Añadir una columna llamada color de tipo varchar 25
Actualiza la columna con un color (el que quieras)
*/
alter table productos
add column color varchar(10) null;


-- cambiar el nombre a la columna
alter table productos
rename column color to colour;

-- borrar la columna colour
alter table productos
drop column colour;

insert into productos(nombre_producto, precio_producto) VALUES
("Samsung 50", 800.35),
("Xiaomi 28", 140.89),
("Redmi 14", 200.67),
("Realme 10", 281.60),
("Samsung 52", 900.45)
;


-- count(*) para contar filas
-- Ejemplo: contar todas las filas de la tabla
SELECT count(*) -- contar las filas
as "cantidad de registros" -- ponemos un alias al resultado
FROM productos; -- indicamos la tabla

-- Mostrar cuantos productos son de Samsung
-- con el encabezado "productos de Samsung"
SELECT count(*) -- contar las filas
as "productos de Samsung" -- ponemos un alias al resultado
FROM productos -- indicamos la tabla
WHERE nombre_producto LIKE "Samsung%";

-- Mostrar cuantos productos valen más de 500
-- con el encabezado "precio > 500"
SELECT count(*) -- contar las filas
as "precio > 500" -- ponemos un alias al resultado
FROM productos -- indicamos la tabla
WHERE precio_producto > 500;

-- Mostrar qué productos valen más de 500
SELECT nombre_producto as "Producto"
FROM productos
WHERE precio_producto > 500;


SELECT sum(precio_producto)
as "suma de los precios"
FROM productos;

-- Mostrar el promedio de los productos < 300
SELECT round(avg(precio_producto), 2) as promedio
FROM productos
WHERE precio_producto < 300;

-- max(precio_producto)
-- Mostrar el precio del producto más caro
-- con el encabezado "precio más caro" 
SELECT max(precio_producto)
as "precio más caro"
FROM productos;

-- Mostrar el precio del Samsung más caro
SELECT max(precio_producto)
as "precio más caro"
FROM productos
where nombre_producto like "samsung%"
;

-- min() valor mínimo

SELECT *
FROM productos
ORDER BY nombre_producto ASC;

SELECT *
FROM productos
ORDER BY nombre_producto DESC;

-- Mostrar los productos ordenados 
-- por precio del más caro al más barato
SELECT *
FROM productos
ORDER BY precio_producto DESC;

SELECT *
FROM productos
ORDER BY precio_producto DESC
LIMIT 2
;

-- Insertar dos productos:
-- uno con el precio más caro
-- otro con el segundo precio más caro
-- Kindle 
-- Kobo

INSERT INTO productos(nombre_producto, precio_producto) VALUES
("Kindle", 900.45), ("Kobo", 800.35);

select *
from productos
order by precio_producto desc, nombre_producto asc
;

-- Si queremos saber el o los productos más caros
-- esta consulta NO SIRVE:
select *
from productos
order by precio_producto desc
limit 1; 

-- ¿Cúal es precio más alto?
SELECT max(precio_producto)
from productos;

SELECT *
FROM productos
WHERE precio_producto = (SELECT max(precio_producto) from productos);

-- ¿Qué productos valen menos de 900 y más de 200?
-- ordénalos de mayor a menor precio
SELECT *
FROM productos
where precio_producto < 900 and precio_producto > 200
order by precio_producto desc;

-- Mostrar qué producto/s NO llevan la letra e en el nombre
SELECT *
FROM productos
WHERE nombre_producto NOT LIKE "%e%";

-- Poner textos en mayúsculas
SELECT upper(nombre_producto) FROM productos;
-- Poner textos en minúsculas
SELECT lower(nombre_producto) FROM productos;

-- "nombre: Iphone 16, precio: 750.25"
SELECT concat("nombre: ", nombre_producto, ", precio: ", precio_producto)
as productos
FROM productos;

-- Mostrar qué productos tienen id_producto que sea 3, 4, o 7
SELECT *
FROM productos
WHERE id_producto in (3, 4, 7);

SELECT *
FROM productos
WHERE id_producto = 3 or id_producto = 4 or id_producto = 7;

-- Hay que mostrar los precios de los productos, sin repeticiones
SELECT DISTINCT precio_producto
FROM productos
order by precio_producto;

-- Crear tabla clientes, con estas columnas:
-- id_cliente obligatorio,
-- nombre_cliente obligatorio,
-- apellido_cliente obligatorio,
-- poblacion_cliente obligatorio,
-- pais_cliente obligatorio,
-- edad int obligatorio

CREATE TABLE clientes (
id_cliente int auto_increment not null primary key,
nombre_cliente varchar(40) not null,
apellido_cliente varchar(60) not null,
poblacion_cliente varchar(60) not null,
pais_cliente varchar(50) not null,
edad int unsigned not null
);

insert into clientes(nombre_cliente, apellido_cliente, poblacion_cliente, pais_cliente, edad)
values ("Peter", "Parker", "Nueva York", "USA", 25),
("Clark", "Kent", "Metropolis", "USA", 30), ("Louis", "Lane", "Metropolis", "USA", 28),
("Bill", "Jobs", "Paris", "Francia", 75), ("Steve", "Gates", "Londres", "Reino Unido", 78),
("Elon", "Capone", "Londres", "Reino Unido", 50), ("Al", "Musk", "Londres", "Reino Unido", 78)
;

-- Mostrar el nombre de los clientes de este modo "apellido, nombre" como "nombre cliente"
-- Mostrar el/los clientes de mayor edad
-- Nombres de clientes cuyo apellido contiene la letra a
-- Clientes que viven en Londres ordenados por apellido de forma descendente
-- Promedio de edades de los clientes que viven en USA
-- Datos completos del cliente/s con nombre más largo
-- Clientes cuyo nombre acaba en "l"
-- Clientes cuyo apellido contiene la "k"
-- Clientes entre 30 y 50 años (incluidos)
-- Promedio de edad de los clientes del Reino Unido

-- Nombre del país y cuantos clientes hay en ese país: USA 3
-- En qué país hay menos clientes


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

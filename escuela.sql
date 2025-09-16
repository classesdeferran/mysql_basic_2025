CREATE DATABASE IF NOT EXISTS escuela;

USE escuela;

# Creación de la tabla
CREATE TABLE alumnos (
id_alumno int auto_increment primary key,
nombre varchar(30) NOT NULL,
apellido1 varchar(50) NOT NULL,
edad int NULL,
alta_sistema datetime DEFAULT current_timestamp
);

SELECT * FROM alumnos;

INSERT INTO escuela.alumnos (edad, nombre, apellido1)
VALUES (25, "Eva", "Pou"), (30, "Pau", "Garcia")
;

UPDATE alumnos SET nombre = "David" 
WHERE id_alumno = 2
;

INSERT INTO alumnos (nombre, apellido1, edad)
VALUES ("Sonia", "Pérez", 18), ("Alba", "Garcia", 18)
;

SELECT * 
FROM alumnos
WHERE apellido1 = "Garcia"
;

DELETE FROM alumnos
WHERE edad > 18
;
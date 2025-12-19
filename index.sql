-- Ejercicio 1 – Crear Base de Datos
-- Crear una base de datos llamada veterinaria_patitas_felices.

CREATE DATABASE veterinaria_patitas_felices;
USE veterinaria_patitas_felices;
-- Ejercicio 2 – Crear tabla duenos
-- Crear la tabla duenos con las siguientes columnas:


CREATE TABLE duenos (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    telefono VARCHAR(20) NOT NULL,
    direccion VARCHAR(100)
);

-- Ejercicio 3 – Crear tabla mascotas
-- Crear la tabla mascotas con las siguientes columnas:

CREATE TABLE mascotas (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    especie VARCHAR(30) NOT NULL,
    fecha_nacimiento DATE,
    id_dueno INT,
    FOREIGN KEY (id_dueno) REFERENCES duenos(id)
);


-- Ejercicio 4 – Crear tabla veterinarios
-- Crear la tabla veterinarios con las siguientes columnas:

CREATE TABLE veterinarios(
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    matricula VARCHAR(20) NOT NULL UNIQUE,
    especialidad VARCHAR(50) NOT NULL
);

-- Ejercicio 5 – Crear tabla historial_clinico
-- Crear la tabla historial_clinico con las siguientes columnas:

CREATE TABLE historial_clinico(
    id INT PRIMARY KEY AUTO_INCREMENT,
    id_mascota INT,
    FOREIGN KEY (id_mascota) REFERENCES mascotas(id) ON DELETE CASCADE,
    id_veterinario INT,
    FOREIGN KEY (id_veterinario) REFERENCES veterinarios(id),
    fecha_registro DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    descripcion VARCHAR(250) NOT NULL
);

-- Ejercicio 6 – Insertar registros
-- Insertar:
-- ● 3 dueños con información completa
-- ● 3 mascotas, cada una asociada a un dueño
-- ● 2 veterinarios con especialidades distintas
-- ● 3 registros de historial clínico


INSERT INTO duenos (nombre, apellido, telefono, direccion)
VALUES
    ('Franco', 'Dominguez', '1166887749', 'Calle Falsa 666'),
    ('Juan', 'Rodriguez', '1180924030', 'Av corrientes 2000'),
    ('Alberto', 'Palacios', '1168552170', 'Jujuy 1250');


INSERT INTO mascotas (nombre, especie, fecha_nacimiento, id_dueno)
VALUES
    ('Socrates', 'Perro', '2019-03-15', '1'),
    ('Pinky Winky', 'Tortuga', '2000-07-10', '2'),
    ('Jesus', 'Gato', '2023-01-12', '3');


INSERT INTO veterinarios (nombre, apellido, matricula, especialidad)
VALUES
    ('Victoria', 'Gomez', '8092', 'Clinica General'),
    ('Tony', 'Stark', '7777', 'Cirugia');


INSERT INTO historial_clinico (id_mascota, id_veterinario, descripcion)
VALUES
    ('1', '1', 'Vacunacion Anual'),
    ('2', '1', 'Control General'),
    ('3', '2', 'Operacion Corazon Abierto');


-- Ejercicio 7 – Actualizar registros
-- Realizar las siguientes actualizaciones:
-- 1. Cambiar la dirección de un dueño (por ID o nombre).
-- 2. Actualizar la especialidad de un veterinario (por ID o matrícula).
-- 3. Editar la descripción de un historial clínico (por ID).


UPDATE duenos
SET direccion = 'Colombres 150'
WHERE id = 3;


UPDATE veterinarios
SET especialidad = 'Cardiologia'
WHERE id = 1;


UPDATE historial_clinico
SET descripcion = 'Trasplante de Corazon'
WHERE id = 3;


-- Ejercicio 8 – Eliminar registros
-- 1. Eliminar una mascota (por ID o nombre).
-- 2. Verificar que se eliminen automáticamente los registros del historial clínico asociados
-- (ON DELETE CASCADE).

DELETE FROM mascotas WHERE id = 2;


-- Ejercicio 9 – JOIN simple
-- Consulta que muestre:
-- ● Nombre de la mascota
-- ● Especie
-- ● Nombre completo del dueño (nombre + apellido)


SELECT m.nombre AS mascota, m.especie, CONCAT(d.nombre, ' ', d.apellido) AS dueno
FROM mascotas m
INNER JOIN duenos d ON m.id_dueno = d.id;


-- Ejercicio 10 – JOIN múltiple con historial
-- Consulta que muestre todas las entradas del historial clínico con:
-- ● Nombre y especie de la mascota
-- ● Nombre completo del dueño
-- ● Nombre completo del veterinario
-- ● Fecha de registro
-- ● Descripción
-- Ordenados por fecha de registro descendente (DESC).


SELECT m.nombre AS mascota, m.especie, CONCAT(d.nombre, ' ', d.apellido) AS dueno,
CONCAT(v.nombre, ' ', v.apellido) AS veterinario, h.fecha_registro, h.descripcion
FROM historial_clinico h
JOIN mascotas m ON h.id_mascota = m.id
JOIN duenos d ON m.id_dueno = d.id
JOIN veterinarios v ON h.id_veterinario = v.id
ORDER BY h.fecha_registro DESC;
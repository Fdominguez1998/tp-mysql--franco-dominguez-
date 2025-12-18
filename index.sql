--Ejercicio 1 – Crear Base de Datos
--Crear una base de datos llamada veterinaria_patitas_felices.

CREATE DATABASE veterinaria_patitas_felices;


--Ejercicio 2 – Crear tabla duenos
--Crear la tabla duenos con las siguientes columnas:


CREATE TABLE duenos (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    telefono VARCHAR(20) NOT NULL,
    direccion VARCHAR(100)
);

--Ejercicio 3 – Crear tabla mascotas
--Crear la tabla mascotas con las siguientes columnas:

CREATE TABLE mascotas (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    especie VARCHAR(30) NOT NULL,
    fecha_nacimiento DATE,
    id_dueno INT,
    FOREIGN KEY (id_dueno) REFERENCES duenos(id)
);


--Ejercicio 4 – Crear tabla veterinarios
--Crear la tabla veterinarios con las siguientes columnas:

CREATE TABLE veterinarios(
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    matricula VARCHAR(20) NOT NULL UNIQUE,
    especialidad VARCHAR(50) NOT NULL
);

--Ejercicio 5 – Crear tabla historial_clinico
--Crear la tabla historial_clinico con las siguientes columnas:

CREATE TABLE historial_clinico(
    id INT PRIMARY KEY AUTO_INCREMENT,
    id_mascota INT,
    FOREIGN KEY (id_mascota) REFERENCES mascotas(id),
    id_veterinario INT,
    FOREIGN KEY (id_veterinario) REFERENCES veterinarios(id),
    fecha_registro DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    descripcion VARCHAR(250) NOT NULL
);

--Ejercicio 6 – Insertar registros
--Insertar:
--● 3 dueños con información completa
--● 3 mascotas, cada una asociada a un dueño
--● 2 veterinarios con especialidades distintas
--● 3 registros de historial clínico
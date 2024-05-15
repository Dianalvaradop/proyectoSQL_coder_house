-- Diana Alvarado Pinzon 
-- Primera Entrega Proyecto SQL Creacion de Tablas

-- Tabla Facultad
CREATE TABLE FACULTAD (
    id_facultad INT PRIMARY KEY,
    nombre_facultad VARCHAR(100),
    direccion_facultad VARCHAR(100));
-- Tabla Decano
CREATE TABLE DECANO (
    id_decano INT PRIMARY KEY,
    nombre_decano VARCHAR(100),
    correo_decano VARCHAR(100),
    telefono_decano VARCHAR(15),
    id_facultad INT,
    FOREIGN KEY (id_facultad) REFERENCES FACULTAD(id_facultad));
-- Tabla Sede
CREATE TABLE SEDE (
    id_sede INT PRIMARY KEY,
    nombre_sede VARCHAR(100),
    direccion_sede VARCHAR(100),
    id_facultad INT,
    FOREIGN KEY (id_facultad) REFERENCES FACULTAD(id_facultad));
-- Tabla profesor
CREATE TABLE PROFESOR (
    id_profesor INT PRIMARY KEY,
    nombre_profesor VARCHAR(100),
    correo_profesor VARCHAR(100),
    telefono_profesor VARCHAR(15),
    id_facultad INT,
    FOREIGN KEY (id_facultad) REFERENCES FACULTAD(id_facultad));
-- Tabla Carrera
CREATE TABLE CARRERA (
    id_carrera INT PRIMARY KEY,
    nombre_carrera VARCHAR(100));
-- Tabla Asignatura
CREATE TABLE ASIGNATURA (
    id_asignatura INT PRIMARY KEY,
    nombre_asignatura VARCHAR(100),
    num_creditos INT,
    id_carrera INT,
    FOREIGN KEY (id_carrera) REFERENCES CARRERA(id_carrera));
-- Tabla Estudiante
CREATE TABLE ESTUDIANTE (
    id_estudiante INT PRIMARY KEY,
    nombre_estudiante VARCHAR(100),
    correo_estudiante VARCHAR(100),
    direccion_estudiante VARCHAR(100),
    id_carrera INT,
    FOREIGN KEY (id_carrera) REFERENCES CARRERA(id_carrera));
-- ---------------------------------------------------------------------------------

    
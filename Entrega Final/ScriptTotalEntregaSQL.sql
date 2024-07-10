-- Diana Alvarado Pinzon 
-- Primera Entrega Proyecto SQL Creacion de Tablas
CREATE DATABASE  IF NOT EXISTS `universidad_distrital` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `universidad_distrital`;
-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: universidad_distrital
-- ------------------------------------------------------
-- Server version	8.0.36

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `asignatura`
--

DROP TABLE IF EXISTS `asignatura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `asignatura` (
  `id_asignatura` int NOT NULL,
  `nombre_asignatura` varchar(100) DEFAULT NULL,
  `num_creditos` int DEFAULT NULL,
  `id_carrera` int DEFAULT NULL,
  PRIMARY KEY (`id_asignatura`),
  KEY `id_carrera` (`id_carrera`),
  CONSTRAINT `asignatura_ibfk_1` FOREIGN KEY (`id_carrera`) REFERENCES `carrera` (`id_carrera`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asignatura`
--

LOCK TABLES `asignatura` WRITE;
/*!40000 ALTER TABLE `asignatura` DISABLE KEYS */;
/*!40000 ALTER TABLE `asignatura` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carrera`
--

DROP TABLE IF EXISTS `carrera`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carrera` (
  `id_carrera` int NOT NULL,
  `nombre_carrera` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_carrera`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carrera`
--

LOCK TABLES `carrera` WRITE;
/*!40000 ALTER TABLE `carrera` DISABLE KEYS */;
/*!40000 ALTER TABLE `carrera` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `decano`
--

DROP TABLE IF EXISTS `decano`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `decano` (
  `id_decano` int NOT NULL,
  `nombre_decano` varchar(100) DEFAULT NULL,
  `correo_decano` varchar(100) DEFAULT NULL,
  `telefono_decano` varchar(15) DEFAULT NULL,
  `id_facultad` int DEFAULT NULL,
  PRIMARY KEY (`id_decano`),
  KEY `id_facultad` (`id_facultad`),
  CONSTRAINT `decano_ibfk_1` FOREIGN KEY (`id_facultad`) REFERENCES `facultad` (`id_facultad`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
--
-- Dumping data for table `decano`
--
LOCK TABLES `decano` WRITE;
/*!40000 ALTER TABLE `decano` DISABLE KEYS */;
/*!40000 ALTER TABLE `decano` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `estudiante`
--
DROP TABLE IF EXISTS `estudiante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estudiante` (
  `id_estudiante` int NOT NULL,
  `nombre_estudiante` varchar(100) DEFAULT NULL,
  `correo_estudiante` varchar(100) DEFAULT NULL,
  `direccion_estudiante` varchar(100) DEFAULT NULL,
  `id_carrera` int DEFAULT NULL,
  PRIMARY KEY (`id_estudiante`),
  KEY `id_carrera` (`id_carrera`),
  CONSTRAINT `estudiante_ibfk_1` FOREIGN KEY (`id_carrera`) REFERENCES `carrera` (`id_carrera`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
--
-- Dumping data for table `estudiante`
--
LOCK TABLES `estudiante` WRITE;
/*!40000 ALTER TABLE `estudiante` DISABLE KEYS */;
/*!40000 ALTER TABLE `estudiante` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `facultad`
--
DROP TABLE IF EXISTS `facultad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `facultad` (
  `id_facultad` int NOT NULL,
  `nombre_facultad` varchar(100) DEFAULT NULL,
  `direccion_facultad` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_facultad`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
--
-- Dumping data for table `facultad`
--
LOCK TABLES `facultad` WRITE;
/*!40000 ALTER TABLE `facultad` DISABLE KEYS */;
/*!40000 ALTER TABLE `facultad` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `profesor`
--
DROP TABLE IF EXISTS `profesor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `profesor` (
  `id_profesor` int NOT NULL,
  `nombre_profesor` varchar(100) DEFAULT NULL,
  `correo_profesor` varchar(100) DEFAULT NULL,
  `telefono_profesor` varchar(15) DEFAULT NULL,
  `id_facultad` int DEFAULT NULL,
  PRIMARY KEY (`id_profesor`),
  KEY `id_facultad` (`id_facultad`),
  CONSTRAINT `profesor_ibfk_1` FOREIGN KEY (`id_facultad`) REFERENCES `facultad` (`id_facultad`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
--
-- Dumping data for table `profesor`
--
LOCK TABLES `profesor` WRITE;
/*!40000 ALTER TABLE `profesor` DISABLE KEYS */;
/*!40000 ALTER TABLE `profesor` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `sede`
--
DROP TABLE IF EXISTS `sede`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sede` (
  `id_sede` int NOT NULL,
  `nombre_sede` varchar(100) DEFAULT NULL,
  `direccion_sede` varchar(100) DEFAULT NULL,
  `id_facultad` int DEFAULT NULL,
  PRIMARY KEY (`id_sede`),
  KEY `id_facultad` (`id_facultad`),
  CONSTRAINT `sede_ibfk_1` FOREIGN KEY (`id_facultad`) REFERENCES `facultad` (`id_facultad`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
--
-- Dumping data for table `sede`
--
LOCK TABLES `sede` WRITE;
/*!40000 ALTER TABLE `sede` DISABLE KEYS */;
/*!40000 ALTER TABLE `sede` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
--
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

-- SEGUNDA ENTREGA Y MODIFICACIONES-------------------------------------------------------------------------------------------
-- Modifique tabla carrera
ALTER TABLE carrera
ADD COLUMN id_facultad INT;
-- Creacion de tabla intermedia
CREATE TABLE asignatura_estudiante (
    id_asignatura INT,
    id_estudiante INT,
    fecha_inscripcion DATE,
    PRIMARY KEY (id_estudiante, id_asignatura),
    FOREIGN KEY (id_asignatura) REFERENCES asignatura(id_asignatura),
    FOREIGN KEY (id_estudiante) REFERENCES estudiante(id_estudiante)
);
-- Insertar Datos en cada tabla
INSERT INTO facultad (id_facultad, nombre_facultad, direccion_facultad) VALUES
(1, 'Facultad de Artes', 'Carrera 13 No. 14-69'),
(2, 'Facultad de Ingeniería', 'Calle 40 No. 9-28'),
(3, 'Facultad de Ciencias de la Salud', 'Carrera 7 No. 32-16'),
(4, 'Facultad de Ciencias Matemáticas y Naturales', 'Calle 13 No. 19-75'),
(5, 'Facultad de Ciencias y Educación', 'Calle 27 No. 10-24'),
(6, 'Facultad Tecnológica', 'Avenida 68 No. 65-82'),
(7, 'Facultad de Medio Ambiente', 'Carrera 11 No. 12-45');

INSERT INTO decano (id_decano, nombre_decano, correo_decano, telefono_decano, id_facultad) VALUES
(45, 'María González', 'mgonzalez@universidad.edu', '555-1234', 1),
(46, 'Juan Pérez', 'jperez@universidad.edu', '555-2345', 2),
(47, 'Laura Martínez', 'lmartinez@universidad.edu', '555-3456', 3),
(48, 'Carlos López', 'clopez@universidad.edu', '555-4567', 4),
(49, 'Ana Torres', 'atorres@universidad.edu', '555-5678', 5),
(50, 'Roberto Sánchez', 'rsanchez@universidad.edu', '555-6789', 6),
(51, 'Patricia Ramírez', 'pramirez@universidad.edu', '555-7890', 7);

INSERT INTO sede (id_sede, nombre_sede, direccion_sede, id_facultad) VALUES
(340, 'Aduanilla de Paiba', 'Carrera 18 No. 10-05', 2),
(341, 'Calle 34', 'Calle 34 No. 15-02', 2),
(342, 'Calle 40', 'Calle 40 No. 9-28', 2),
(343, 'Ciudadela Universitaria Bosa', 'Carrera 87 No. 72-21', 5),
(344, 'Sede Macarena', 'Carrera 6 No. 26-10', 3),
(345, 'Vivero', 'Carrera 15 No. 6-40', 4),
(346, 'ASAB', 'Carrera 13 No. 14-69', 1),
(347, 'Teinco', 'Avenida 19 No. 28-22', 2),
(348, 'Sede Tecnológica', 'Avenida 68 No. 65-82', 6);

INSERT INTO carrera (id_carrera, nombre_carrera) VALUES
(1, 'Administración Ambiental'),
(2, 'Administración Deportiva'),
(3, 'Archivística y Gestión de la Información'),
(4, 'Artes Danzarias'),
(5, 'Artes Escénicas'),
(6, 'Artes Musicales'),
(7, 'Artes Plásticas y Visuales'),
(8, 'Biología'),
(9, 'Comunicación Social y Periodismo'),
(10, 'Física'),
(11, 'Ingeniería Ambiental'),
(12, 'Ingeniería Catastral'),
(13, 'Ingeniería Mecánica'),
(14, 'Ingeniería Civil'),
(15, 'Ingeniería de Producción'),
(16, 'Ingeniería de Sistemas'),
(17, 'Ingeniería Electrónica'),
(18, 'Ingeniería Eléctrica'),
(19, 'Ingeniería Telemática'),
(20, 'Ingeniería Forestal'),
(21, 'Ingeniería Industrial'),
(22, 'Ingeniería Sanitaria'),
(23, 'Licenciatura en Biología'),
(24, 'Licenciatura en Ciencias Sociales'),
(25, 'Licenciatura en Educación Artística'),
(26, 'Licenciatura en Física'),
(27, 'Licenciatura en Humanidades'),
(28, 'Licenciatura en Matemáticas'),
(29, 'Matemáticas'),
(30, 'Química');

INSERT INTO profesor (id_profesor, nombre_profesor, correo_profesor, telefono_profesor, id_facultad) VALUES
(1, 'Alejandro García', 'agarcia@universidad.edu', '555-1001', 1),
(2, 'Beatriz Naranjo', 'bnaranjo@universidad.edu', '555-2002', 2),
(3, 'Carlos Hernández', 'chernandez@universidad.edu', '555-3003', 3),
(4, 'Diana López', 'dlopez@universidad.edu', '555-4004', 4),
(5, 'Ernesto Ramírez', 'eramirez@universidad.edu', '555-5005', 5),
(6, 'Fernanda Torres', 'ftorres@universidad.edu', '555-6006', 6),
(7, 'Gustavo Mora', 'gmora@universidad.edu', '555-7007', 7),
(8, 'Jorge López',	'jlopez@correo.com', '555-8008', 4),
(9, 'Karla Mendoza','kmendoza@correo.com','555-9009', 1),
(10, 'Luis Martínez','lmartinez@correo.com','555-1034',	5),
(11, 'Mónica Sánchez','msanchez@correo.com','555-1183', 3),
(12, 'Néstor Ramírez', 'nramirez@correo.com', '555-1201', 2),
(13, 'Olga Vargas','ovargas@correo.com','555-1301',	6),
(14, 'Pedro Navarro', 'pnavarro@correo.com','555-1401',	7),
(15, 'Quintín Osorio','qosorio@correo.com',	'555-1501',	1),
(16, 'Beatriz Romero',	'bromero@correo.com', '555-1601', 4),
(17, 'Carlos Jiménez', 'cjimenez@correo.com', '555-1701', 2),
(18, 'Daniela Gutiérrez', 'dgutierrez@correo.com', '555-1801', 1),
(19, 'Elena Rodríguez',	'erodriguez@correo.com','555-1901',	6),
(20, 'Fernando Díaz','fdiaz@correo.com' ,'555-2001', 5);

INSERT INTO asignatura (id_asignatura, nombre_asignatura, num_creditos, id_carrera) VALUES
(1, 'Gestión Ambiental', 3, 1),
(2, 'Psicología del Deporte', 3, 2),
(3, 'Archivística I', 3, 3),
(4, 'Introducción a la Danza', 2, 4),
(5, 'Actuación I', 3, 5),
(6, 'Teoría Musical', 3, 6),
(7, 'Técnicas de Pintura', 4, 7),
(8, 'Biología General', 4, 8),
(9, 'Comunicación Social', 3, 9),
(10, 'Física I', 4, 10),
(11, 'Ingeniería Ambiental I', 4, 11),
(12, 'Catastro y Cartografía', 3, 12),
(13, 'Termodinámica', 4, 13),
(14, 'Mecánica de Fluidos', 4, 14),
(15, 'Producción y Manufactura', 3, 15),
(16, 'Programación I', 4, 16),
(17, 'Circuitos Electrónicos', 4, 17),
(18, 'Electrotecnia', 3, 18),
(19, 'Redes y Telemática', 3, 19),
(20, 'Silvicultura', 4, 20),
(21, 'Ingeniería Industrial I', 4, 21),
(22, 'Saneamiento Ambiental', 3, 22),
(23, 'Didáctica de la Biología', 4, 23),
(24, 'Historia y Geografía', 3, 24),
(25, 'Educación Artística I', 3, 25),
(26, 'Física Experimental', 4, 26),
(27, 'Literatura y Humanidades', 3, 27),
(28, 'Álgebra y Trigonometría', 4, 28),
(29, 'Cálculo Diferencial', 4, 29),
(30, 'Química General', 4, 30),
(31, 'Ecología', 3, 29),
(32, 'Anatomía Humana', 4, 15),
(33, 'Historia del Arte', 3, 9),
(34, 'Coreografía', 2, 4),
(35, 'Dirección Escénica', 3, 22),
(36, 'Composición Musical', 3, 11),
(37, 'Pintura al Óleo', 4, 30),
(38, 'Genética', 4, 3),
(39, 'Geografía Humana', 3, 7),
(40, 'Literatura Universal', 3, 18),
(41, 'Bioquímica', 4, 5),
(42, 'Teatro Experimental', 4, 14),
(43, 'Dibujo Técnico', 3, 10),
(44, 'Cálculo Integral', 4, 26),
(45, 'Ingeniería de Software', 3, 12),
(46, 'Electromagnetismo', 4, 17),
(47, 'Automatización Industrial', 4, 6),
(48, 'Derecho Ambiental', 3, 19),
(49, 'Paisajismo', 4, 8),
(50, 'Inglés Avanzado', 3, 1),
(51, 'Psicología del Aprendizaje', 4, 24),
(52, 'Didáctica de la Matemática', 3, 21),
(53, 'Química Orgánica', 4, 1),
(54, 'Gestión de Proyectos', 3, 27),
(55, 'Educación Física', 3, 28),
(56, 'Finanzas Corporativas', 4, 29),
(57, 'Marketing Digital', 3, 30),
(58, 'Programación Avanzada', 4, 8),
(59, 'Sistemas Digitales', 4, 5),
(60, 'Robótica', 3, 4);

INSERT INTO estudiante (id_estudiante, nombre_estudiante, correo_estudiante, direccion_estudiante, id_carrera) VALUES
(1, 'Alberto Fernández', 'afernandez@correo.com', 'Calle Falsa 123', 1),
(2, 'Beatriz Romero', 'bromero@correo.com', 'Avenida Siempre Viva 742', 2),
(3, 'Carlos Jiménez', 'cjimenez@correo.com', 'Pasaje Los Sauces 456', 3),
(4, 'Daniela Gutiérrez', 'dgutierrez@correo.com', 'Carrera 8 No. 12-34', 4),
(5, 'Elena Rodríguez', 'erodriguez@correo.com', 'Calle 10 No. 23-45', 5),
(6, 'Fernando Díaz', 'fdiaz@correo.com', 'Avenida 15 No. 67-89', 6),
(7, 'Gabriela Castro', 'gcastro@correo.com', 'Calle 20 No. 34-56', 7),
(8, 'Héctor Pineda', 'hpineda@correo.com', 'Carrera 9 No. 45-67', 8),
(9, 'Inés García', 'igarcia@correo.com', 'Pasaje Los Robles 789', 9),
(10, 'Jorge López', 'jlopez@correo.com', 'Calle del Sol 1010', 10),
(11, 'Karla Mendoza', 'kmendoza@correo.com', 'Avenida de la Luna 1111', 11),
(12, 'Luis Martínez', 'lmartinez@correo.com', 'Carrera del Mar 1212', 12),
(13, 'Mónica Sánchez', 'msanchez@correo.com', 'Pasaje del Río 1313', 13),
(14, 'Néstor Ramírez', 'nramirez@correo.com', 'Calle del Bosque 1414', 14),
(15, 'Olga Vargas', 'ovargas@correo.com', 'Avenida de las Flores 1515', 15),
(16, 'Pedro Navarro', 'pnavarro@correo.com', 'Carrera del Lago 1616', 16),
(17, 'Quintín Osorio', 'qosorio@correo.com', 'Calle del Campo 1717', 17),
(18, 'Rosa Pérez', 'rperez@correo.com', 'Pasaje de las Rosas 1818', 18),
(19, 'Sergio Morales', 'smorales@correo.com', 'Avenida de los Árboles 1919', 19),
(20, 'Tatiana Salazar', 'tsalazar@correo.com', 'Calle del Viento 2020', 20),
(21, 'Ulises Vega', 'uvega@correo.com', 'Pasaje del Norte 2121', 21),
(22, 'Valeria Herrera', 'vherrera@correo.com', 'Calle del Sur 2222', 22),
(23, 'Walter Castillo', 'wcastillo@correo.com', 'Avenida de los Cipreses 2323', 23),
(24, 'Ximena Aguilar', 'xaguilar@correo.com', 'Pasaje de los Pinos 2424', 24),
(25, 'Yadira Peña', 'ypena@correo.com', 'Calle del Sol 2525', 25),
(26, 'Zoe Gómez', 'zgomez@correo.com', 'Avenida de la Luna 2626', 26),
(27, 'Luis Salgado', 'lsalgado@correo.com', 'Calle 5 No. 33-44', 27),
(28, 'María Fernández', 'mfernandez@correo.com', 'Avenida 18 No. 50-60', 28),
(29, 'Nadia Campos', 'ncampos@correo.com', 'Carrera 3 No. 21-32', 29),
(30, 'Oscar Reyes', 'oreyes@correo.com', 'Calle 7 No. 40-55', 30),
(31, 'Pablo Guerrero', 'pguerrero@correo.com', 'Avenida 23 No. 65-75', 1),
(32, 'Queralt López', 'qlopez@correo.com', 'Calle 13 No. 24-35', 2),
(33, 'Raúl Martínez', 'rmartinez@correo.com', 'Carrera 5 No. 14-25', 3),
(34, 'Sara Gómez', 'sgomez@correo.com', 'Avenida 17 No. 30-41', 4),
(35, 'Tomás Sánchez', 'tsanchez@correo.com', 'Calle 9 No. 20-31', 5),
(36, 'Úrsula Díaz', 'udiaz@correo.com', 'Pasaje 7 No. 10-21', 6),
(37, 'Valentina González', 'vgonzalez@correo.com', 'Avenida 25 No. 40-51', 7),
(38, 'Walter Rodríguez', 'wrodriguez@correo.com', 'Carrera 10 No. 15-26', 8),
(39, 'Ximena Pérez', 'xperez@correo.com', 'Calle 11 No. 22-33', 9),
(40, 'Yolanda Hernández', 'yhernandez@correo.com', 'Pasaje 6 No. 12-23', 10),
(41, 'Zacarías Flores', 'zflores@correo.com', 'Avenida 14 No. 25-36', 11),
(42, 'Ana María Soto', 'amsoto@correo.com', 'Carrera 6 No. 14-25', 12),
(43, 'Bruno Vargas', 'bvargas@correo.com', 'Calle 12 No. 24-35', 13),
(44, 'Clara Ríos', 'crios@correo.com', 'Avenida 16 No. 30-41', 14),
(45, 'Daniel López', 'dlopez@correo.com', 'Pasaje 8 No. 20-31', 15),
(46, 'Elisa Martínez', 'emartinez@correo.com', 'Carrera 11 No. 10-21', 16),
(47, 'Felipe Sánchez', 'fsanchez@correo.com', 'Calle 10 No. 20-31', 17),
(48, 'Gabriela Torres', 'gtorres@correo.com', 'Avenida 18 No. 30-41', 18),
(49, 'Hugo González', 'hgonzalez@correo.com', 'Pasaje 9 No. 12-23', 19),
(50, 'Irene Pérez', 'iperez@correo.com', 'Carrera 7 No. 25-36', 20),
(51, 'Javier Díaz', 'jdiaz@correo.com', 'Calle 15 No. 14-25', 21),
(52, 'Karina Flores', 'kflores@correo.com', 'Avenida 19 No. 24-35', 22),
(53, 'Luisa Martínez', 'lmartinez2@correo.com', 'Pasaje 11 No. 30-41', 23),
(54, 'Miguel Sánchez', 'msanchez2@correo.com', 'Carrera 8 No. 20-31', 24),
(55, 'Natalia López', 'nlopez@correo.com', 'Calle 18 No. 10-21', 25),
(56, 'Óscar Torres', 'otorres@correo.com', 'Avenida 21 No. 20-31', 26),
(57, 'Paula González', 'pgonzalez@correo.com', 'Pasaje 10 No. 30-41', 27),
(58, 'Quintín Pérez', 'qperez@correo.com', 'Carrera 9 No. 20-31', 28),
(59, 'Ramiro Díaz', 'rdiaz@correo.com', 'Calle 16 No. 10-21', 29),
(60, 'Sandra Martínez', 'smartinez@correo.com', 'Avenida 20 No. 30-41', 30);

-- Insercion de datos de la tabla intermedia
INSERT INTO asignatura_estudiante (id_estudiante, id_asignatura, fecha_inscripcion) VALUES
(1, 1, '2024-05-15'),
(1, 50, '2024-07-23'),
(1, 53, '2024-08-10'),
(2, 2, '2024-06-04'),
(3, 3, '2024-06-17'),
(3, 38, '2024-07-06'),
(4, 4, '2024-06-23'),
(4, 34, '2024-06-01'),
(4, 60, '2024-08-04'),
(5, 5, '2024-07-19'),
(5, 41, '2024-05-30'),
(5, 59, '2024-08-01'),
(6, 6, '2024-06-15'),
(6, 47, '2024-06-12'),
(7, 7, '2024-06-28'),
(7, 39, '2024-07-10'),
(8, 8, '2024-07-25'),
(8, 49, '2024-07-14'),
(8, 58, '2024-06-05'),
(9, 9, '2024-06-24'),
(9, 33, '2024-07-02'),
(10, 10, '2024-07-15'),
(10, 43, '2024-06-20'),
(11, 11, '2024-08-02'),
(11, 36, '2024-06-30'),
(12, 12, '2024-07-18'),
(12, 45, '2024-06-29'),
(13, 13, '2024-06-27'),
(14, 14, '2024-06-25'),
(14, 42, '2024-06-19'),
(15, 15, '2024-06-16'),
(15, 32, '2024-07-17'),
(16, 16, '2024-06-26'),
(17, 17, '2024-07-22'),
(17, 46, '2024-07-29'),
(18, 18, '2024-08-03'),
(18, 40, '2024-07-21'),
(19, 19, '2024-07-11'),
(19, 48, '2024-07-24'),
(20, 20, '2024-07-31'),
(21, 21, '2024-08-09'),
(21, 52, '2024-06-21'),
(22, 22, '2024-07-09'),
(22, 35, '2024-07-28'),
(23, 23, '2024-06-14'),
(24, 24, '2024-07-30'),
(24, 51, '2024-06-25'),
(25, 25, '2024-06-08'),
(26, 26, '2024-07-13'),
(26, 44, '2024-07-20'),
(27, 27, '2024-08-07'),
(27, 54, '2024-07-03'),
(28, 28, '2024-06-18'),
(28, 55, '2024-07-27'),
(29, 29, '2024-07-05'),
(29, 31, '2024-08-05'),
(29, 56, '2024-06-22'),
(30, 30, '2024-07-26'),
(30, 37, '2024-08-06'),
(30, 57, '2024-08-01'),
(31, 1, '2024-07-12'),
(31, 50, '2024-08-02'),
(31, 53, '2024-07-31'),
(32, 2, '2024-06-29'),
(33, 3, '2024-07-18'),
(33, 38, '2024-06-23'),
(34, 4, '2024-07-04'),
(34, 34, '2024-06-16'),
(34, 60, '2024-07-19'),
(35, 5, '2024-08-06'),
(35, 41, '2024-06-14'),
(35, 59, '2024-07-21'),
(36, 6, '2024-08-04'),
(36, 47, '2024-08-02'),
(37, 7, '2024-06-27'),
(37, 39, '2024-06-30'),
(38, 8, '2024-08-07'),
(38, 49, '2024-08-05'),
(38, 58, '2024-08-01'),
(39, 9, '2024-06-19'),
(39, 33, '2024-07-24'),
(40, 10, '2024-06-21'),
(40, 43, '2024-06-28'),
(41, 11, '2024-07-13'),
(41, 36, '2024-07-14'),
(42, 12, '2024-08-05'),
(42, 45, '2024-08-08'),
(43, 13, '2024-08-10'),
(44, 14, '2024-07-23'),
(44, 42, '2024-07-26'),
(45, 15, '2024-07-30'),
(45, 32, '2024-08-09'),
(46, 16, '2024-07-08'),
(47, 17, '2024-06-05'),
(47, 46, '2024-07-18'),
(48, 18, '2024-06-18'),
(48, 40, '2024-06-13'),
(49, 19, '2024-08-03'),
(49, 48, '2024-07-29'),
(50, 20, '2024-06-25'),
(51, 21, '2024-06-22'),
(51, 52, '2024-06-17'),
(52, 22, '2024-06-12'),
(52, 35, '2024-07-11'),
(53, 23, '2024-06-28'),
(54, 24, '2024-07-05'),
(54, 51, '2024-07-08'),
(55, 25, '2024-06-15'),
(56, 26, '2024-07-02'),
(56, 44, '2024-06-27'),
(57, 27, '2024-07-15'),
(57, 54, '2024-07-17'),
(58, 28, '2024-06-29'),
(58, 55, '2024-07-12'),
(59, 29, '2024-06-08'),
(59, 31, '2024-06-23'),
(59, 56, '2024-08-06'),
(60, 30, '2024-07-09'),
(60, 37, '2024-06-20'),
(60, 57, '2024-06-14');

-- Modifique tabla carrera
ALTER TABLE carrera
ADD COLUMN id_facultad INT;

-- Creacion de tabla intermedia
CREATE TABLE asignatura_estudiante (
    id_asignatura INT,
    id_estudiante INT,
    fecha_inscripcion DATE,
    PRIMARY KEY (id_estudiante, id_asignatura),
    FOREIGN KEY (id_asignatura) REFERENCES asignatura(id_asignatura),
    FOREIGN KEY (id_estudiante) REFERENCES estudiante(id_estudiante)
);
-- Agregar los datos de la tabla modificada
UPDATE carrera
SET id_facultad = CASE id_carrera
                    WHEN 1 THEN 7
                    WHEN 2 THEN 7
                    WHEN 3 THEN 5
                    WHEN 4 THEN 1
                    WHEN 5 THEN 1
                    WHEN 6 THEN 1
                    WHEN 7 THEN 1
                    WHEN 8 THEN 4
                    WHEN 9 THEN 5
                    WHEN 10 THEN 4
                    WHEN 11 THEN 2
                    WHEN 12 THEN 2
                    WHEN 13 THEN 6
                    WHEN 14 THEN 2
                    WHEN 15 THEN 2
                    WHEN 16 THEN 2
                    WHEN 17 THEN 2
                    WHEN 18 THEN 2
                    WHEN 19 THEN 6
                    WHEN 20 THEN 7
                    WHEN 21 THEN 2
                    WHEN 22 THEN 7
                    WHEN 23 THEN 5
                    WHEN 24 THEN 5
                    WHEN 25 THEN 5
                    WHEN 26 THEN 5
                    WHEN 27 THEN 5
                    WHEN 28 THEN 5
                    WHEN 29 THEN 4
                    WHEN 30 THEN 4
END
WHERE id_carrera BETWEEN 1 AND 30;
-- CREACION DE VISTAS
-- Vista 1:
CREATE VIEW vista_estudiantes_facultades AS
SELECT e.id_estudiante, e.nombre_estudiante, c.nombre_carrera, f.nombre_facultad
FROM estudiante e
JOIN carrera c ON e.id_carrera = c.id_carrera
JOIN facultad f ON c.id_facultad = f.id_facultad;
-- Vista 2:
CREATE VIEW vista_detalle_asignaturas AS
SELECT a.id_asignatura, a.nombre_asignatura, a.num_creditos, c.nombre_carrera, p.nombre_profesor, f.nombre_facultad
FROM asignatura a
JOIN carrera c ON a.id_carrera = c.id_carrera
JOIN profesor p ON c.id_facultad = p.id_facultad
JOIN facultad f ON c.id_facultad = f.id_facultad;
-- Vista 3
CREATE VIEW vista_asig_inscr_junio AS
SELECT ae.id_asignatura, a.nombre_asignatura, ae.id_estudiante, e.nombre_estudiante
FROM asignatura_estudiante ae
JOIN asignatura a ON ae.id_asignatura = a.id_asignatura
JOIN estudiante e ON ae.id_estudiante = e.id_estudiante
WHERE MONTH(ae.fecha_inscripcion) = 6;

SELECT * FROM vista_estudiantes_facultades;
SELECT * FROM vista_detalle_asignaturas;
SELECT * FROM vista_asig_inscr_junio;


-- CREACION DE FUNCTIONS
-- Funcion 1:
DELIMITER //
CREATE FUNCTION ObtenerNombreCarrera(p_id_estudiante INT)
RETURNS VARCHAR(250)
READS SQL DATA
BEGIN
    DECLARE nombre_carrera VARCHAR(250);
    SELECT c.nombre_carrera 
    INTO nombre_carrera
    FROM carrera c
    JOIN estudiante e ON c.id_carrera = e.id_carrera
    WHERE e.id_estudiante = p_id_estudiante;
    RETURN nombre_carrera;
END //
DELIMITER ;

SELECT id_estudiante, nombre_estudiante, ObtenerNombreCarrera(40) AS nombre_carrera
FROM estudiante
WHERE id_estudiante = 40;

-- Funcion 2:
DELIMITER //
CREATE FUNCTION ContarAsignaturasInscritas(p_id_estudiante INT)
RETURNS INT
READS SQL DATA
BEGIN
    DECLARE num_asignaturas INT;
    SELECT COUNT(*) INTO num_asignaturas
    FROM asignatura_estudiante
    WHERE id_estudiante = p_id_estudiante;
    
    RETURN num_asignaturas;
END //
DELIMITER ;

SELECT ContarAsignaturasInscritas(3) AS num_asignaturas_inscritas;

-- Funcion 3:
DELIMITER //
CREATE FUNCTION ContarEstudiantesPorCarrera(p_id_carrera INT)
RETURNS INT
READS SQL DATA
BEGIN
    DECLARE num_estudiantes INT;
    SELECT COUNT(*) INTO num_estudiantes
    FROM estudiante
    WHERE id_carrera = p_id_carrera;
    RETURN num_estudiantes;
END //
DELIMITER ;

SELECT ContarEstudiantesPorCarrera(1) AS num_estudiantes_carrera_1;

-- CREACION STORED PROCEDURES
-- Procedimiento 1:
DELIMITER //
CREATE PROCEDURE EliminarProfesor(IN p_id_profesor INT)
BEGIN
    DELETE FROM profesor 
    WHERE id_profesor = p_id_profesor;
END //
DELIMITER ;

-- Procedimiento 2:
DELIMITER //
CREATE PROCEDURE ActualizarCorreoEstudiante(IN p_id_estudiante INT, IN p_nuevo_correo VARCHAR(100))
BEGIN
    UPDATE estudiante 
    SET correo_estudiante = p_nuevo_correo
    WHERE id_estudiante = p_id_estudiante;
END //
DELIMITER ;

-- Procedimiento 3:
DELIMITER //
CREATE PROCEDURE RegistrarFacultad(IN p_id_facultad INT,IN p_nombre_facultad VARCHAR(100), IN p_direccion_facultad VARCHAR(100))
BEGIN
    INSERT INTO facultad (id_facultad, nombre_facultad, direccion_facultad)
    VALUES (p_id_facultad, p_nombre_facultad, p_direccion_facultad);
END //
DELIMITER ;

CALL ActualizarCorreoEstudiante(1, 'nuevo_correo@example.com');
SELECT *
FROM estudiante
WHERE id_estudiante = 1;

CALL EliminarProfesor(21);
SELECT *
FROM profesor
WHERE id_profesor = 21;

CALL RegistrarFacultad(8,'Facultad de Diseño', 'Calle Principal, Bogota');
SELECT *
FROM facultad
WHERE nombre_facultad = 'Facultad de Diseño';

-- CREACION TRIGGERS
-- Trigger 1:
DELIMITER //
CREATE TRIGGER RegistrarFechaInscripcion
BEFORE INSERT ON asignatura_estudiante
FOR EACH ROW
BEGIN
    IF NEW.fecha_inscripcion IS NULL THEN
        SET NEW.fecha_inscripcion = NOW();
    END IF;
END //
DELIMITER ;

-- Trigger 2:
DELIMITER //
CREATE TRIGGER EvitarEliminacionEstudiante
BEFORE DELETE ON estudiante
FOR EACH ROW
BEGIN
    DECLARE num_asignaturas INT;
    SELECT COUNT(*) 
    INTO num_asignaturas
    FROM asignatura_estudiante
    WHERE id_estudiante = OLD.id_estudiante;
    IF num_asignaturas > 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'No se puede eliminar el estudiante porque está inscrito en una o más asignaturas';
    END IF;
END //
DELIMITER ;

DELETE FROM estudiante WHERE id_estudiante = 60;

-- TERCERA ENTREGA CONSULTAS --------------------------------------------------------------------------------------------------
-- Primera consulta

SELECT id_estudiante, nombre_estudiante, correo_estudiante, direccion_estudiante, nombre_carrera, nombre_facultad
FROM estudiante e
JOIN carrera  c ON e.id_carrera = c.id_carrera
JOIN facultad f ON c.id_facultad = f.id_facultad;

-- Segunda consulta
SELECT a.id_asignatura, a.nombre_asignatura, p.nombre_profesor, f.nombre_facultad
FROM asignatura a
JOIN carrera c ON a.id_carrera = c.id_carrera
JOIN profesor p ON c.id_facultad = p.id_facultad
JOIN facultad f ON p.id_facultad = f.id_facultad;

-- Tercera consulta
SELECT f.nombre_facultad, p.nombre_profesor, COUNT(a.id_asignatura) AS cantidad_asignaturas
FROM asignatura a
JOIN carrera c ON a.id_carrera = c.id_carrera
JOIN facultad f ON c.id_facultad = f.id_facultad
JOIN profesor p ON c.id_facultad = p.id_facultad
GROUP BY f.nombre_facultad, p.nombre_profesor;

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
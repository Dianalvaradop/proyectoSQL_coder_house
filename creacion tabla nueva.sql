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


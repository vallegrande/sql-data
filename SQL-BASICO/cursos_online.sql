-- Crear tablas
CREATE TABLE Cursos (
    ID INT PRIMARY KEY,
    Titulo VARCHAR(100),
    Descripcion TEXT,
    Duracion INT
);

CREATE TABLE Estudiantes (
    ID INT PRIMARY KEY,
    Nombre VARCHAR(100),
    Email VARCHAR(100),
    FechaRegistro DATE
);

CREATE TABLE Inscripciones (
    ID INT PRIMARY KEY,
    ID_Estudiante INT,
    ID_Curso INT,
    FechaInscripcion DATE,
    FOREIGN KEY (ID_Estudiante) REFERENCES Estudiantes(ID),
    FOREIGN KEY (ID_Curso) REFERENCES Cursos(ID)
);

-- Consultas
-- Inscribir a un estudiante en un curso
INSERT INTO Inscripciones (ID, ID_Estudiante, ID_Curso, FechaInscripcion)
VALUES (1, 1, 1, '2025-04-27');

-- Listar cursos disponibles
SELECT * FROM Cursos;

-- Mostrar estudiantes inscritos en un curso específico
SELECT Estudiantes.Nombre FROM Estudiantes
JOIN Inscripciones ON Estudiantes.ID = Inscripciones.ID_Estudiante
WHERE Inscripciones.ID_Curso = 1;

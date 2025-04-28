-- Crear tablas
CREATE TABLE Libros (
    ID INT PRIMARY KEY,
    Titulo VARCHAR(100),
    Autor VARCHAR(100),
    Genero VARCHAR(50),
    AnoPublicacion INT
);

CREATE TABLE Usuarios (
    ID INT PRIMARY KEY,
    Nombre VARCHAR(100),
    Direccion VARCHAR(255),
    Telefono VARCHAR(15)
);

CREATE TABLE Prestamos (
    ID INT PRIMARY KEY,
    ID_Usuario INT,
    ID_Libro INT,
    FechaPrestamo DATE,
    FechaDevolucion DATE,
    FOREIGN KEY (ID_Usuario) REFERENCES Usuarios(ID),
    FOREIGN KEY (ID_Libro) REFERENCES Libros(ID)
);

-- Consultas
-- Listar todos los libros disponibles
SELECT * FROM Libros;

-- Registrar un préstamo de libro
INSERT INTO Prestamos (ID, ID_Usuario, ID_Libro, FechaPrestamo, FechaDevolucion)
VALUES (1, 1, 1, '2025-04-27', '2025-05-04');

-- Mostrar historial de préstamos por usuario
SELECT * FROM Prestamos WHERE ID_Usuario = 1;

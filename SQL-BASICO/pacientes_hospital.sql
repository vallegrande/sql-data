-- Crear tablas
CREATE TABLE Pacientes (
    ID INT PRIMARY KEY,
    Nombre VARCHAR(100),
    Edad INT,
    Direccion VARCHAR(255),
    Telefono VARCHAR(15)
);

CREATE TABLE Doctores (
    ID INT PRIMARY KEY,
    Nombre VARCHAR(100),
    Especialidad VARCHAR(100),
    Telefono VARCHAR(15)
);

CREATE TABLE Citas (
    ID INT PRIMARY KEY,
    ID_Paciente INT,
    ID_Doctor INT,
    FechaCita DATE,
    Motivo VARCHAR(255),
    FOREIGN KEY (ID_Paciente) REFERENCES Pacientes(ID),
    FOREIGN KEY (ID_Doctor) REFERENCES Doctores(ID)
);

-- Consultas
-- Programar una cita para un paciente
INSERT INTO Citas (ID, ID_Paciente, ID_Doctor, FechaCita, Motivo)
VALUES (1, 1, 1, '2025-04-28', 'Consulta General');

-- Mostrar el historial de citas de un paciente
SELECT * FROM Citas WHERE ID_Paciente = 1;

-- Listar doctores por especialidad
SELECT * FROM Doctores WHERE Especialidad = 'Cardiología';

-- Crear tablas
CREATE TABLE Mesas (
    ID INT PRIMARY KEY,
    Capacidad INT,
    Ubicacion VARCHAR(50)
);

CREATE TABLE Clientes (
    ID INT PRIMARY KEY,
    Nombre VARCHAR(100),
    Telefono VARCHAR(15),
    Email VARCHAR(100)
);

CREATE TABLE Reservas (
    ID INT PRIMARY KEY,
    ID_Cliente INT,
    ID_Mesa INT,
    FechaReserva DATE,
    HoraReserva TIME,
    FOREIGN KEY (ID_Cliente) REFERENCES Clientes(ID),
    FOREIGN KEY (ID_Mesa) REFERENCES Mesas(ID)
);

-- Consultas
-- Verificar disponibilidad de mesas
SELECT * FROM Mesas WHERE ID NOT IN (SELECT ID_Mesa FROM Reservas WHERE FechaReserva = '2025-04-27');

-- Registrar una nueva reserva
INSERT INTO Reservas (ID, ID_Cliente, ID_Mesa, FechaReserva, HoraReserva)
VALUES (1, 1, 1, '2025-04-27', '19:00:00');

-- Listar reservas por fecha
SELECT * FROM Reservas WHERE FechaReserva = '2025-04-27';

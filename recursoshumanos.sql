-- Crear tablas
CREATE TABLE Empleados (
    ID INT PRIMARY KEY,
    Nombre VARCHAR(100),
    Email VARCHAR(100),
    Telefono VARCHAR(15),
    FechaContratacion DATE,
    Salario DECIMAL(10, 2)
);

CREATE TABLE Departamentos (
    ID INT PRIMARY KEY,
    Nombre VARCHAR(100),
    Ubicacion VARCHAR(100)
);

CREATE TABLE Asignaciones (
    ID INT PRIMARY KEY,
    ID_Empleado INT,
    ID_Departamento INT,
    FechaAsignacion DATE,
    FOREIGN KEY (ID_Empleado) REFERENCES Empleados(ID),
    FOREIGN KEY (ID_Departamento) REFERENCES Departamentos(ID)
);

-- Ejemplo de transacción para asignar un empleado a un departamento
START TRANSACTION;

BEGIN TRY
    -- Insertar un nuevo empleado
    INSERT INTO Empleados (ID, Nombre, Email, Telefono, FechaContratacion, Salario)
    VALUES (1, 'Juan Pérez', 'juan.perez@example.com', '123456789', '2025-04-01', 50000.00);

    -- Insertar un nuevo departamento
    INSERT INTO Departamentos (ID, Nombre, Ubicacion)
    VALUES (1, 'IT', 'Edificio A');

    -- Asignar el empleado al departamento
    INSERT INTO Asignaciones (ID, ID_Empleado, ID_Departamento, FechaAsignacion)
    VALUES (1, 1, 1, '2025-04-27');

    -- Confirmar la transacción
    COMMIT;
END TRY

BEGIN CATCH
    -- Revertir la transacción en caso de error
    ROLLBACK;
END CATCH;

-- Consultas
-- Listar todos los empleados
SELECT * FROM Empleados;

-- Mostrar asignaciones de un empleado específico
SELECT * FROM Asignaciones WHERE ID_Empleado = 1;

-- Listar departamentos y sus ubicaciones
SELECT * FROM Departamentos;

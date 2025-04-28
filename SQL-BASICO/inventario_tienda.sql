-- Crear tablas
CREATE TABLE Productos (
    ID INT PRIMARY KEY,
    Nombre VARCHAR(100),
    Categoria VARCHAR(50),
    Precio DECIMAL(10, 2),
    Stock INT
);

CREATE TABLE Proveedores (
    ID INT PRIMARY KEY,
    Nombre VARCHAR(100),
    Contacto VARCHAR(100),
    Direccion VARCHAR(255)
);

CREATE TABLE Compras (
    ID INT PRIMARY KEY,
    ID_Producto INT,
    Cantidad INT,
    FechaCompra DATE,
    FOREIGN KEY (ID_Producto) REFERENCES Productos(ID)
);

-- Consultas
-- Actualizar el stock después de una compra
UPDATE Productos SET Stock = Stock + 10 WHERE ID = 1;

-- Mostrar productos con bajo stock
SELECT * FROM Productos WHERE Stock < 5;

-- Listar proveedores por producto
SELECT Proveedores.Nombre FROM Proveedores
JOIN Compras ON Proveedores.ID = Compras.ID_Producto
WHERE Compras.ID_Producto = 1;

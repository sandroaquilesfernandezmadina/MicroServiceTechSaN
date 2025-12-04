-- Crear la base de datos
CREATE DATABASE bd_tecnologia;
USE bd_tecnologia;

-- =========================
-- TABLA: categorias
-- =========================
CREATE TABLE categorias (
    id_Categoria INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);

-- =========================
-- TABLA: sub_categorias
-- =========================
CREATE TABLE sub_categorias (
    id_Sub_Categoria INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    id_Categoria INT,
    FOREIGN KEY (id_Categoria) REFERENCES categorias(id_Categoria)
);

-- =========================
-- TABLA: usuarios
-- =========================
CREATE TABLE usuarios (
    id_Usuario INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    email VARCHAR(150) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    rol ENUM('ADMIN') NOT NULL,
    fecha_creacion DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- =========================
-- TABLA: productos
-- =========================
CREATE TABLE productos (
    id_Producto INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(200) NOT NULL,
    descripcion TEXT,
    precio DECIMAL(10,2) NOT NULL,
    stock INT NOT NULL,
    url_Imagen VARCHAR(500),
    marca VARCHAR(100),
    id_Sub_Categoria INT,
    activo BOOLEAN DEFAULT TRUE,  -- 🟢 Eliminación lógica,
    FOREIGN KEY (id_Sub_Categoria) REFERENCES sub_categorias(id_Sub_Categoria)
);

-- =========================
-- INSERTS
-- =========================

-- CATEGORIAS
INSERT INTO categorias (id_Categoria, nombre) VALUES
(1, 'Audio'),
(2, 'Celulares'),
(3, 'Cómputo'),
(4, 'Fotografía'),
(5, 'TV y Video'),
(6, 'Gamer');


-- SUB_CATEGORIAS
INSERT INTO sub_categorias (id_Sub_Categoria, nombre, id_Categoria) VALUES
(1, 'Audífonos', 1),
(2, 'Parlantes', 1),
(3, 'Cargadores', 2),
(4, 'Smartphones', 2),
(5, 'Laptops', 3),
(6, 'Periféricos', 3),
(7, 'Cámara', 4),
(8, 'Trípodes', 4),
(9, 'Televisores', 5),
(10, 'Proyectores', 5);

-- USUARIOS
INSERT INTO usuarios (id_Usuario, nombre, apellido, email, password, rol, fecha_creacion) VALUES
(1, 'Ana', 'López', 'ana.lopez@email.com', 'admin123', 'ADMIN', '2025-09-27 14:00:06');

-- PRODUCTOS
INSERT INTO productos (id_Producto, nombre, descripcion, precio, stock, url_Imagen, marca, id_Sub_Categoria) VALUES
(1, 'Sony WH-1000XMS', 'Auriculares premium con cancelación de ruido y hasta 30 h de batería', 1599.00, 10, 'https://coolboxpe.vtexassets.com/arquivos/ids/277257-1200-1200?v=638218412074930000&width=1200&height=1200&aspect=true', 'Sony', 1),
(2, 'JBL Tune 520BT', 'Auriculares Bluetooth con hasta 57h de batería y sonido Pure Bass', 249.00, 20, 'https://coolboxpe.vtexassets.com/arquivos/ids/449246-1200-1200?v=638824243705530000&width=1200&height=1200&aspect=true', 'JBL', 1),
(3, 'Xiaomi Redmi Buds 4', 'Audífonos TWS con cancelación activa de ruido y estuche de carga', 189.00, 15, 'https://coolboxpe.vtexassets.com/arquivos/ids/290553-1200-1200?v=638258164038170000&width=1200&height=1200&aspect=true', 'Xiaomi', 1),
(4, 'JBL Wave Buds', 'Audífonos TWS con sonido JBL Deep Bass y hasta 32h de batería', 169.00, 25, 'https://coolboxpe.vtexassets.com/arquivos/ids/440255-1200-1200?v=638793849480300000&width=1200&height=1200&aspect=true', 'JBL', 2);


 INSERT INTO productos (nombre, descripcion, precio, stock, url_Imagen, marca, id_Sub_Categoria) VALUES
( 'Sony WH-1000XMS', 'Auriculares premium con cancelación de ruido y hasta 30 h de batería', 1599.00, 10, 'https://coolboxpe.vtexassets.com/arquivos/ids/277257-1200-1200?v=638218412074930000&width=1200&height=1200&aspect=true', 'Sony', 1),
( 'JBL Tune 520BT', 'Auriculares Bluetooth con hasta 57h de batería y sonido Pure Bass', 249.00, 20, 'https://coolboxpe.vtexassets.com/arquivos/ids/449246-1200-1200?v=638824243705530000&width=1200&height=1200&aspect=true', 'JBL', 1),
( 'Xiaomi Redmi Buds 4', 'Audífonos TWS con cancelación activa de ruido y estuche de carga', 189.00, 15, 'https://coolboxpe.vtexassets.com/arquivos/ids/290553-1200-1200?v=638258164038170000&width=1200&height=1200&aspect=true', 'Xiaomi', 1),
( 'JBL Wave Buds', 'Audífonos TWS con sonido JBL Deep Bass y hasta 32h de batería', 169.00, 25, 'https://coolboxpe.vtexassets.com/arquivos/ids/440255-1200-1200?v=638793849480300000&width=1200&height=1200&aspect=true', 'JBL', 2);


-- AGREGANDO LOG 
-- LOG
CREATE TABLE log (
    log_id INT AUTO_INCREMENT PRIMARY KEY,
    message VARCHAR(255) NOT NULL,
    log_date DATETIME NOT NULL
);



CREATE TABLE auditoria_producto (
    id_mantenimiento INT AUTO_INCREMENT PRIMARY KEY,
    id_producto INT NOT NULL,
    descripcion_trabajo VARCHAR(200) NOT NULL,
    fecha DATETIME DEFAULT CURRENT_TIMESTAMP,
    usuario_responsable VARCHAR(100),
    detalle VARCHAR(500) DEFAULT '-',
    estado ENUM('Pendiente', 'Completado') DEFAULT 'Pendiente'
);


CREATE TABLE productos_bajo_stock (
    idreporte INT AUTO_INCREMENT PRIMARY KEY,
    fechareporte DATETIME DEFAULT CURRENT_TIMESTAMP,
    idproducto INT,
    nombre VARCHAR(200) NOT NULL,
    stock INT NOT NULL,
    precio DECIMAL(10,2) NOT NULL
);


DROP TABLE IF EXISTS productos_bajo_stock;

select * from log;

 select * from  productos;
select * from auditoria_producto

select * from productos_bajo_stock
-- =============================================
-- Creación de la Base de Datos
-- =============================================

DROP DATABASE IF EXISTS SenorSM;

CREATE DATABASE SenorSM;


-- =============================================
-- Seleccionar la Base de Datos
-- =============================================

USE SenorSM;


-- =============================================
-- CREACION DE TABLAS DE EMPLEADOS
-- =============================================
CREATE TABLE CARGO
(
	idcar                INTEGER AUTO_INCREMENT COMMENT 'Identificador del cargo del empleado.',
	nombre               VARCHAR(50) NOT NULL COMMENT 'Nombre del cargo del empleado.',
    sueldomin			 NUMERIC(6)  NULL COMMENT 'sueldo minimo del empleado.',
	sueldomax      	 	 NUMERIC(6) NULL COMMENT 'sueldo maximo del empleado.',
	PRIMARY KEY (idcar)
) COMMENT='Tabla de cargo de empleados.';


CREATE TABLE EMPLEADO
(
	idemp                INTEGER AUTO_INCREMENT COMMENT 'Identificador del empleado.',
	nombre               VARCHAR(50) NOT NULL COMMENT 'Nombre del empleado.',
    dni					 VARCHAR(8) NOT NULL COMMENT 'dni del empleado.',
	apellidopa      	 VARCHAR(50) NOT NULL COMMENT 'Apellido paterno.',
	apellidoma		 	 VARCHAR(50) NOT NULL COMMENT 'Apellido materno.',
    idcar                INTEGER NOT NULL COMMENT 'Identificador de cargo.',
    email                VARCHAR(50) NOT NULL COMMENT 'Email del empleado.',
	telefono             VARCHAR(20) NULL COMMENT 'Teléfono del empleado.',
    celular              VARCHAR(15) NULL COMMENT 'celular del empleado.',
	PRIMARY KEY (idemp),
    FOREIGN KEY fk_cargo_empleado (idcar) REFERENCES CARGO (idcar)
) COMMENT='Tabla de empleados.';


CREATE TABLE CLIENTE
(
	idclie               INTEGER AUTO_INCREMENT COMMENT 'Identificador del cliente.',
	nombre               VARCHAR(50) NOT NULL COMMENT 'Nombre del cliente.',
    dni					 VARCHAR(8) NOT NULL COMMENT 'dni del cliente.',
	apellidopa      	 VARCHAR(50) NOT NULL COMMENT 'Apellido paterno.',
	apellidoma		 	 VARCHAR(50) NOT NULL COMMENT 'Apellido materno.',
    email                VARCHAR(50) NOT NULL COMMENT 'Email del cliente.',
	telefono             VARCHAR(20) NULL COMMENT 'Teléfono del cliente.',
    celular              VARCHAR(15) NULL COMMENT 'celular del cliente.',
	PRIMARY KEY (idclie)
) COMMENT='Tabla de clientes.';


-- =============================================
-- CREACION DE TABLAS DEL USUARIOS
-- =============================================

CREATE TABLE USUARIOEMP
(
	idemp                INTEGER NOT NULL COMMENT 'Identificador del empleado.',
	usuario              VARCHAR(20) NOT NULL COMMENT 'Cuenta de usuario asociado al empleado.',
	clave                VARCHAR(40) NOT NULL COMMENT 'Clave del usuario.',
	estado               NUMERIC(2,0) NOT NULL COMMENT 'Estado del usuario: 1 - Activo 0 - Inactivo',
	PRIMARY KEY (idemp),
	CONSTRAINT CHK_USUARIO_ESTADO CHECK ( estado IN (1, 0) ),
	FOREIGN KEY fk_usuario_empleado (idemp) REFERENCES EMPLEADO (idemp)
) COMMENT='Tabla de usuarios de empleados.';


CREATE TABLE USUARIOCLIE
(
	idclie               INTEGER NOT NULL COMMENT 'Identificador del cliente.',
	usuario              VARCHAR(20) NOT NULL COMMENT 'Cuenta de usuario asociado al cliente.',
	clave                VARCHAR(40) NOT NULL COMMENT 'Clave del usuario.',
	estado               NUMERIC(2,0) NOT NULL COMMENT 'Estado del usuario: 1 - Activo 0 - Inactivo',
	PRIMARY KEY (idclie),
	CONSTRAINT CHK_USUARIO_ESTADO CHECK ( estado IN (1, 0) ),
	FOREIGN KEY fk_usuario_cliente (idclie) REFERENCES CLIENTE (idclie)
) COMMENT='Tabla de usuarios de clientes.';
-- =============================================
-- CREACION DE TABLAS DEL CATALOGO
-- =============================================


CREATE TABLE CATEGORIA
(
	idcat                INTEGER NOT NULL     COMMENT 'Identificador de categoría.',
	nombre               VARCHAR(50) NOT NULL COMMENT 'Nombre de categoría.',
	PRIMARY KEY (idcat)
) COMMENT='Tabla de categorías.';

CREATE TABLE MARCA
(
	idmar                INTEGER NOT NULL     COMMENT 'Identificador de marca.',
	nombre               VARCHAR(50) NOT NULL COMMENT 'Nombre de marca.',
	PRIMARY KEY (idmar)
) COMMENT='Tabla de marcas.';

CREATE TABLE PRODUCTO
(
	idprod               INTEGER AUTO_INCREMENT COMMENT 'Identificador de producto.',
	idcat                INTEGER NOT NULL COMMENT 'Identificador de categoría.',
    idmar				 INTEGER NOT NULL COMMENT 'Identificador de marca.',
	nombre               VARCHAR(100) NOT NULL COMMENT 'Nombre de producto.',
	precio               NUMERIC(10,2) NOT NULL COMMENT 'Precio del producto.',
	stock                INTEGER NOT NULL COMMENT 'Stock del producto.',
	PRIMARY KEY (idprod),
	FOREIGN KEY FK_PRODUCTO_CATEGORIA (idcat) REFERENCES CATEGORIA (idcat),
    FOREIGN KEY FK_PRODUCTO_MARCA (idmar) REFERENCES MARCA (idmar)
) COMMENT='Tabla de productos.';


-- =============================================
-- CREACION DE TABLAS DE VENTAS
-- =============================================

CREATE TABLE VENTA
(
	idventa              INTEGER AUTO_INCREMENT COMMENT 'Identificador de venta.',
	idemp                INTEGER NOT NULL COMMENT 'Identificador del empleado.',
	idclie				 INTEGER NOT NULL COMMENT 'Identificador del cliente.',
	cliente              VARCHAR(100) NOT NULL COMMENT 'Nombre del cliente.',
	fecha                DATE NOT NULL COMMENT 'Fecha de venta.',
	importe              NUMERIC(10,2) NOT NULL COMMENT 'Importe de la venta.',
	PRIMARY KEY (idventa),
	FOREIGN KEY FK_VENTA_USUARIOEMP (idemp) REFERENCES USUARIOEMP (idemp),
    FOREIGN KEY FK_VENTA_USUARIOCLIE (idclie) REFERENCES USUARIOCLIE (idclie)
) COMMENT='Tabla de ventas.';

CREATE TABLE DETALLE
(
	iddetalle            INTEGER AUTO_INCREMENT COMMENT 'Identificador del detalle.',
	idventa              INTEGER NOT NULL COMMENT 'Identificador de venta.',
	idprod               INTEGER NOT NULL COMMENT 'Identificador de producto.',
	cant                 NUMERIC NOT NULL COMMENT 'Cantidad vendida.',
	precio               NUMERIC(10,2) NOT NULL COMMENT 'Precio de venta.',
	subtotal             NUMERIC(10,2) NULL COMMENT 'Subtotal de la venta.',
	PRIMARY KEY (iddetalle),
	FOREIGN KEY FK_DETALLE_PRODUCTO (idprod) REFERENCES PRODUCTO (idprod),
	FOREIGN KEY FK_DETALLE_VENTA (idventa) REFERENCES VENTA (idventa)
) COMMENT='Tabla de detalle de ventas.';

CREATE UNIQUE INDEX U_DETALLE ON DETALLE
(
	idventa,
	idprod
);


-- =============================================
-- CREACION DE TABLAS DE PAGOS
-- =============================================

CREATE TABLE TIPO_PAGO
(
	idtipo               INTEGER NOT NULL     COMMENT 'Identificador del tipo de pago.',
	nombre               VARCHAR(50) NOT NULL COMMENT 'Nombre del tipo de pago.',
	PRIMARY KEY (idtipo)
) COMMENT='Tabla de tipos de pago.';


CREATE TABLE PAGO
(
	idpago               INTEGER AUTO_INCREMENT COMMENT 'Identificador del pago.',
	idventa              INTEGER NOT NULL COMMENT 'Identificador de venta.',
	idtipo               INTEGER NOT NULL COMMENT 'Identificador del tipo de pago.',
	detalle              VARCHAR(100) NOT NULL COMMENT 'Descripción del pago.',
	importe              NUMERIC(10,2) NOT NULL COMMENT 'Importe del pago.',
	obs                  VARCHAR(1000) NOT NULL COMMENT 'Campo para comentarios adicionales.',
	PRIMARY KEY (idpago),
	FOREIGN KEY FK_PAGO_VENTA (idventa) REFERENCES VENTA (idventa),
	FOREIGN KEY FK_PAGO_TIPO_PAGO (idtipo) REFERENCES TIPO_PAGO (idtipo)
) COMMENT='Tabla de pagos.';

CREATE UNIQUE INDEX U_PAGO_UNIQUE ON PAGO
(
	idventa,
	idtipo
);


-- =============================================
-- CREAR EL USUARIO
-- =============================================

USE MYSQL;
GRANT ALL PRIVILEGES ON *.* TO 'senorsm'@'%' IDENTIFIED BY 'admin' WITH GRANT OPTION;
FLUSH PRIVILEGES;
USE SenorSM;

USE MYSQL;
GRANT ALL PRIVILEGES ON *.* TO 'senorsm'@'localhost' IDENTIFIED BY 'admin' WITH GRANT OPTION;
FLUSH PRIVILEGES;
USE SenorSM;


-- =============================================
-- HABILITAR SALIDAS
-- =============================================

SELECT DATABASE();
SHOW TABLES;

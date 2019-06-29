/****** DROP CONSTRAINTS ******/
ALTER TABLE [Proyectos] DROP CONSTRAINT [FK_Proyectos_Contactos]
GO
ALTER TABLE [Presupuestos] DROP CONSTRAINT [FK_Presupuestos_Proyectos]
GO
ALTER TABLE [Presupuestos] DROP CONSTRAINT [FK_Presupuestos_Estados]
GO
ALTER TABLE [Presupuestos_Tareas] DROP CONSTRAINT [FK_Presupuestos_Tareas_Presupuestos]
GO
ALTER TABLE [Presupuestos_Tareas] DROP CONSTRAINT [FK_Presupuestos_Tareas_Tareas]
GO
ALTER TABLE [Recursos] DROP CONSTRAINT [FK_Recursos_Rangos]
GO
ALTER TABLE [Recursos] DROP CONSTRAINT [FK_Recursos_Roles]
GO
ALTER TABLE [Categorias] DROP CONSTRAINT [FK_Categorias_Categorias]
GO
ALTER TABLE [Plantillas_Tareas] DROP CONSTRAINT [FK_Plantillas_Tareas_Plantillas]
GO
ALTER TABLE [Plantillas_Tareas] DROP CONSTRAINT [FK_Plantillas_Tareas_Tareas]
GO
ALTER TABLE [Tareas] DROP CONSTRAINT [FK_Tareas_Tipos_Tareas]
GO
ALTER TABLE [Tareas] DROP CONSTRAINT [FK_Tareas_Categorias]
GO
ALTER TABLE [PresupuestosTareas_Recursos] DROP CONSTRAINT [FK_PresupuestosTareas_Recursos_PresupuestosTareas]
GO
ALTER TABLE [PresupuestosTareas_Recursos] DROP CONSTRAINT [FK_PresupuestosTareas_Recursos_Recursos]
GO

/****** DROP TABLES ******/
DROP TABLE IF EXISTS Contactos
GO
DROP TABLE IF EXISTS Proyectos
GO
DROP TABLE IF EXISTS Presupuestos_Estados
GO
DROP TABLE IF EXISTS Presupuestos
GO
DROP TABLE IF EXISTS Tipos_Tareas
GO
DROP TABLE IF EXISTS Categorias
GO
DROP TABLE IF EXISTS Plantillas
GO
DROP TABLE IF EXISTS Plantillas_Tareas
GO
DROP TABLE IF EXISTS Tareas
GO
DROP TABLE IF EXISTS Presupuestos_Tareas
GO
DROP TABLE IF EXISTS Rangos
GO
DROP TABLE IF EXISTS Roles
GO
DROP TABLE IF EXISTS Recursos
GO
DROP TABLE IF EXISTS PresupuestosTareas_Recursos
GO

/****** CREATE TABLES ******/
CREATE TABLE Contactos (
    id INT IDENTITY(1,1),
    nombre VARCHAR (50) NOT NULL,
	mail VARCHAR (50) NOT NULL,
	telefono VARCHAR (50) NOT NULL,
	cargo VARCHAR (50) NOT NULL,
	CONSTRAINT PK_Contactos PRIMARY KEY NONCLUSTERED (id)
);
GO

CREATE TABLE Proyectos (
    id INT IDENTITY(1,1),
    nombre VARCHAR (50) NOT NULL,
	descripcion VARCHAR(250),
	contacto_id INT NOT NULL,
	CONSTRAINT PK_Proyectos PRIMARY KEY NONCLUSTERED (id),
    CONSTRAINT FK_Proyectos_Contactos FOREIGN KEY (contacto_id) REFERENCES Contactos(id)
);
GO

CREATE TABLE Presupuestos_Estados (
    id INT IDENTITY(1,1),
    descripcion VARCHAR (50) NOT NULL,
	CONSTRAINT PK_Presupuestos_Estados PRIMARY KEY NONCLUSTERED (id)
);
GO

CREATE TABLE Presupuestos (
    id INT IDENTITY(1,1),
    descripcion VARCHAR (250) NOT NULL,
	ciclos_test INT NOT NULL,
	tiempo_test INT NOT NULL,
	fecha_creacion DATE NOT NULL,
	fecha_vencimiento DATE NOT NULL,
	cargas_sociales FLOAT,
	markup FLOAT,
	costo_base FLOAT,
	creador VARCHAR(50),
	proyecto_id INT NOT NULL,
	estado_id INT NOT NULL,
	CONSTRAINT PK_Presupuestos PRIMARY KEY NONCLUSTERED (id),
    CONSTRAINT FK_Presupuestos_Proyectos FOREIGN KEY (proyecto_id) REFERENCES Proyectos(id),
	CONSTRAINT FK_Presupuestos_Estados FOREIGN KEY (estado_id) REFERENCES Presupuestos_Estados(id)
);
GO

CREATE TABLE Tipos_Tareas (
    id INT IDENTITY(1,1),
    descripcion VARCHAR (50) NOT NULL,
	CONSTRAINT PK_Tipos_Tareas PRIMARY KEY NONCLUSTERED (id)
);
GO

CREATE TABLE Categorias (
    id INT IDENTITY(1,1),
    descripcion VARCHAR (500) NOT NULL,
	categoria_padre INT,
	CONSTRAINT PK_Categorias PRIMARY KEY NONCLUSTERED (id),
	CONSTRAINT FK_Categorias_Categorias FOREIGN KEY (categoria_padre) REFERENCES Categorias(id)
);
GO

CREATE TABLE Plantillas (
    id INT IDENTITY(1,1),
    nombre VARCHAR (250) NOT NULL,
	CONSTRAINT PK_Plantillas PRIMARY KEY NONCLUSTERED (id)
);
GO

CREATE TABLE Tareas (
    id INT IDENTITY(1,1),
	titulo VARCHAR (250) NOT NULL,
    descripcion VARCHAR (500) NOT NULL,
	tipo_tarea_id INT NOT NULL,
	categoria_id INT NOT NULL,
	CONSTRAINT PK_Tareas PRIMARY KEY NONCLUSTERED (id),
	CONSTRAINT FK_Tareas_Tipos_Tareas FOREIGN KEY (tipo_tarea_id) REFERENCES Tipos_Tareas(id),
	CONSTRAINT FK_Tareas_Categorias FOREIGN KEY (categoria_id) REFERENCES Categorias(id)
);
GO

CREATE TABLE Plantillas_Tareas (
    id INT IDENTITY(1,1),
	plantilla_id INT NOT NULL,
	tarea_id INT NOT NULL,
	CONSTRAINT PK_Plantillas_Tareas PRIMARY KEY NONCLUSTERED (id),
	CONSTRAINT FK_Plantillas_Tareas_Plantillas FOREIGN KEY (plantilla_id) REFERENCES Plantillas(id),
	CONSTRAINT FK_Plantillas_Tareas_Tareas FOREIGN KEY (tarea_id) REFERENCES Tareas(id)
);
GO

CREATE TABLE Presupuestos_Tareas (
    id INT IDENTITY(1,1),
	presupuesto_id INT NOT NULL,
	tarea_id INT NOT NULL,
	CONSTRAINT PK_Presupuestos_Tareas PRIMARY KEY NONCLUSTERED (id),
	CONSTRAINT FK_Presupuestos_Tareas_Presupuestos FOREIGN KEY (presupuesto_id) REFERENCES Presupuestos(id),
	CONSTRAINT FK_Presupuestos_Tareas_Tareas FOREIGN KEY (tarea_id) REFERENCES Tareas(id)
);
GO

CREATE TABLE Rangos (
    id INT IDENTITY(1,1),
    descripcion VARCHAR (50)
	CONSTRAINT PK_Rangos PRIMARY KEY NONCLUSTERED (id)
);
GO

CREATE TABLE Roles (
    id INT IDENTITY(1,1),
    descripcion VARCHAR (50)
	CONSTRAINT PK_Roles PRIMARY KEY NONCLUSTERED (id)
);
GO

CREATE TABLE Recursos (
    id INT IDENTITY(1,1),
    descripcion VARCHAR (50),
	valorHora INT NOT NULL,
	rango_id INT NOT NULL,
	rol_id INT NOT NULL,
	CONSTRAINT PK_Recursos PRIMARY KEY NONCLUSTERED (id),
	CONSTRAINT FK_Recursos_Rangos FOREIGN KEY (rango_id) REFERENCES Rangos(id),
	CONSTRAINT FK_Recursos_Roles FOREIGN KEY (rol_id) REFERENCES Roles(id),
);
GO

CREATE TABLE PresupuestosTareas_Recursos (
    id INT IDENTITY(1,1),
	horas INT,
    presupuesto_tarea_id INT NOT NULL,
	recurso_id INT NOT NULL,
	CONSTRAINT PK_PresupuestosTareas_Recursos PRIMARY KEY NONCLUSTERED (id),
	CONSTRAINT FK_PresupuestosTareas_Recursos_PresupuestosTareas FOREIGN KEY (presupuesto_tarea_id) REFERENCES Presupuestos_Tareas(id),
	CONSTRAINT FK_PresupuestosTareas_Recursos_Recursos FOREIGN KEY (recurso_id) REFERENCES Recursos(id),
);
GO
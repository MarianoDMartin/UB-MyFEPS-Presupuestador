/****** DROP CONSTRAINTS ******/
ALTER TABLE [Proyectos] DROP CONSTRAINT [FK_Proyectos_Clientes]
GO
ALTER TABLE [Presupuestos] DROP CONSTRAINT [FK_Presupuestos_Proyectos]
GO
ALTER TABLE [Presupuestos_Tareas] DROP CONSTRAINT [FK_Presupuestos_Tareas_Presupuestos]
GO
ALTER TABLE [Presupuestos_Tareas] DROP CONSTRAINT [FK_Presupuestos_Tareas_Tareas]
GO
ALTER TABLE [Recursos] DROP CONSTRAINT [FK_Recursos_Rangos]
GO
ALTER TABLE [Recursos] DROP CONSTRAINT [FK_Recursos_Roles]
GO
ALTER TABLE [PresupuestosTareas_Recursos] DROP CONSTRAINT [FK_PresupuestosTareas_Recursos_PresupuestosTareas]
GO
ALTER TABLE [PresupuestosTareas_Recursos] DROP CONSTRAINT [FK_PresupuestosTareas_Recursos_Recursos]
GO

/****** DROP TABLES ******/
DROP TABLE IF EXISTS Clientes
GO
DROP TABLE IF EXISTS Proyectos
GO
DROP TABLE IF EXISTS Presupuestos
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
CREATE TABLE Clientes (
    id INT,
    nombre VARCHAR (50) NOT NULL,
	apellido VARCHAR (50) NOT NULL,
	documento VARCHAR (50) NOT NULL,
	genero VARCHAR (50) NOT NULL,
	CONSTRAINT PK_Clientes PRIMARY KEY NONCLUSTERED (id)
);
GO

CREATE TABLE Proyectos (
    id INT,
    nombre VARCHAR (50) NOT NULL,
	descripcion VARCHAR(250),
	cliente_id INT NOT NULL,
	CONSTRAINT PK_Proyectos PRIMARY KEY NONCLUSTERED (id),
    CONSTRAINT FK_Proyectos_Clientes FOREIGN KEY (cliente_id) REFERENCES Clientes(id)
);
GO

CREATE TABLE Presupuestos (
    id INT,
    descripcion VARCHAR (250) NOT NULL,
	proyecto_id INT NOT NULL,
	CONSTRAINT PK_Presupuestos PRIMARY KEY NONCLUSTERED (id),
    CONSTRAINT FK_Presupuestos_Proyectos FOREIGN KEY (proyecto_id) REFERENCES Proyectos(id)
);
GO

CREATE TABLE Tareas (
    id INT,
	titulo VARCHAR (250) NOT NULL,
    descripcion VARCHAR (500) NOT NULL,
	CONSTRAINT PK_Tareas PRIMARY KEY NONCLUSTERED (id)
);
GO

CREATE TABLE Presupuestos_Tareas (
    id INT,
	presupuesto_id INT NOT NULL,
	tarea_id INT NOT NULL,
	CONSTRAINT PK_Presupuestos_Tareas PRIMARY KEY NONCLUSTERED (id),
	CONSTRAINT FK_Presupuestos_Tareas_Presupuestos FOREIGN KEY (presupuesto_id) REFERENCES Presupuestos(id),
	CONSTRAINT FK_Presupuestos_Tareas_Tareas FOREIGN KEY (tarea_id) REFERENCES Tareas(id)
);
GO

CREATE TABLE Rangos (
    id INT,
    descripcion VARCHAR (50)
	CONSTRAINT PK_Rangos PRIMARY KEY NONCLUSTERED (id)
);
GO

CREATE TABLE Roles (
    id INT,
    descripcion VARCHAR (50)
	CONSTRAINT PK_Roles PRIMARY KEY NONCLUSTERED (id)
);
GO

CREATE TABLE Recursos (
    id INT,
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
    id INT,
	horas INT,
    presupuesto_tarea_id INT NOT NULL,
	recurso_id INT NOT NULL,
	CONSTRAINT PK_PresupuestosTareas_Recursos PRIMARY KEY NONCLUSTERED (id),
	CONSTRAINT FK_PresupuestosTareas_Recursos_PresupuestosTareas FOREIGN KEY (presupuesto_tarea_id) REFERENCES Presupuestos_Tareas(id),
	CONSTRAINT FK_PresupuestosTareas_Recursos_Recursos FOREIGN KEY (recurso_id) REFERENCES Recursos(id),
);
GO
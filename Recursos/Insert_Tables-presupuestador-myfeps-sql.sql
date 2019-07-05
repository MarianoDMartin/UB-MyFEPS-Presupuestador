use [presupuestador-myfeps-sql]
go

select * from categorias
select * from contactos
select * from plantillas
select * from Plantillas_Tareas
select * from Presupuestos
select * from Presupuestos_Estados
select * from Presupuestos_Tareas
select * from PresupuestosTareas_Recursos
select * from Proyectos
select * from Rangos
select * from Recursos
select * from Roles
select * from Tareas
select * from Tipos_Tareas


-- Tablas Maestras

-- Insert de presupuestos_estados
insert into Presupuestos_Estados (descripcion) values ('Borrador')
insert into Presupuestos_Estados (descripcion) values ('Aceptado')
insert into Presupuestos_Estados (descripcion) values ('Rechazado')
insert into Presupuestos_Estados (descripcion) values ('Cancelado')

-- Insert de Roles
insert into roles (descripcion) values ('Desarrollador')
insert into roles (descripcion) values ('Coordinador')
insert into roles (descripcion) values ('Lider de proyecto')
insert into roles (descripcion) values ('Adminstrador base de datos')
insert into roles (descripcion) values ('Usuario prueba')
insert into roles (descripcion) values ('Tecnico')
insert into roles (descripcion) values ('Ing de Software')

-- Insert de rangos
insert into rangos (descripcion) values ('Junior')
insert into rangos (descripcion) values ('Semi-Senior')
insert into rangos (descripcion) values ('Senior')
insert into rangos (descripcion) values ('Master')

-- Insert de  Tipo_Tareas
insert into Tipos_Tareas (descripcion) values ('Documentacion')
insert into Tipos_Tareas (descripcion) values ('Evaluación')
insert into Tipos_Tareas (descripcion) values ('Ejecución')


-- Tablas de usuarios o de uso
-- Insert de contactos
insert into contactos (nombre, mail, telefono, cargo) values('Paula Angeleri','paula.angeleri@gmail.com','15 1111-1111','CIO')
insert into contactos (nombre, mail, telefono, cargo) values('Juan Garcia','juan.garcia@gmail.com','15 2222-2222','CDOR')

--Insert de Proyectos
insert into proyectos (nombre,descripcion,contacto_id) values ('Proyecto Banelco','Desarrollo del nuevo Banelco','1')
insert into proyectos (nombre,descripcion,contacto_id) values ('Proyecto Desarrollo CRM','Sistema CRM Web para empresas','2')
insert into proyectos (nombre,descripcion,contacto_id) values ('Proyecto Seguridad Web','Soluciones de seguridad Web para empresas','1')

-- Insert de Categorias
insert into Recursos (descripcion,rango_id,rol_id,valorHora) values ('Juan Perez',1,1,100)
insert into Recursos (descripcion,rango_id,rol_id,valorHora) values ('Daniel Lopez',2,1,200)
insert into Recursos (descripcion,rango_id,rol_id,valorHora) values ('Martin Garcia',2,2,220)
insert into Recursos (descripcion,rango_id,rol_id,valorHora) values ('Juana Ortiz',3,3,300)
insert into Recursos (descripcion,rango_id,rol_id,valorHora) values ('Francisco J',4,3,400)

--Categorias Padre
insert into Categorias (descripcion) values ('Proceso de Evaluación')
--Sub Categoria Nivel 1
insert into Categorias (descripcion,categoria_padre) values ('Establecer Requisitos y objetivos',1)
insert into Categorias (descripcion,categoria_padre) values ('Especificar la Evaluación',1)
insert into Categorias (descripcion,categoria_padre) values ('Diseñar la Evaluación',1)
insert into Categorias (descripcion,categoria_padre) values ('Evaluar el Producto',1)
insert into Categorias (descripcion,categoria_padre) values ('Concluir',1)

select * from categorias
--Sub Categoria Nivel 2
--2	Establecer Requisitos y objetivos
--3	Especificar la Evaluación
--4	Diseñar la Evaluación
--5	Evaluar el Producto
--6	Concluir
insert into Categorias (descripcion,categoria_padre) values ('Establecer el Propósito de la Evaluación',2)
insert into Categorias (descripcion,categoria_padre) values ('Identificar el Producto a Evaluar',2)
insert into Categorias (descripcion,categoria_padre) values ('Identificarlos Requerimientos de Calidad',2)
insert into Categorias (descripcion,categoria_padre) values ('Elegir el Marco de Calidad',2)
insert into Categorias (descripcion,categoria_padre) values ('Administrar Riesgos de la Evaluación',2)

insert into Categorias (descripcion,categoria_padre) values ('Definir Recursos para la Evaluación',3)
insert into Categorias (descripcion,categoria_padre) values ('Conformar Equipo Evaluador',3)
insert into Categorias (descripcion,categoria_padre) values ('Seleccionar las Métricas',3)
insert into Categorias (descripcion,categoria_padre) values ('Establecer Ponderación',3)
insert into Categorias (descripcion,categoria_padre) values ('Establecer Fidelidades de Medición',3)

insert into Categorias (descripcion,categoria_padre) values ('Preparar Recursos e Infraestructura',4)
insert into Categorias (descripcion,categoria_padre) values ('Elaborar el Plan de Mediciones',4)
insert into Categorias (descripcion,categoria_padre) values ('Elaborar las Pruebas',4)
insert into Categorias (descripcion,categoria_padre) values ('Obtener y Adecuar Recursos para la Evaluación',4)

insert into Categorias (descripcion,categoria_padre) values ('StakeHolders debe completar los Surveys',5)
insert into Categorias (descripcion,categoria_padre) values ('Realizar las Pruebas',5)
insert into Categorias (descripcion,categoria_padre) values ('Medir los Atributos requeridos por las Métricas',5)
insert into Categorias (descripcion,categoria_padre) values ('Registrar los Valores de las Métricas en el Modelo de Evaluación',5)
insert into Categorias (descripcion,categoria_padre) values ('Obtener Resultados',5)

insert into Categorias (descripcion,categoria_padre) values ('Analizar los resultados ',6)
insert into Categorias (descripcion,categoria_padre) values ('Concluir el Grado de Calidad',6)
insert into Categorias (descripcion,categoria_padre) values ('Documentar la Evaluación ',6)


--Sub Categoria Nivel 3  Se cargan directamente como tareas
--insert into Categorias (descripcion,categoria_padre) values ('Definir El Modelo de Calidad a Usar',10)
--insert into Categorias (descripcion,categoria_padre) values ('Definir la Rigurosidad del Modelo',10)
--insert into Categorias (descripcion,categoria_padre) values ('Identificar Riesgos de Proyecto y/o Producto',11)
--insert into Categorias (descripcion,categoria_padre) values ('Analizar los Riesgos',11)
--insert into Categorias (descripcion,categoria_padre) values ('Tratar los Riesgos',11)
--insert into Categorias (descripcion,categoria_padre) values ('Monitorear los Riesgos',11)
--insert into Categorias (descripcion,categoria_padre) values ('Elaborar casos de Prueba',19)
--insert into Categorias (descripcion,categoria_padre) values ('Diseñar El Ambiente de Prueba',19)
--insert into Categorias (descripcion,categoria_padre) values ('Documentar los Casos de Prueba',19)
--insert into Categorias (descripcion,categoria_padre) values ('Armar el Ambiente de Prueba',22)
--insert into Categorias (descripcion,categoria_padre) values ('Ejecutar Casos de Prueba',22)
--insert into Categorias (descripcion,categoria_padre) values ('Documentar sus Ejecuciones de Pruebas',22)
--insert into Categorias (descripcion,categoria_padre) values ('Concluir la Prueba',22)


-- Recursos
insert into recursos (descripcion,valorHora,rango_id,rol_id) values ('Marcelo Garcia',200,1,1)
insert into recursos (descripcion,valorHora,rango_id,rol_id) values ('Marcelo Garcia',200,2,1)
insert into recursos (descripcion,valorHora,rango_id,rol_id) values ('Juan Perez',280,3,1)
insert into recursos (descripcion,valorHora,rango_id,rol_id) values ('Pablo Krat',310,3,1)
insert into recursos (descripcion,valorHora,rango_id,rol_id) values ('Julia Melle',200,3,2)
insert into recursos (descripcion,valorHora,rango_id,rol_id) values ('Andres Pila',400,3,4)
insert into recursos (descripcion,valorHora,rango_id,rol_id) values ('Karina Gomez',420,3,3)
insert into recursos (descripcion,valorHora,rango_id,rol_id) values ('Karina Gomez',220,3,2)
insert into recursos (descripcion,valorHora,rango_id,rol_id) values ('Carlos Paz',520,4,7)

select * from Tipos_Tareas
select * from Categorias


-- Tareas
insert into Tareas (titulo,descripcion,tipo_tarea_id,categoria_id) values('Definir El Modelo de Calidad a Usar','Realizar reuniones para definir El Modelo de Calidad a Usar',1,10)
insert into Tareas (titulo,descripcion,tipo_tarea_id,categoria_id) values ('Definir la Rigurosidad del Modelo','Realizar reuniones para definir Rigurosidad del Modelo',1,10)
insert into Tareas (titulo,descripcion,tipo_tarea_id,categoria_id) values ('Identificar Riesgos de Proyecto y/o Producto','Realizar relevamiento para Identificar Riesgos potenciales que afecten al proyecto/producto',1,11)
insert into Tareas (titulo,descripcion,tipo_tarea_id,categoria_id) values ('Analizar los Riesgos','Realizar el analisis de los riesgos identificados',2,11)
insert into Tareas (titulo,descripcion,tipo_tarea_id,categoria_id) values ('Tratar los Riesgos','Tratar los Riesgos identificados',2,11)
insert into Tareas (titulo,descripcion,tipo_tarea_id,categoria_id) values ('Monitorear los Riesgos','Realizar el monitoreo de los riesgos identificados',3,11)
insert into Tareas (titulo,descripcion,tipo_tarea_id,categoria_id) values ('Elaborar casos de Prueba','Realizar junto con el cliente, los casos de prueba a ejecutar',1,19)
insert into Tareas (titulo,descripcion,tipo_tarea_id,categoria_id) values ('Diseñar El Ambiente de Prueba','Realizar las tareas necesarias para diseñar el ambiente de pruebas',3,19)
insert into Tareas (titulo,descripcion,tipo_tarea_id,categoria_id) values ('Documentar los Casos de Prueba','Realziar la docuemtancion de los casos de pruebas ejecutados',1,19)
insert into Tareas (titulo,descripcion,tipo_tarea_id,categoria_id) values ('Armar el Ambiente de Prueba','Realizar las tareas necesarias para armar el ambiente de pruebas',3,22)
insert into Tareas (titulo,descripcion,tipo_tarea_id,categoria_id) values ('Ejecutar Casos de Prueba','Ejecutar los casos de pruebas diseñados en el ambiente de pruebas',3,22)
insert into Tareas (titulo,descripcion,tipo_tarea_id,categoria_id) values ('Documentar sus Ejecuciones de Pruebas','Realizar la docuemntacion de los resultados de la sejecuciones de las pruebas',1,22)
insert into Tareas (titulo,descripcion,tipo_tarea_id,categoria_id) values ('Concluir la Prueba','Elaborar la conclusion de las pruebas realizadas',2,22)





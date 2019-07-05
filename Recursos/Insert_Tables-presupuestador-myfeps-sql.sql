use [presupuestador-myfeps-sql]
go
-- Tablas Maestras
-- Insert de presupuestos_estados
insert into Presupuestos_Estados (descripcion) values ('Eliminado')
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

-- Insert de contactos
insert into contactos (nombre, mail, telefono, cargo) values('Paula Angeleri','paula.angeleri@gmail.com','15 1111-1111','CIO')
insert into contactos (nombre, mail, telefono, cargo) values('Juan Garcia','juan.garcia@gmail.com','15 2222-2222','CDOR')

--Insert de Proyectos
insert into proyectos (nombre,descripcion,contacto_id) values ('Proyecto Banelco','Desarrollo del nuevo Banelco','1')
insert into proyectos (nombre,descripcion,contacto_id) values ('Proyecto Desarrollo CRM','Sistema CRM Web para empresas','2')
insert into proyectos (nombre,descripcion,contacto_id) values ('Proyecto Seguridad Web','Soluciones de seguridad Web para empresas','1')

-- Insert de Recursos
insert into Recursos (descripcion,rango_id,rol_id,valorHora) values ('Desarrollador - Junior',1,1,100)
insert into Recursos (descripcion,rango_id,rol_id,valorHora) values ('Desarrollador - SemiSenior',2,1,170)
insert into Recursos (descripcion,rango_id,rol_id,valorHora) values ('Desarrollador - Junior',3,1,250)
insert into Recursos (descripcion,rango_id,rol_id,valorHora) values ('Lider de Proyecto - SemiSenior',2,3,200)
insert into Recursos (descripcion,rango_id,rol_id,valorHora) values ('Lider de Proyecto - SemiSenior',3,3,320)
insert into Recursos (descripcion,rango_id,rol_id,valorHora) values ('Usuario Prueba - Junior',1,5,100)
insert into Recursos (descripcion,rango_id,rol_id,valorHora) values ('Usuario Prueba - SemiSenior',2,5,130)
insert into Recursos (descripcion,rango_id,rol_id,valorHora) values ('Usuario Prueba - Senior',3,5,180)
insert into Recursos (descripcion,rango_id,rol_id,valorHora) values ('Administrador DBs - Senior',3,4,400)
insert into Recursos (descripcion,rango_id,rol_id,valorHora) values ('Ing de Software - Senior',3,7,400)
insert into Recursos (descripcion,rango_id,rol_id,valorHora) values ('Ing de Software - Master',4,7,600)

-- iNsert Categorias 
insert into Categorias (descripcion) values ('Proceso de Evaluación')
insert into Categorias (descripcion,categoria_padre) values ('Establecer Requisitos y objetivos',1)
insert into Categorias (descripcion,categoria_padre) values ('Elegir el Marco de Calidad',2)
insert into Categorias (descripcion,categoria_padre) values ('Administrar Riesgos de la Evaluación',2)
insert into Categorias (descripcion,categoria_padre) values ('Especificar la Evaluación',1)
insert into Categorias (descripcion,categoria_padre) values ('Diseñar la Evaluación',1)
insert into Categorias (descripcion,categoria_padre) values ('Elaborar las Pruebas',6)
insert into Categorias (descripcion,categoria_padre) values ('Evaluar el Producto',1)
insert into Categorias (descripcion,categoria_padre) values ('Realizar Pruebas',1)
insert into Categorias (descripcion,categoria_padre) values ('Concluir',1)

-- Tareas
insert into Tareas (titulo,descripcion,tipo_tarea_id,categoria_id) values ('Establecer el Propósito de la Evaluación',' Realizar reuniones para Establecer el Propósito de la Evaluación',1,2)
insert into Tareas (titulo,descripcion,tipo_tarea_id,categoria_id) values ('Identificar el Producto a Evaluar','Realizar relevamiento para Identificar el Producto a Evaluar',1,2)
insert into Tareas (titulo,descripcion,tipo_tarea_id,categoria_id) values ('Identificarlos Requerimientos de Calidad','Realizar relevamiento para Identificarlos Requerimientos de Calidad',1,2)
insert into Tareas (titulo,descripcion,tipo_tarea_id,categoria_id) values ('Definir El Modelo de Calidad a Usar','Realizar reuniones para definir El Modelo de Calidad a Usar',1,3)
insert into Tareas (titulo,descripcion,tipo_tarea_id,categoria_id) values ('Definir la Rigurosidad del Modelo','Realizar reuniones para definir Rigurosidad del Modelo',1,3)
insert into Tareas (titulo,descripcion,tipo_tarea_id,categoria_id) values ('Identificar Riesgos de Proyecto y/o Producto','Realizar relevamiento para Identificar Riesgos potenciales que afecten al proyecto/producto',1,4)
insert into Tareas (titulo,descripcion,tipo_tarea_id,categoria_id) values ('Analizar los Riesgos','Realizar el analisis de los riesgos identificados',2,4)
insert into Tareas (titulo,descripcion,tipo_tarea_id,categoria_id) values ('Tratar los Riesgos','Tratar los Riesgos identificados',2,4)
insert into Tareas (titulo,descripcion,tipo_tarea_id,categoria_id) values ('Monitorear los Riesgos','Realizar el monitoreo de los riesgos identificados',3,4)
insert into Tareas (titulo,descripcion,tipo_tarea_id,categoria_id) values ('Definir Recursos para la Evaluación','Realizar reuniones para Definir Recursos para la Evaluación',1,5)
insert into Tareas (titulo,descripcion,tipo_tarea_id,categoria_id) values ('Conformar Equipo Evaluador','Realizar reuniones para Conformar Equipo Evaluador',1,5)
insert into Tareas (titulo,descripcion,tipo_tarea_id,categoria_id) values ('Seleccionar las Métricas','Realizar reuniones para Seleccionar las Métricas',1,5)
insert into Tareas (titulo,descripcion,tipo_tarea_id,categoria_id) values ('Establecer Ponderación','Realizar reuniones para Establecer Ponderación',1,5)
insert into Tareas (titulo,descripcion,tipo_tarea_id,categoria_id) values ('Establecer Fidelidades de Medición','Realizar reuniones para Establecer Fidelidades de Medición',1,5)
insert into Tareas (titulo,descripcion,tipo_tarea_id,categoria_id) values ('Preparar Recursos e Infraestructura','Realizar reuniones para Preparar Recursos e Infraestructura',1,6)
insert into Tareas (titulo,descripcion,tipo_tarea_id,categoria_id) values ('Elaborar el Plan de Mediciones','Realizar reuniones para Elaborar el Plan de Mediciones',1,6)
insert into Tareas (titulo,descripcion,tipo_tarea_id,categoria_id) values ('Elaborar casos de Prueba','Realizar junto con el cliente, los casos de prueba a ejecutar',1,7)
insert into Tareas (titulo,descripcion,tipo_tarea_id,categoria_id) values ('Diseñar El Ambiente de Prueba','Realizar las tareas necesarias para diseñar el ambiente de pruebas',3,7)
insert into Tareas (titulo,descripcion,tipo_tarea_id,categoria_id) values ('Documentar los Casos de Prueba','Realziar la docuemtancion de los casos de pruebas ejecutados',1,7)
insert into Tareas (titulo,descripcion,tipo_tarea_id,categoria_id) values ('Obtener y Adecuar Recursos para la Evaluación','Realizar reuniones para Obtener y Adecuar Recursos para la Evaluación',1,7)
insert into Tareas (titulo,descripcion,tipo_tarea_id,categoria_id) values ('StakeHolders debe completar los Surveys','Realizar reuniones para que StakeHolders complete los Surveys',1,8)
insert into Tareas (titulo,descripcion,tipo_tarea_id,categoria_id) values ('Armar el Ambiente de Prueba','Realizar las tareas necesarias para armar el ambiente de pruebas',3,9)
insert into Tareas (titulo,descripcion,tipo_tarea_id,categoria_id) values ('Ejecutar Casos de Prueba','Ejecutar los casos de pruebas diseñados en el ambiente de pruebas',3,9)
insert into Tareas (titulo,descripcion,tipo_tarea_id,categoria_id) values ('Documentar sus Ejecuciones de Pruebas','Realizar la docuemntacion de los resultados de la sejecuciones de las pruebas',1,9)
insert into Tareas (titulo,descripcion,tipo_tarea_id,categoria_id) values ('Concluir la Prueba','Elaborar la conclusion de las pruebas realizadas',2,9)
insert into Tareas (titulo,descripcion,tipo_tarea_id,categoria_id) values ('Medir los Atributos requeridos por las Métricas','Realizar las tareas necesarias para Medir los Atributos',1,8)
insert into Tareas (titulo,descripcion,tipo_tarea_id,categoria_id) values ('Registrar los Valores de las Métricas en el Modelo de Evaluación','Registrar los Valores de las Métricas en el Modelo de Evaluación',1,8)
insert into Tareas (titulo,descripcion,tipo_tarea_id,categoria_id) values ('Obtener Resultados','Realizar las tareas necesarias para Obtener Resultados',1,8)
insert into Tareas (titulo,descripcion,tipo_tarea_id,categoria_id) values ('Analizar los resultados ','Realizar las tareas necesarias para Analizar los resultados',1,10)
insert into Tareas (titulo,descripcion,tipo_tarea_id,categoria_id) values ('Concluir el Grado de Calidad','Realizar las tareas necesarias para Concluir el Grado de Calidad',1,10)
insert into Tareas (titulo,descripcion,tipo_tarea_id,categoria_id) values ('Documentar la Evaluación ','Realizar las tareas necesarias para Documentar la Evaluación',1,10)


--select * from categorias
--select * from contactos
--select * from plantillas
--select * from Plantillas_Tareas
--select * from Presupuestos
--select * from Presupuestos_Estados
--select * from Presupuestos_Tareas
--select * from PresupuestosTareas_Recursos
--select * from Proyectos
--select * from Rangos
--select * from Recursos
--select * from Roles
--select * from Tareas
--select * from Tipos_Tareas

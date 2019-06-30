use [presupuestador-myfeps-sql]
go
-- Insert de contactos
insert into contactos (nombre, mail, telefono, cargo) values('Paula','paula@gmail.com','15 1111-1111','PMO')
insert into contactos (nombre, mail, telefono, cargo) values('Nereo Candenas','nereocandenas@gmail.com','15 2222-2222','CIO')
insert into contactos (nombre, mail, telefono, cargo) values('Gabriel Ferreira','gabrielferreira@gmail.com','15 3333-3333','DEV')
insert into contactos (nombre, mail, telefono, cargo) values('Mariano Martin','marianomartin@gmail.com','15 4444-4444','CEO')

--Insert de Proyectos
insert into proyectos (nombre,descripcion,contacto_id) values ('Prueba 1','Descripción de Prueba 1','1')
insert into proyectos (nombre,descripcion,contacto_id) values ('Prueba 2','Descripción de Prueba 2','2')
insert into proyectos (nombre,descripcion,contacto_id) values ('Prueba 3','Descripción de Prueba 3','3')
insert into proyectos (nombre,descripcion,contacto_id) values ('Prueba Seguridad','Seguridad de Prueba','4')
insert into proyectos (nombre,descripcion,contacto_id) values ('Prueba Performace','Performance de Prueba','3')
insert into proyectos (nombre,descripcion,contacto_id) values ('Prueba Integridad','Integridad de Prueba','2')

--Insert de presupuestos_estados
insert into Presupuestos_Estados (descripcion) values ('Borrador')
insert into Presupuestos_Estados (descripcion) values ('Aceptado')
insert into Presupuestos_Estados (descripcion) values ('Rechazado')
insert into Presupuestos_Estados (descripcion) values ('Cancelado')

-- Insert de Categorias
insert into Recursos (descripcion,rango_id,rol_id,valorHora) values ('Juan Perez',1,1,100)
insert into Recursos (descripcion,rango_id,rol_id,valorHora) values ('Daniel Lopez',2,1,200)
insert into Recursos (descripcion,rango_id,rol_id,valorHora) values ('Martin Garcia',2,2,220)
insert into Recursos (descripcion,rango_id,rol_id,valorHora) values ('Juana Ortiz',3,3,300)
insert into Recursos (descripcion,rango_id,rol_id,valorHora) values ('Francisco J',4,3,400)


-- Insert de Roles
insert into roles (descripcion) values ('Usuario prueba')
insert into roles (descripcion) values ('Desarrollador')
insert into roles (descripcion) values ('Coordinador')
insert into roles (descripcion) values ('Lider de proyecto')
insert into roles (descripcion) values ('adminstrador DBA')

-- Insert de rangos
insert into rangos (descripcion) values ('Junior')
insert into rangos (descripcion) values ('Semi-Senior')
insert into rangos (descripcion) values ('Senior')
insert into rangos (descripcion) values ('Master')


-- Insert de  Tipo_Tareas
insert into Tipos_Tareas (descripcion) values ('Documentacion')
insert into Tipos_Tareas (descripcion) values ('Evaluación')




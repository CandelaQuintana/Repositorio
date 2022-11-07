create database Ayuda_A_Ayudar


/*------------------------------------------------Creacion de Tablas----------------------------------------*/

create table Alumno (
Id_Alumno int identity primary key not null,
Id_Año int not null,
Id_Bimestre int not null,
Id_Materia int not null,
Id_Grado int not null,
Nombre varchar(40) not null,
Apellido varchar(40)not null,
Documento int not null,
Constraint Fk_Año_Alumno Foreign key (Id_Año) References Año(Id_Año),
Constraint Fk_Bimestre_Alumno Foreign key (Id_Bimestre) References Bimestre(Id_Bimestre),
Constraint Fk_Materia_Alumno Foreign key (Id_Materia) References Materia(Id_Materia),
Constraint Fk_Grado_Alumno Foreign key (Id_Grado) References Grado(Id_Grado),
);

create table Año(
Id_Año int identity primary key not null,
Año int not null
);

create table Asistencia (
Id_Asistencia int identity primary key not null,
Id_Escuela_Alumno int not null,
Fecha date not null,
Presente bit /*Boolean (bit)*/ not null,
Constraint Fk_Escuela_Alumno_Asistencia Foreign key (Id_Escuela_Alumno) References Escuela_Alumno(Id_Escuela_Alumno)
);

create table Bimestre (
	Id_Bimestre int identity primary key not null,
	Bimestre varchar(40) not null
);


create table Datos_Cualitativos (
Id_Datos_Cualitativos int identity primary key not null,
Id_Escuela_Alumno int not null,
Contenido varchar (150) not null,
Eje_Selecc_a_Avanz varchar (150) not null, 
Artic_De_Trabaj varchar (150) not null, 
Observaciones varchar (150) not null, 
Sintesis_Primer_Cuatrimestre varchar (200), 
Sintesis_Segundo_Cuatrimestre varchar (200),
Constraint Fk_Escuela_Alumno_Datos_Cualitativos Foreign key (Id_Escuela_Alumno) References Escuela_Alumno(Id_Escuela_Alumno)
);

create table Cant_Alum_Acomp (
Id_Cant_Alum_Acomp int identity primary key not null,
Id_Datos_Cuantitativos int not null
Constraint Fk_Datos_Cuantitativos_Cant_Alum_Acomp Foreign key (Id_Datos_Cuantitativos) References Datos_Cuantitativos(Id_Datos_Cuantitativos)
);

create table Cobert_Grados (
Id_Cobert_Grados int identity primary key not null,
Id_Datos_Cuantitativos int not null,
Fecha_P_Desde Datetime not null,
Fecha_P_Hasta Datetime not null,
Nomb_Docent_Remplazado varchar(40) not null,
Motivo varchar(100) not null
Constraint Fk_Datos_Cuantitativos_Cobert_Grados Foreign key (Id_Datos_Cuantitativos) References Datos_Cuantitativos(Id_Datos_Cuantitativos)
);

create table Datos_Cuantitativos (
Id_Datos_Cuantitativos int identity primary key not null,
Id_Escuela_Alumno int not null,
Constraint Fk_Escuela_Alumno_Datos_Cuantitativos Foreign key (Id_Escuela_Alumno) References Escuela_Alumno(Id_Escuela_Alumno)
);

create table Escuela (
Id_Escuela int identity primary key not null,
Escuela_n int not null,
Dist_Esc int not null
);

create table Escuela_Alumno (
Id_Escuela_Alumno int identity primary key not null,
Id_Escuela int not null,
Id_Alumno int not null,
Constraint Fk_Escuela_Escuela_Alumno Foreign key (Id_Escuela) References Escuela(Id_Escuela),
Constraint Fk_Alumno_Escuela_Alumno Foreign key (Id_Alumno ) References Alumno (Id_Alumno )
);

create table Grado (
	Id_Grado int identity primary key not null,
	Grado varchar(30) not null
);

create table Maestro_grado_Compartidos (
	Id_Maestro_grado_Compartidos int identity primary key not null,
	Id_Datos_Cualitativos int not null,
	Fecha date not null,
	Contenidos varchar (150) not null,
	Constraint Fk_Datos_Cualitativos_Maestro_grado_Compartidos Foreign key (Id_Datos_Cualitativos) References Datos_Cualitativos(Id_Datos_Cualitativos)
);

create table Materia (
Id_Materia int identity primary key not null,
Materia varchar(40) not null
);

create table Prom_Acomp (
Id_Prom_Acomp int identity primary key not null,
Id_Escuela_Alumno int not null,
Niñxs_Promovido_PA varchar (5) not null,
Niñxs_Permanecen varchar (5) not null,
Observaciones varchar (150) not null,
Constraint Fk_Escuela_Alumno_Prom_Acomp Foreign key (Id_Escuela_Alumno) References Escuela_Alumno(Id_Escuela_Alumno)
);

create table Rol ( /**/
Id_Rol int identity primary key not null,
Nombre_Rol varchar (20) not null
);

create table Turno (
Id_turno int identity primary key not null,
Turno varchar (40) not null
);

create table Usuario ( /**/
Id_Usuario int identity primary key not null,
Id_Escuela int  not null,
Id_Turno int  not null,
Id_Rol int not null,
Nom_Docente Varchar (40)  not null,
Año_Ingreso_Proyecto_Mate date  not null,
Correo Varchar (40)  not null,
Usuario Varchar (20) not null,
Contraseña varchar (20) not null,
Constraint Fk_Escuela_Usuario Foreign key (Id_Escuela) References Escuela(Id_Escuela),
Constraint Fk_Turno_Usuario Foreign key (Id_Turno) References Turno(Id_Turno),
Constraint Fk_Rol_Usuario Foreign key (Id_Rol) References Rol(Id_Rol)
);


/*------------------------------------------------- Eliminacion de Tablas --------------------------------------------*/

DROP TABLE Alumno;
DROP TABLE Año;
DROP TABLE Asistencia;
DROP TABLE Bimestre;
DROP TABLE Cant_Alum_Acomp;
DROP TABLE Cobert_Grados;
DROP TABLE Datos_Cualitativos;
DROP TABLE Datos_Cuantitativos;
DROP TABLE Escuela;
DROP TABLE Escuela_Alumno;
DROP TABLE Grado;
DROP TABLE Maestro_grado_Compartidos;
DROP TABLE Materia;
DROP TABLE Prom_Acomp;
DROP TABLE Rol;
DROP TABLE Turno;
DROP TABLE Usuario;

/*Union de Tablas*/

/*--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/

/* Rellenado de Tablas*/

Insert into Alumno values /*(Id_Año,Id_Bimestre,Materia,Grado,Nombre,Apellido,Documento)*/
(1,1,1,1,'Estevancito','Minimo',00000001),
(30,1,1,1,'Estebanzote','Maximo',99999999),
(20,2,1,2,'Julian','Paez',52367890),
(20,1,2,3,'Lucio','Ballon',38472934),
(20,1,1,4,'Markos','Silva',42567893),
(22,3,2,5,'alan','bazques',34356234),
(22,4,1,6,'magali','mendoza',36745234),
(21,1,2,7,'nahuel','lozano',37954746),
(21,3,1,2,'rodrigo','kresta',37857333),
(21,1,2,3,'eros','santos',22223345),
(19,3,1,4,'good','code',32567423);

Insert into Año values /*(Año)*/
('2001'),
('2002'),
('2003'),
('2004'),
('2005'),
('2006'),
('2007'),
('2008'),
('2009'),
('2010'),
('2011'),
('2012'),
('2013'),
('2014'),
('2015'),
('2016'),
('2017'),
('2018'),
('2019'),
('2020'),
('2021'),
('2022'),
('2023'),
('2024'),
('2025'),
('2026'),
('2027'),
('2028'),
('2029'),
('2030');

Insert into Asistencia  values /*(Escuela_Alumno,Fecha,Presente)*/  
/*Las forent keys de materia y grado se rellenan pero se ignoran por que esos datos los sacamos de alumno*/
/*  'Ausente'      'Presente'    */
/*agregar id alumno*/
(1,'2030-12-31',1),
(2,'2030-12-31',0),
(3,'2030-12-31',1),
(4,'2020-01-01',1),
(5,'2022-01-01',0),
(6,'2022-01-01',1),
(7,'2021-01-01',1),
(8,'2021-02-01',1),
(9,'2021-01-01',1);


Insert into Bimestre values /*(Bimestre)*/
('1er Bimestre'),
('2do Bimestre'),
('3er Bimestre'),
('4to Bimestre');


Insert into Cant_Alum_Acomp values /*(Id_Datos_Cuantitativos)*/
/*Esta tabla se puede simplificar solo poniendo el Id_Datos_Cuantitativos (probar)*/
(1),
(2),
(3),
(4),
(5);

Insert into Cobert_Grados values /*(Id_Datos_Cuantitativos,Fecha_P_Desde,Fecha_P_Hasta,Nomb_Docent_Remplazado,Motivo)*/
(2,'2022-03-10','2022-03-15','Julian', 'Covid'),
(2,'2021-04-10','2021-04-15','Julian', 'Covid'),
(3,'2022-08-01','2021-08-07','Sandro', 'Licencia'),
(3,'2022-2-20','2021-02-23','Diego', 'Enfermo'),
(1,'2022-04-15','2022-04-20', 'Alan', 'Enfermo');

Insert into Datos_Cualitativos values 
 /*( Id_Escuela_Alumno,Contenido,Eje_Selecc_a_Avanz,Artic_De_Trabaj,Observaciones,Sintesis_Primer_Cuatrimestre,Sintesis_Segundo_Cuatrimestre)*/
 /*Se puede simplificar año,bimestre,materia,grado y Fecha_Inicio_Acomp. si lo filtramos todo por alumno*/
(3,'Sistema de numeracion: Lectura y escritura de numeros','Trabaja con el mismo contenido pero usando otras propuestas y materiales diferentes a los del aula','no','Cuadernillo, Estudiar','',''),
(4,'Sistema de Lectura: Nivel de conceptualizacion','Lectura y Escritura','Trabaja con el mismo contenido pero usando otras propuestas y ateriales diferentes a los del aula','Piter escribe su nombre. Trabaja la propuesta del aula con tetos cortos, Estudiar','Continua en PA escribe de manera silabica con valor sonoro convencional','');

Insert into Datos_Cuantitativos values/*( Id_Escuela_Alumno)*/
(1),
(2),
(3),
(4),
(5);

Insert into Escuela values /*(Escuela_n,Dist_Esc)*/
(1,21),
(2,21),
(3,21),
(4,21),
(5,21),
(6,21),
(7,21),
(8,21),
(9,21),
(10,21);

Insert into Escuela_Alumno values /*Id_Escuela,Id_Alumno*/
(1,1),
(1,2),
(2,3),
(2,4),
(2,5),
(3,6),
(3,7),
(4,8),
(4,9),
(4,10),
(5,11);

Insert into Grado values /*(Grado)*/
('1er Grado'),
('2do Grado'),
('3er Grado'),
('4to Grado'),
('5to Grado'),
('6to Grado'),
('7mo Grado');

Insert into Maestro_grado_Compartidos values /*(Id_Datos_Cualitativos,Contenidos,Fecha,)*/
/*agrgar id_alumno?*/
(1,'2022-05-01','numeracion: Lectura y escritura de numeros'),
(2,'2022-01-01','Lectura y escritura anexada pero ejemplos simples');

Insert into Materia values /*(Materia)*/
('Matematica'),
('Practica de Lenguaje');


Insert into Prom_Acomp values /*TABLA INDEPEDIENTE SOLO DE INGRESO, NO MANEJA DATOS */
/*'(Id_Escuela_Alumno,Niñxs_Promovido_PA,Niñxs_Permanecen,Observaciones)'*/
(1,2,1,'ninguna'),
(2,1,0,'F');

Insert into Rol values /*(Rol)*/
('Administrador'),
('Ususario');

Insert into Turno values /*(Turno)*/
('Mañana'),
('Tarde');

Insert into Usuario values
/*(Id_Escuela,Id_Turno,Id_Rol,Nom_Docente,Año_Ingreso_Proyecto_Mate,Ususario,Contraseña)*/
(1,1,2,'Analia','2016-01-01','juanilapaz@hotmail.es','Analia','Ana12345'),
(1,2,1,'Joel','2014-01-01','RobertoPaez@Gmail.com','Joel','Joel12345');

/*--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/

/*ejemplos de muestra*/

/*Solo muesta comun*/
select *
From Alumno;

select *
From Año;

select *
From Asistencia;

select *
From Bimestre;

select *
From Cant_Alum_Acomp;

select *
From Cobert_Grados;

select *
From Datos_Cualitativos;

select *
From Datos_Cuantitativos;

select *
From Escuela;

select *
From Escuela_Alumno;

select *
From Grado;

select *
From Maestro_grado_Compartidos;

select *
From Materia;

select *
From Prom_Acomp;

select *
From Rol;

select *
From Turno;

select *
From Usuario;

/*Como se veria en las planillas*/
/*--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
/*Usuario*/
Select Usuario.Id_Usuario, Escuela.Escuela_n, Escuela.Dist_Esc, Turno.Turno, Rol.Nombre_Rol, Usuario.Nom_Docente, Usuario.Correo, Usuario.Usuario, Usuario.Contraseña
From Usuario Inner Join Escuela on Usuario.Id_Escuela = Escuela.Id_Escuela
Inner Join Turno on Usuario.Id_Turno = Turno.Id_Turno
Inner Join Rol on Usuario.Id_Rol = Rol.Id_Rol
Group by Usuario.Id_Usuario, Escuela.Escuela_n, Escuela.Dist_Esc, Turno.Turno, Rol.Nombre_Rol, Usuario.Nom_Docente, Usuario.Correo, Usuario.Usuario, Usuario.Contraseña

/*--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
/*Asistencia*/
/*Problema, el datos que pongas en escuela igualara y pondra lo mismo en alumno*/
Select Asistencia.Id_Asistencia, Escuela.Escuela_n, Escuela.Dist_Esc, Año.Año, Materia.Materia, Grado.Grado, Asistencia.Fecha, Alumno.Nombre, Alumno.Documento, Asistencia.Presente
From Asistencia Inner Join Escuela_Alumno on Asistencia.Id_Escuela_Alumno = Escuela_Alumno.Id_Escuela_Alumno
Inner Join Escuela on Escuela_Alumno.Id_Escuela = Escuela.Id_Escuela
Inner Join Alumno on Escuela_Alumno.Id_Alumno = Alumno.Id_Alumno
Inner Join Grado on Alumno.Id_Grado = Grado.Id_Grado
Inner Join Materia on Alumno.Id_Materia = Materia.Id_Materia
Inner Join Año on Alumno.Id_Año = Año.Id_Año
Group by Asistencia.Id_Asistencia, Escuela.Escuela_n, Escuela.Dist_Esc, Año.Año, Materia.Materia, Grado.Grado, Asistencia.Fecha, Alumno.Nombre, Alumno.Documento, Asistencia.Presente

/*--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
/*Datos Cualitativos*/

Select Datos_Cualitativos.Id_Datos_Cualitativos, Escuela.Escuela_n, Escuela.Dist_Esc, Bimestre.Bimestre, Materia.Materia, Grado.Grado, Alumno.Nombre, Alumno.Documento, Año.Año/*'Año_de_Inicio_de_Acompañamiento'*/, Datos_Cualitativos.Contenido, Datos_Cualitativos.Eje_Selecc_a_Avanz, Datos_Cualitativos.Artic_De_Trabaj, Datos_Cualitativos.Observaciones, Datos_Cualitativos.Sintesis_Primer_Cuatrimestre,Datos_Cualitativos.Sintesis_Segundo_Cuatrimestre
From Datos_Cualitativos Inner Join Escuela_Alumno on Datos_Cualitativos.Id_Escuela_Alumno = Escuela_Alumno.Id_Escuela_Alumno
Inner Join Escuela on Escuela_Alumno.Id_Escuela = Escuela.Id_Escuela
Inner Join Alumno on Escuela_Alumno.Id_Alumno = Alumno.Id_Alumno
Inner Join Año on Alumno.Id_Año = Año.Id_Año
Inner Join Bimestre on Alumno.Id_Bimestre = Bimestre.Id_Bimestre
Inner Join Materia on Alumno.Id_Materia = Materia.Id_Materia
Inner Join Grado on Alumno.Id_Grado = Grado.Id_Grado
Group By Datos_Cualitativos.Id_Datos_Cualitativos, Escuela.Escuela_n, Escuela.Dist_Esc, Bimestre.Bimestre, Materia.Materia, Grado.Grado, Alumno.Nombre, Alumno.Documento, Año.Año/*'Año_de_Inicio_de_Acompañamiento'*/, Datos_Cualitativos.Contenido, Datos_Cualitativos.Eje_Selecc_a_Avanz, Datos_Cualitativos.Artic_De_Trabaj, Datos_Cualitativos.Observaciones, Datos_Cualitativos.Sintesis_Primer_Cuatrimestre,Datos_Cualitativos.Sintesis_Segundo_Cuatrimestre

/*--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
/*Maestro de Grado Compartido*/

Select Maestro_grado_Compartidos.Id_Maestro_grado_Compartidos, Grado.Grado, Maestro_grado_Compartidos.Fecha, Alumno.Nombre, Alumno.Apellido, Maestro_grado_Compartidos.Contenidos
From Maestro_grado_Compartidos inner join Datos_Cualitativos on Maestro_grado_Compartidos.Id_Datos_Cualitativos = Datos_Cualitativos.Id_Datos_Cualitativos
inner join Escuela_Alumno on Datos_Cualitativos.Id_Escuela_Alumno = Escuela_Alumno.Id_Escuela_Alumno
Inner Join Escuela on Escuela_Alumno.Id_Escuela = Escuela.Id_Escuela
/* Inner Join Ususario on Usuario.Id_Escuela = Escuela.Id_Escuela */
Inner Join Alumno on Escuela_Alumno.Id_Alumno = Alumno.Id_Alumno
Inner Join Grado on Alumno.Id_Grado = Grado.Id_Grado
Group by Maestro_grado_Compartidos.Id_Maestro_grado_Compartidos, Grado.Grado, Maestro_grado_Compartidos.Fecha, Alumno.Nombre, Alumno.Apellido, Maestro_grado_Compartidos.Contenidos

/*--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
/*Alumno*/

select  Alumno.Id_Alumno, Año.Año, Bimestre.Bimestre, Materia.Materia, Grado.Grado, Alumno.Nombre, Alumno.Apellido, Alumno.Documento
from Alumno inner join Año on Alumno.Id_Año = Año.Id_Año
inner join Bimestre on Alumno.Id_Bimestre = Bimestre.Id_Bimestre
Inner Join Materia on Alumno.Id_Materia = Materia.Id_Materia
Inner Join Grado on Alumno.Id_Grado = Grado.Id_Grado
group by Alumno.Id_Alumno, Año.Año, Bimestre.Bimestre, Materia.Materia, Grado.Grado, Alumno.Nombre, Alumno.Apellido, Alumno.Documento

/*--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
/*Promocion Acompañada*/ /*chequear ingresos*/
select Prom_Acomp.Id_Prom_Acomp, Escuela.Escuela_n, Escuela.Dist_Esc, Año.Año, Bimestre.Bimestre, Grado.Grado, Prom_Acomp.Niñxs_Promovido_PA, Prom_Acomp.Niñxs_Permanecen, Prom_Acomp.Observaciones
from Prom_Acomp inner join Escuela_Alumno on Prom_Acomp.Id_Escuela_Alumno = Escuela_Alumno.Id_Escuela_Alumno
Inner Join Escuela on Escuela_Alumno.Id_Escuela = Escuela.Id_Escuela
Inner Join Alumno on Escuela_Alumno.Id_Alumno = Alumno.Id_Alumno
inner join Año on Alumno.Id_Año = Año.Id_Año
inner join Bimestre on Alumno.Id_Bimestre = Bimestre.Id_Bimestre
inner join Grado on Alumno.Id_Grado = Grado.Id_Grado
group by Prom_Acomp.Id_Prom_Acomp, Escuela.Escuela_n, Escuela.Dist_Esc, Año.Año, Bimestre.Bimestre, Grado.Grado, Prom_Acomp.Niñxs_Promovido_PA, Prom_Acomp.Niñxs_Permanecen, Prom_Acomp.Observaciones

/*--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
/*Datos Cuantitativos*/

select Datos_Cuantitativos.Id_Datos_Cuantitativos, Escuela.Escuela_n, Escuela.Dist_Esc, Año.Año, Bimestre.Bimestre
from Datos_Cuantitativos inner join Escuela_Alumno on Datos_Cuantitativos.Id_Escuela_Alumno = Escuela_Alumno.Id_Escuela_Alumno
Inner Join Escuela on Escuela_Alumno.Id_Escuela = Escuela.Id_Escuela
Inner Join Alumno on Escuela_Alumno.Id_Alumno = Alumno.Id_Alumno
inner join Año on Alumno.Id_Año = Año.Id_Año
inner join Bimestre on Alumno.Id_Bimestre = Bimestre.Id_Bimestre
group by Datos_Cuantitativos.Id_Datos_Cuantitativos, Escuela.Escuela_n, Escuela.Dist_Esc, Año.Año, Bimestre.Bimestre

/*Cobertura de Grado*/

select Cobert_Grados.Id_Cobert_Grados, Grado.Grado, Cobert_Grados.Fecha_P_Desde, Cobert_Grados.Fecha_P_Desde, Cobert_Grados.Nomb_Docent_Remplazado, Cobert_Grados.Motivo
from Cobert_Grados inner join Datos_Cuantitativos on Cobert_Grados.Id_Datos_Cuantitativos = Datos_Cuantitativos.Id_Datos_Cuantitativos
inner join Escuela_Alumno on Datos_Cuantitativos.Id_Escuela_Alumno = Escuela_Alumno.Id_Escuela_Alumno
Inner Join Escuela on Escuela_Alumno.Id_Escuela = Escuela.Id_Escuela
Inner Join Alumno on Escuela_Alumno.Id_Alumno = Alumno.Id_Alumno
Inner Join Grado on Alumno.Id_Grado = Grado.Id_Grado
group by Cobert_Grados.Id_Cobert_Grados, Grado.Grado, Cobert_Grados.Fecha_P_Desde, Cobert_Grados.Fecha_P_Desde, Cobert_Grados.Nomb_Docent_Remplazado, Cobert_Grados.Motivo

/*Cantidad de alumnos acaompañados*/

select Cant_Alum_Acomp.Id_Cant_Alum_Acomp, Año.Año, Bimestre.Bimestre, Materia.Materia, Grado.Grado
from Cant_Alum_Acomp inner join Datos_Cuantitativos on Cant_Alum_Acomp.Id_Datos_Cuantitativos = Datos_Cuantitativos.Id_Datos_Cuantitativos
inner join Escuela_Alumno on Datos_Cuantitativos.Id_Escuela_Alumno = Escuela_Alumno.Id_Escuela_Alumno
Inner Join Escuela on Escuela_Alumno.Id_Escuela = Escuela.Id_Escuela
Inner Join Alumno on Escuela_Alumno.Id_Alumno = Alumno.Id_Alumno
Inner Join Grado on  Alumno.Id_Grado = Grado.Id_Grado
Inner Join Materia on  Alumno.Id_Materia = Materia.Id_Materia
inner join Año on Alumno.Id_Año = Año.Id_Año
inner join Bimestre on Alumno.Id_Bimestre = Bimestre.Id_Bimestre
group by Cant_Alum_Acomp.Id_Cant_Alum_Acomp, Año.Año, Bimestre.Bimestre, Materia.Materia, Grado.Grado
















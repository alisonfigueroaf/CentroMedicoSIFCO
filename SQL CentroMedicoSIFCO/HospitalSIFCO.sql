--Creación base de datos--
CREATE DATABASE HOSPITALSIFCO
GO

USE HOSPITALSIFCO
GO
--Creación de tablas--
CREATE TABLE DOCTORHOSPITAL(
	Id_Doctor int not null identity(1,1),
	Nombre varchar(50) not null,
	Num_Colegiado varchar(10) not null,
	Especialidad varchar(30) not null,
	Genero varchar(1) not null,
	Fecha_Nacimiento Date not null,
	Fecha_Ingreso DateTime,
	Fecha_Salida DateTime,
	
	CONSTRAINT PK_Doctor PRIMARY KEY (Id_Doctor),
	CONSTRAINT UK_Colegiado UNIQUE (Num_Colegiado),
	CONSTRAINT CK_DGenero CHECK (Genero='M' or Genero= 'F')
)

GO
CREATE TABLE ORGANIZACIONHOSPITAL(
	Num_Clinica int,
	
	CONSTRAINT PK_Clinica PRIMARY KEY (Num_Clinica)
)
GO
CREATE TABLE FICHAPACIENTE(
	Id_Paciente int not null identity(1,1),
	Id_Doctor int not null,
	DPI varchar(13) not null,
	Nombre varchar(50) not null,
	Genero varchar(1) not null,
	Fecha_Nacimiento Date not null,
	Num_Clinica int not null,
	
	CONSTRAINT PK_Paciente PRIMARY KEY (Id_Paciente),
	CONSTRAINT UK_DPI unique (DPI),
	CONSTRAINT FK_PacienteDoctor FOREIGN KEY (Id_Doctor) REFERENCES DOCTORHOSPITAL(Id_Doctor),
	CONSTRAINT FK_PacienteClinica FOREIGN KEY (Num_Clinica) REFERENCES ORGANIZACIONHOSPITAL(Num_Clinica),
	CONSTRAINT CK_PGenero CHECK (Genero='M' or Genero= 'F')
)
GO
CREATE TABLE CONSULTAHOSPITAL(
	Id_Consulta int not null identity(1,1),
	Id_Paciente int not null,
	Id_Doctor int not null,
	Num_Clinica int NOT NULL,
	Fecha_Ingreso DateTime,
	Fecha_Salida DateTime,
	Estado varchar(15) not null,
	Observaciones varchar (300),
	Medicamentos varchar (300),
	FotoEvidencia varbinary(max),
	ProximaCita bit not null,
	Fecha_ProximaCita DateTime,

	CONSTRAINT PK_Consulta PRIMARY KEY (Id_Consulta),
	CONSTRAINT FK_ConsultaPaciente FOREIGN KEY (Id_Paciente) REFERENCES FICHAPACIENTE(Id_Paciente),
	CONSTRAINT FK_ConsultaDoctor FOREIGN KEY (Id_Doctor) REFERENCES DOCTORHOSPITAL(Id_Doctor),
	CONSTRAINT FK_ConsultaClinica FOREIGN KEY (Num_Clinica) REFERENCES ORGANIZACIONHOSPITAL(Num_Clinica),
	CONSTRAINT CK_Estado CHECK(Estado='En progreso' or Estado='Pendiente' or Estado='Finalizada' or Estado='Cancelada'),
	CONSTRAINT CK_ProximaCita CHECK((ProximaCita=1 AND Fecha_ProximaCita is not null) OR (ProximaCita=0 AND Fecha_ProximaCita is null))
)

--Visualizar tablas--
SELECT * FROM DOCTORHOSPITAL
SELECT * FROM FICHAPACIENTE
SELECT * FROM ORGANIZACIONHOSPITAL
SELECT * FROM CONSULTAHOSPITAL

--Vaciar tablas--
DELETE FROM DOCTORHOSPITAL
DELETE FROM FICHAPACIENTE
DELETE FROM ORGANIZACIONHOSPITAL
DELETE FROM CONSULTAHOSPITAL

--Borrar tablas--
DROP TABLE CONSULTAHOSPITAL
DROP TABLE FICHAPACIENTE
DROP TABLE DOCTORHOSPITAL
DROP TABLE ORGANIZACIONHOSPITAL


-------------------------------------QUERIES-------------------------------------
--Total de consultas en progreso por especialidad
SELECT CONSULTAHOSPITAL.Estado, COUNT(CONSULTAHOSPITAL.Estado) as Consultas, DOCTORHOSPITAL.Especialidad 
FROM CONSULTAHOSPITAL JOIN DOCTORHOSPITAL ON CONSULTAHOSPITAL.Id_Doctor = DOCTORHOSPITAL.Id_Doctor
where CONSULTAHOSPITAL.Estado like '%En progreso%'
group by CONSULTAHOSPITAL.Estado, DOCTORHOSPITAL.Especialidad

--Total de consultas pendientes por médico
SELECT CONSULTAHOSPITAL.Estado, COUNT(CONSULTAHOSPITAL.Estado) as Consultas, DOCTORHOSPITAL.Id_Doctor, DOCTORHOSPITAL.Nombre 
FROM CONSULTAHOSPITAL JOIN DOCTORHOSPITAL ON CONSULTAHOSPITAL.Id_Doctor = DOCTORHOSPITAL.Id_Doctor
where CONSULTAHOSPITAL.Estado like '%Pendiente%'
group by CONSULTAHOSPITAL.Estado, DOCTORHOSPITAL.Id_Doctor, DOCTORHOSPITAL.Nombre

--La consulta con mayor duración en minutos, incluir el nombre del paciente y médico tratante de dicha consulta
SELECT TOP 1 CONSULTAHOSPITAL.Id_Consulta, MAX(DATEDIFF(MINUTE,CONSULTAHOSPITAL.Fecha_Ingreso, CONSULTAHOSPITAL.Fecha_Salida)) as Duración, DOCTORHOSPITAL.Nombre as Doctor, DOCTORHOSPITAL.Especialidad, FICHAPACIENTE.Nombre as Paciente 
FROM CONSULTAHOSPITAL JOIN DOCTORHOSPITAL ON CONSULTAHOSPITAL.Id_Doctor = DOCTORHOSPITAL.Id_Doctor
					  JOIN FICHAPACIENTE ON CONSULTAHOSPITAL.Id_Paciente = FICHAPACIENTE.Id_Paciente
group by CONSULTAHOSPITAL.Id_Consulta, DOCTORHOSPITAL.Nombre, DOCTORHOSPITAL.Especialidad, FICHAPACIENTE.Nombre   
ORDER BY Duración DESC

--La consulta con menor duración en segundos, incluir el nombre del paciente y médico tratante de dicha consulta
SELECT TOP 1 CONSULTAHOSPITAL.Id_Consulta, MIN(DATEDIFF(SECOND,CONSULTAHOSPITAL.Fecha_Ingreso, CONSULTAHOSPITAL.Fecha_Salida)) as Duración, DOCTORHOSPITAL.Nombre as Doctor, DOCTORHOSPITAL.Especialidad, FICHAPACIENTE.Nombre as Paciente 
FROM CONSULTAHOSPITAL JOIN DOCTORHOSPITAL ON CONSULTAHOSPITAL.Id_Doctor = DOCTORHOSPITAL.Id_Doctor
					  JOIN FICHAPACIENTE ON CONSULTAHOSPITAL.Id_Paciente = FICHAPACIENTE.Id_Paciente
group by CONSULTAHOSPITAL.Id_Consulta, DOCTORHOSPITAL.Nombre, DOCTORHOSPITAL.Especialidad, FICHAPACIENTE.Nombre  
having MIN(DATEDIFF(SECOND,CONSULTAHOSPITAL.Fecha_Ingreso, CONSULTAHOSPITAL.Fecha_Salida))>0
ORDER BY Duración ASC 

--El cliente con más medicamentos recetados.
SELECT TOP 1 FICHAPACIENTE.Id_Paciente, FICHAPACIENTE.Nombre, COUNT(CONSULTAHOSPITAL.Medicamentos) as Medicamentos 
FROM FICHAPACIENTE JOIN CONSULTAHOSPITAL ON FICHAPACIENTE.Id_Paciente=CONSULTAHOSPITAL.Id_Paciente
group by FICHAPACIENTE.Id_Paciente, FICHAPACIENTE.Nombre
Order by Medicamentos DESC

--El médico hombre que ha atendido a más pacientes mujeres.
SELECT TOP 1 DOCTORHOSPITAL.Id_Doctor, DOCTORHOSPITAL.Nombre, DOCTORHOSPITAL.Especialidad, COUNT(FICHAPACIENTE.Genero) as Mujeres 
FROM DOCTORHOSPITAL JOIN FICHAPACIENTE ON DOCTORHOSPITAL.Id_Doctor=FICHAPACIENTE.Id_Doctor
where FICHAPACIENTE.Genero='F' AND DOCTORHOSPITAL.Genero='M'
GROUP BY DOCTORHOSPITAL.Id_Doctor, DOCTORHOSPITAL.Nombre, DOCTORHOSPITAL.Especialidad
Order by Mujeres DESC

--Especialidad, nombre y fecha de ingreso de todos los médicos del hospital. 
SELECT Especialidad,Nombre,Fecha_Ingreso FROM DOCTORHOSPITAL

--Uso por clínica
SELECT Num_Clinica, COUNT(Num_Clinica) as Máximo from FICHAPACIENTE 
group by Num_Clinica




USE HOSPITALSIFCO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Alison Figueroa>
-- Create date: <17/01/2021>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SPSDoctores]
AS
BEGIN
	SELECT Id_Doctor ,
	Nombre ,
	Num_Colegiado,
	Especialidad,
	Genero,
	Fecha_Nacimiento,
	Fecha_Ingreso,
	Fecha_Salida
	FROM DOCTORHOSPITAL	
END
GO
CREATE PROCEDURE [dbo].[SPSPacientes]
AS
BEGIN
SELECT Id_Paciente,
	Id_Doctor,
	DPI,
	Nombre,
	Genero,
	Fecha_Nacimiento,
	Num_Clinica
	FROM FICHAPACIENTE
END
GO
CREATE PROCEDURE [dbo].[SPSConsultas]
AS
BEGIN
SELECT
	Id_Consulta,
	Id_Paciente,
	Id_Doctor,
	Num_Clinica,
	Fecha_Ingreso,
	Fecha_Salida,
	Estado,
	Observaciones,
	Medicamentos,
	FotoEvidencia,
	ProximaCita,
	Fecha_ProximaCita
	FROM CONSULTAHOSPITAL
END
/*
INSERT TABLE REGISTERS
*/

INSERT INTO [dbo].[PROVINCES]
           ([Name])
     VALUES
           ('Cartago'),
		   ('San Jose'),
		   ('Guanacaste'),
		   ('Limon'),
		   ('Puntarenas'),
		   ('Alajuela'),
		   ('Heredia')
GO

INSERT INTO [dbo].[CANTONS]
           ([IdProvince]
           ,[Name])
     VALUES
           (2
           ,'San Jose'),
		   (2
           ,'Desamparados'),

		   (6
           ,'San Ramon'),
		   (6
           ,'San Carlos'),

		   (1
           ,'El Guarco'),
		   (1
           ,'Cartago'),

		   (3
           ,'Liberia'),
		   (3
           ,'Cañas')
GO

INSERT INTO [dbo].[USERTYPE]
           ([Name])
     VALUES
           ('Citizen'),
           ('CampaignManager')
GO

INSERT INTO [dbo].[USERS]
           ([IdUserType]
		   ,[IdCanton]
           ,[Name]
           ,[LastName]
           ,[Password]
           ,[UrlPicture]
           ,[CreationDate]
		   ,[IdenNumber])
     VALUES
           (1
		   ,5
           ,'Gunther'
           ,'Karolyi'
           ,'Password'
           ,'URL'
           ,CURRENT_TIMESTAMP
		   ,'116940776'),

		   (2
		   ,5
           ,'Gunther'
           ,'Karolyi'
           ,'Password'
           ,'URL'
           ,CURRENT_TIMESTAMP
		   ,'116940776')
GO

INSERT INTO [dbo].[PARTIES]
           ([Name]
           ,[Description]
           ,[UrlFlag]
           ,[CreationDate])
     VALUES
           ('Partido Liberacion Nacional'
           ,'Somos unas ratas'
           ,'URL'
           ,CURRENT_TIMESTAMP),

		   ('Partido Accion Ciudadana'
           ,'Somos unas vistimas'
           ,'URL'
           ,CURRENT_TIMESTAMP),

		   ('Partido Unidad Social Cristiana'
           ,'No tenemos plan de gobierno'
           ,'URL'
           ,CURRENT_TIMESTAMP),

		   ('Partido Frente Amplio'
           ,'Vamos a salvar el pais'
           ,'URL'
           ,CURRENT_TIMESTAMP)
GO

INSERT INTO [dbo].[PLANS]
           ([IdParty]
           ,[Title]
           ,[Description])
     VALUES
           (1
           ,'Plan de Gobierno 2022'
           ,'Este es el plan para que Figueres se robe toda la plata ...'),

		   (2
           ,'Plan de Gobierno 2022'
           ,'Que pelada, no vamos a ganar ...'),

		   (3
           ,'Plan de Gobierno 2022'
           ,'Que era un plan de gobierno? ...'),

		   (4
           ,'Plan de Gobierno 2022'
           ,'Este es el mejor plan de gobierno, con el que vamos a salvar al pais')
GO

INSERT INTO [dbo].[ACTIONS]
           ([IdPlan]
           ,[Description])
     VALUES
           (1
           ,'Estafar al pueblo'),
		   (1
           ,'Robar Dinero'),
		   (1
           ,'Huir con el dinero'),
		   (1
           ,'Comerselo en confites'),
		   (1
           ,'No me acuerdo señor juez'),
		   (1
           ,'No me toque viejo sin verguenza'),

		   (2
           ,'Llorar por ser el peor partido'),
		   (2
           ,'Hacerse la vistima'),
		   (2
           ,'Volver a llorar'),
		   (2
           ,'Hacer un chorizo'),
		   (2
           ,'Robar porque ya se van'),
		   (2
           ,'Dormir en la asamblea'),

		   (3
           ,'Hablar sin decir nada'),
		   (3
           ,'Mejorar el apoyo hacia las mujeres'),
		   (3
           ,'Ver que pasa en el camino'),
		   (3
           ,'Llamar la atencion'),
		   (3
           ,'Prometer cosas que se van a hacer'),
		   (3
           ,'Llorar en caso de perder'),

		   (4
           ,'Mejorar la economia del pais'),
		   (4
           ,'Mejorar la educacion'),
		   (4
           ,'Asfaltar carreteras'),
		   (4
           ,'Cuidar el medio ambiente'),
		   (4
           ,'Generar empleo'),
		   (4
           ,'Tomar medidas para minimizar el impacto de la crisis economica')
GO

-- Insert Deliverables Data --

-- Get Number of Actions
DECLARE @NumberActions int
SELECT @NumberActions = COUNT(IdAction)
FROM dbo.ACTIONS

-- Get Number of Cantons
DECLARE @NumberCantons int
SELECT @NumberCantons = COUNT(IdCanton)
FROM dbo.CANTONS

-- Iterate Actions Table
DECLARE @CurrentIdAction int = 1
DECLARE @CurrentIdPlan int
DECLARE @RandNumber int

WHILE @CurrentIdAction <= @NumberActions
BEGIN
	-- Get Data From Current Action
	SELECT 
		@CurrentIdPlan = IdPlan
	FROM dbo.ACTIONS
	WHERE IdAction = @CurrentIdAction

	-- Generate a Random Number of Deliverables
	SET @RandNumber = CAST(RAND()*(20-10)+10 AS int) -- [10,20[

	WHILE @RandNumber > 0 
	BEGIN

		-- Insert Random Number of Deliverables
		INSERT INTO [dbo].[DELIVERABLES]
           ([IdAction]
           ,[IdPlan]
           ,[IdCanton]
           ,[KPIValue]
           ,[KPIType]
           ,[PostTime]
		   ,[CheckSum])
		VALUES
           (@CurrentIdAction
           ,@CurrentIdPlan
           ,CAST(RAND()*(@NumberCantons)+1 AS int)
           ,100
           ,'UNDS'
           ,CURRENT_TIMESTAMP
		   ,NEWID())

		-- Decrement Counter
		 SET @RandNumber = @RandNumber - 1
	END

	-- Increment Counter
	SET @CurrentIdAction = @CurrentIdAction + 1

END

GO
USE [master]
GO
/*

CREATE DATABASE

*/
IF DB_ID('Aseni') IS NOT NULL
BEGIN
   DROP DATABASE [Aseni]
END

CREATE DATABASE [Aseni]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Aseni', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Aseni.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Aseni_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Aseni_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Aseni] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Aseni].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Aseni] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Aseni] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Aseni] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Aseni] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Aseni] SET ARITHABORT OFF 
GO
ALTER DATABASE [Aseni] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Aseni] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Aseni] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Aseni] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Aseni] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Aseni] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Aseni] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Aseni] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Aseni] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Aseni] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Aseni] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Aseni] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Aseni] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Aseni] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Aseni] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Aseni] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Aseni] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Aseni] SET RECOVERY FULL 
GO
ALTER DATABASE [Aseni] SET  MULTI_USER 
GO
ALTER DATABASE [Aseni] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Aseni] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Aseni] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Aseni] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Aseni] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Aseni] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Aseni', N'ON'
GO
ALTER DATABASE [Aseni] SET QUERY_STORE = OFF
GO
USE [Aseni]
GO

/*

CREATE TABLES

*/

-- ACTIONS TABLE
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ACTIONS]') AND type in (N'U'))
DROP TABLE [dbo].[ACTIONS]
GO

CREATE TABLE [dbo].[ACTIONS](
	[IdAction] [int] IDENTITY(1,1) NOT NULL,
	[IdPlan] [int] NOT NULL,
	[Description] [varchar](120) NOT NULL,
 CONSTRAINT [PK_ACTIONS] PRIMARY KEY CLUSTERED 
(
	[IdAction] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

-- CANTONS TABLE
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CANTONS]') AND type in (N'U'))
DROP TABLE [dbo].[CANTONS]
GO

CREATE TABLE [dbo].[CANTONS](
	[IdCanton] [int] IDENTITY(1,1) NOT NULL,
	[IdProvince] [int] NOT NULL,
	[Name] [varchar](32) NOT NULL,
 CONSTRAINT [PK_CANTONS] PRIMARY KEY CLUSTERED 
(
	[IdCanton] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

-- DELIVERABLES TABLE
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DELIVERABLES]') AND type in (N'U'))
DROP TABLE [dbo].[DELIVERABLES]
GO

CREATE TABLE [dbo].[DELIVERABLES](
	[IdDeriverable] [int] IDENTITY(1,1) NOT NULL,
	[IdAction] [int] NOT NULL,
	[IdPlan] [int] NOT NULL,
	[IdCanton] [int] NOT NULL,
	[KPIValue] [int] NOT NULL,
	[KPIType] [varchar](8) NOT NULL,
	[EndDate] [datetime] NOT NULL,
 CONSTRAINT [PK_DELIVERABLES] PRIMARY KEY CLUSTERED 
(
	[IdDeriverable] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

-- PARTIES TABLE
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PARTIES]') AND type in (N'U'))
DROP TABLE [dbo].[PARTIES]
GO

CREATE TABLE [dbo].[PARTIES](
	[IdParty] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](32) NOT NULL,
	[Description] [varchar](max) NOT NULL,
	[UrlFlag] [varchar](32) NOT NULL,
	[CreationDate] [datetime] NOT NULL,
 CONSTRAINT [PK_PARTIES] PRIMARY KEY CLUSTERED 
(
	[IdParty] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

-- PLANS TABLE
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PLANS]') AND type in (N'U'))
DROP TABLE [dbo].[PLANS]
GO

CREATE TABLE [dbo].[PLANS](
	[IdPlan] [int] IDENTITY(1,1) NOT NULL,
	[IdParty] [int] NOT NULL,
	[Title] [varchar](64) NOT NULL,
	[Description] [varchar](max) NOT NULL,
 CONSTRAINT [PK_PLANS] PRIMARY KEY CLUSTERED 
(
	[IdPlan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

-- PROVINCES TABLE
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PROVINCES]') AND type in (N'U'))
DROP TABLE [dbo].[PROVINCES]
GO

CREATE TABLE [dbo].[PROVINCES](
	[IdProvince] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](32) NOT NULL,
 CONSTRAINT [PK_PROVINCES] PRIMARY KEY CLUSTERED 
(
	[IdProvince] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

-- USERS TABLE
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USERS]') AND type in (N'U'))
DROP TABLE [dbo].[USERS]
GO

CREATE TABLE [dbo].[USERS](
	[IdUser] [int] IDENTITY(1,1) NOT NULL,
	[IdUserType] [int] NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[LastName] [varchar](50) NOT NULL,
	[Password] [varchar](50) NOT NULL,
	[UrlPicture] [varchar](50) NOT NULL,
	[CreationDate] [datetime] NOT NULL,
 CONSTRAINT [PK_USERS] PRIMARY KEY CLUSTERED 
(
	[IdUser] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

-- USERTYPE TABLE
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USERTYPE]') AND type in (N'U'))
DROP TABLE [dbo].[USERTYPE]
GO

CREATE TABLE [dbo].[USERTYPE](
	[IdUserType] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](32) NOT NULL,
 CONSTRAINT [PK_USERTYPE] PRIMARY KEY CLUSTERED 
(
	[IdUserType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


ALTER TABLE [dbo].[ACTIONS]  WITH CHECK ADD  CONSTRAINT [FK_ACTIONS_PLANS] FOREIGN KEY([IdPlan])
REFERENCES [dbo].[PLANS] ([IdPlan])
GO
ALTER TABLE [dbo].[ACTIONS] CHECK CONSTRAINT [FK_ACTIONS_PLANS]
GO
ALTER TABLE [dbo].[CANTONS]  WITH CHECK ADD  CONSTRAINT [FK_CANTONS_PROVINCES] FOREIGN KEY([IdProvince])
REFERENCES [dbo].[PROVINCES] ([IdProvince])
GO
ALTER TABLE [dbo].[CANTONS] CHECK CONSTRAINT [FK_CANTONS_PROVINCES]
GO
ALTER TABLE [dbo].[DELIVERABLES]  WITH CHECK ADD  CONSTRAINT [FK_DELIVERABLES_ACTIONS] FOREIGN KEY([IdAction])
REFERENCES [dbo].[ACTIONS] ([IdAction])
GO
ALTER TABLE [dbo].[DELIVERABLES] CHECK CONSTRAINT [FK_DELIVERABLES_ACTIONS]
GO
ALTER TABLE [dbo].[DELIVERABLES]  WITH CHECK ADD  CONSTRAINT [FK_DELIVERABLES_CANTONS] FOREIGN KEY([IdCanton])
REFERENCES [dbo].[CANTONS] ([IdCanton])
GO
ALTER TABLE [dbo].[DELIVERABLES] CHECK CONSTRAINT [FK_DELIVERABLES_CANTONS]
GO
ALTER TABLE [dbo].[DELIVERABLES]  WITH CHECK ADD  CONSTRAINT [FK_DELIVERABLES_PLANS] FOREIGN KEY([IdPlan])
REFERENCES [dbo].[PLANS] ([IdPlan])
GO
ALTER TABLE [dbo].[DELIVERABLES] CHECK CONSTRAINT [FK_DELIVERABLES_PLANS]
GO
ALTER TABLE [dbo].[PLANS]  WITH CHECK ADD  CONSTRAINT [FK_PLANS_PARTIES] FOREIGN KEY([IdParty])
REFERENCES [dbo].[PARTIES] ([IdParty])
GO
ALTER TABLE [dbo].[PLANS] CHECK CONSTRAINT [FK_PLANS_PARTIES]
GO
ALTER TABLE [dbo].[USERS]  WITH CHECK ADD  CONSTRAINT [FK_USERS_USERTYPE] FOREIGN KEY([IdUserType])
REFERENCES [dbo].[USERTYPE] ([IdUserType])
GO
ALTER TABLE [dbo].[USERS] CHECK CONSTRAINT [FK_USERS_USERTYPE]
GO
USE [master]
GO
ALTER DATABASE [Aseni] SET  READ_WRITE 
GO

/*

INSERT TABLE REGISTERS

*/

INSERT INTO [dbo].[USERTYPE]
           ([Name])
     VALUES
           ('Citizen'),
           ('CampaignManager')
GO

INSERT INTO [dbo].[USERS]
           ([IdUserType]
           ,[Name]
           ,[LastName]
           ,[Password]
           ,[UrlPicture]
           ,[CreationDate])
     VALUES
           (1
           ,'Gunther'
           ,'Karolyi'
           ,'Password'
           ,'URL'
           ,CURRENT_TIMESTAMP),

		   (2
           ,'Gunther'
           ,'Karolyi'
           ,'Password'
           ,'URL'
           ,CURRENT_TIMESTAMP)
GO

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

		   (2
           ,'Llorar por ser el peor partido'),
		    (2
           ,'Hacerse la vistima'),
		    (2
           ,'Volver a llorar'),

		   (3
           ,'Hablar sin decir nada'),
		    (3
           ,'Mejorar el apoyo hacia las mujeres'),
		    (3
           ,'Ver que pasa en el camino'),

		   (4
           ,'Mejorar la economia del pais'),
		    (4
           ,'Mejorar la educacion'),
		    (4
           ,'Asfaltar carreteras')
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
	SET @RandNumber = CAST(RAND()*(8-3)+3 AS int) -- [3,8[

	WHILE @RandNumber > 0 
	BEGIN
		
		-- Insert Random Number of Deliverables
		INSERT INTO [dbo].[DELIVERABLES]
           ([IdAction]
           ,[IdPlan]
           ,[IdCanton]
           ,[KPIValue]
           ,[KPIType]
           ,[EndDate])
		VALUES
           (@CurrentIdAction
           ,@CurrentIdPlan
           ,CAST(RAND()*(@NumberCantons)+1 AS int)
           ,100
           ,'UNDS'
           ,CURRENT_TIMESTAMP)

		-- Decrement Counter
		 SET @RandNumber = @RandNumber - 1
	END

	-- Increment Counter
	SET @CurrentIdAction = @CurrentIdAction + 1

END

GO
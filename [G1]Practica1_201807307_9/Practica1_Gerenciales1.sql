USE [master]
GO
/****** Object:  Database [Practica1_Gerenciales1]    Script Date: 08/08/2023 1:00:14 ******/
CREATE DATABASE [Practica1_Gerenciales1]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Practica1_Gerenciales1', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Practica1_Gerenciales1.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Practica1_Gerenciales1_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Practica1_Gerenciales1_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Practica1_Gerenciales1] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Practica1_Gerenciales1].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Practica1_Gerenciales1] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Practica1_Gerenciales1] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Practica1_Gerenciales1] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Practica1_Gerenciales1] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Practica1_Gerenciales1] SET ARITHABORT OFF 
GO
ALTER DATABASE [Practica1_Gerenciales1] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Practica1_Gerenciales1] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Practica1_Gerenciales1] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Practica1_Gerenciales1] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Practica1_Gerenciales1] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Practica1_Gerenciales1] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Practica1_Gerenciales1] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Practica1_Gerenciales1] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Practica1_Gerenciales1] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Practica1_Gerenciales1] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Practica1_Gerenciales1] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Practica1_Gerenciales1] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Practica1_Gerenciales1] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Practica1_Gerenciales1] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Practica1_Gerenciales1] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Practica1_Gerenciales1] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Practica1_Gerenciales1] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Practica1_Gerenciales1] SET RECOVERY FULL 
GO
ALTER DATABASE [Practica1_Gerenciales1] SET  MULTI_USER 
GO
ALTER DATABASE [Practica1_Gerenciales1] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Practica1_Gerenciales1] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Practica1_Gerenciales1] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Practica1_Gerenciales1] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Practica1_Gerenciales1] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Practica1_Gerenciales1] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Practica1_Gerenciales1', N'ON'
GO
ALTER DATABASE [Practica1_Gerenciales1] SET QUERY_STORE = OFF
GO
USE [Practica1_Gerenciales1]
GO
/****** Object:  Table [dbo].[Empleados]    Script Date: 08/08/2023 1:00:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Empleados](
	[ID_Empleado] [tinyint] NOT NULL,
	[Nombre] [nvarchar](50) NOT NULL,
	[Edad] [tinyint] NOT NULL,
	[Titulo] [nvarchar](50) NOT NULL,
	[Fecha_Contratacion] [date] NOT NULL,
	[Productividad_Diaria] [tinyint] NOT NULL,
	[Horas_Trabajadas] [float] NOT NULL,
 CONSTRAINT [PK_Empleados] PRIMARY KEY CLUSTERED 
(
	[ID_Empleado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Evaluaciones]    Script Date: 08/08/2023 1:00:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Evaluaciones](
	[ID_Empleado] [tinyint] NOT NULL,
	[Evaluacion_Mensual] [float] NOT NULL,
	[Evaluacion_Anual] [float] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ventas_Productos]    Script Date: 08/08/2023 1:00:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ventas_Productos](
	[ID_Producto] [tinyint] NOT NULL,
	[Nombre_Producto] [nvarchar](50) NOT NULL,
	[Cantidad_Vendida] [tinyint] NOT NULL,
	[Precio_Unitario] [smallint] NOT NULL,
	[Total_Ventas] [int] NOT NULL,
	[ID_Empleado] [tinyint] NOT NULL,
 CONSTRAINT [PK_Ventas_Productos] PRIMARY KEY CLUSTERED 
(
	[ID_Producto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Empleados] ([ID_Empleado], [Nombre], [Edad], [Titulo], [Fecha_Contratacion], [Productividad_Diaria], [Horas_Trabajadas]) VALUES (101, N'John Smith', 30, N'Ingeniero de Ventas', CAST(N'2015-05-15' AS Date), 85, 8)
INSERT [dbo].[Empleados] ([ID_Empleado], [Nombre], [Edad], [Titulo], [Fecha_Contratacion], [Productividad_Diaria], [Horas_Trabajadas]) VALUES (102, N'Alice Johnson', 28, N'Asistente de Marketing', CAST(N'2016-02-20' AS Date), 75, 7)
INSERT [dbo].[Empleados] ([ID_Empleado], [Nombre], [Edad], [Titulo], [Fecha_Contratacion], [Productividad_Diaria], [Horas_Trabajadas]) VALUES (103, N'Michael Brown', 35, N'Gerente de Proyectos', CAST(N'2014-09-10' AS Date), 90, 9)
INSERT [dbo].[Empleados] ([ID_Empleado], [Nombre], [Edad], [Titulo], [Fecha_Contratacion], [Productividad_Diaria], [Horas_Trabajadas]) VALUES (104, N'Emily Davis', 32, N'Analista de Ventas', CAST(N'2017-07-05' AS Date), 80, 85)
INSERT [dbo].[Empleados] ([ID_Empleado], [Nombre], [Edad], [Titulo], [Fecha_Contratacion], [Productividad_Diaria], [Horas_Trabajadas]) VALUES (105, N'Robert Wilson', 29, N'Asistente Administrativo', CAST(N'2018-03-12' AS Date), 70, 65)
INSERT [dbo].[Empleados] ([ID_Empleado], [Nombre], [Edad], [Titulo], [Fecha_Contratacion], [Productividad_Diaria], [Horas_Trabajadas]) VALUES (106, N'Linda Miller', 31, N'Ingeniero de Ventas', CAST(N'2019-01-18' AS Date), 88, 85)
INSERT [dbo].[Empleados] ([ID_Empleado], [Nombre], [Edad], [Titulo], [Fecha_Contratacion], [Productividad_Diaria], [Horas_Trabajadas]) VALUES (107, N'William Jones', 26, N'Analista de Datos', CAST(N'2020-11-22' AS Date), 78, 75)
INSERT [dbo].[Empleados] ([ID_Empleado], [Nombre], [Edad], [Titulo], [Fecha_Contratacion], [Productividad_Diaria], [Horas_Trabajadas]) VALUES (108, N'Susan Martinez', 27, N'Asistente de Ventas', CAST(N'2017-08-30' AS Date), 82, 8)
INSERT [dbo].[Empleados] ([ID_Empleado], [Nombre], [Edad], [Titulo], [Fecha_Contratacion], [Productividad_Diaria], [Horas_Trabajadas]) VALUES (109, N'David Anderson', 33, N'Gerente de Marketing', CAST(N'2015-06-25' AS Date), 92, 95)
INSERT [dbo].[Empleados] ([ID_Empleado], [Nombre], [Edad], [Titulo], [Fecha_Contratacion], [Productividad_Diaria], [Horas_Trabajadas]) VALUES (110, N'Sarah Taylor', 30, N'Asistente de Proyectos', CAST(N'2016-04-14' AS Date), 76, 75)
INSERT [dbo].[Empleados] ([ID_Empleado], [Nombre], [Edad], [Titulo], [Fecha_Contratacion], [Productividad_Diaria], [Horas_Trabajadas]) VALUES (111, N'James Thomas', 29, N'Ingeniero de Ventas', CAST(N'2016-08-05' AS Date), 84, 8)
INSERT [dbo].[Empleados] ([ID_Empleado], [Nombre], [Edad], [Titulo], [Fecha_Contratacion], [Productividad_Diaria], [Horas_Trabajadas]) VALUES (112, N'Karen Hernandez', 28, N'Analista de Marketing', CAST(N'2017-03-09' AS Date), 80, 8)
INSERT [dbo].[Empleados] ([ID_Empleado], [Nombre], [Edad], [Titulo], [Fecha_Contratacion], [Productividad_Diaria], [Horas_Trabajadas]) VALUES (113, N'Charles White', 34, N'Gerente de Ventas', CAST(N'2013-12-02' AS Date), 88, 85)
INSERT [dbo].[Empleados] ([ID_Empleado], [Nombre], [Edad], [Titulo], [Fecha_Contratacion], [Productividad_Diaria], [Horas_Trabajadas]) VALUES (114, N'Amy Lee', 31, N'Asistente de Proyectos', CAST(N'2018-10-17' AS Date), 75, 7)
INSERT [dbo].[Empleados] ([ID_Empleado], [Nombre], [Edad], [Titulo], [Fecha_Contratacion], [Productividad_Diaria], [Horas_Trabajadas]) VALUES (115, N'Richard Walker', 27, N'Ingeniero de Ventas', CAST(N'2019-09-08' AS Date), 85, 85)
INSERT [dbo].[Empleados] ([ID_Empleado], [Nombre], [Edad], [Titulo], [Fecha_Contratacion], [Productividad_Diaria], [Horas_Trabajadas]) VALUES (116, N'Mary Clark', 32, N'Gerente de Proyectos', CAST(N'2016-06-24' AS Date), 90, 9)
INSERT [dbo].[Empleados] ([ID_Empleado], [Nombre], [Edad], [Titulo], [Fecha_Contratacion], [Productividad_Diaria], [Horas_Trabajadas]) VALUES (117, N'Joseph Rodriguez', 29, N'Analista de Ventas', CAST(N'2017-05-11' AS Date), 78, 75)
INSERT [dbo].[Empleados] ([ID_Empleado], [Nombre], [Edad], [Titulo], [Fecha_Contratacion], [Productividad_Diaria], [Horas_Trabajadas]) VALUES (118, N'Elizabeth Lewis', 28, N'Asistente Administrativo', CAST(N'2018-02-28' AS Date), 72, 7)
INSERT [dbo].[Empleados] ([ID_Empleado], [Nombre], [Edad], [Titulo], [Fecha_Contratacion], [Productividad_Diaria], [Horas_Trabajadas]) VALUES (119, N'Michael Hall', 34, N'Gerente de Ventas', CAST(N'2019-11-15' AS Date), 88, 85)
INSERT [dbo].[Empleados] ([ID_Empleado], [Nombre], [Edad], [Titulo], [Fecha_Contratacion], [Productividad_Diaria], [Horas_Trabajadas]) VALUES (120, N'Jennifer Allen', 31, N'Asistente de Marketing', CAST(N'2020-07-23' AS Date), 80, 8)
INSERT [dbo].[Empleados] ([ID_Empleado], [Nombre], [Edad], [Titulo], [Fecha_Contratacion], [Productividad_Diaria], [Horas_Trabajadas]) VALUES (121, N'Christopher Young', 33, N'Ingeniero de Ventas', CAST(N'2015-11-09' AS Date), 85, 85)
INSERT [dbo].[Empleados] ([ID_Empleado], [Nombre], [Edad], [Titulo], [Fecha_Contratacion], [Productividad_Diaria], [Horas_Trabajadas]) VALUES (122, N'Margaret Scott', 29, N'Gerente de Proyectos', CAST(N'2016-10-14' AS Date), 90, 9)
INSERT [dbo].[Empleados] ([ID_Empleado], [Nombre], [Edad], [Titulo], [Fecha_Contratacion], [Productividad_Diaria], [Horas_Trabajadas]) VALUES (123, N'Mark Green', 32, N'Analista de Ventas', CAST(N'2017-08-28' AS Date), 75, 7)
INSERT [dbo].[Empleados] ([ID_Empleado], [Nombre], [Edad], [Titulo], [Fecha_Contratacion], [Productividad_Diaria], [Horas_Trabajadas]) VALUES (124, N'Sophia Adams', 27, N'Asistente Administrativo', CAST(N'2018-05-19' AS Date), 72, 7)
INSERT [dbo].[Empleados] ([ID_Empleado], [Nombre], [Edad], [Titulo], [Fecha_Contratacion], [Productividad_Diaria], [Horas_Trabajadas]) VALUES (125, N'Thomas Baker', 31, N'Gerente de Marketing', CAST(N'2019-04-05' AS Date), 85, 85)
INSERT [dbo].[Empleados] ([ID_Empleado], [Nombre], [Edad], [Titulo], [Fecha_Contratacion], [Productividad_Diaria], [Horas_Trabajadas]) VALUES (126, N'Emma Carter', 28, N'Asistente de Proyectos', CAST(N'2020-02-12' AS Date), 75, 7)
INSERT [dbo].[Empleados] ([ID_Empleado], [Nombre], [Edad], [Titulo], [Fecha_Contratacion], [Productividad_Diaria], [Horas_Trabajadas]) VALUES (127, N'Josephine Hill', 34, N'Ingeniero de Ventas', CAST(N'2015-12-08' AS Date), 90, 9)
INSERT [dbo].[Empleados] ([ID_Empleado], [Nombre], [Edad], [Titulo], [Fecha_Contratacion], [Productividad_Diaria], [Horas_Trabajadas]) VALUES (128, N'William Turner', 31, N'Analista de Marketing', CAST(N'2016-09-17' AS Date), 80, 8)
INSERT [dbo].[Empleados] ([ID_Empleado], [Nombre], [Edad], [Titulo], [Fecha_Contratacion], [Productividad_Diaria], [Horas_Trabajadas]) VALUES (129, N'Olivia Murphy', 27, N'Gerente de Ventas', CAST(N'2017-07-21' AS Date), 78, 75)
INSERT [dbo].[Empleados] ([ID_Empleado], [Nombre], [Edad], [Titulo], [Fecha_Contratacion], [Productividad_Diaria], [Horas_Trabajadas]) VALUES (130, N'Matthew King', 30, N'Asistente de Marketing', CAST(N'2018-04-30' AS Date), 72, 7)
INSERT [dbo].[Empleados] ([ID_Empleado], [Nombre], [Edad], [Titulo], [Fecha_Contratacion], [Productividad_Diaria], [Horas_Trabajadas]) VALUES (131, N'Ella Peterson', 32, N'Ingeniero de Ventas', CAST(N'2019-03-03' AS Date), 85, 85)
INSERT [dbo].[Empleados] ([ID_Empleado], [Nombre], [Edad], [Titulo], [Fecha_Contratacion], [Productividad_Diaria], [Horas_Trabajadas]) VALUES (132, N'Andrew Morgan', 28, N'Analista de Datos', CAST(N'2020-01-06' AS Date), 80, 8)
INSERT [dbo].[Empleados] ([ID_Empleado], [Nombre], [Edad], [Titulo], [Fecha_Contratacion], [Productividad_Diaria], [Horas_Trabajadas]) VALUES (133, N'Ava Reed', 29, N'Asistente de Ventas', CAST(N'2015-09-29' AS Date), 78, 75)
INSERT [dbo].[Empleados] ([ID_Empleado], [Nombre], [Edad], [Titulo], [Fecha_Contratacion], [Productividad_Diaria], [Horas_Trabajadas]) VALUES (134, N'Noah Cooper', 31, N'Gerente de Proyectos', CAST(N'2016-08-08' AS Date), 88, 85)
INSERT [dbo].[Empleados] ([ID_Empleado], [Nombre], [Edad], [Titulo], [Fecha_Contratacion], [Productividad_Diaria], [Horas_Trabajadas]) VALUES (135, N'Grace Richardson', 27, N'Analista de Ventas', CAST(N'2017-05-26' AS Date), 75, 7)
INSERT [dbo].[Empleados] ([ID_Empleado], [Nombre], [Edad], [Titulo], [Fecha_Contratacion], [Productividad_Diaria], [Horas_Trabajadas]) VALUES (136, N'Liam Cox', 30, N'Asistente Administrativo', CAST(N'2018-03-14' AS Date), 72, 7)
INSERT [dbo].[Empleados] ([ID_Empleado], [Nombre], [Edad], [Titulo], [Fecha_Contratacion], [Productividad_Diaria], [Horas_Trabajadas]) VALUES (137, N'Chloe Howard', 28, N'Gerente de Marketing', CAST(N'2019-01-22' AS Date), 85, 85)
INSERT [dbo].[Empleados] ([ID_Empleado], [Nombre], [Edad], [Titulo], [Fecha_Contratacion], [Productividad_Diaria], [Horas_Trabajadas]) VALUES (138, N'Emily Gray', 32, N'Asistente de Proyectos', CAST(N'2020-11-02' AS Date), 75, 7)
INSERT [dbo].[Empleados] ([ID_Empleado], [Nombre], [Edad], [Titulo], [Fecha_Contratacion], [Productividad_Diaria], [Horas_Trabajadas]) VALUES (139, N'Logan Bell', 34, N'Ingeniero de Ventas', CAST(N'2015-07-19' AS Date), 90, 9)
INSERT [dbo].[Empleados] ([ID_Empleado], [Nombre], [Edad], [Titulo], [Fecha_Contratacion], [Productividad_Diaria], [Horas_Trabajadas]) VALUES (140, N'Avery Murphy', 31, N'Analista de Marketing', CAST(N'2016-06-28' AS Date), 80, 8)
INSERT [dbo].[Empleados] ([ID_Empleado], [Nombre], [Edad], [Titulo], [Fecha_Contratacion], [Productividad_Diaria], [Horas_Trabajadas]) VALUES (141, N'Sophia Turner', 29, N'Gerente de Ventas', CAST(N'2017-05-14' AS Date), 78, 75)
INSERT [dbo].[Empleados] ([ID_Empleado], [Nombre], [Edad], [Titulo], [Fecha_Contratacion], [Productividad_Diaria], [Horas_Trabajadas]) VALUES (142, N'Mason James', 28, N'Asistente de Marketing', CAST(N'2018-04-21' AS Date), 72, 7)
INSERT [dbo].[Empleados] ([ID_Empleado], [Nombre], [Edad], [Titulo], [Fecha_Contratacion], [Productividad_Diaria], [Horas_Trabajadas]) VALUES (143, N'Isabella Ross', 30, N'Ingeniero de Ventas', CAST(N'2019-03-27' AS Date), 85, 85)
INSERT [dbo].[Empleados] ([ID_Empleado], [Nombre], [Edad], [Titulo], [Fecha_Contratacion], [Productividad_Diaria], [Horas_Trabajadas]) VALUES (144, N'Ethan Watson', 32, N'Gerente de Proyectos', CAST(N'2020-01-05' AS Date), 90, 9)
INSERT [dbo].[Empleados] ([ID_Empleado], [Nombre], [Edad], [Titulo], [Fecha_Contratacion], [Productividad_Diaria], [Horas_Trabajadas]) VALUES (145, N'Alexis Cox', 28, N'Analista de Ventas', CAST(N'2015-10-12' AS Date), 75, 7)
INSERT [dbo].[Empleados] ([ID_Empleado], [Nombre], [Edad], [Titulo], [Fecha_Contratacion], [Productividad_Diaria], [Horas_Trabajadas]) VALUES (146, N'Aiden Howard', 30, N'Asistente Administrativo', CAST(N'2016-09-20' AS Date), 72, 7)
INSERT [dbo].[Empleados] ([ID_Empleado], [Nombre], [Edad], [Titulo], [Fecha_Contratacion], [Productividad_Diaria], [Horas_Trabajadas]) VALUES (147, N'Ella Gray', 29, N'Gerente de Marketing', CAST(N'2017-08-28' AS Date), 85, 85)
INSERT [dbo].[Empleados] ([ID_Empleado], [Nombre], [Edad], [Titulo], [Fecha_Contratacion], [Productividad_Diaria], [Horas_Trabajadas]) VALUES (148, N'James Reed', 31, N'Asistente de Proyectos', CAST(N'2018-07-04' AS Date), 80, 8)
INSERT [dbo].[Empleados] ([ID_Empleado], [Nombre], [Edad], [Titulo], [Fecha_Contratacion], [Productividad_Diaria], [Horas_Trabajadas]) VALUES (149, N'Mia Richardson', 27, N'Ingeniero de Ventas', CAST(N'2019-06-10' AS Date), 78, 75)
INSERT [dbo].[Empleados] ([ID_Empleado], [Nombre], [Edad], [Titulo], [Fecha_Contratacion], [Productividad_Diaria], [Horas_Trabajadas]) VALUES (150, N'Benjamin Hill', 32, N'Analista de Marketing', CAST(N'2020-05-17' AS Date), 72, 7)
GO
INSERT [dbo].[Evaluaciones] ([ID_Empleado], [Evaluacion_Mensual], [Evaluacion_Anual]) VALUES (101, 85, 89)
INSERT [dbo].[Evaluaciones] ([ID_Empleado], [Evaluacion_Mensual], [Evaluacion_Anual]) VALUES (102, 88, 92)
INSERT [dbo].[Evaluaciones] ([ID_Empleado], [Evaluacion_Mensual], [Evaluacion_Anual]) VALUES (103, 72, 75)
INSERT [dbo].[Evaluaciones] ([ID_Empleado], [Evaluacion_Mensual], [Evaluacion_Anual]) VALUES (104, 90, 95)
INSERT [dbo].[Evaluaciones] ([ID_Empleado], [Evaluacion_Mensual], [Evaluacion_Anual]) VALUES (105, 78, 80)
INSERT [dbo].[Evaluaciones] ([ID_Empleado], [Evaluacion_Mensual], [Evaluacion_Anual]) VALUES (106, 82, 86)
INSERT [dbo].[Evaluaciones] ([ID_Empleado], [Evaluacion_Mensual], [Evaluacion_Anual]) VALUES (107, 62, 65)
INSERT [dbo].[Evaluaciones] ([ID_Empleado], [Evaluacion_Mensual], [Evaluacion_Anual]) VALUES (108, 75, 81)
INSERT [dbo].[Evaluaciones] ([ID_Empleado], [Evaluacion_Mensual], [Evaluacion_Anual]) VALUES (109, 88, 90)
INSERT [dbo].[Evaluaciones] ([ID_Empleado], [Evaluacion_Mensual], [Evaluacion_Anual]) VALUES (110, 70, 74)
INSERT [dbo].[Evaluaciones] ([ID_Empleado], [Evaluacion_Mensual], [Evaluacion_Anual]) VALUES (111, 83, 87)
INSERT [dbo].[Evaluaciones] ([ID_Empleado], [Evaluacion_Mensual], [Evaluacion_Anual]) VALUES (112, 78, 82)
INSERT [dbo].[Evaluaciones] ([ID_Empleado], [Evaluacion_Mensual], [Evaluacion_Anual]) VALUES (113, 75, 80)
INSERT [dbo].[Evaluaciones] ([ID_Empleado], [Evaluacion_Mensual], [Evaluacion_Anual]) VALUES (114, 81, 85)
INSERT [dbo].[Evaluaciones] ([ID_Empleado], [Evaluacion_Mensual], [Evaluacion_Anual]) VALUES (115, 79, 83)
INSERT [dbo].[Evaluaciones] ([ID_Empleado], [Evaluacion_Mensual], [Evaluacion_Anual]) VALUES (116, 86, 90)
INSERT [dbo].[Evaluaciones] ([ID_Empleado], [Evaluacion_Mensual], [Evaluacion_Anual]) VALUES (117, 70, 75)
INSERT [dbo].[Evaluaciones] ([ID_Empleado], [Evaluacion_Mensual], [Evaluacion_Anual]) VALUES (118, 84, 88)
INSERT [dbo].[Evaluaciones] ([ID_Empleado], [Evaluacion_Mensual], [Evaluacion_Anual]) VALUES (119, 72, 78)
INSERT [dbo].[Evaluaciones] ([ID_Empleado], [Evaluacion_Mensual], [Evaluacion_Anual]) VALUES (120, 80, 84)
INSERT [dbo].[Evaluaciones] ([ID_Empleado], [Evaluacion_Mensual], [Evaluacion_Anual]) VALUES (121, 87, 91)
INSERT [dbo].[Evaluaciones] ([ID_Empleado], [Evaluacion_Mensual], [Evaluacion_Anual]) VALUES (122, 76, 80)
INSERT [dbo].[Evaluaciones] ([ID_Empleado], [Evaluacion_Mensual], [Evaluacion_Anual]) VALUES (123, 78, 82)
INSERT [dbo].[Evaluaciones] ([ID_Empleado], [Evaluacion_Mensual], [Evaluacion_Anual]) VALUES (124, 83, 87)
INSERT [dbo].[Evaluaciones] ([ID_Empleado], [Evaluacion_Mensual], [Evaluacion_Anual]) VALUES (125, 79, 85)
INSERT [dbo].[Evaluaciones] ([ID_Empleado], [Evaluacion_Mensual], [Evaluacion_Anual]) VALUES (126, 82, 88)
INSERT [dbo].[Evaluaciones] ([ID_Empleado], [Evaluacion_Mensual], [Evaluacion_Anual]) VALUES (127, 75, 81)
INSERT [dbo].[Evaluaciones] ([ID_Empleado], [Evaluacion_Mensual], [Evaluacion_Anual]) VALUES (128, 77, 83)
INSERT [dbo].[Evaluaciones] ([ID_Empleado], [Evaluacion_Mensual], [Evaluacion_Anual]) VALUES (129, 89, 93)
INSERT [dbo].[Evaluaciones] ([ID_Empleado], [Evaluacion_Mensual], [Evaluacion_Anual]) VALUES (130, 73, 79)
INSERT [dbo].[Evaluaciones] ([ID_Empleado], [Evaluacion_Mensual], [Evaluacion_Anual]) VALUES (131, 86, 90)
INSERT [dbo].[Evaluaciones] ([ID_Empleado], [Evaluacion_Mensual], [Evaluacion_Anual]) VALUES (132, 81, 86)
INSERT [dbo].[Evaluaciones] ([ID_Empleado], [Evaluacion_Mensual], [Evaluacion_Anual]) VALUES (133, 75, 81)
INSERT [dbo].[Evaluaciones] ([ID_Empleado], [Evaluacion_Mensual], [Evaluacion_Anual]) VALUES (134, 83, 88)
INSERT [dbo].[Evaluaciones] ([ID_Empleado], [Evaluacion_Mensual], [Evaluacion_Anual]) VALUES (135, 79, 83)
INSERT [dbo].[Evaluaciones] ([ID_Empleado], [Evaluacion_Mensual], [Evaluacion_Anual]) VALUES (136, 82, 87)
INSERT [dbo].[Evaluaciones] ([ID_Empleado], [Evaluacion_Mensual], [Evaluacion_Anual]) VALUES (137, 76, 80)
INSERT [dbo].[Evaluaciones] ([ID_Empleado], [Evaluacion_Mensual], [Evaluacion_Anual]) VALUES (138, 78, 82)
INSERT [dbo].[Evaluaciones] ([ID_Empleado], [Evaluacion_Mensual], [Evaluacion_Anual]) VALUES (139, 84, 89)
INSERT [dbo].[Evaluaciones] ([ID_Empleado], [Evaluacion_Mensual], [Evaluacion_Anual]) VALUES (140, 72, 78)
INSERT [dbo].[Evaluaciones] ([ID_Empleado], [Evaluacion_Mensual], [Evaluacion_Anual]) VALUES (141, 80, 84)
INSERT [dbo].[Evaluaciones] ([ID_Empleado], [Evaluacion_Mensual], [Evaluacion_Anual]) VALUES (142, 87, 91)
INSERT [dbo].[Evaluaciones] ([ID_Empleado], [Evaluacion_Mensual], [Evaluacion_Anual]) VALUES (143, 75, 80)
INSERT [dbo].[Evaluaciones] ([ID_Empleado], [Evaluacion_Mensual], [Evaluacion_Anual]) VALUES (144, 77, 82)
INSERT [dbo].[Evaluaciones] ([ID_Empleado], [Evaluacion_Mensual], [Evaluacion_Anual]) VALUES (145, 85, 90)
INSERT [dbo].[Evaluaciones] ([ID_Empleado], [Evaluacion_Mensual], [Evaluacion_Anual]) VALUES (146, 74, 79)
INSERT [dbo].[Evaluaciones] ([ID_Empleado], [Evaluacion_Mensual], [Evaluacion_Anual]) VALUES (147, 88, 92)
INSERT [dbo].[Evaluaciones] ([ID_Empleado], [Evaluacion_Mensual], [Evaluacion_Anual]) VALUES (148, 73, 79)
INSERT [dbo].[Evaluaciones] ([ID_Empleado], [Evaluacion_Mensual], [Evaluacion_Anual]) VALUES (149, 86, 90)
INSERT [dbo].[Evaluaciones] ([ID_Empleado], [Evaluacion_Mensual], [Evaluacion_Anual]) VALUES (150, 81, 86)
GO
INSERT [dbo].[Ventas_Productos] ([ID_Producto], [Nombre_Producto], [Cantidad_Vendida], [Precio_Unitario], [Total_Ventas], [ID_Empleado]) VALUES (1, N'Laptop Dell XPS 13', 50, 1200, 60000, 101)
INSERT [dbo].[Ventas_Productos] ([ID_Producto], [Nombre_Producto], [Cantidad_Vendida], [Precio_Unitario], [Total_Ventas], [ID_Empleado]) VALUES (2, N'Monitor LG 27"', 30, 350, 10500, 102)
INSERT [dbo].[Ventas_Productos] ([ID_Producto], [Nombre_Producto], [Cantidad_Vendida], [Precio_Unitario], [Total_Ventas], [ID_Empleado]) VALUES (3, N'Teclado Logitech', 100, 40, 4000, 105)
INSERT [dbo].[Ventas_Productos] ([ID_Producto], [Nombre_Producto], [Cantidad_Vendida], [Precio_Unitario], [Total_Ventas], [ID_Empleado]) VALUES (4, N'Mochila Ejecutiva', 70, 50, 3500, 106)
INSERT [dbo].[Ventas_Productos] ([ID_Producto], [Nombre_Producto], [Cantidad_Vendida], [Precio_Unitario], [Total_Ventas], [ID_Empleado]) VALUES (5, N'Mouse Inalámbrico', 120, 25, 3000, 108)
INSERT [dbo].[Ventas_Productos] ([ID_Producto], [Nombre_Producto], [Cantidad_Vendida], [Precio_Unitario], [Total_Ventas], [ID_Empleado]) VALUES (6, N'Smartphone Samsung Galaxy S21', 40, 800, 32000, 110)
INSERT [dbo].[Ventas_Productos] ([ID_Producto], [Nombre_Producto], [Cantidad_Vendida], [Precio_Unitario], [Total_Ventas], [ID_Empleado]) VALUES (7, N'Audífonos Inalámbricos Sony', 90, 80, 7200, 112)
INSERT [dbo].[Ventas_Productos] ([ID_Producto], [Nombre_Producto], [Cantidad_Vendida], [Precio_Unitario], [Total_Ventas], [ID_Empleado]) VALUES (8, N'Impresora Multifuncional HP', 25, 200, 5000, 114)
INSERT [dbo].[Ventas_Productos] ([ID_Producto], [Nombre_Producto], [Cantidad_Vendida], [Precio_Unitario], [Total_Ventas], [ID_Empleado]) VALUES (9, N'Tablet Lenovo Tab M10', 60, 150, 9000, 116)
INSERT [dbo].[Ventas_Productos] ([ID_Producto], [Nombre_Producto], [Cantidad_Vendida], [Precio_Unitario], [Total_Ventas], [ID_Empleado]) VALUES (10, N'Reloj Inteligente Fitbit', 80, 100, 8000, 118)
INSERT [dbo].[Ventas_Productos] ([ID_Producto], [Nombre_Producto], [Cantidad_Vendida], [Precio_Unitario], [Total_Ventas], [ID_Empleado]) VALUES (11, N'Proyector Epson HD', 15, 400, 6000, 121)
INSERT [dbo].[Ventas_Productos] ([ID_Producto], [Nombre_Producto], [Cantidad_Vendida], [Precio_Unitario], [Total_Ventas], [ID_Empleado]) VALUES (12, N'Escáner Canon LiDE', 35, 70, 2450, 124)
INSERT [dbo].[Ventas_Productos] ([ID_Producto], [Nombre_Producto], [Cantidad_Vendida], [Precio_Unitario], [Total_Ventas], [ID_Empleado]) VALUES (13, N'Cámara DSLR Nikon', 20, 600, 12000, 127)
INSERT [dbo].[Ventas_Productos] ([ID_Producto], [Nombre_Producto], [Cantidad_Vendida], [Precio_Unitario], [Total_Ventas], [ID_Empleado]) VALUES (14, N'Disco Duro Externo 1TB', 50, 90, 4500, 130)
INSERT [dbo].[Ventas_Productos] ([ID_Producto], [Nombre_Producto], [Cantidad_Vendida], [Precio_Unitario], [Total_Ventas], [ID_Empleado]) VALUES (15, N'Memoria USB Kingston 32GB', 100, 20, 2000, 133)
INSERT [dbo].[Ventas_Productos] ([ID_Producto], [Nombre_Producto], [Cantidad_Vendida], [Precio_Unitario], [Total_Ventas], [ID_Empleado]) VALUES (16, N'Teclado y Mouse Inalámbrico Logitech', 70, 60, 4200, 135)
INSERT [dbo].[Ventas_Productos] ([ID_Producto], [Nombre_Producto], [Cantidad_Vendida], [Precio_Unitario], [Total_Ventas], [ID_Empleado]) VALUES (17, N'Monitor Dell 24"', 40, 300, 12000, 137)
INSERT [dbo].[Ventas_Productos] ([ID_Producto], [Nombre_Producto], [Cantidad_Vendida], [Precio_Unitario], [Total_Ventas], [ID_Empleado]) VALUES (18, N'Ratón Gaming Razer', 55, 50, 2750, 140)
INSERT [dbo].[Ventas_Productos] ([ID_Producto], [Nombre_Producto], [Cantidad_Vendida], [Precio_Unitario], [Total_Ventas], [ID_Empleado]) VALUES (19, N'Auriculares Gaming HyperX', 65, 75, 4875, 143)
INSERT [dbo].[Ventas_Productos] ([ID_Producto], [Nombre_Producto], [Cantidad_Vendida], [Precio_Unitario], [Total_Ventas], [ID_Empleado]) VALUES (20, N'Router WiFi TP-Link', 30, 100, 3000, 146)
INSERT [dbo].[Ventas_Productos] ([ID_Producto], [Nombre_Producto], [Cantidad_Vendida], [Precio_Unitario], [Total_Ventas], [ID_Empleado]) VALUES (21, N'Laptop Lenovo ThinkPad', 55, 900, 49500, 149)
INSERT [dbo].[Ventas_Productos] ([ID_Producto], [Nombre_Producto], [Cantidad_Vendida], [Precio_Unitario], [Total_Ventas], [ID_Empleado]) VALUES (22, N'Monitor ASUS 32"', 25, 400, 10000, 102)
INSERT [dbo].[Ventas_Productos] ([ID_Producto], [Nombre_Producto], [Cantidad_Vendida], [Precio_Unitario], [Total_Ventas], [ID_Empleado]) VALUES (23, N'Teclado Mecánico Redragon', 80, 50, 4000, 105)
INSERT [dbo].[Ventas_Productos] ([ID_Producto], [Nombre_Producto], [Cantidad_Vendida], [Precio_Unitario], [Total_Ventas], [ID_Empleado]) VALUES (24, N'Cámara de Seguridad IP', 120, 70, 8400, 108)
INSERT [dbo].[Ventas_Productos] ([ID_Producto], [Nombre_Producto], [Cantidad_Vendida], [Precio_Unitario], [Total_Ventas], [ID_Empleado]) VALUES (25, N'Smart TV Samsung 55"', 40, 1200, 48000, 111)
INSERT [dbo].[Ventas_Productos] ([ID_Producto], [Nombre_Producto], [Cantidad_Vendida], [Precio_Unitario], [Total_Ventas], [ID_Empleado]) VALUES (26, N'Impresora láser Brother', 30, 180, 5400, 114)
INSERT [dbo].[Ventas_Productos] ([ID_Producto], [Nombre_Producto], [Cantidad_Vendida], [Precio_Unitario], [Total_Ventas], [ID_Empleado]) VALUES (27, N'Audífonos Bluetooth JBL', 50, 60, 3000, 117)
INSERT [dbo].[Ventas_Productos] ([ID_Producto], [Nombre_Producto], [Cantidad_Vendida], [Precio_Unitario], [Total_Ventas], [ID_Empleado]) VALUES (28, N'Tablet Huawei MediaPad', 65, 130, 8450, 120)
INSERT [dbo].[Ventas_Productos] ([ID_Producto], [Nombre_Producto], [Cantidad_Vendida], [Precio_Unitario], [Total_Ventas], [ID_Empleado]) VALUES (29, N'Ratón Inalámbrico HP', 85, 30, 2550, 123)
INSERT [dbo].[Ventas_Productos] ([ID_Producto], [Nombre_Producto], [Cantidad_Vendida], [Precio_Unitario], [Total_Ventas], [ID_Empleado]) VALUES (30, N'Auriculares Inalámbricos Apple', 90, 120, 10800, 126)
INSERT [dbo].[Ventas_Productos] ([ID_Producto], [Nombre_Producto], [Cantidad_Vendida], [Precio_Unitario], [Total_Ventas], [ID_Empleado]) VALUES (31, N'Ruteador Gaming ASUS', 40, 150, 6000, 129)
INSERT [dbo].[Ventas_Productos] ([ID_Producto], [Nombre_Producto], [Cantidad_Vendida], [Precio_Unitario], [Total_Ventas], [ID_Empleado]) VALUES (32, N'Teclado Ergonómico Microsoft', 70, 80, 5600, 132)
INSERT [dbo].[Ventas_Productos] ([ID_Producto], [Nombre_Producto], [Cantidad_Vendida], [Precio_Unitario], [Total_Ventas], [ID_Empleado]) VALUES (33, N'Monitor Acer 27"', 55, 250, 13750, 135)
INSERT [dbo].[Ventas_Productos] ([ID_Producto], [Nombre_Producto], [Cantidad_Vendida], [Precio_Unitario], [Total_Ventas], [ID_Empleado]) VALUES (34, N'Disco Duro SSD 500GB', 20, 100, 2000, 138)
INSERT [dbo].[Ventas_Productos] ([ID_Producto], [Nombre_Producto], [Cantidad_Vendida], [Precio_Unitario], [Total_Ventas], [ID_Empleado]) VALUES (35, N'Memoria MicroSD SanDisk 64GB', 120, 25, 3000, 141)
INSERT [dbo].[Ventas_Productos] ([ID_Producto], [Nombre_Producto], [Cantidad_Vendida], [Precio_Unitario], [Total_Ventas], [ID_Empleado]) VALUES (36, N'Webcam Logitech HD', 30, 50, 1500, 144)
INSERT [dbo].[Ventas_Productos] ([ID_Producto], [Nombre_Producto], [Cantidad_Vendida], [Precio_Unitario], [Total_Ventas], [ID_Empleado]) VALUES (37, N'Altavoces Bluetooth Bose', 40, 200, 8000, 147)
INSERT [dbo].[Ventas_Productos] ([ID_Producto], [Nombre_Producto], [Cantidad_Vendida], [Precio_Unitario], [Total_Ventas], [ID_Empleado]) VALUES (39, N'Audífonos Inalámbricos Beats', 50, 180, 9000, 103)
INSERT [dbo].[Ventas_Productos] ([ID_Producto], [Nombre_Producto], [Cantidad_Vendida], [Precio_Unitario], [Total_Ventas], [ID_Empleado]) VALUES (40, N'Tablet Samsung Galaxy Tab A', 60, 140, 8400, 106)
INSERT [dbo].[Ventas_Productos] ([ID_Producto], [Nombre_Producto], [Cantidad_Vendida], [Precio_Unitario], [Total_Ventas], [ID_Empleado]) VALUES (41, N'Monitor BenQ 24"', 90, 120, 10800, 109)
INSERT [dbo].[Ventas_Productos] ([ID_Producto], [Nombre_Producto], [Cantidad_Vendida], [Precio_Unitario], [Total_Ventas], [ID_Empleado]) VALUES (42, N'Ratón Ergonómico Evoluent', 70, 90, 6300, 112)
INSERT [dbo].[Ventas_Productos] ([ID_Producto], [Nombre_Producto], [Cantidad_Vendida], [Precio_Unitario], [Total_Ventas], [ID_Empleado]) VALUES (43, N'Cámara Deportiva GoPro', 40, 300, 12000, 115)
INSERT [dbo].[Ventas_Productos] ([ID_Producto], [Nombre_Producto], [Cantidad_Vendida], [Precio_Unitario], [Total_Ventas], [ID_Empleado]) VALUES (44, N'Laptop HP Pavilion', 35, 800, 28000, 118)
INSERT [dbo].[Ventas_Productos] ([ID_Producto], [Nombre_Producto], [Cantidad_Vendida], [Precio_Unitario], [Total_Ventas], [ID_Empleado]) VALUES (45, N'Impresora Epson EcoTank', 80, 150, 12000, 121)
INSERT [dbo].[Ventas_Productos] ([ID_Producto], [Nombre_Producto], [Cantidad_Vendida], [Precio_Unitario], [Total_Ventas], [ID_Empleado]) VALUES (46, N'Smart TV LG 43"', 60, 500, 30000, 124)
INSERT [dbo].[Ventas_Productos] ([ID_Producto], [Nombre_Producto], [Cantidad_Vendida], [Precio_Unitario], [Total_Ventas], [ID_Empleado]) VALUES (47, N'Teclado Retroiluminado Razer', 40, 70, 2800, 127)
INSERT [dbo].[Ventas_Productos] ([ID_Producto], [Nombre_Producto], [Cantidad_Vendida], [Precio_Unitario], [Total_Ventas], [ID_Empleado]) VALUES (48, N'Disco Duro Externo 2TB', 50, 120, 6000, 130)
INSERT [dbo].[Ventas_Productos] ([ID_Producto], [Nombre_Producto], [Cantidad_Vendida], [Precio_Unitario], [Total_Ventas], [ID_Empleado]) VALUES (49, N'Microfono USB Blue Yeti', 30, 200, 6000, 133)
INSERT [dbo].[Ventas_Productos] ([ID_Producto], [Nombre_Producto], [Cantidad_Vendida], [Precio_Unitario], [Total_Ventas], [ID_Empleado]) VALUES (50, N'Cámara Réflex Canon', 25, 800, 20000, 136)
INSERT [dbo].[Ventas_Productos] ([ID_Producto], [Nombre_Producto], [Cantidad_Vendida], [Precio_Unitario], [Total_Ventas], [ID_Empleado]) VALUES (51, N'Monitor Curvo Samsung 32"', 45, 350, 15750, 139)
INSERT [dbo].[Ventas_Productos] ([ID_Producto], [Nombre_Producto], [Cantidad_Vendida], [Precio_Unitario], [Total_Ventas], [ID_Empleado]) VALUES (52, N'Audífonos Inalámbricos Sennheiser', 60, 100, 6000, 142)
INSERT [dbo].[Ventas_Productos] ([ID_Producto], [Nombre_Producto], [Cantidad_Vendida], [Precio_Unitario], [Total_Ventas], [ID_Empleado]) VALUES (55, N'Smartphone Xiaomi Redmi Note 9', 100, 180, 18000, 101)
INSERT [dbo].[Ventas_Productos] ([ID_Producto], [Nombre_Producto], [Cantidad_Vendida], [Precio_Unitario], [Total_Ventas], [ID_Empleado]) VALUES (56, N'Tablet Amazon Fire', 45, 80, 3600, 104)
INSERT [dbo].[Ventas_Productos] ([ID_Producto], [Nombre_Producto], [Cantidad_Vendida], [Precio_Unitario], [Total_Ventas], [ID_Empleado]) VALUES (57, N'Ratón Gamer Logitech G502', 70, 90, 6300, 107)
INSERT [dbo].[Ventas_Productos] ([ID_Producto], [Nombre_Producto], [Cantidad_Vendida], [Precio_Unitario], [Total_Ventas], [ID_Empleado]) VALUES (58, N'Audífonos Inalámbricos Skullcandy', 50, 70, 3500, 110)
INSERT [dbo].[Ventas_Productos] ([ID_Producto], [Nombre_Producto], [Cantidad_Vendida], [Precio_Unitario], [Total_Ventas], [ID_Empleado]) VALUES (59, N'Monitor LG 24"', 80, 200, 16000, 113)
INSERT [dbo].[Ventas_Productos] ([ID_Producto], [Nombre_Producto], [Cantidad_Vendida], [Precio_Unitario], [Total_Ventas], [ID_Empleado]) VALUES (60, N'Teclado Inalámbrico Apple', 30, 120, 3600, 116)
INSERT [dbo].[Ventas_Productos] ([ID_Producto], [Nombre_Producto], [Cantidad_Vendida], [Precio_Unitario], [Total_Ventas], [ID_Empleado]) VALUES (61, N'Cámara de Seguridad CCTV', 90, 60, 5400, 119)
INSERT [dbo].[Ventas_Productos] ([ID_Producto], [Nombre_Producto], [Cantidad_Vendida], [Precio_Unitario], [Total_Ventas], [ID_Empleado]) VALUES (62, N'Laptop Acer Aspire', 40, 700, 28000, 122)
INSERT [dbo].[Ventas_Productos] ([ID_Producto], [Nombre_Producto], [Cantidad_Vendida], [Precio_Unitario], [Total_Ventas], [ID_Empleado]) VALUES (63, N'Impresora láser Samsung', 55, 250, 13750, 125)
INSERT [dbo].[Ventas_Productos] ([ID_Producto], [Nombre_Producto], [Cantidad_Vendida], [Precio_Unitario], [Total_Ventas], [ID_Empleado]) VALUES (64, N'Smart TV Sony 50"', 25, 600, 15000, 128)
INSERT [dbo].[Ventas_Productos] ([ID_Producto], [Nombre_Producto], [Cantidad_Vendida], [Precio_Unitario], [Total_Ventas], [ID_Empleado]) VALUES (65, N'Ratón Inalámbrico Logitech M590', 70, 40, 2800, 131)
INSERT [dbo].[Ventas_Productos] ([ID_Producto], [Nombre_Producto], [Cantidad_Vendida], [Precio_Unitario], [Total_Ventas], [ID_Empleado]) VALUES (66, N'Auriculares Inalámbricos Jabra', 60, 80, 4800, 134)
INSERT [dbo].[Ventas_Productos] ([ID_Producto], [Nombre_Producto], [Cantidad_Vendida], [Precio_Unitario], [Total_Ventas], [ID_Empleado]) VALUES (67, N'Tablet Lenovo Yoga', 80, 140, 11200, 137)
INSERT [dbo].[Ventas_Productos] ([ID_Producto], [Nombre_Producto], [Cantidad_Vendida], [Precio_Unitario], [Total_Ventas], [ID_Empleado]) VALUES (68, N'Monitor HP 27"', 30, 300, 9000, 140)
INSERT [dbo].[Ventas_Productos] ([ID_Producto], [Nombre_Producto], [Cantidad_Vendida], [Precio_Unitario], [Total_Ventas], [ID_Empleado]) VALUES (69, N'Disco Duro Externo 4TB', 40, 150, 6000, 143)
INSERT [dbo].[Ventas_Productos] ([ID_Producto], [Nombre_Producto], [Cantidad_Vendida], [Precio_Unitario], [Total_Ventas], [ID_Empleado]) VALUES (70, N'Memoria USB SanDisk 128GB', 50, 30, 1500, 146)
INSERT [dbo].[Ventas_Productos] ([ID_Producto], [Nombre_Producto], [Cantidad_Vendida], [Precio_Unitario], [Total_Ventas], [ID_Empleado]) VALUES (71, N'Webcam Microsoft LifeCam', 25, 50, 1250, 149)
INSERT [dbo].[Ventas_Productos] ([ID_Producto], [Nombre_Producto], [Cantidad_Vendida], [Precio_Unitario], [Total_Ventas], [ID_Empleado]) VALUES (72, N'Altavoces Bluetooth JBL Flip', 70, 100, 7000, 102)
INSERT [dbo].[Ventas_Productos] ([ID_Producto], [Nombre_Producto], [Cantidad_Vendida], [Precio_Unitario], [Total_Ventas], [ID_Empleado]) VALUES (73, N'Smartphone Google Pixel 4a', 80, 200, 16000, 105)
INSERT [dbo].[Ventas_Productos] ([ID_Producto], [Nombre_Producto], [Cantidad_Vendida], [Precio_Unitario], [Total_Ventas], [ID_Empleado]) VALUES (74, N'Audífonos Inalámbricos JBL Free', 45, 80, 3600, 108)
INSERT [dbo].[Ventas_Productos] ([ID_Producto], [Nombre_Producto], [Cantidad_Vendida], [Precio_Unitario], [Total_Ventas], [ID_Empleado]) VALUES (75, N'Tablet Huawei MatePad', 30, 180, 5400, 111)
INSERT [dbo].[Ventas_Productos] ([ID_Producto], [Nombre_Producto], [Cantidad_Vendida], [Precio_Unitario], [Total_Ventas], [ID_Empleado]) VALUES (76, N'Monitor ASUS 24"', 90, 150, 13500, 114)
INSERT [dbo].[Ventas_Productos] ([ID_Producto], [Nombre_Producto], [Cantidad_Vendida], [Precio_Unitario], [Total_Ventas], [ID_Empleado]) VALUES (77, N'Teclado Mecánico SteelSeries', 55, 70, 3850, 117)
INSERT [dbo].[Ventas_Productos] ([ID_Producto], [Nombre_Producto], [Cantidad_Vendida], [Precio_Unitario], [Total_Ventas], [ID_Empleado]) VALUES (78, N'Cámara Deportiva SJCAM', 40, 120, 4800, 120)
INSERT [dbo].[Ventas_Productos] ([ID_Producto], [Nombre_Producto], [Cantidad_Vendida], [Precio_Unitario], [Total_Ventas], [ID_Empleado]) VALUES (79, N'Laptop Microsoft Surface', 25, 900, 22500, 123)
INSERT [dbo].[Ventas_Productos] ([ID_Producto], [Nombre_Producto], [Cantidad_Vendida], [Precio_Unitario], [Total_Ventas], [ID_Empleado]) VALUES (80, N'Impresora Canon PIXMA', 60, 80, 4800, 126)
INSERT [dbo].[Ventas_Productos] ([ID_Producto], [Nombre_Producto], [Cantidad_Vendida], [Precio_Unitario], [Total_Ventas], [ID_Empleado]) VALUES (81, N'Smart TV TCL 55"', 70, 400, 28000, 129)
INSERT [dbo].[Ventas_Productos] ([ID_Producto], [Nombre_Producto], [Cantidad_Vendida], [Precio_Unitario], [Total_Ventas], [ID_Empleado]) VALUES (82, N'Ratón Gaming Corsair', 80, 60, 4800, 132)
INSERT [dbo].[Ventas_Productos] ([ID_Producto], [Nombre_Producto], [Cantidad_Vendida], [Precio_Unitario], [Total_Ventas], [ID_Empleado]) VALUES (83, N'Auriculares Inalámbricos Sony WH', 50, 250, 12500, 135)
INSERT [dbo].[Ventas_Productos] ([ID_Producto], [Nombre_Producto], [Cantidad_Vendida], [Precio_Unitario], [Total_Ventas], [ID_Empleado]) VALUES (84, N'Router WiFi Linksys', 100, 80, 8000, 138)
INSERT [dbo].[Ventas_Productos] ([ID_Producto], [Nombre_Producto], [Cantidad_Vendida], [Precio_Unitario], [Total_Ventas], [ID_Empleado]) VALUES (85, N'Teclado y Mouse Microsoft', 30, 100, 3000, 141)
INSERT [dbo].[Ventas_Productos] ([ID_Producto], [Nombre_Producto], [Cantidad_Vendida], [Precio_Unitario], [Total_Ventas], [ID_Empleado]) VALUES (86, N'Monitor Dell 21"', 70, 200, 14000, 144)
INSERT [dbo].[Ventas_Productos] ([ID_Producto], [Nombre_Producto], [Cantidad_Vendida], [Precio_Unitario], [Total_Ventas], [ID_Empleado]) VALUES (87, N'Disco Duro Externo 1TB Seagate', 60, 90, 5400, 147)
INSERT [dbo].[Ventas_Productos] ([ID_Producto], [Nombre_Producto], [Cantidad_Vendida], [Precio_Unitario], [Total_Ventas], [ID_Empleado]) VALUES (88, N'Microfono USB Samson Go', 45, 50, 2250, 150)
INSERT [dbo].[Ventas_Productos] ([ID_Producto], [Nombre_Producto], [Cantidad_Vendida], [Precio_Unitario], [Total_Ventas], [ID_Empleado]) VALUES (89, N'Cámara Compacta Sony', 40, 300, 12000, 103)
INSERT [dbo].[Ventas_Productos] ([ID_Producto], [Nombre_Producto], [Cantidad_Vendida], [Precio_Unitario], [Total_Ventas], [ID_Empleado]) VALUES (90, N'Laptop ASUS ROG', 70, 1000, 70000, 106)
INSERT [dbo].[Ventas_Productos] ([ID_Producto], [Nombre_Producto], [Cantidad_Vendida], [Precio_Unitario], [Total_Ventas], [ID_Empleado]) VALUES (91, N'Impresora HP DeskJet', 80, 120, 9600, 109)
INSERT [dbo].[Ventas_Productos] ([ID_Producto], [Nombre_Producto], [Cantidad_Vendida], [Precio_Unitario], [Total_Ventas], [ID_Empleado]) VALUES (92, N'Smart TV Panasonic 40"', 30, 500, 15000, 112)
INSERT [dbo].[Ventas_Productos] ([ID_Producto], [Nombre_Producto], [Cantidad_Vendida], [Precio_Unitario], [Total_Ventas], [ID_Empleado]) VALUES (93, N'Ratón Inalámbrico Microsoft', 25, 30, 750, 115)
INSERT [dbo].[Ventas_Productos] ([ID_Producto], [Nombre_Producto], [Cantidad_Vendida], [Precio_Unitario], [Total_Ventas], [ID_Empleado]) VALUES (94, N'Auriculares Gaming SteelSeries', 55, 80, 4400, 118)
INSERT [dbo].[Ventas_Productos] ([ID_Producto], [Nombre_Producto], [Cantidad_Vendida], [Precio_Unitario], [Total_Ventas], [ID_Empleado]) VALUES (95, N'Tablet Xiaomi Mi Pad', 60, 140, 8400, 121)
INSERT [dbo].[Ventas_Productos] ([ID_Producto], [Nombre_Producto], [Cantidad_Vendida], [Precio_Unitario], [Total_Ventas], [ID_Empleado]) VALUES (96, N'Monitor AOC 27"', 40, 250, 10000, 124)
INSERT [dbo].[Ventas_Productos] ([ID_Producto], [Nombre_Producto], [Cantidad_Vendida], [Precio_Unitario], [Total_Ventas], [ID_Empleado]) VALUES (97, N'Teclado Inalámbrico Logitech K780', 50, 120, 6000, 127)
INSERT [dbo].[Ventas_Productos] ([ID_Producto], [Nombre_Producto], [Cantidad_Vendida], [Precio_Unitario], [Total_Ventas], [ID_Empleado]) VALUES (98, N'Cámara Réflex Nikon', 25, 700, 17500, 130)
INSERT [dbo].[Ventas_Productos] ([ID_Producto], [Nombre_Producto], [Cantidad_Vendida], [Precio_Unitario], [Total_Ventas], [ID_Empleado]) VALUES (99, N'Smartphone OnePlus 9', 80, 300, 24000, 133)
INSERT [dbo].[Ventas_Productos] ([ID_Producto], [Nombre_Producto], [Cantidad_Vendida], [Precio_Unitario], [Total_Ventas], [ID_Empleado]) VALUES (100, N'Altavoces Bluetooth Sony', 70, 200, 14000, 136)
GO
ALTER TABLE [dbo].[Evaluaciones]  WITH CHECK ADD  CONSTRAINT [FK_Evaluaciones_Empleados] FOREIGN KEY([ID_Empleado])
REFERENCES [dbo].[Empleados] ([ID_Empleado])
GO
ALTER TABLE [dbo].[Evaluaciones] CHECK CONSTRAINT [FK_Evaluaciones_Empleados]
GO
ALTER TABLE [dbo].[Ventas_Productos]  WITH CHECK ADD  CONSTRAINT [ID_Empleado] FOREIGN KEY([ID_Empleado])
REFERENCES [dbo].[Empleados] ([ID_Empleado])
GO
ALTER TABLE [dbo].[Ventas_Productos] CHECK CONSTRAINT [ID_Empleado]
GO
USE [master]
GO
ALTER DATABASE [Practica1_Gerenciales1] SET  READ_WRITE 
GO

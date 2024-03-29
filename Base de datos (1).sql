USE [master]
GO
/****** Object:  Database [MiSistema]    Script Date: 17/12/2019 1:45:13 a. m. ******/
CREATE DATABASE [MiSistema]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MiSistem', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\MiSistem.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'MiSistem_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\MiSistem_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [MiSistema] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MiSistema].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MiSistema] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MiSistema] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MiSistema] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MiSistema] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MiSistema] SET ARITHABORT OFF 
GO
ALTER DATABASE [MiSistema] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [MiSistema] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MiSistema] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MiSistema] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MiSistema] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MiSistema] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MiSistema] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MiSistema] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MiSistema] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MiSistema] SET  DISABLE_BROKER 
GO
ALTER DATABASE [MiSistema] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MiSistema] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MiSistema] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MiSistema] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MiSistema] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MiSistema] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MiSistema] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MiSistema] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [MiSistema] SET  MULTI_USER 
GO
ALTER DATABASE [MiSistema] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MiSistema] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MiSistema] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MiSistema] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [MiSistema] SET DELAYED_DURABILITY = DISABLED 
GO
USE [MiSistema]
GO
/****** Object:  Table [dbo].[Bus]    Script Date: 17/12/2019 1:45:13 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bus](
	[Placa_bus] [nvarchar](50) NOT NULL,
	[Tipo_bus] [nvarchar](50) NULL,
	[Cantidad_pasajeros_bus] [nvarchar](50) NULL,
	[Documento_Conductor] [nvarchar](50) NULL,
 CONSTRAINT [PK_Bus] PRIMARY KEY CLUSTERED 
(
	[Placa_bus] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Ciudad]    Script Date: 17/12/2019 1:45:13 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ciudad](
	[Codigo_ciudad] [nvarchar](50) NOT NULL,
	[Nombre_ciudad] [nvarchar](50) NULL,
 CONSTRAINT [PK_Ciudad] PRIMARY KEY CLUSTERED 
(
	[Codigo_ciudad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Cliente]    Script Date: 17/12/2019 1:45:13 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cliente](
	[Cedula_Cliente] [nvarchar](50) NOT NULL,
	[Nombre_Cliente] [nvarchar](50) NULL,
	[Apellido_Cliente] [nvarchar](50) NULL,
	[Telefono_Cliente] [nvarchar](50) NULL,
	[Correo_Cliente] [nvarchar](50) NULL,
	[Edad_Cliente] [nvarchar](50) NULL,
	[Estado] [bit] NULL,
 CONSTRAINT [PK_Cliente] PRIMARY KEY CLUSTERED 
(
	[Cedula_Cliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Conductor]    Script Date: 17/12/2019 1:45:13 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Conductor](
	[Documento_Conductor] [nvarchar](50) NOT NULL,
	[Nombre_Conductor] [nvarchar](50) NULL,
	[Apellido_Conductor] [nvarchar](50) NULL,
	[Correo_Conductor] [nvarchar](50) NULL,
	[Edad_Conductor] [nvarchar](50) NULL,
	[Telefono_Conductor] [nvarchar](50) NULL,
	[Nit_Empresa] [nvarchar](50) NULL,
 CONSTRAINT [PK_Conductor] PRIMARY KEY CLUSTERED 
(
	[Documento_Conductor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Empleado]    Script Date: 17/12/2019 1:45:13 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Empleado](
	[id_Empleado] [int] IDENTITY(1,1) NOT NULL,
	[nombre_Empleado] [nvarchar](50) NULL,
	[email_empleado] [nvarchar](50) NULL,
	[password_Empleado] [nvarchar](50) NULL,
	[fecha_Empleado] [datetime] NULL,
	[idRol_Empleado] [int] NULL,
	[Cedula_Empleado] [nvarchar](50) NULL,
	[Telefono_Empleado] [nvarchar](50) NULL,
	[Direccion_Empleado] [nvarchar](50) NULL,
	[Estado] [bit] NULL,
	[Nit_Empresa] [nvarchar](50) NULL,
 CONSTRAINT [PK_usuario] PRIMARY KEY CLUSTERED 
(
	[id_Empleado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Empresa]    Script Date: 17/12/2019 1:45:13 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Empresa](
	[Nit_Empresa] [nvarchar](50) NOT NULL,
	[Nombre_Empresa] [nvarchar](50) NULL,
	[Direccion_Empresa] [nvarchar](50) NULL,
	[Correo_Empresa] [nvarchar](50) NULL,
	[Telefono_Empresa] [nvarchar](50) NULL,
 CONSTRAINT [PK_Empresa] PRIMARY KEY CLUSTERED 
(
	[Nit_Empresa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[modulo]    Script Date: 17/12/2019 1:45:13 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[modulo](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NULL,
 CONSTRAINT [PK_modulo] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[operaciones]    Script Date: 17/12/2019 1:45:13 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[operaciones](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NULL,
	[idModulo] [int] NULL,
 CONSTRAINT [PK_operaciones] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Reserva]    Script Date: 17/12/2019 1:45:13 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reserva](
	[Id_Reserva] [int] IDENTITY(1,1) NOT NULL,
	[origen_ciudad] [nvarchar](50) NULL,
	[Destino_ciudad] [nvarchar](50) NULL,
	[Nit_Empresa] [nvarchar](50) NULL,
	[fecha_Reserva] [datetime] NULL,
	[cantida_tiquetes_Reserva] [nvarchar](50) NULL,
	[total_pagar_Reserva] [nvarchar](50) NULL,
	[Cedula_cliente] [nvarchar](50) NULL,
 CONSTRAINT [PK_Reserva] PRIMARY KEY CLUSTERED 
(
	[Id_Reserva] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[rol]    Script Date: 17/12/2019 1:45:13 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[rol](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NULL,
 CONSTRAINT [PK_rol] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[rol_operacion]    Script Date: 17/12/2019 1:45:13 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[rol_operacion](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idRol] [int] NULL,
	[idOperacion] [int] NULL,
 CONSTRAINT [PK_perfil_operacion] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Tiquete]    Script Date: 17/12/2019 1:45:13 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tiquete](
	[Codigo_factura] [bigint] IDENTITY(1,1) NOT NULL,
	[origen_ciudad] [nvarchar](50) NULL,
	[Documento_Conductor] [nvarchar](50) NULL,
	[Placa_bus] [nvarchar](50) NULL,
	[Cedula_Cliente] [nvarchar](50) NULL,
	[Nit_Empresa] [nvarchar](50) NULL,
	[fecha_factura] [datetime] NULL,
	[cantida_tiquetes] [nvarchar](50) NULL,
	[total_pagar_Tiquete] [nvarchar](50) NULL,
	[id_Empleado] [int] NOT NULL,
	[Destino_ciudad] [nvarchar](50) NULL,
 CONSTRAINT [PK_Factura] PRIMARY KEY CLUSTERED 
(
	[Codigo_factura] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[Bus] ([Placa_bus], [Tipo_bus], [Cantidad_pasajeros_bus], [Documento_Conductor]) VALUES (N'stp123', N'grande', N'36', N'10538567854')
GO
INSERT [dbo].[Ciudad] ([Codigo_ciudad], [Nombre_ciudad]) VALUES (N'1', N'manizales')
GO
INSERT [dbo].[Ciudad] ([Codigo_ciudad], [Nombre_ciudad]) VALUES (N'2', N'pereira')
GO
INSERT [dbo].[Ciudad] ([Codigo_ciudad], [Nombre_ciudad]) VALUES (N'3', N'armenia')
GO
INSERT [dbo].[Cliente] ([Cedula_Cliente], [Nombre_Cliente], [Apellido_Cliente], [Telefono_Cliente], [Correo_Cliente], [Edad_Cliente], [Estado]) VALUES (N'10222956', N'jaime Alberto', N'Rojas Vargas', N'3128769145', N'jaime@hotmail.com', N'60', 1)
GO
INSERT [dbo].[Cliente] ([Cedula_Cliente], [Nombre_Cliente], [Apellido_Cliente], [Telefono_Cliente], [Correo_Cliente], [Edad_Cliente], [Estado]) VALUES (N'1053775378', N'Luis Mauricio', N'Rojas Serna', N'3232832869', N'lmrserna23@hotmail.com', N'32', 1)
GO
INSERT [dbo].[Cliente] ([Cedula_Cliente], [Nombre_Cliente], [Apellido_Cliente], [Telefono_Cliente], [Correo_Cliente], [Edad_Cliente], [Estado]) VALUES (N'10538698747', N'lizeth', N'kintero', N'3215678963', N'lizeth@hotmail.com', N'29', NULL)
GO
INSERT [dbo].[Cliente] ([Cedula_Cliente], [Nombre_Cliente], [Apellido_Cliente], [Telefono_Cliente], [Correo_Cliente], [Edad_Cliente], [Estado]) VALUES (N'10538789654', N'Mauricio', N'Cruz', N'3213587545', N'mauricioCruz@hotmail.com', N'35', 1)
GO
INSERT [dbo].[Cliente] ([Cedula_Cliente], [Nombre_Cliente], [Apellido_Cliente], [Telefono_Cliente], [Correo_Cliente], [Edad_Cliente], [Estado]) VALUES (N'105389753', N'Andres', N'serna', N'3217896452', N'andres@hotmail.com', N'36', 1)
GO
INSERT [dbo].[Cliente] ([Cedula_Cliente], [Nombre_Cliente], [Apellido_Cliente], [Telefono_Cliente], [Correo_Cliente], [Edad_Cliente], [Estado]) VALUES (N'10538975378', N'Bryan', N'Moreno', N'3248596321', N'bryan@hotmail.com', N'22', 1)
GO
INSERT [dbo].[Cliente] ([Cedula_Cliente], [Nombre_Cliente], [Apellido_Cliente], [Telefono_Cliente], [Correo_Cliente], [Edad_Cliente], [Estado]) VALUES (N'10539878985', N'luis', N'serna', N'3257896574', N'luis@hotmail.com', N'50', NULL)
GO
INSERT [dbo].[Cliente] ([Cedula_Cliente], [Nombre_Cliente], [Apellido_Cliente], [Telefono_Cliente], [Correo_Cliente], [Edad_Cliente], [Estado]) VALUES (N'1854302', N'Estiven', N'Gomez', N'3214343423', N'estiven.3801911635@ucaldas.edu.co', N'34', 1)
GO
INSERT [dbo].[Cliente] ([Cedula_Cliente], [Nombre_Cliente], [Apellido_Cliente], [Telefono_Cliente], [Correo_Cliente], [Edad_Cliente], [Estado]) VALUES (N'24856510', N'Estela', N'Rodriguez', N'3118576311', N'estela@hotmail.com', N'42', NULL)
GO
INSERT [dbo].[Conductor] ([Documento_Conductor], [Nombre_Conductor], [Apellido_Conductor], [Correo_Conductor], [Edad_Conductor], [Telefono_Conductor], [Nit_Empresa]) VALUES (N'10538567854', N'ricardo', N'rojas', N'ricardo@hotmail.com', N'35', N'3258789873', N'123')
GO
INSERT [dbo].[Conductor] ([Documento_Conductor], [Nombre_Conductor], [Apellido_Conductor], [Correo_Conductor], [Edad_Conductor], [Telefono_Conductor], [Nit_Empresa]) VALUES (N'10538975243', N'jorge', N'tellez', N'jorge@hotmail.com', N'35', N'3287539852', N'123')
GO
SET IDENTITY_INSERT [dbo].[Empleado] ON 

GO
INSERT [dbo].[Empleado] ([id_Empleado], [nombre_Empleado], [email_empleado], [password_Empleado], [fecha_Empleado], [idRol_Empleado], [Cedula_Empleado], [Telefono_Empleado], [Direccion_Empleado], [Estado], [Nit_Empresa]) VALUES (1, N'mauricio ', N'lmrserna23@hotmail.com', N'12345', CAST(N'2019-12-06 00:00:00.000' AS DateTime), 1, N'1053775378', N'3232832869', N'calle 68 # 34 71', 0, N'123')
GO
INSERT [dbo].[Empleado] ([id_Empleado], [nombre_Empleado], [email_empleado], [password_Empleado], [fecha_Empleado], [idRol_Empleado], [Cedula_Empleado], [Telefono_Empleado], [Direccion_Empleado], [Estado], [Nit_Empresa]) VALUES (4, N'estiven ', N'estiven@hotmail.com', N'12345', CAST(N'2019-12-14 00:00:00.000' AS DateTime), 2, N'10538975236', N'3145246968', N'calle 44 # 21 13', 0, NULL)
GO
INSERT [dbo].[Empleado] ([id_Empleado], [nombre_Empleado], [email_empleado], [password_Empleado], [fecha_Empleado], [idRol_Empleado], [Cedula_Empleado], [Telefono_Empleado], [Direccion_Empleado], [Estado], [Nit_Empresa]) VALUES (5, N'felipe', N'felipe@hotmail.com', N'12345', CAST(N'2019-12-14 00:00:00.000' AS DateTime), 3, N'1053865741', N'3225879632', N'calle 34 # 22 44', 0, NULL)
GO
SET IDENTITY_INSERT [dbo].[Empleado] OFF
GO
INSERT [dbo].[Empresa] ([Nit_Empresa], [Nombre_Empresa], [Direccion_Empresa], [Correo_Empresa], [Telefono_Empresa]) VALUES (N'123', N'derco', N'calle 68 # 34 71', N'derco@hotmail.com', N'3232423039')
GO
INSERT [dbo].[Empresa] ([Nit_Empresa], [Nombre_Empresa], [Direccion_Empresa], [Correo_Empresa], [Telefono_Empresa]) VALUES (N'801', N'arauca', N'calle 68 # 34 12', N'arauca@hotmail.com', N'3128566987')
GO
SET IDENTITY_INSERT [dbo].[modulo] ON 

GO
INSERT [dbo].[modulo] ([id], [nombre]) VALUES (1, N'Bus')
GO
INSERT [dbo].[modulo] ([id], [nombre]) VALUES (2, N'Ciudad')
GO
INSERT [dbo].[modulo] ([id], [nombre]) VALUES (3, N'Cliente')
GO
INSERT [dbo].[modulo] ([id], [nombre]) VALUES (4, N'Conductor')
GO
INSERT [dbo].[modulo] ([id], [nombre]) VALUES (5, N'empleado')
GO
INSERT [dbo].[modulo] ([id], [nombre]) VALUES (6, N'Empresa')
GO
INSERT [dbo].[modulo] ([id], [nombre]) VALUES (7, N'Reserva')
GO
INSERT [dbo].[modulo] ([id], [nombre]) VALUES (8, N'Tiquete')
GO
SET IDENTITY_INSERT [dbo].[modulo] OFF
GO
SET IDENTITY_INSERT [dbo].[operaciones] ON 

GO
INSERT [dbo].[operaciones] ([id], [nombre], [idModulo]) VALUES (2, N'Index', 1)
GO
INSERT [dbo].[operaciones] ([id], [nombre], [idModulo]) VALUES (3, N'Delete', 1)
GO
INSERT [dbo].[operaciones] ([id], [nombre], [idModulo]) VALUES (4, N'Details', 1)
GO
INSERT [dbo].[operaciones] ([id], [nombre], [idModulo]) VALUES (5, N'Edit', 1)
GO
INSERT [dbo].[operaciones] ([id], [nombre], [idModulo]) VALUES (6, N'Create', 1)
GO
INSERT [dbo].[operaciones] ([id], [nombre], [idModulo]) VALUES (7, N'Index', 2)
GO
INSERT [dbo].[operaciones] ([id], [nombre], [idModulo]) VALUES (8, N'Delete', 2)
GO
INSERT [dbo].[operaciones] ([id], [nombre], [idModulo]) VALUES (9, N'Details', 2)
GO
INSERT [dbo].[operaciones] ([id], [nombre], [idModulo]) VALUES (10, N'Edit', 2)
GO
INSERT [dbo].[operaciones] ([id], [nombre], [idModulo]) VALUES (11, N'Create', 2)
GO
INSERT [dbo].[operaciones] ([id], [nombre], [idModulo]) VALUES (1007, N'Index', 3)
GO
INSERT [dbo].[operaciones] ([id], [nombre], [idModulo]) VALUES (1008, N'Delete', 3)
GO
INSERT [dbo].[operaciones] ([id], [nombre], [idModulo]) VALUES (1009, N'Details', 3)
GO
INSERT [dbo].[operaciones] ([id], [nombre], [idModulo]) VALUES (1010, N'Edit', 3)
GO
INSERT [dbo].[operaciones] ([id], [nombre], [idModulo]) VALUES (1011, N'Create', 3)
GO
INSERT [dbo].[operaciones] ([id], [nombre], [idModulo]) VALUES (1012, N'Index', 4)
GO
INSERT [dbo].[operaciones] ([id], [nombre], [idModulo]) VALUES (1013, N'Delete', 4)
GO
INSERT [dbo].[operaciones] ([id], [nombre], [idModulo]) VALUES (1014, N'Details', 4)
GO
INSERT [dbo].[operaciones] ([id], [nombre], [idModulo]) VALUES (1015, N'Edit', 4)
GO
INSERT [dbo].[operaciones] ([id], [nombre], [idModulo]) VALUES (1016, N'Create', 4)
GO
INSERT [dbo].[operaciones] ([id], [nombre], [idModulo]) VALUES (1017, N'Index', 5)
GO
INSERT [dbo].[operaciones] ([id], [nombre], [idModulo]) VALUES (1018, N'Delete', 5)
GO
INSERT [dbo].[operaciones] ([id], [nombre], [idModulo]) VALUES (1019, N'Details', 5)
GO
INSERT [dbo].[operaciones] ([id], [nombre], [idModulo]) VALUES (1020, N'Edit', 5)
GO
INSERT [dbo].[operaciones] ([id], [nombre], [idModulo]) VALUES (1021, N'Create', 5)
GO
INSERT [dbo].[operaciones] ([id], [nombre], [idModulo]) VALUES (1022, N'Index', 6)
GO
INSERT [dbo].[operaciones] ([id], [nombre], [idModulo]) VALUES (1023, N'Delete', 6)
GO
INSERT [dbo].[operaciones] ([id], [nombre], [idModulo]) VALUES (1024, N'Details', 6)
GO
INSERT [dbo].[operaciones] ([id], [nombre], [idModulo]) VALUES (1025, N'Edit', 6)
GO
INSERT [dbo].[operaciones] ([id], [nombre], [idModulo]) VALUES (1026, N'Create', 6)
GO
INSERT [dbo].[operaciones] ([id], [nombre], [idModulo]) VALUES (1027, N'Index', 7)
GO
INSERT [dbo].[operaciones] ([id], [nombre], [idModulo]) VALUES (1028, N'Delete', 7)
GO
INSERT [dbo].[operaciones] ([id], [nombre], [idModulo]) VALUES (1029, N'Details', 7)
GO
INSERT [dbo].[operaciones] ([id], [nombre], [idModulo]) VALUES (1030, N'Edit', 7)
GO
INSERT [dbo].[operaciones] ([id], [nombre], [idModulo]) VALUES (1031, N'Create', 7)
GO
INSERT [dbo].[operaciones] ([id], [nombre], [idModulo]) VALUES (1032, N'Index', 8)
GO
INSERT [dbo].[operaciones] ([id], [nombre], [idModulo]) VALUES (1033, N'Delete', 8)
GO
INSERT [dbo].[operaciones] ([id], [nombre], [idModulo]) VALUES (1034, N'Details', 8)
GO
INSERT [dbo].[operaciones] ([id], [nombre], [idModulo]) VALUES (1035, N'Edit', 8)
GO
INSERT [dbo].[operaciones] ([id], [nombre], [idModulo]) VALUES (1036, N'Create', 8)
GO
INSERT [dbo].[operaciones] ([id], [nombre], [idModulo]) VALUES (1037, N'Create2', 3)
GO
INSERT [dbo].[operaciones] ([id], [nombre], [idModulo]) VALUES (1038, N'Create2', 7)
GO
SET IDENTITY_INSERT [dbo].[operaciones] OFF
GO
SET IDENTITY_INSERT [dbo].[Reserva] ON 

GO
INSERT [dbo].[Reserva] ([Id_Reserva], [origen_ciudad], [Destino_ciudad], [Nit_Empresa], [fecha_Reserva], [cantida_tiquetes_Reserva], [total_pagar_Reserva], [Cedula_cliente]) VALUES (2, N'1', N'3', N'801', CAST(N'2019-12-16 00:00:00.000' AS DateTime), N'1', N'25000', N'105389753')
GO
INSERT [dbo].[Reserva] ([Id_Reserva], [origen_ciudad], [Destino_ciudad], [Nit_Empresa], [fecha_Reserva], [cantida_tiquetes_Reserva], [total_pagar_Reserva], [Cedula_cliente]) VALUES (3, N'1', N'2', N'801', CAST(N'2019-12-16 00:00:00.000' AS DateTime), N'2', N'25000', N'10538975378')
GO
INSERT [dbo].[Reserva] ([Id_Reserva], [origen_ciudad], [Destino_ciudad], [Nit_Empresa], [fecha_Reserva], [cantida_tiquetes_Reserva], [total_pagar_Reserva], [Cedula_cliente]) VALUES (4, N'2', N'3', N'801', CAST(N'2019-12-16 00:00:00.000' AS DateTime), N'2', N'50000', N'10539878985')
GO
INSERT [dbo].[Reserva] ([Id_Reserva], [origen_ciudad], [Destino_ciudad], [Nit_Empresa], [fecha_Reserva], [cantida_tiquetes_Reserva], [total_pagar_Reserva], [Cedula_cliente]) VALUES (5, N'1', N'2', N'801', CAST(N'2019-12-17 00:00:00.000' AS DateTime), N'2', N'50000', N'10538789654')
GO
SET IDENTITY_INSERT [dbo].[Reserva] OFF
GO
SET IDENTITY_INSERT [dbo].[rol] ON 

GO
INSERT [dbo].[rol] ([id], [nombre]) VALUES (1, N'administrador ')
GO
INSERT [dbo].[rol] ([id], [nombre]) VALUES (2, N'supervisor')
GO
INSERT [dbo].[rol] ([id], [nombre]) VALUES (3, N'vendedor')
GO
SET IDENTITY_INSERT [dbo].[rol] OFF
GO
SET IDENTITY_INSERT [dbo].[rol_operacion] ON 

GO
INSERT [dbo].[rol_operacion] ([id], [idRol], [idOperacion]) VALUES (1, 1, 2)
GO
INSERT [dbo].[rol_operacion] ([id], [idRol], [idOperacion]) VALUES (2, 1, 3)
GO
INSERT [dbo].[rol_operacion] ([id], [idRol], [idOperacion]) VALUES (3, 1, 4)
GO
INSERT [dbo].[rol_operacion] ([id], [idRol], [idOperacion]) VALUES (4, 1, 5)
GO
INSERT [dbo].[rol_operacion] ([id], [idRol], [idOperacion]) VALUES (5, 1, 6)
GO
INSERT [dbo].[rol_operacion] ([id], [idRol], [idOperacion]) VALUES (6, 1, 7)
GO
INSERT [dbo].[rol_operacion] ([id], [idRol], [idOperacion]) VALUES (8, 1, 8)
GO
INSERT [dbo].[rol_operacion] ([id], [idRol], [idOperacion]) VALUES (9, 1, 9)
GO
INSERT [dbo].[rol_operacion] ([id], [idRol], [idOperacion]) VALUES (10, 1, 10)
GO
INSERT [dbo].[rol_operacion] ([id], [idRol], [idOperacion]) VALUES (11, 1, 11)
GO
INSERT [dbo].[rol_operacion] ([id], [idRol], [idOperacion]) VALUES (12, 1, 1007)
GO
INSERT [dbo].[rol_operacion] ([id], [idRol], [idOperacion]) VALUES (13, 1, 1008)
GO
INSERT [dbo].[rol_operacion] ([id], [idRol], [idOperacion]) VALUES (14, 1, 1009)
GO
INSERT [dbo].[rol_operacion] ([id], [idRol], [idOperacion]) VALUES (15, 1, 1010)
GO
INSERT [dbo].[rol_operacion] ([id], [idRol], [idOperacion]) VALUES (16, 1, 1011)
GO
INSERT [dbo].[rol_operacion] ([id], [idRol], [idOperacion]) VALUES (17, 1, 1012)
GO
INSERT [dbo].[rol_operacion] ([id], [idRol], [idOperacion]) VALUES (18, 1, 1013)
GO
INSERT [dbo].[rol_operacion] ([id], [idRol], [idOperacion]) VALUES (19, 1, 1014)
GO
INSERT [dbo].[rol_operacion] ([id], [idRol], [idOperacion]) VALUES (20, 1, 1015)
GO
INSERT [dbo].[rol_operacion] ([id], [idRol], [idOperacion]) VALUES (21, 1, 1016)
GO
INSERT [dbo].[rol_operacion] ([id], [idRol], [idOperacion]) VALUES (22, 1, 1017)
GO
INSERT [dbo].[rol_operacion] ([id], [idRol], [idOperacion]) VALUES (23, 1, 1018)
GO
INSERT [dbo].[rol_operacion] ([id], [idRol], [idOperacion]) VALUES (24, 1, 1019)
GO
INSERT [dbo].[rol_operacion] ([id], [idRol], [idOperacion]) VALUES (25, 1, 1020)
GO
INSERT [dbo].[rol_operacion] ([id], [idRol], [idOperacion]) VALUES (27, 1, 1021)
GO
INSERT [dbo].[rol_operacion] ([id], [idRol], [idOperacion]) VALUES (28, 1, 1022)
GO
INSERT [dbo].[rol_operacion] ([id], [idRol], [idOperacion]) VALUES (29, 1, 1023)
GO
INSERT [dbo].[rol_operacion] ([id], [idRol], [idOperacion]) VALUES (30, 1, 1024)
GO
INSERT [dbo].[rol_operacion] ([id], [idRol], [idOperacion]) VALUES (31, 1, 1025)
GO
INSERT [dbo].[rol_operacion] ([id], [idRol], [idOperacion]) VALUES (32, 1, 1026)
GO
INSERT [dbo].[rol_operacion] ([id], [idRol], [idOperacion]) VALUES (33, 1, 1027)
GO
INSERT [dbo].[rol_operacion] ([id], [idRol], [idOperacion]) VALUES (34, 1, 1028)
GO
INSERT [dbo].[rol_operacion] ([id], [idRol], [idOperacion]) VALUES (35, 1, 1029)
GO
INSERT [dbo].[rol_operacion] ([id], [idRol], [idOperacion]) VALUES (36, 1, 1030)
GO
INSERT [dbo].[rol_operacion] ([id], [idRol], [idOperacion]) VALUES (37, 1, 1031)
GO
INSERT [dbo].[rol_operacion] ([id], [idRol], [idOperacion]) VALUES (38, 1, 1032)
GO
INSERT [dbo].[rol_operacion] ([id], [idRol], [idOperacion]) VALUES (39, 1, 1033)
GO
INSERT [dbo].[rol_operacion] ([id], [idRol], [idOperacion]) VALUES (40, 1, 1034)
GO
INSERT [dbo].[rol_operacion] ([id], [idRol], [idOperacion]) VALUES (41, 1, 1035)
GO
INSERT [dbo].[rol_operacion] ([id], [idRol], [idOperacion]) VALUES (42, 1, 1036)
GO
INSERT [dbo].[rol_operacion] ([id], [idRol], [idOperacion]) VALUES (43, 1, 1037)
GO
INSERT [dbo].[rol_operacion] ([id], [idRol], [idOperacion]) VALUES (44, 2, 2)
GO
INSERT [dbo].[rol_operacion] ([id], [idRol], [idOperacion]) VALUES (45, 2, 4)
GO
INSERT [dbo].[rol_operacion] ([id], [idRol], [idOperacion]) VALUES (46, 2, 6)
GO
INSERT [dbo].[rol_operacion] ([id], [idRol], [idOperacion]) VALUES (47, 2, 7)
GO
INSERT [dbo].[rol_operacion] ([id], [idRol], [idOperacion]) VALUES (48, 2, 1007)
GO
INSERT [dbo].[rol_operacion] ([id], [idRol], [idOperacion]) VALUES (49, 2, 1011)
GO
INSERT [dbo].[rol_operacion] ([id], [idRol], [idOperacion]) VALUES (50, 2, 1012)
GO
INSERT [dbo].[rol_operacion] ([id], [idRol], [idOperacion]) VALUES (51, 2, 1013)
GO
INSERT [dbo].[rol_operacion] ([id], [idRol], [idOperacion]) VALUES (52, 2, 1014)
GO
INSERT [dbo].[rol_operacion] ([id], [idRol], [idOperacion]) VALUES (53, 2, 1015)
GO
INSERT [dbo].[rol_operacion] ([id], [idRol], [idOperacion]) VALUES (54, 2, 1016)
GO
INSERT [dbo].[rol_operacion] ([id], [idRol], [idOperacion]) VALUES (55, 2, 1017)
GO
INSERT [dbo].[rol_operacion] ([id], [idRol], [idOperacion]) VALUES (56, 2, 1022)
GO
INSERT [dbo].[rol_operacion] ([id], [idRol], [idOperacion]) VALUES (57, 2, 1024)
GO
INSERT [dbo].[rol_operacion] ([id], [idRol], [idOperacion]) VALUES (58, 2, 1027)
GO
INSERT [dbo].[rol_operacion] ([id], [idRol], [idOperacion]) VALUES (59, 2, 1028)
GO
INSERT [dbo].[rol_operacion] ([id], [idRol], [idOperacion]) VALUES (60, 2, 1029)
GO
INSERT [dbo].[rol_operacion] ([id], [idRol], [idOperacion]) VALUES (61, 2, 1030)
GO
INSERT [dbo].[rol_operacion] ([id], [idRol], [idOperacion]) VALUES (62, 2, 1031)
GO
INSERT [dbo].[rol_operacion] ([id], [idRol], [idOperacion]) VALUES (63, 2, 1032)
GO
INSERT [dbo].[rol_operacion] ([id], [idRol], [idOperacion]) VALUES (64, 2, 1034)
GO
INSERT [dbo].[rol_operacion] ([id], [idRol], [idOperacion]) VALUES (65, 2, 1035)
GO
INSERT [dbo].[rol_operacion] ([id], [idRol], [idOperacion]) VALUES (66, 2, 1036)
GO
INSERT [dbo].[rol_operacion] ([id], [idRol], [idOperacion]) VALUES (67, 2, 1037)
GO
INSERT [dbo].[rol_operacion] ([id], [idRol], [idOperacion]) VALUES (68, 2, 1038)
GO
INSERT [dbo].[rol_operacion] ([id], [idRol], [idOperacion]) VALUES (69, 3, 2)
GO
INSERT [dbo].[rol_operacion] ([id], [idRol], [idOperacion]) VALUES (70, 3, 4)
GO
INSERT [dbo].[rol_operacion] ([id], [idRol], [idOperacion]) VALUES (71, 3, 1007)
GO
INSERT [dbo].[rol_operacion] ([id], [idRol], [idOperacion]) VALUES (72, 3, 1009)
GO
INSERT [dbo].[rol_operacion] ([id], [idRol], [idOperacion]) VALUES (73, 3, 1010)
GO
INSERT [dbo].[rol_operacion] ([id], [idRol], [idOperacion]) VALUES (74, 3, 1011)
GO
INSERT [dbo].[rol_operacion] ([id], [idRol], [idOperacion]) VALUES (75, 3, 1012)
GO
INSERT [dbo].[rol_operacion] ([id], [idRol], [idOperacion]) VALUES (76, 3, 1014)
GO
INSERT [dbo].[rol_operacion] ([id], [idRol], [idOperacion]) VALUES (77, 3, 1027)
GO
INSERT [dbo].[rol_operacion] ([id], [idRol], [idOperacion]) VALUES (78, 3, 1028)
GO
INSERT [dbo].[rol_operacion] ([id], [idRol], [idOperacion]) VALUES (79, 3, 1029)
GO
INSERT [dbo].[rol_operacion] ([id], [idRol], [idOperacion]) VALUES (80, 3, 1030)
GO
INSERT [dbo].[rol_operacion] ([id], [idRol], [idOperacion]) VALUES (81, 3, 1031)
GO
INSERT [dbo].[rol_operacion] ([id], [idRol], [idOperacion]) VALUES (82, 3, 1032)
GO
INSERT [dbo].[rol_operacion] ([id], [idRol], [idOperacion]) VALUES (83, 3, 1033)
GO
INSERT [dbo].[rol_operacion] ([id], [idRol], [idOperacion]) VALUES (84, 3, 1034)
GO
INSERT [dbo].[rol_operacion] ([id], [idRol], [idOperacion]) VALUES (85, 3, 1035)
GO
INSERT [dbo].[rol_operacion] ([id], [idRol], [idOperacion]) VALUES (86, 3, 1036)
GO
INSERT [dbo].[rol_operacion] ([id], [idRol], [idOperacion]) VALUES (87, 3, 1037)
GO
INSERT [dbo].[rol_operacion] ([id], [idRol], [idOperacion]) VALUES (88, 3, 1038)
GO
INSERT [dbo].[rol_operacion] ([id], [idRol], [idOperacion]) VALUES (89, 1, 1038)
GO
SET IDENTITY_INSERT [dbo].[rol_operacion] OFF
GO
SET IDENTITY_INSERT [dbo].[Tiquete] ON 

GO
INSERT [dbo].[Tiquete] ([Codigo_factura], [origen_ciudad], [Documento_Conductor], [Placa_bus], [Cedula_Cliente], [Nit_Empresa], [fecha_factura], [cantida_tiquetes], [total_pagar_Tiquete], [id_Empleado], [Destino_ciudad]) VALUES (7, N'1', N'10538567854', N'stp123', N'1053775378', N'801', CAST(N'2019-12-12 00:00:00.000' AS DateTime), N'2', N'50000', 1, N'2')
GO
SET IDENTITY_INSERT [dbo].[Tiquete] OFF
GO
ALTER TABLE [dbo].[Bus]  WITH CHECK ADD  CONSTRAINT [FK_Bus_Conductor] FOREIGN KEY([Documento_Conductor])
REFERENCES [dbo].[Conductor] ([Documento_Conductor])
GO
ALTER TABLE [dbo].[Bus] CHECK CONSTRAINT [FK_Bus_Conductor]
GO
ALTER TABLE [dbo].[Conductor]  WITH CHECK ADD  CONSTRAINT [FK_Conductor_Empresa] FOREIGN KEY([Nit_Empresa])
REFERENCES [dbo].[Empresa] ([Nit_Empresa])
GO
ALTER TABLE [dbo].[Conductor] CHECK CONSTRAINT [FK_Conductor_Empresa]
GO
ALTER TABLE [dbo].[Empleado]  WITH CHECK ADD  CONSTRAINT [FK_Empleado_Empresa] FOREIGN KEY([Nit_Empresa])
REFERENCES [dbo].[Empresa] ([Nit_Empresa])
GO
ALTER TABLE [dbo].[Empleado] CHECK CONSTRAINT [FK_Empleado_Empresa]
GO
ALTER TABLE [dbo].[Empleado]  WITH CHECK ADD  CONSTRAINT [FK_usuario_rol] FOREIGN KEY([idRol_Empleado])
REFERENCES [dbo].[rol] ([id])
GO
ALTER TABLE [dbo].[Empleado] CHECK CONSTRAINT [FK_usuario_rol]
GO
ALTER TABLE [dbo].[operaciones]  WITH CHECK ADD  CONSTRAINT [FK_operaciones_modulo] FOREIGN KEY([idModulo])
REFERENCES [dbo].[modulo] ([id])
GO
ALTER TABLE [dbo].[operaciones] CHECK CONSTRAINT [FK_operaciones_modulo]
GO
ALTER TABLE [dbo].[Reserva]  WITH CHECK ADD  CONSTRAINT [FK_Reserva_Ciudad] FOREIGN KEY([origen_ciudad])
REFERENCES [dbo].[Ciudad] ([Codigo_ciudad])
GO
ALTER TABLE [dbo].[Reserva] CHECK CONSTRAINT [FK_Reserva_Ciudad]
GO
ALTER TABLE [dbo].[Reserva]  WITH CHECK ADD  CONSTRAINT [FK_Reserva_Ciudad1] FOREIGN KEY([Destino_ciudad])
REFERENCES [dbo].[Ciudad] ([Codigo_ciudad])
GO
ALTER TABLE [dbo].[Reserva] CHECK CONSTRAINT [FK_Reserva_Ciudad1]
GO
ALTER TABLE [dbo].[Reserva]  WITH CHECK ADD  CONSTRAINT [FK_Reserva_Cliente] FOREIGN KEY([Cedula_cliente])
REFERENCES [dbo].[Cliente] ([Cedula_Cliente])
GO
ALTER TABLE [dbo].[Reserva] CHECK CONSTRAINT [FK_Reserva_Cliente]
GO
ALTER TABLE [dbo].[Reserva]  WITH CHECK ADD  CONSTRAINT [FK_Reserva_Empresa] FOREIGN KEY([Nit_Empresa])
REFERENCES [dbo].[Empresa] ([Nit_Empresa])
GO
ALTER TABLE [dbo].[Reserva] CHECK CONSTRAINT [FK_Reserva_Empresa]
GO
ALTER TABLE [dbo].[rol_operacion]  WITH CHECK ADD  CONSTRAINT [FK_rol_operacion_operaciones] FOREIGN KEY([idOperacion])
REFERENCES [dbo].[operaciones] ([id])
GO
ALTER TABLE [dbo].[rol_operacion] CHECK CONSTRAINT [FK_rol_operacion_operaciones]
GO
ALTER TABLE [dbo].[rol_operacion]  WITH CHECK ADD  CONSTRAINT [FK_rol_operacion_rol] FOREIGN KEY([idRol])
REFERENCES [dbo].[rol] ([id])
GO
ALTER TABLE [dbo].[rol_operacion] CHECK CONSTRAINT [FK_rol_operacion_rol]
GO
ALTER TABLE [dbo].[Tiquete]  WITH CHECK ADD  CONSTRAINT [FK_Factura_Conductor] FOREIGN KEY([Documento_Conductor])
REFERENCES [dbo].[Conductor] ([Documento_Conductor])
GO
ALTER TABLE [dbo].[Tiquete] CHECK CONSTRAINT [FK_Factura_Conductor]
GO
ALTER TABLE [dbo].[Tiquete]  WITH CHECK ADD  CONSTRAINT [FK_Factura_Empleado] FOREIGN KEY([id_Empleado])
REFERENCES [dbo].[Empleado] ([id_Empleado])
GO
ALTER TABLE [dbo].[Tiquete] CHECK CONSTRAINT [FK_Factura_Empleado]
GO
ALTER TABLE [dbo].[Tiquete]  WITH CHECK ADD  CONSTRAINT [FK_Factura_Empresa] FOREIGN KEY([Nit_Empresa])
REFERENCES [dbo].[Empresa] ([Nit_Empresa])
GO
ALTER TABLE [dbo].[Tiquete] CHECK CONSTRAINT [FK_Factura_Empresa]
GO
ALTER TABLE [dbo].[Tiquete]  WITH CHECK ADD  CONSTRAINT [FK_Tiquete_Bus] FOREIGN KEY([Placa_bus])
REFERENCES [dbo].[Bus] ([Placa_bus])
GO
ALTER TABLE [dbo].[Tiquete] CHECK CONSTRAINT [FK_Tiquete_Bus]
GO
ALTER TABLE [dbo].[Tiquete]  WITH CHECK ADD  CONSTRAINT [FK_Tiquete_Ciudad] FOREIGN KEY([Destino_ciudad])
REFERENCES [dbo].[Ciudad] ([Codigo_ciudad])
GO
ALTER TABLE [dbo].[Tiquete] CHECK CONSTRAINT [FK_Tiquete_Ciudad]
GO
ALTER TABLE [dbo].[Tiquete]  WITH CHECK ADD  CONSTRAINT [FK_Tiquete_Ciudad1] FOREIGN KEY([origen_ciudad])
REFERENCES [dbo].[Ciudad] ([Codigo_ciudad])
GO
ALTER TABLE [dbo].[Tiquete] CHECK CONSTRAINT [FK_Tiquete_Ciudad1]
GO
ALTER TABLE [dbo].[Tiquete]  WITH CHECK ADD  CONSTRAINT [FK_Tiquete_Cliente] FOREIGN KEY([Cedula_Cliente])
REFERENCES [dbo].[Cliente] ([Cedula_Cliente])
GO
ALTER TABLE [dbo].[Tiquete] CHECK CONSTRAINT [FK_Tiquete_Cliente]
GO
USE [master]
GO
ALTER DATABASE [MiSistema] SET  READ_WRITE 
GO

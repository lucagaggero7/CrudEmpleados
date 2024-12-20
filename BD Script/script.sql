USE [CrudEmpleados]
GO
/****** Object:  Table [dbo].[Empleados]    Script Date: 26/11/2024 03:01:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Empleados](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](25) NULL,
	[Apellido] [varchar](25) NULL,
	[CorreoElectronico] [varchar](40) NULL,
	[Salario] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO



USE [Reto]
GO
/****** Object:  Table [dbo].[USUARIO]    Script Date: 17/01/2024 15:40:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[USUARIO](
	[IdUsuario] [int] IDENTITY(1,1) NOT NULL,
	[DocumentoIdentidad] [varchar](60) NULL,
	[Nombres] [varchar](60) NULL,
	[Telefono] [varchar](60) NULL,
	[Correo] [varchar](60) NULL,
	[Ciudad] [varchar](60) NULL,
	[FechaRegistro] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[USUARIO] ON 

INSERT [dbo].[USUARIO] ([IdUsuario], [DocumentoIdentidad], [Nombres], [Telefono], [Correo], [Ciudad], [FechaRegistro]) VALUES (1, N'23480629', N'Marco Antonio', N'987687665', N'mcandiaaa@gmail.com', N'Apurimac', CAST(N'2024-01-17T15:18:17.193' AS DateTime))
INSERT [dbo].[USUARIO] ([IdUsuario], [DocumentoIdentidad], [Nombres], [Telefono], [Correo], [Ciudad], [FechaRegistro]) VALUES (2, N'48609913', N'Marco candia', N'444777444', N'mcandiaq@gmail.com', N'Lima', CAST(N'2024-01-17T15:19:18.547' AS DateTime))
INSERT [dbo].[USUARIO] ([IdUsuario], [DocumentoIdentidad], [Nombres], [Telefono], [Correo], [Ciudad], [FechaRegistro]) VALUES (3, N'48609913', N'Jesus Perez', N'375809876', N'Jesus@gmail.com', N'Cuzco', CAST(N'2024-01-17T15:20:45.983' AS DateTime))
INSERT [dbo].[USUARIO] ([IdUsuario], [DocumentoIdentidad], [Nombres], [Telefono], [Correo], [Ciudad], [FechaRegistro]) VALUES (4, N'23456789', N'Marios Mendoza', N'987687665', N'marios@gmail.com', N'Ayacucho', CAST(N'2024-01-17T15:21:41.940' AS DateTime))
SET IDENTITY_INSERT [dbo].[USUARIO] OFF
GO
ALTER TABLE [dbo].[USUARIO] ADD  DEFAULT (getdate()) FOR [FechaRegistro]
GO
/****** Object:  StoredProcedure [dbo].[usp_eliminar]    Script Date: 17/01/2024 15:40:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[usp_eliminar](
@idusuario int
)
as
begin

delete from usuario where IdUsuario = @idusuario

end

GO
/****** Object:  StoredProcedure [dbo].[usp_listar]    Script Date: 17/01/2024 15:40:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[usp_listar]
as
begin

select * from usuario
end


GO
/****** Object:  StoredProcedure [dbo].[usp_modificar]    Script Date: 17/01/2024 15:40:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[usp_modificar](
@idusuario int,
@documentoidentidad varchar(60),
@nombres varchar(60),
@telefono varchar(60),
@correo varchar(60),
@ciudad varchar(60)
)
as
begin

update USUARIO set 
DocumentoIdentidad = @documentoidentidad,
Nombres = @nombres,
Telefono = @telefono,
Correo = @correo,
Ciudad = @ciudad
where IdUsuario = @idusuario

end

GO
/****** Object:  StoredProcedure [dbo].[usp_obtener]    Script Date: 17/01/2024 15:40:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[usp_obtener](@idusuario int)
as
begin

select * from usuario where IdUsuario = @idusuario
end

GO
/****** Object:  StoredProcedure [dbo].[usp_registrar]    Script Date: 17/01/2024 15:40:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--************************ PROCEDIMIENTOS PARA CREAR ************************--
create procedure [dbo].[usp_registrar](
@documentoidentidad varchar(60),
@nombres varchar(60),
@telefono varchar(60),
@correo varchar(60),
@ciudad varchar(60)
)
as
begin

insert into USUARIO(DocumentoIdentidad,Nombres,Telefono,Correo,Ciudad)
values
(
@documentoidentidad,
@nombres,
@telefono,
@correo,
@ciudad
)

end


GO

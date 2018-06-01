CREATE DATABASE bussiness
GO
USE bussiness
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_flowXml](
	[WFID] [varchar](50) NOT NULL,
	[NAME] [varchar](50) NULL,
	[XML] [text] NULL,
	[IMAGE] [text] NULL,
 CONSTRAINT [PK_t_flowXml] PRIMARY KEY CLUSTERED 
(
	[WFID] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_umr](
	[RID] [bigint] NULL,
	[UUID] [bigint] NULL
) ON [PRIMARY]

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_config](
	[ID] [bigint] NOT NULL,
	[Name] [varchar](50) NULL,
	[Connection] [varchar](512) NULL,
	[DbCategory] [varchar](50) NULL,
 CONSTRAINT [PK_t_config] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'连接字符串' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N't_config', @level2type=N'COLUMN', @level2name=N'Connection'

GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'数据库类型' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N't_config', @level2type=N'COLUMN', @level2name=N'DbCategory'

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_pending](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[ACTORID] [bigint] NULL,
	[NODEID] [varchar](50) NULL,
	[INSTANCEID] [varchar](50) NULL,
	[NAME] [varchar](1024) NULL,
	[CREATEDATETIME] [datetime] NULL CONSTRAINT [DF_t_pending_CREATEDATETIME]  DEFAULT (getdate()),
	[ACTION] [varchar](50) NULL,
 CONSTRAINT [PK_t_pending] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_user](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[USERNAME] [varchar](50) NULL,
	[USERPWD] [varchar](50) NULL,
	[EMPLOYEENAME] [varchar](50) NULL,
	[ORGCODE] [varchar](50) NULL,
	[ORGNAME] [varchar](50) NULL,
 CONSTRAINT [PK_t_user] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_role](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[NAME] [varchar](50) NULL,
 CONSTRAINT [PK_T_ROLE] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_org](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[Code] [varchar](50) NULL,
	[ParentCode] [varchar](50) NULL,
	[Description] [varchar](50) NULL,
 CONSTRAINT [PK_t_org] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_record](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[NODENAME] [varchar](512) NULL,
	[MESSAGE] [varchar](1024) NULL,
	[INSTANCEID] [varchar](50) NULL,
	[INSERTDATE] [datetime] NULL CONSTRAINT [DF_t_record_INSERTDATE]  DEFAULT (getdate()),
 CONSTRAINT [PK_t_record] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_apply](
	[AUTOID] [bigint] IDENTITY(1,1) NOT NULL,
	[NAME] [varchar](50) NULL,
	[DESCRIPTION] [varchar](1024) NULL,
	[STATUS] [int] NULL,
	[WFID] [varchar](50) NULL,
	[INSTANCEID] [varchar](50) NULL,
	[INSERTDATE] [datetime] NULL CONSTRAINT [DF_t_apply_INSERTDATE]  DEFAULT (getdate()),
	[SECRETGRADE] [varchar](50) NULL,
 CONSTRAINT [PK_t_apply] PRIMARY KEY CLUSTERED 
(
	[AUTOID] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]


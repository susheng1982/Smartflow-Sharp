CREATE DATABASE flow
GO
USE flow
GO
/****** 对象:  Table [dbo].[t_node]    脚本日期: 06/01/2018 21:16:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_node](
	[NID] [varchar](50) NOT NULL,
	[ID] [bigint] NOT NULL,
	[NAME] [varchar](50) NULL,
	[NODETYPE] [varchar](50) NULL,
	[INSTANCEID] [varchar](50) NULL,
 CONSTRAINT [PK_t_node] PRIMARY KEY CLUSTERED 
(
	[NID] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** 对象:  Table [dbo].[t_process]    脚本日期: 06/01/2018 21:16:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_process](
	[NID] [varchar](50) NOT NULL,
	[SOURCE] [bigint] NULL,
	[DESTINATION] [bigint] NULL,
	[TRANSITIONID] [varchar](50) NULL,
	[INSTANCEID] [varchar](50) NULL,
	[NODETYPE] [varchar](50) NULL,
	[CREATEDATETIME] [datetime] NULL CONSTRAINT [DF_t_process_INSERTDATE]  DEFAULT (getdate()),
	[RNID] [varchar](50) NULL,
	[ACTION] [varchar](50) NULL CONSTRAINT [DF_t_process_OPERATE]  DEFAULT ('normal'),
 CONSTRAINT [PK_t_process] PRIMARY KEY CLUSTERED 
(
	[NID] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** 对象:  Table [dbo].[t_transition]    脚本日期: 06/01/2018 21:16:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_transition](
	[NID] [varchar](50) NOT NULL,
	[RNID] [varchar](50) NULL,
	[NAME] [varchar](128) NULL,
	[DESTINATION] [bigint] NULL,
	[SOURCE] [bigint] NULL,
	[INSTANCEID] [varchar](50) NULL,
	[EXPRESSION] [varchar](50) NULL,
 CONSTRAINT [PK_t_transition_1] PRIMARY KEY CLUSTERED 
(
	[NID] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** 对象:  Table [dbo].[t_instance]    脚本日期: 06/01/2018 21:16:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_instance](
	[INSTANCEID] [varchar](50) NOT NULL,
	[CREATEDATETIME] [datetime] NULL CONSTRAINT [DF_t_instance_CreateDateTime]  DEFAULT (getdate()),
	[RNID] [bigint] NULL,
	[FLOWID] [varchar](50) NULL,
	[STATE] [varchar](50) NULL CONSTRAINT [DF_t_instance_STATUS]  DEFAULT ('running'),
	[IMAGE] [text] NULL,
 CONSTRAINT [PK_t_instance] PRIMARY KEY CLUSTERED 
(
	[INSTANCEID] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'流程状态（运行中：running、结束：end、终止：termination,kill:杀死流程）' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N't_instance', @level2type=N'COLUMN', @level2name=N'STATE'

GO
/****** 对象:  Table [dbo].[t_group]    脚本日期: 06/01/2018 21:16:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_group](
	[NID] [varchar](50) NOT NULL,
	[RNID] [varchar](50) NULL,
	[ID] [bigint] NULL,
	[NAME] [varchar](50) NULL,
	[INSTANCEID] [varchar](50) NULL,
 CONSTRAINT [PK_t_role] PRIMARY KEY CLUSTERED 
(
	[NID] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** 对象:  Table [dbo].[t_command]    脚本日期: 06/01/2018 21:16:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_command](
	[NID] [varchar](50) NOT NULL,
	[RNID] [varchar](50) NULL,
	[NAME] [varchar](50) NULL,
	[Text] [varchar](4000) NULL,
	[CONNECTION] [varchar](512) NULL,
	[DBCATEGORY] [varchar](50) NULL,
	[INSTANCEID] [varchar](50) NULL,
	[COMMANDTYPE] [varchar](50) NULL,
 CONSTRAINT [PK_t_command] PRIMARY KEY CLUSTERED 
(
	[NID] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'文本' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N't_command', @level2type=N'COLUMN', @level2name=N'Text'

GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'连接字符串' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N't_command', @level2type=N'COLUMN', @level2name=N'CONNECTION'

GO
/****** 对象:  Table [dbo].[t_actor]    脚本日期: 06/01/2018 21:16:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_actor](
	[NID] [varchar](50) NOT NULL,
	[RNID] [varchar](50) NULL,
	[ID] [bigint] NULL,
	[NAME] [varchar](50) NULL,
	[INSTANCEID] [varchar](50) NULL,
	[CREATEDATETIME] [datetime] NULL CONSTRAINT [DF_t_actor_INSERTDATE]  DEFAULT (getdate()),
	[ACTION] [varchar](50) NULL,
 CONSTRAINT [PK_t_actor] PRIMARY KEY CLUSTERED 
(
	[NID] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]


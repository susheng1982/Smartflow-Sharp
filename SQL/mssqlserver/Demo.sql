CREATE DATABASE Demo
GO
USE [Demo]
GO
/****** Object:  UserDefinedFunction [dbo].[FN_GetOrganizationName]    Script Date: 2020-09-26 21:10:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE FUNCTION [dbo].[FN_GetOrganizationName]
(	
	-- Add the parameters for the function here
	 @OrganizationCode varchar(50)
)
RETURNS varchar(50)  
AS
BEGIN


    DECLARE @result varchar(50)
	select  @result=[Name] from  [dbo].[t_sys_organization] where ID=@OrganizationCode
   
    RETURN @result

END
GO
/****** Object:  UserDefinedFunction [dbo].[FN_GetOrganizationNameByID]    Script Date: 2020-09-26 21:10:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE FUNCTION [dbo].[FN_GetOrganizationNameByID]
(	
	-- Add the parameters for the function here
	 @UID varchar(50)
)
RETURNS varchar(50)  
AS
BEGIN


    DECLARE @result varchar(50)
	select  @result=[dbo].[FN_GetOrganizationName](OrganizationCode) from  [dbo].[t_sys_user] where ID=@UID
   
    RETURN @result

END
GO
/****** Object:  UserDefinedFunction [dbo].[GetOrganizationName]    Script Date: 2020-09-26 21:10:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


create function [dbo].[GetOrganizationName](@Code varchar(50)) 
returns varchar(1024)
as
begin
declare @Names varchar(1024)
select @Names=[Name] from [dbo].[t_sys_organization]  where ID=@Code

return @Names
end
GO
/****** Object:  Table [dbo].[t_sys_organization]    Script Date: 2020-09-26 21:10:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_sys_organization](
	[ID] [varchar](50) NOT NULL,
	[ParentID] [varchar](50) NULL,
	[Name] [varchar](50) NULL,
	[Memo] [text] NULL,
 CONSTRAINT [PK_t_sys_organization] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[t_sys_rmm]    Script Date: 2020-09-26 21:10:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_sys_rmm](
	[ID] [varchar](50) NOT NULL,
	[RID] [varchar](50) NULL,
	[MID] [varchar](50) NULL,
 CONSTRAINT [PK_t_sys_rmm] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[t_sys_role]    Script Date: 2020-09-26 21:10:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_sys_role](
	[ID] [varchar](50) NOT NULL,
	[Name] [varchar](50) NULL,
	[Memo] [text] NULL,
	[Type] [int] NULL,
	[CreateTime] [datetime] NULL,
 CONSTRAINT [PK_t_sys_role] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[t_sys_umr]    Script Date: 2020-09-26 21:10:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_sys_umr](
	[ID] [varchar](50) NOT NULL,
	[RID] [varchar](50) NULL,
	[UID] [varchar](50) NULL,
 CONSTRAINT [PK_t_sys_umr] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[t_sys_user]    Script Date: 2020-09-26 21:10:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_sys_user](
	[ID] [varchar](50) NOT NULL,
	[UID] [varchar](50) NULL,
	[Password] [varchar](50) NULL,
	[No] [varchar](50) NULL,
	[Name] [varchar](50) NULL,
	[OrganizationCode] [varchar](50) NULL,
	[Type] [int] NULL,
	[Status] [int] NULL,
	[Error] [int] NULL,
	[CreateTime] [datetime] NULL,
	[LatestTime] [datetime] NULL,
	[Force] [int] NULL,
	[Memo] [text] NULL,
 CONSTRAINT [PK_t_sys_user] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[t_vacation]    Script Date: 2020-09-26 21:10:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_vacation](
	[NID] [varchar](50) NOT NULL,
	[Name] [varchar](50) NULL,
	[Day] [int] NULL,
	[Reason] [text] NULL,
	[CreateTime] [datetime] NULL,
	[VacationType] [varchar](50) NULL,
	[UID] [varchar](50) NULL,
 CONSTRAINT [PK_t_vacation] PRIMARY KEY CLUSTERED 
(
	[NID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[t_sys_rmm] ADD  CONSTRAINT [DF_t_sys_rmm_ID]  DEFAULT (newid()) FOR [ID]
GO
ALTER TABLE [dbo].[t_sys_rmm] ADD  CONSTRAINT [DF_t_sys_rmm_MID]  DEFAULT (newid()) FOR [MID]
GO
ALTER TABLE [dbo].[t_sys_role] ADD  CONSTRAINT [DF_t_sys_role_ID]  DEFAULT (newid()) FOR [ID]
GO
ALTER TABLE [dbo].[t_sys_role] ADD  CONSTRAINT [DF_t_sys_role_Type]  DEFAULT ((0)) FOR [Type]
GO
ALTER TABLE [dbo].[t_sys_role] ADD  CONSTRAINT [DF_t_sys_role_CreateTime]  DEFAULT (getdate()) FOR [CreateTime]
GO
ALTER TABLE [dbo].[t_sys_umr] ADD  CONSTRAINT [DF_t_sys_umr_ID]  DEFAULT (newid()) FOR [ID]
GO
ALTER TABLE [dbo].[t_sys_user] ADD  CONSTRAINT [DF_t_sys_user_ID]  DEFAULT (newid()) FOR [ID]
GO
ALTER TABLE [dbo].[t_sys_user] ADD  CONSTRAINT [DF_t_sys_user_Type]  DEFAULT ((0)) FOR [Type]
GO
ALTER TABLE [dbo].[t_sys_user] ADD  CONSTRAINT [DF_t_sys_user_Status]  DEFAULT ((0)) FOR [Status]
GO
ALTER TABLE [dbo].[t_sys_user] ADD  CONSTRAINT [DF_t_sys_user_Error]  DEFAULT ((0)) FOR [Error]
GO
ALTER TABLE [dbo].[t_sys_user] ADD  CONSTRAINT [DF_t_sys_user_CreateDateTime]  DEFAULT (getdate()) FOR [CreateTime]
GO
ALTER TABLE [dbo].[t_sys_user] ADD  CONSTRAINT [DF_t_sys_user_LatestTime]  DEFAULT (getdate()) FOR [LatestTime]
GO
ALTER TABLE [dbo].[t_sys_user] ADD  CONSTRAINT [DF_t_sys_user_Force]  DEFAULT ((0)) FOR [Force]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'0:普通 1：系统生成' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N't_sys_role', @level2type=N'COLUMN',@level2name=N'Type'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户类型（1:管理员 0：普通用）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N't_sys_user', @level2type=N'COLUMN',@level2name=N'Type'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户状态（0：正常 1：禁用  2：删除）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N't_sys_user', @level2type=N'COLUMN',@level2name=N'Status'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'错误记数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N't_sys_user', @level2type=N'COLUMN',@level2name=N'Error'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N't_sys_user', @level2type=N'COLUMN',@level2name=N'CreateTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'最新登录时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N't_sys_user', @level2type=N'COLUMN',@level2name=N'LatestTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'强制修改密码 0:不强制修改密码 1：强制修改密码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N't_sys_user', @level2type=N'COLUMN',@level2name=N'Force'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'申请时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N't_vacation', @level2type=N'COLUMN',@level2name=N'CreateTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'请假类型（事假、病假、产假）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N't_vacation', @level2type=N'COLUMN',@level2name=N'VacationType'
GO

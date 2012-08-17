/****** Object:  Table [dbo].[Actions]    Script Date: 8/16/2012 4:38:34 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[Actions](
	[PatientId] [int] NOT NULL,
	[ActionId] [int] IDENTITY(1,1) NOT NULL,
	[ActionPending] [bit] NULL,
	[ActionDateText] [varchar](50) NULL,
	[ActionDate] [datetime] NULL,
	[ActionItem] [varchar](50) NOT NULL,
	[ActionNotes] [varchar](1000) NULL,
	[EnteredBy] [varchar](50) NOT NULL,
	[EnteredTime] [datetime] NOT NULL,
	[UpdatedBy] [varchar](50) NULL,
	[UpdatedTime] [datetime] NULL,
	[LockedBy] [varchar](50) NULL,
	[LockedTime] [datetime] NULL,
 CONSTRAINT [PK_Actions] PRIMARY KEY CLUSTERED 
(
	[ActionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[Actions] ADD  CONSTRAINT [DF_Actions_ActionPending]  DEFAULT ((0)) FOR [ActionPending]
GO



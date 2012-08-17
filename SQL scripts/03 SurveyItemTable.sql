/****** Object:  Table [dbo].[SurveyItems]    Script Date: 8/16/2012 4:40:36 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[SurveyItems](
	[SurveyId] [int] NOT NULL,
	[SurveyItemId] [int] IDENTITY(1,1) NOT NULL,
	[SurveyItemNum] [varchar](50) NULL,
	[SurveyItem] [varchar](1000) NULL,
	[SurveyItemResult] [varchar](255) NULL,
	[SurveyItemTotal] [varchar](50) NULL,
	[SurveyItemNotes] [varchar](1000) NULL,
	[EnteredBy] [varchar](50) NOT NULL,
	[EnteredTime] [datetime] NOT NULL,
	[UpdatedBy] [varchar](50) NULL,
	[UpdatedTime] [datetime] NULL,
 CONSTRAINT [PK_SurveyItems] PRIMARY KEY CLUSTERED 
(
	[SurveyItemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[SurveyItems]  WITH NOCHECK ADD  CONSTRAINT [FK_SurveyItems_Surveys] FOREIGN KEY([SurveyId])
REFERENCES [dbo].[Surveys] ([SurveyId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[SurveyItems] CHECK CONSTRAINT [FK_SurveyItems_Surveys]
GO



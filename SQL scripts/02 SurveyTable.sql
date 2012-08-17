/****** Object:  Table [dbo].[Surveys]    Script Date: 8/16/2012 4:40:06 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[Surveys](
	[PatientId] [int] NOT NULL,
	[SurveyId] [int] IDENTITY(1,1) NOT NULL,
	[SurveyDateText] [varchar](50) NULL,
	[SurveyDate] [datetime] NULL,
	[SurveyType] [varchar](255) NULL,
	[SurveyResult] [varchar](50) NULL,
	[SurveyTotal] [varchar](50) NULL,
	[SurveyVersion] [varchar](50) NULL,
	[SurveyNotes] [varchar](1000) NULL,
	[SurveyDataSource] [varchar](100) NULL,
	[SurveyQuality] [varchar](50) NULL,
	[EnteredBy] [varchar](50) NOT NULL,
	[EnteredTime] [datetime] NOT NULL,
	[UpdatedBy] [varchar](50) NULL,
	[UpdatedTime] [datetime] NULL,
	[LockedBy] [varchar](50) NULL,
	[LockedTime] [datetime] NULL,
	[SurveyAccessCode] [varchar](50) NULL,
 CONSTRAINT [PK_Surveys] PRIMARY KEY CLUSTERED 
(
	[SurveyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[Surveys]  WITH CHECK ADD  CONSTRAINT [FK_Surveys_Patients] FOREIGN KEY([PatientId])
REFERENCES [dbo].[Patients] ([PatientId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[Surveys] CHECK CONSTRAINT [FK_Surveys_Patients]
GO



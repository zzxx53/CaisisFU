/****** Object:  Table [dbo].[MetadataSurveys]    Script Date: 8/16/2012 4:41:05 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[MetadataSurveys](
	[MetadataSurveyId] [int] IDENTITY(1,1) NOT NULL,
	[SurveyType] [varchar](255) NOT NULL,
	[SurveyCategory] [varchar](50) NULL,
	[SendCondition] [varchar](50) NULL,
	[SendFrequency] [varchar](255) NULL,
	[SurveyPrintableFileName] [varchar](50) NULL,
	[VersionNumber] [varchar](50) NULL,
	[EnteredBy] [varchar](50) NOT NULL,
	[EnteredTime] [datetime] NOT NULL,
	[UpdatedBy] [varchar](50) NULL,
	[UpdatedTime] [datetime] NULL,
 CONSTRAINT [PK_MetadataSurveys] PRIMARY KEY CLUSTERED 
(
	[MetadataSurveyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO



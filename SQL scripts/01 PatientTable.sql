/****** Object:  Table [dbo].[Patients]    Script Date: 8/16/2012 4:39:37 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[Patients](
	[PtMRN] [varchar](50) NULL,
	[PatientId] [int] IDENTITY(1,1) NOT NULL,
	[PtTitle] [varchar](50) NULL,
	[PtFirstName] [varchar](50) NULL,
	[PtMiddleName] [varchar](50) NULL,
	[PtLastName] [varchar](50) NULL,
	[PtSuffix] [varchar](50) NULL,
	[PtAlias] [varchar](50) NULL,
	[PtMaidenName] [varchar](50) NULL,
	[PtGender] [varchar](50) NULL,
	[PtCompany] [varchar](50) NULL,
	[PtBusinessCity] [varchar](50) NULL,
	[PtBusinessState] [varchar](50) NULL,
	[PtAddress1] [varchar](100) NULL,
	[PtAddress2] [varchar](100) NULL,
	[PtCity] [varchar](50) NULL,
	[PtState] [varchar](50) NULL,
	[PtPostalCode] [varchar](50) NULL,
	[PtCountry] [varchar](50) NULL,
	[PtEmail] [varchar](50) NULL,
	[PtBirthDateText] [varchar](50) NULL,
	[PtBirthDate] [datetime] NULL,
	[PtBirthPlace] [varchar](100) NULL,
	[PtDeathDateText] [varchar](50) NULL,
	[PtDeathDate] [datetime] NULL,
	[PtDeathType] [varchar](50) NULL,
	[PtDeathCause] [varchar](255) NULL,
	[PtContactPerson] [varchar](50) NULL,
	[PtContactAddress1] [varchar](100) NULL,
	[PtContactAddress2] [varchar](100) NULL,
	[PtContactCity] [varchar](50) NULL,
	[PtContactState] [varchar](50) NULL,
	[PtContactPostalCode] [varchar](50) NULL,
	[PtContactPhone] [varchar](50) NULL,
	[PtSpouse] [varchar](50) NULL,
	[PtRace] [varchar](50) NULL,
	[PtEthnicity] [varchar](50) NULL,
	[PtLanguage] [varchar](50) NULL,
	[PtContactStatus] [varchar](50) NULL,
	[PtContactPreference] [varchar](50) NULL,
	[PtNotes] [varchar](1000) NULL,
	[EnteredBy] [varchar](50) NOT NULL,
	[EnteredTime] [datetime] NOT NULL,
	[UpdatedBy] [varchar](50) NULL,
	[UpdatedTime] [datetime] NULL,
	[LockedBy] [varchar](50) NULL,
	[LockedTime] [datetime] NULL,
 CONSTRAINT [PK_Patients] PRIMARY KEY CLUSTERED 
(
	[PatientId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO



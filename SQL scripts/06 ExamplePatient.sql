/****** Object:  Table [dbo].[Patients]    Script Date: 8/16/2012 3:40:00 PM ******/
INSERT INTO [dbo].[Patients]
           ([PtMRN]
           ,[PtTitle]
           ,[PtFirstName]
           ,[PtLastName]
           ,[PtEmail]
           ,[PtContactStatus]
           ,[PtContactPreference]
           ,[EnteredBy]
           ,[EnteredTime])
     VALUES
           ('Patient1'
           ,'Mr.'
           ,'Patient'
           ,'Example'
           ,'example@example.com'
           ,'Current'
           ,'Email'
           ,'admin'
           ,'2012-08-16 15:40:00');
INSERT INTO [dbo].[MetadataSurveys]
           ([SurveyType]
           ,[SurveyCategory]
           ,[EnteredBy]
           ,[EnteredTime])
     VALUES
           ('ExampleSurvey1'
           ,'ExampleCategory1'
           ,'admin'
           ,'2012-8-16 15:40:00');




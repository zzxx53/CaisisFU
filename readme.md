#Introduction

This web system was developed by Lifan Zhang (lzhan65 # emory.edu) in Jul-Aug 2012 as a prototype for data linkage between a separate Patient Data Management System (PDMS) and survey system. For more on motivation of the project, please read “about.htm”. Also, see this video: http://www.youtube.com/watch?v=mzeQV5Jir64 for a screencast demonstration of the website. 

This repository only holds the PDMS side of the program, and it needs both the PDMS and the survey component to work. The survey component can be downloaded at http://github.com/zzxx53/surveyor . It is a customized version of Surveyor (http://github.com/NUBIC/surveyor/).

This website uses the same database schema and programming language (C#) as Caisis (http://www.caisis.org). Due to time limitations, I wasn’t able to combine this project into the existing Caisis survey module (http://www.caisis.org/wiki/index.php?title=Followup). This is a project that I will leave for the future. 

For those who wish to build on this project, the Visio Studio project file is also available in the root directory.  

#Description of modules

After deployment of the website, the users should go to the home page (“Default.aspx”), which lists all the patients in the system. The users could then click on the “details” link next to each patient, which should lead them to the patient details view (“details.aspx”). Here they can view past actions on this patient and surveys assigned to the patient. They can also assign new surveys. Once they do that, a new page appears (“addsurvey.aspx”) that generates the survey link to be sent by email to the patient. The survey identifier contained in the link is also written to database. 

After the patient completes the survey, the users can go to the “Collect Surveys” page (collect.aspx), which lists all surveys that have not been collected to the PDMS. The PDMS checks with Surveyor server to see if the survey has been completed by the patient through JSON, and if it has, the option appears to fetch the responses via JSON into the PDMS (fetch.aspx). After the fetching, the responses can be viewed (“view.aspx”) from the link in patient details view. 



#Installation Guide
0. Download project files as ZIP and extract all files. 
1. Expand WebApplication2.zip so that the "WebApplication2" folder inside the archive is on the same level as other files. 
2. Install Microsoft SQL server and IIS (express editions are fine). For more details, see relevant information in Caisis Wiki: http://caisis.org/wiki/index.php?title=Installation
3. Use SQL Server Management Studio to create a new database, and then open the sql files in the “SQL scripts” folder and execute them to create database schema. Note: the order in which these scripts are executed matters. 
4. Create an application in IIS, and point the “physical path” to “WebApplication2” directory. 
5. Modify Web.Config file under “WebApplication2” directory. Change "dbConnectionString" to point to the database you just created with correct login information. Modify "SurveyorPath" and "JsonPath" to point to the actual Surveyor server paths. 
6. Add more patients and surveys to the “patients” and “metadatasurveys” table in the database, as needed.

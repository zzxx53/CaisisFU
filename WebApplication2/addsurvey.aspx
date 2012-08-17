<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="addsurvey.aspx.cs" Inherits="WebApplication2.AddSurvey" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
     <title>Caisis FU - Assign New Survey</title>
     <link href="default.css" type="text/css" rel="stylesheet" />
</head>
<body>
    <!-- #include virtual ="menu.htm" -->
    <div id="content">
    <h4>Please send the following message to the following email address: </h4>
    <a href="<%= email %>"><%= email %></a>
    <br />
    <textarea rows="30" cols="50">
Dear <%= name %>, 
    
    I certainly hope that this letter finds you well. It has been a while since your surgery for cancer, and I am interested in hearing about your state of health since our last contact. If you could complete the following questionnaire and return it to us in the enclosed, postage-paid envelope, I would be very grateful.
    Please go to the following link to take the survey, "<%= surveyname %>"
    <%= url %>

Sincerely, 
FHCRC Cancer Follow-up Team
    </textarea> 
    <br />
<a href="details.aspx?id=<%= id %>">Back to Details Page</a>
    </div>
</body>
</html>

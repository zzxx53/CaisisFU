<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="fetch.aspx.cs" Inherits="WebApplication2.fetch" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Fetch Surveys from Surveyor</title>
    <link href="default.css" type="text/css" rel="stylesheet" />
</head>
<body>
    <!-- #include virtual ="menu.htm" -->
    <div id="content">
    <h4><%= result %></h4>
    <a href="collect.aspx"><< Return to uncollected surveys</a>
    </div>
</body>
</html>

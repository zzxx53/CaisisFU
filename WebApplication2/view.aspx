<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="view.aspx.cs" Inherits="WebApplication2.view" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Survey Result Viewer</title>
    <link href="default.css" type="text/css" rel="stylesheet" />
</head>
<body>
    <!-- #include virtual ="menu.htm" -->
    <div id="content">
    <h3>Survey Results</h3>
    <h4>MRN: <%= ptmrn %></h4>
    <h4>Completed at: <%= date %></h4>
    <asp:Repeater ID="Repeater1" runat="server">
    <HeaderTemplate>
    <table id="box-table-a">
    <tr>
    <th></th>
    <th>Question Text</th>
    <th>Response</th>
    </tr>
    </HeaderTemplate>
    <ItemTemplate>
    <tr>
    <td><%#DataBinder.Eval(Container, "DataItem.SurveyItemNum")%></td>
    <td><%#DataBinder.Eval(Container, "DataItem.SurveyItem")%></td>
    <td><%#DataBinder.Eval(Container, "DataItem.SurveyItemResult") %></td>
    </tr>
    </ItemTemplate>
    <FooterTemplate>
    </table>
    </FooterTemplate>

    </asp:Repeater>
    <a href="details.aspx?id=<%= id %>"><< Return to patient details</a>
    </div>
</body>
</html>

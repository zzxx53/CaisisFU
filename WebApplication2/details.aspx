<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="details.aspx.cs" Inherits="WebApplication2.WebForm1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
   <title>Caisis FU - Patient Details</title>
<link href="default.css" type="text/css" rel="stylesheet" />
</head>
<body>
    <!-- #include virtual ="menu.htm" -->
    <div id="content">
	 <h2>Patient Details</h2>
	<h4>Former Actions on this Patient</h4>
    <asp:Repeater ID="Repeater1" runat="server">
    <HeaderTemplate>
    <table id="box-table-a">
    <tr>
    <th>Date</th>
    <th>Action</th>
    <th>Entered Time</th>
    </tr>
    </HeaderTemplate>
    <ItemTemplate>
    <tr>
    <td><%#DataBinder.Eval(Container, "DataItem.ActionDate").ToString().Substring(0,10)%></td>
    <td><%#DataBinder.Eval(Container, "DataItem.ActionItem")%></td>
    <td><%#DataBinder.Eval(Container, "DataItem.EnteredTime").ToString().Substring(10) %></td>
    </tr>
    </ItemTemplate>
    <FooterTemplate>
    </table>
    </FooterTemplate>
    </asp:Repeater>
    
    <h4>Surveys Assigned to this Patient</h4>
    <asp:Repeater ID="Repeater2" runat="server">
    <HeaderTemplate>
    <table id="box-table-a">
    <tr>
    <th>Date</th>
    <th>Survey Name</th>
    <th>Access Code</th>
    <th>Completed?</th>
    <th></th>
    </tr>
    </HeaderTemplate>
    <ItemTemplate>
    <tr>
    <td><%#DataBinder.Eval(Container, "DataItem.date").ToString().Substring(0,10)%></td>
    <td><%#DataBinder.Eval(Container, "DataItem.surveyname")%></td>
    <td><%#DataBinder.Eval(Container, "DataItem.accesscode")%></td>
    <td><%#DataBinder.Eval(Container, "DataItem.completed")%></td>
    <td><%#DataBinder.Eval(Container, "DataItem.view")%></td>
    </tr>
    </ItemTemplate>
    <FooterTemplate>
    </table>
    </FooterTemplate>
    </asp:Repeater>
    <h4>Assign A New Survey</h4>
    <form action="addsurvey.aspx?id=<%=id %>" method="post">
    <asp:Repeater ID="Repeater3" runat="server">
    <HeaderTemplate>
    <select name="surveyname">
    </HeaderTemplate>
    <ItemTemplate>
    <option><%# Container.DataItem %></option>
    </ItemTemplate>
    <FooterTemplate>
    </select>
    </FooterTemplate>
    </asp:Repeater>
    <input type="submit" value="Submit" />
    </form>
    </div>
</body>
</html>

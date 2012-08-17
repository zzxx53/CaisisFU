<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="collect.aspx.cs" Inherits="WebApplication2.collect" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Collect Assigned Surveys</title>
<link href="default.css" type="text/css" rel="stylesheet" />
</head>
<body>
     <!-- #include virtual ="menu.htm" -->
     <div id="content">
	 <h2>Uncollected Surveys</h2>
	 <asp:Repeater ID="Repeater1" runat="server">
    <HeaderTemplate>
    <table id="box-table-a">
    <tr>
    <th>Date Assigned</th>
    <th>MRN</th>
    <th>Survey Type</th>
    <th>Access Code</th>
    <th>Status</th>
    <th></th>
    </tr>
    </HeaderTemplate>
    <ItemTemplate>
    <tr>
    <td><%#DataBinder.Eval(Container, "DataItem.date")%></td>
    <td><%#DataBinder.Eval(Container, "DataItem.ptmrn")%></td>
    <td><%#DataBinder.Eval(Container, "DataItem.type") %></td>
    <td><%#DataBinder.Eval(Container, "DataItem.accesscode") %></td>
    <td><%#DataBinder.Eval(Container, "DataItem.status") %></td>
    <td><%#DataBinder.Eval(Container, "DataItem.collect") %></td>
    </tr>
    </ItemTemplate>
    <FooterTemplate>
    </table>
    </FooterTemplate>
    </asp:Repeater>
	 </div>
</body>
</html>

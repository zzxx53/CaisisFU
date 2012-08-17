<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="CaisisFU._Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Caisis FU - Patient List</title>
<link href="default.css" type="text/css" rel="stylesheet" />
</head>
<body>
    <!-- #include virtual ="menu.htm" -->
    <div id="content">
	 <h2>Patient List</h2>
	
    <asp:Repeater ID="Repeater1" runat="server">
    <HeaderTemplate>
    <table id="box-table-a">
    <tr>
    <th>MRN</th>
    <th>Title</th>
    <th>Name</th>
    <th>Email</th>
    <th>Status</th>
    <th>Preference</th>
    <th></th>
    <th></th>
    </tr>
    </HeaderTemplate>
    <ItemTemplate>
    <tr>
    <td><%#DataBinder.Eval(Container, "DataItem.PtMRN")%></td>
    <td><%#DataBinder.Eval(Container, "DataItem.PtTitle")%></td>
    <td><%#DataBinder.Eval(Container, "DataItem.PtFirstName") + " " + DataBinder.Eval(Container, "DataItem.PtLastName")%></td>
    <td><%#DataBinder.Eval(Container, "DataItem.PtEmail")%></td>
    <td><%#DataBinder.Eval(Container, "DataItem.PtContactStatus")%></td>
    <td><%#DataBinder.Eval(Container, "DataItem.PtContactPreference")%></td>
    <td><a href="details.aspx?id=<%#DataBinder.Eval(Container, "DataItem.PatientId")%>">Details</a></td>
    <td></td>
    </tr>
    </ItemTemplate>
    <FooterTemplate>
    </table>
    </FooterTemplate>

    </asp:Repeater>
    </div>
   
</body>
</html>

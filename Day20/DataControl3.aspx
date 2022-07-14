<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DataControl3.aspx.cs" Inherits="Day20.DataControl3" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        </div>
        <asp:GridView ID="GridEmployee" runat="server" AllowPaging="True" OnPageIndexChanging="GridView1_PageIndexChanging">
        </asp:GridView>
    </form>
</body>
</html>

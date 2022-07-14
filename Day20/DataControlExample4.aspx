<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DataControlExample4.aspx.cs" Inherits="Day20.DataControlExample4" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table>
                <tr>
                    <td>
                        <lable>Select Department</lable>
                        <asp:DropDownList ID="DdlDepartment" runat="server"></asp:DropDownList>
                        <asp:Button ID="BtnSearch" runat="server" Text="Button" OnClick="BtnSearch_Click" />
                    </td>
                </tr>
            </table>
            <asp:GridView ID="GridDepartment" runat="server"></asp:GridView>
        </div>
    </form>
</body>
</html>

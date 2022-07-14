<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DataControlExample2.aspx.cs" Inherits="Day20.DataControlExample2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        table,tr,td{
            padding:5px;
        }
        .font14{
            font-family:Verdana, Geneva, Tahoma, sans-serif;
            font-size:14px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table>
                <tr>
                    <td>
                        <label class="font14">Select a city</label>
                        <asp:DropDownList CssClass="font14" ID="DdlCity" runat="server"></asp:DropDownList>
                        <asp:Button CssClass="font14"  ID="BtnGetData" runat="server" Text="Get Data" OnClick="BtnGetData_Click" />
                    </td>
                </tr>
            </table>
            <asp:GridView ID="GridEmployee" runat="server"></asp:GridView>
        </div>
    </form>
</body>
</html>

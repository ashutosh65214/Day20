<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DataControlExample5.aspx.cs" Inherits="Day20.DataControlExample5" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table>
                <asp:GridView AutoGenerateColumns="false" ID="GridDisplay" runat="server">
                     <Columns>
                    <asp:TemplateField HeaderText="Employee Code">
                        <ItemTemplate>
                            <asp:Label Text='<%#Eval("cEmployeeCode") %>' ID="lblEmpCode" runat="server" />
                        </ItemTemplate>
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText="First Name">
                        <ItemTemplate>
                            <asp:Label Text='<%#Eval("vFirstName") %>' ID="lblFirstName" runat="server" />
                        </ItemTemplate>
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText="City">
                        <ItemTemplate>
                            <asp:Label Text='<%#Eval("cCity") %>' ID="lblCity" runat="server" />
                        </ItemTemplate>
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText="Department Name">
                        <ItemTemplate>
                            <asp:Label Text='<%#Eval("vDepartmentName") %>' ID="lblDepartmentName" runat="server" />
                        </ItemTemplate>
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText="Position Code">
                        <ItemTemplate>
                            <asp:Label Text='<%#Eval("cPositionCode") %>' ID="lblPositionCode" runat="server" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                </asp:GridView>
            </table>
        </div>
    </form>
</body>
</html>

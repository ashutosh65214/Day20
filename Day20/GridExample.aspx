<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GridExample.aspx.cs" Inherits="Day20.GridExample" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        </div>
        <asp:GridView ID="GridPosition" runat="server" AutoGenerateColumns="False" DataKeyNames="cPositionCode" DataSourceID="SqlDataSource1" AllowSorting="True">
            <Columns>
                <asp:BoundField DataField="cPositionCode" HeaderText="Position Code" ReadOnly="True" SortExpression="cPositionCode" />
                <asp:BoundField DataField="vDescription" HeaderText="Description" SortExpression="vDescription" />
                <asp:BoundField DataField="iBudgetedStrength" HeaderText="Budgeted Strength"  />
                <asp:BoundField DataField="siYear" HeaderText="Year" />
                <asp:BoundField DataField="iCurrentStrength" HeaderText="CurrentStrength"  />
                <asp:CommandField ShowEditButton="True" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:HRConnectionString %>" SelectCommand="SELECT * FROM [Position]" UpdateCommand="Update Position SET siYear=@siYear where cPositionCode=@cPositionCode">
            <UpdateParameters>
                <asp:Parameter Name="siYear" />
                <asp:Parameter Name="PositionCode" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </form>
</body>
</html>

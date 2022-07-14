<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DataControlExample.aspx.cs" Inherits="Day20.DataControlExample" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        </div>
        <asp:GridView ID="DataGridView" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="Book_code" DataSourceID="SqlDataSource2" PageSize="5">
            <Columns>
                <asp:BoundField DataField="Book_code" HeaderText="Book_code" ReadOnly="True" SortExpression="Book_code" />
                <asp:BoundField DataField="Book_name" HeaderText="Book_name" SortExpression="Book_name" />
                <asp:BoundField DataField="pub_year" HeaderText="pub_year" />
                <asp:BoundField DataField="Author" HeaderText="Author" />
                <asp:BoundField DataField="book_category" HeaderText="book_category" />
                <asp:CommandField ShowEditButton="True" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:TrainingConnectionString %>" SelectCommand="SELECT * FROM [Book_Master]" UpdateCommand="Update Book_Master SET Book_name=@Book_name where Book_code=@Book_code">
            <UpdateParameters>
                <asp:Parameter Name="Book_name" />
                <asp:Parameter Name="Book_code" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </form>
</body>
</html>

<%@ Page Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="FrmValidationExample.aspx.cs" Inherits="Day20.FrmValidationExample" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="head">
     <style>
        .d1 {
            margin: auto;
            border: 1px solid;
            margin-top: 20px;
            border-radius: 20px;
            width: 30%;
        }

        table, tr {
            padding: 20px;
        }

        td {
            padding-top: 10px;
        }
    </style>


</asp:Content>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="Content">
     <div class="d1">
            <table>
                <tr>
                    <td colspan="2">
                        <asp:ValidationSummary ForeColor="Red" ID="ValidationSummary1" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <label>Name</label>
                    </td>
                    <td>
                        <asp:TextBox ID="TxtFirstName" runat="server" />
                        <asp:RequiredFieldValidator Text="*" ID="RfvFirstName" runat="server" ErrorMessage="Please enter first name" ControlToValidate="TxtFirstName" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label>Gender</label>
                    </td>
                    <td>
                        <asp:DropDownList ID="DdlGender" runat="server">
                            <asp:ListItem Value="-1">--Please select--</asp:ListItem>
                            <asp:ListItem Value="M">Male</asp:ListItem>
                            <asp:ListItem Value="F">Female</asp:ListItem>
                            <asp:ListItem Value="O">Others</asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator Display="Dynamic" ID="RfvGender" Text="*" ForeColor="Red" ErrorMessage="Please select a gender" InitialValue="-1" ControlToValidate="DdlGender" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <label>Email Id</label>
                    </td>
                    <td>
                        <asp:TextBox ID="TxtEmailId" runat="server" />
                        <asp:RequiredFieldValidator Display="Dynamic" ID="RfvEmailId" Text="*" ForeColor="Red" ErrorMessage="Email Id is required" ControlToValidate="TxtEmailId" runat="server" />
                        <asp:RegularExpressionValidator Display="Dynamic" ForeColor="Red" Text="*" ErrorMessage="Please enter valid email id" ID="RevEmailId" ControlToValidate="TxtEmailId" runat="server" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <label>Password</label>
                    </td>
                    <td>
                        <asp:TextBox ID="TxtPassword" TextMode="Password" runat="server" />
                        <asp:RequiredFieldValidator ID="RfvPassword" Text="*" ForeColor="Red" ErrorMessage="Password is required" ControlToValidate="TxtPassword" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <label>Confirm Password</label>
                    </td>
                    <td>
                        <asp:TextBox TextMode="Password" ID="TxtConfirmPassword" runat="server" />
                        <asp:CompareValidator ID="CvPassword" Text="*" ErrorMessage="Password and Confirm Password doesn't match" ControlToValidate="TxtConfirmPassword" ControlToCompare="TxtPassword" ForeColor="Red" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <label>Salary</label>
                    </td>
                    <td>
                        <asp:TextBox ID="TxtSalary" runat="server" />
                        <asp:RequiredFieldValidator ID="RfvSalary" Text="*" ForeColor="Red" ErrorMessage="Salary is required" ControlToValidate="TxtSalary" runat="server" />
                        <asp:RangeValidator ID="rvSalary" Text="*" ErrorMessage="Salary should be between 10000 and 100000" ControlToValidate="TxtSalary" runat="server" ForeColor="Red" MaximumValue="100000" MinimumValue="10000" Type="Double" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <label>Preferred Location</label>
                    </td>
                    <td>
                        <asp:CheckBoxList ID="ChkListLocation" runat="server" RepeatColumns="2">
                            <asp:ListItem Text="Mumbai" />
                            <asp:ListItem Text="Chennai" />
                            <asp:ListItem Text="Bengaluru" />
                            <asp:ListItem Text="Pune" />
                            <asp:ListItem Text="Trivandrum" />
                            <asp:ListItem Text="Hyderabad" />
                        </asp:CheckBoxList>
                        <asp:CustomValidator OnServerValidate="cvLocation_ServerValidate" ErrorMessage="Please select more than 1 location" ID="cvLocation" Text="*" ForeColor="Red" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Button Text="Save" ID="BtnSave" runat="server" OnClick="BtnSave_Click" />
                    </td>
                    <td>
                        <asp:Button Text="Reset" ID="BtnReset" runat="server" CausesValidation="False" OnClick="BtnReset_Click" />
                    </td>
                </tr>
            </table>
        </div>

</asp:Content>



<%--<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
   <title>Validation Controls</title>
    <style>
        .d1 {
            margin: auto;
            border: 1px solid;
            margin-top: 20px;
            border-radius: 20px;
            width: 30%;
        }

        table, tr {
            padding: 20px;
        }

        td {
            padding-top: 10px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
         <div class="d1">
            <table>
                <tr>
                    <td colspan="2">
                        <asp:ValidationSummary ForeColor="Red" ID="ValidationSummary1" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <label>Name</label>
                    </td>
                    <td>
                        <asp:TextBox ID="TxtFirstName" runat="server" />
                        <asp:RequiredFieldValidator Text="*" ID="RfvFirstName" runat="server" ErrorMessage="Please enter first name" ControlToValidate="TxtFirstName" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label>Gender</label>
                    </td>
                    <td>
                        <asp:DropDownList ID="DdlGender" runat="server">
                            <asp:ListItem Value="-1">--Please select--</asp:ListItem>
                            <asp:ListItem Value="M">Male</asp:ListItem>
                            <asp:ListItem Value="F">Female</asp:ListItem>
                            <asp:ListItem Value="O">Others</asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator Display="Dynamic" ID="RfvGender" Text="*" ForeColor="Red" ErrorMessage="Please select a gender" InitialValue="-1" ControlToValidate="DdlGender" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <label>Email Id</label>
                    </td>
                    <td>
                        <asp:TextBox ID="TxtEmailId" runat="server" />
                        <asp:RequiredFieldValidator Display="Dynamic" ID="RfvEmailId" Text="*" ForeColor="Red" ErrorMessage="Email Id is required" ControlToValidate="TxtEmailId" runat="server" />
                        <asp:RegularExpressionValidator Display="Dynamic" ForeColor="Red" Text="*" ErrorMessage="Please enter valid email id" ID="RevEmailId" ControlToValidate="TxtEmailId" runat="server" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <label>Password</label>
                    </td>
                    <td>
                        <asp:TextBox ID="TxtPassword" TextMode="Password" runat="server" />
                        <asp:RequiredFieldValidator ID="RfvPassword" Text="*" ForeColor="Red" ErrorMessage="Password is required" ControlToValidate="TxtPassword" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <label>Confirm Password</label>
                    </td>
                    <td>
                        <asp:TextBox TextMode="Password" ID="TxtConfirmPassword" runat="server" />
                        <asp:CompareValidator ID="CvPassword" Text="*" ErrorMessage="Password and Confirm Password doesn't match" ControlToValidate="TxtConfirmPassword" ControlToCompare="TxtPassword" ForeColor="Red" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <label>Salary</label>
                    </td>
                    <td>
                        <asp:TextBox ID="TxtSalary" runat="server" />
                        <asp:RequiredFieldValidator ID="RfvSalary" Text="*" ForeColor="Red" ErrorMessage="Salary is required" ControlToValidate="TxtSalary" runat="server" />
                        <asp:RangeValidator ID="rvSalary" Text="*" ErrorMessage="Salary should be between 10000 and 100000" ControlToValidate="TxtSalary" runat="server" ForeColor="Red" MaximumValue="100000" MinimumValue="10000" Type="Double" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <label>Preferred Location</label>
                    </td>
                    <td>
                        <asp:CheckBoxList ID="ChkListLocation" runat="server" RepeatColumns="2">
                            <asp:ListItem Text="Mumbai" />
                            <asp:ListItem Text="Chennai" />
                            <asp:ListItem Text="Bengaluru" />
                            <asp:ListItem Text="Pune" />
                            <asp:ListItem Text="Trivandrum" />
                            <asp:ListItem Text="Hyderabad" />
                        </asp:CheckBoxList>
                        <asp:CustomValidator OnServerValidate="cvLocation_ServerValidate" ErrorMessage="Please select more than 1 location" ID="cvLocation" Text="*" ForeColor="Red" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Button Text="Save" ID="BtnSave" runat="server" OnClick="BtnSave_Click" />
                    </td>
                    <td>
                        <asp:Button Text="Reset" ID="BtnReset" runat="server" CausesValidation="False" OnClick="BtnReset_Click" />
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>--%>
    

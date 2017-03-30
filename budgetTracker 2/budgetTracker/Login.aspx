<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="budgetTracker.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login Page</title>
    <link rel="stylesheet" type="text/css" href="content/bootstrap.css" />
    <link rel="stylesheet" type="text/css" href="content/custom.css" />
</head>
<body>
    <form id="form1" runat="server">
        <div><h1>Budget Tracker Login</h1></div>
        <div class="container">
            <div class="center">
               <div class="vert">
                <table style="margin-left:auto; margin-right:auto;">
                    <tr>
                        <td><asp:Label ID="userNamelbl"  runat="server" Text="User Name"></asp:Label></td>
                        <td><asp:TextBox ID="userNameBox" class="form-control" runat="server"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td><asp:Label ID="passwordlbl"  runat="server" Text="Password"></asp:Label></td>
                        <td><asp:TextBox ID="passwordBox" class="form-control" runat="server" ></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td colspan="2"><asp:Button ID="Button1" runat="server" class="btn btn-primary btn-space" Text="Login" OnClick="loginButton_Click" /></td>
                    </tr>
                </table>
                   </div>
            </div>
        </div>
    </form>
</body>
</html>

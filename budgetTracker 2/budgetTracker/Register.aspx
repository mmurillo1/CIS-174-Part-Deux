<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="budgetTracker.Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Registration Page</title>
    <link rel="stylesheet" type="text/css" href="content/bootstrap.css" />
    <link rel="stylesheet" type="text/css" href="content/custom.css" />
</head>
<body>
    <form id="form1" runat="server">
      <div class="center"><h1>Budget Tracker Registration</h1></div>
        <div class="container">
            <div class="center">
               <div class="vert">
                <table style="margin-left:auto; margin-right:auto;">
                    <tr>
                        <td><asp:Label ID="userNamelbl"  runat="server" Text="User Name"></asp:Label></td>
                        <td><asp:TextBox ID="rUserNameBox" class="form-control" runat="server"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td><asp:Label ID="emailLbl"  runat="server" Text="Email"></asp:Label></td>
                        <td><asp:TextBox ID="rEmailBox" class="form-control" runat="server" ></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td><asp:Label ID="passwordlbl"  runat="server" Text="Password"></asp:Label></td>
                        <td><asp:TextBox ID="rPasswordBox" class="form-control" runat="server" ></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td><asp:Label ID="confirmPasswordlbl"  runat="server" Text="Confirm Password"></asp:Label></td>
                        <td><asp:TextBox ID="confirmPasswordBox" class="form-control" runat="server" ></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td colspan="2"><asp:Button ID="registerButton" runat="server" class="btn btn-primary btn-space" Text="Register" OnClick="registerButton_Click" /></td>
                    </tr>
                </table>
                   </div>
            </div>
        </div>
    </form>
</body>
</html>

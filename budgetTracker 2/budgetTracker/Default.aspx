<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="budgetTracker.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Budget Tracker</title>
    <link rel="stylesheet" type="text/css" href="content/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="content/custom.css">
    <script src="Scripts/jquery-3.1.1.min.js"></script>
    <script src="Scripts/main.js"></script>
</head>
<div class="container">
    <h1>Budget Tracker</h1>
    <hr />
    <form id="form1" runat="server" class="form-horizontal">
        <!-- Salary Input Fields -->
        <h2>Salary Information</h2>
        <hr />
        <div class="row">
            <div class="form-group">
                <label class="control-label col-sm-2" for="salaryInput">Please input monthly salary: </label>
                <div class="col-sm-10">
                    <asp:TextBox ID="salaryInput" class="form-control" runat="server" ></asp:TextBox>
                </div>
                <div class="text-danger col-sm-offset-2 col-sm-10 error">
                    <asp:RequiredFieldValidator ID="reqSalaryInput" runat="server" ErrorMessage="Please enter a salary amount." 
                                                ControlToValidate="salaryInput" ValidationGroup="salaryGroup"></asp:RequiredFieldValidator>
                    <asp:regularexpressionvalidator ID="regExSalaryInput" ControlToValidate="salaryInput" ValidationGroup="salaryGroup" runat="server" errormessage="Please enter a valid number."
                                                    ValidationExpression="^[ ]*[\-]?[0-9]*[\.]?[0-9]*[ ]*$"></asp:regularexpressionvalidator>
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-10">
                    <asp:Button ID="saveSalaryButton" runat="server" OnClick="saveSalaryButton_Click" 
                                ValidationGroup="salaryGroup" Text="Save salary" CssClass="btn btn-primary" />
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-10">
                    Total Salary Amount: <asp:Label ID="monthlySalaryLabel" runat="server" Text="$0.00"></asp:Label>
                </div>
            </div>
            <asp:hiddenfield id="salaryTotalAmt" runat="server" value="0"></asp:hiddenfield>
            <asp:hiddenfield id="salaryCurrentAmt" runat="server" value="0"></asp:hiddenfield>
        </div>
        <!-- END: Salary Input Fields -->

        <!-- Expense Input Fields -->
        <h2>Expense Information</h2>
        <hr />
        <div class="row">
            <div class="form-group">
                <label class="control-label col-sm-2" for="ddlExpenseCategory">Please select an expense category: </label>
                <div class="col-sm-10">
                    <asp:dropdownlist runat="server" id="ddlExpenseCategory" class="form-control">
                        <asp:ListItem Value="other">Other</asp:ListItem>
                        <asp:ListItem Value="home">Home</asp:ListItem>
                        <asp:ListItem Value="auto">Auto</asp:ListItem>
                        <asp:ListItem Value="entertainment">Entertainment</asp:ListItem>
                        <asp:ListItem Value="food">Food</asp:ListItem>
                    </asp:dropdownlist>
                </div>
                <div class="text-danger col-sm-offset-2 col-sm-10 error">
                    <asp:RequiredFieldValidator ID="reqDdlExpenseCategory" runat="server" ErrorMessage="Please enter a category." 
                                                ControlToValidate="ddlExpenseCategory" ValidationGroup="expenseGroup"></asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-sm-2" for="expenseNameInput">Please input name of monthly expense: </label>
                <div class="col-sm-10">
                    <asp:TextBox ID="expenseNameInput" class="form-control" runat="server"></asp:TextBox>
                </div>
                <div class="text-danger col-sm-offset-2 col-sm-10 error">
                    <asp:RequiredFieldValidator ID="reqExpenseNameInput" runat="server" ErrorMessage="Please enter an expense name." 
                                                ControlToValidate="expenseNameInput" ValidationGroup="expenseGroup"></asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-sm-2" for="expenseAmountInput">Please enter amount of expense: </label>
                <div class="col-sm-10">
                    <asp:TextBox ID="expenseAmountInput" class="form-control" runat="server"></asp:TextBox>
                </div>
                <div class="text-danger col-sm-offset-2 col-sm-10 error">
                    <asp:RequiredFieldValidator ID="reqExpenseAmountInput" runat="server" ErrorMessage="Please enter an expense amount." 
                                                ControlToValidate="expenseAmountInput" ValidationGroup="expenseGroup"></asp:RequiredFieldValidator>
                    <asp:regularexpressionvalidator ID="regExExpenseAmountInput" ControlToValidate="expenseAmountInput" ValidationGroup="expenseGroup" runat="server" errormessage="Please enter a valid number."
                                                    ValidationExpression="^[ ]*[\-]?[0-9]*[\.]?[0-9]*[ ]*$"></asp:regularexpressionvalidator>
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-10">
                    <asp:Button ID="addExpenseButton" runat="server" OnClick="addExpenseButton_Click" 
                                ValidationGroup="expenseGroup" Text="Add Expense" CssClass="btn btn-primary" />
                </div>
            </div>
        </div>
        <!-- END: Expense Input Fields -->

        <!-- Expense Output Result -->
        <table id="tableExpenses" class="table table-hover" runat="server">
            <tbody>
            </tbody>
        </table>
        <!-- END: Expense Output Result -->
    </form>
</div>
</html>

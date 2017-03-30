using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;

namespace budgetTracker
{
    public partial class Default : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["expenseTable"] != null)
            {
                HtmlTable tableExpensesSession = (HtmlTable)Session["expenseTable"];
                int count = tableExpensesSession.Rows.Count; //need to set count to variable, because it changes
                for (int i = 0; i < count; i++)
                {
                    //Removes from session and then adds to acutal table
                    //so index will always be 0, because it gets popped off the top
                    tableExpenses.Rows.Add(tableExpensesSession.Rows[0]); 
                }
            }
        }

        //upon clicking save salary button the number in the text box will be stored in a label
        protected void saveSalaryButton_Click(object sender, EventArgs e)
        {
            decimal salaryToAdd = Decimal.Parse(salaryInput.Text),
                    currentSalary = Decimal.Parse(salaryCurrentAmt.Value),
                    curTotalSalary = Decimal.Parse(salaryTotalAmt.Value),
                    salary = salaryToAdd + currentSalary,
                    salaryTotal = salaryToAdd + curTotalSalary;
            monthlySalaryLabel.Text = salary.ToString("c");
            salaryCurrentAmt.Value = salary.ToString();
            salaryTotalAmt.Value = salaryTotal.ToString();
            salaryInput.Text = String.Empty;
        }

        private void addExpense()
        {
            HtmlTableRow row = new HtmlTableRow();
            HtmlTableCell cell1 = new HtmlTableCell();
            HtmlTableCell cell2 = new HtmlTableCell();
            HtmlTableCell cell3 = new HtmlTableCell();
            HtmlTableCell cell4 = new HtmlTableCell();


            decimal expenseAmount = Decimal.Parse(expenseAmountInput.Text),
                    curTotalSalary = Decimal.Parse(salaryTotalAmt.Value),
                    percentValue = (expenseAmount / curTotalSalary) * 100;
            string category = ddlExpenseCategory.SelectedValue.ToString();

            row.ID = "exp" + (tableExpenses.Rows.Count + 1);
            cell1.InnerText = expenseNameInput.Text;
            row.Cells.Add(cell1);
            cell2.InnerText = expenseAmount.ToString("c");
            row.Cells.Add(cell2);
            cell3.InnerText = category;
            row.Cells.Add(cell3);
            tableExpenses.Rows.Add(row);
            cell4.InnerText = Math.Round(percentValue,2) + "%";
            row.Cells.Add(cell4);
            Session["expenseTable"] = tableExpenses;
        }

        //This function updates the remianing monthly budget
        private void updateRemainingBudget()
        {
            decimal expenseAmount = Decimal.Parse(expenseAmountInput.Text),
                    currentSalary = Decimal.Parse(salaryCurrentAmt.Value),
                    newSalary = currentSalary - expenseAmount;
            monthlySalaryLabel.Text = newSalary.ToString("c");
            salaryCurrentAmt.Value = newSalary.ToString();
            expenseAmountInput.Text = String.Empty;
            expenseNameInput.Text = String.Empty;
        }

        protected void addExpenseButton_Click(object sender, EventArgs e)
        {
            //addExpenseNameLabel();
            //addExpenseAmountLabel();
            addExpense();
            updateRemainingBudget();
        }

        /*//This function adds a new label for every expense
        private void addExpenseNameLabel()
        {
            Label lbl = new Label();
            lbl.ID = "expense" + i.ToString();
            lbl.Text = expenseNameInput.Text;
            this.Controls.Add(lbl);
            expenseNameInput.Text = String.Empty;
            i++;
        }

        //This function adds a new amount label for every expense
        private void addExpenseAmountLabel()
        {
            Label lbl = new Label();
            lbl.ID = "expenseAmount" + j.ToString();
            lbl.Text = "$" + expenseAmountInput.Text;
            this.Controls.Add(lbl);
            j++;
        }*/
    }
}
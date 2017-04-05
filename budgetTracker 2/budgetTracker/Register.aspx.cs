using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

namespace budgetTracker
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                //Creating connection object
                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["UserDataConnectionString"].ConnectionString);
                //Opening connection string
                conn.Open();
                //Creating SQL command and storing it in a variable
                String userExists = "select count(*) from userData where userName='" + rUserNameBox.Text + "'";
                //Creating command object
                SqlCommand com = new SqlCommand(userExists, conn);
                //Converting result to an int to see if user already exists
                int temp = Convert.ToInt32(com.ExecuteScalar().ToString());
                if (temp == 1)
                {
                    Response.Write("Username already exists");
                }
                //Close Connection
                conn.Close();
            }

        }

        protected void registerButton_Click(object sender, EventArgs e)
        {
            try
            {
                //Creating connection object
                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["UserDataConnectionString"].ConnectionString);
                //Opening connection string
                conn.Open();
                //Creating SQL command and storing it in a variable
                String Insertdata = "insert into userData (userName,password,email) values(@userName,@password,@email)";
                //Creating command object
                SqlCommand com = new SqlCommand(Insertdata, conn);
                //Adding data from fields to the database
                com.Parameters.AddWithValue("@userName", rUserNameBox.Text);
                com.Parameters.AddWithValue("@password", rPasswordBox.Text);
                com.Parameters.AddWithValue("@email", rEmailBox.Text);
                com.ExecuteNonQuery();
                Response.Redirect("Login.aspx");
                Response.Write("You have succesfully registered!");
                //Close connection
                conn.Close();
                
            }
            //If there is an error respond "Invalid Data"
            catch (Exception exc)
            {
                Response.Write("Invalid data");
            }

        }
    }
}
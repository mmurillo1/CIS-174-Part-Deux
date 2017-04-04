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
                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["UserDataConnectionString"].ConnectionString);
                conn.Open();
                String userExists = "select count(*) from userData where userName='" + rUserNameBox.Text + "'";
                SqlCommand com = new SqlCommand(userExists, conn);
                int temp = Convert.ToInt32(com.ExecuteScalar().ToString());
                if (temp == 1)
                {
                    Response.Write("Username already exists");
                }
                conn.Close();
            }

        }

        protected void registerButton_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["UserDataConnectionString"].ConnectionString);
                conn.Open();
                String Insertdata = "insert into userData (userName,password,email) values(@userName,@password,@email)";
                SqlCommand com = new SqlCommand(Insertdata, conn);
                com.Parameters.AddWithValue("@userName", rUserNameBox.Text);
                com.Parameters.AddWithValue("@password", rPasswordBox.Text);
                com.Parameters.AddWithValue("@email", rEmailBox.Text);
                com.ExecuteNonQuery();
                Response.Redirect("Login.aspx");
                Response.Write("You have succesfully registered!");
                conn.Close();
                
            }
            catch (Exception exc)
            {
                Response.Write("Invalid data");
            }

        }
    }
}
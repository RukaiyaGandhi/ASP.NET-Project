using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Data.Sql;
public partial class Admin_Default : System.Web.UI.Page
{
    SqlConnection myconn = new SqlConnection(ConfigurationManager.ConnectionStrings["Society_MANAGEMENTConnectionString2"].ConnectionString);
    String Qry;

    protected void Page_Load(object sender, EventArgs e)
    {
        lblmsg.Text = "";
    }
    protected void loginBtn_Click(object sender, EventArgs e)
    {
        myconn.Open();
        Qry = "Select Username,Password From [dbo].[Admin_Login] Where Username='" + txtUser.Text + "'and Password='" + TxtPassword.Text +"';";

        SqlCommand logincheck = new SqlCommand(Qry, myconn);

        SqlDataAdapter DA = new SqlDataAdapter(logincheck);
        DataTable DT = new DataTable();
        DA.Fill(DT);
        if (DT.Rows.Count > 0)
        {
            
            Response.Redirect("Add_Society.aspx");

        }

        else
        {

            lblmsg.Text = "Error!";

        }
        myconn.Close();
    }
}

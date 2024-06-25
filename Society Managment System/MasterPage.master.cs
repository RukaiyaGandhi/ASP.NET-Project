using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;
using System.Data.Sql;
public partial class MasterPage : System.Web.UI.MasterPage
{
    SqlConnection myconn = new SqlConnection(ConfigurationManager.ConnectionStrings["Society_MANAGEMENTConnectionString2"].ConnectionString);
    String Qry;
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void loginBtn_Click(object sender, EventArgs e)
    {
           
        
            myconn.Open();
            Qry = "Select Owner_ID,Username,Password From [dbo].[Owner_details] Where Username='" + txtUsername.Text + "'and Password='" + txtPassword.Text + "';";
    
            SqlCommand logincheck = new SqlCommand(Qry, myconn);
            SqlDataAdapter DA = new SqlDataAdapter(logincheck);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            if (DT.Rows.Count > 0)
            {
                Session["Owner_ID"] = DT.Rows[0]["Owner_ID"].ToString();
                Response.Redirect("MHome.aspx");

            }

            else
            {

                lbllogin.Text = "Error!";

            }
            myconn.Close();

           }
}
    


using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;


public partial class changePassword : System.Web.UI.Page
{
    String Qry;
    SqlConnection myconn = new SqlConnection(ConfigurationManager.ConnectionStrings["Society_MANAGEMENTConnectionString2"].ConnectionString);
    SqlCommand Cmd;
    SqlDataAdapter DA;
    
    DataTable DT;

    protected void Page_Load(object sender, EventArgs e)
    {
            GetTxtPassword();
  
    }
    protected void GetTxtPassword()
    {
        Qry = "Select Username,Password  from Owner_details Where Owner_ID="+Session["Owner_ID"];
        Cmd = new SqlCommand(Qry, myconn);
        myconn.Open();
        DA = new SqlDataAdapter(Cmd);
        DT = new DataTable();
        DA.Fill(DT);

        if(DT.Rows.Count>0)
        {
            txtCurrentPass.Text = DT.Rows[0]["Password"].ToString();
            Session["Username"] = DT.Rows[0]["Username"].ToString();
        }
        myconn.Close();
    }
    protected void ChangePassword()
    {
        if (txtCurrentPass.Text != txtNewPass.Text)
        {
            Qry = "Update Owner_details  Set Password='" + txtConfirm.Text + "' Where Owner_ID=" + Session["Owner_ID"];
            Cmd = new SqlCommand(Qry, myconn);
            myconn.Open();
            Cmd.ExecuteNonQuery();
            lblPass.Text = "Entered updateded";
        }
        else 
        {
            lblPass.Text = "Plz Change Password";
        }
    }
    protected void btnChangePass_Click(object sender, EventArgs e)
    {
        ChangePassword();
    }
}
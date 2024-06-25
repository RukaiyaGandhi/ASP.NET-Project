using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;
public partial class MAccount : System.Web.UI.Page
{
    string Qry;
    SqlConnection myconn = new SqlConnection(ConfigurationManager.ConnectionStrings["Society_MANAGEMENTConnectionString2"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        MyDetails();
    }
    protected void MyDetails()
    {
        if (Session["Owner_ID"] != null)
        {
            Qry = "Select *from [dbo].[Owner_details] where Owner_ID=" + Session["Owner_ID"];
            myconn.Open();
            SqlCommand cmd = new SqlCommand(Qry, myconn);
            SqlDataAdapter DA = new SqlDataAdapter(cmd);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            if (DT.Rows.Count > 0)
            {
                lblfname.Text = DT.Rows[0]["Fname"].ToString();
                lblLName.Text = DT.Rows[0]["Lname"].ToString();
                lblContact.Text = DT.Rows[0]["Contact_No"].ToString();
                lblEmail.Text = DT.Rows[0]["Email_ID"].ToString();
                lblMember.Text = DT.Rows[0]["O_No_Of_FamilyMember"].ToString();
                Session["FName"] = lblfname.Text;
            }
            Qry = "Select SName From SocietyDetails where Society_ID=" + DT.Rows[0]["Society_ID"];
            cmd = new SqlCommand(Qry, myconn);
            DA = new SqlDataAdapter(cmd);
            DT = new DataTable();
            DA.Fill(DT);
            if (DT.Rows.Count > 0)
            {
                lblSName.Text = DT.Rows[0]["SName"].ToString();
                Session["SocietyName"] = lblSName.Text;
            }
        }
        
        
    }

}
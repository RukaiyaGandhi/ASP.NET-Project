using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

public partial class mLSearch : System.Web.UI.Page
{
    String  SocietySel;

    SqlConnection myconn = new SqlConnection(ConfigurationManager.ConnectionStrings["Society_MANAGEMENTConnectionString2"].ConnectionString);

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            bindSociety();
        }
    }
    public void bindSociety()
    {
        SocietySel = "Select Society_ID,SName from [dbo].[SocietyDetails]";
        myconn.Open();
        SqlCommand cmd = new SqlCommand(SocietySel, myconn);
        SqlDataReader DR = cmd.ExecuteReader();
        ddlSociety.DataSource = DR;
        ddlSociety.Items.Clear();
        ddlSociety.Items.Add("Select Society");
        ddlSociety.DataTextField = "SName";
        ddlSociety.DataValueField = "Society_ID";
        ddlSociety.DataBind();
        myconn.Close();

    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;


public partial class MemberMaster : System.Web.UI.MasterPage
{
    String Qry, HouseSel, StateQry, SocietySel, Cityqry;

    SqlConnection myconn = new SqlConnection(ConfigurationManager.ConnectionStrings["Society_MANAGEMENTConnectionString2"].ConnectionString);

    protected void Page_Load(object sender, EventArgs e)
    {
        BindMyGrid();
    }

    protected void BindMyGrid()
    {

        myconn.Open();
        Qry = "Select *from Owner_details Where Owner_ID="+Session["Owner_ID"];
        SqlCommand cmd = new SqlCommand(Qry, myconn);
        SqlDataAdapter DA = new SqlDataAdapter(cmd);
        DataTable DT = new DataTable();

        DA.Fill(DT);
        if (DT.Rows.Count > 0)
        {
            GrxImageOwner.DataSource = DT;
            GrxImageOwner.DataBind();
            myconn.Close();

        }
        

    }
}

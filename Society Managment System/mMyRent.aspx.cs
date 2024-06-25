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
public partial class mMyRent : System.Web.UI.Page
{
    String Qry, Society;
    SqlCommand cmd;
    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Society_MANAGEMENTConnectionString2"].ConnectionString);

    protected void Page_Load(object sender, EventArgs e)
    {
        lblBlockNo.Text=Session["House_No"].ToString();
        lblSname.Text = Session["SocietyName"].ToString();
        lblType.Text = Session["House_Type"].ToString();
        BindMyGrid();
    }
    protected void BindMyGrid()
    {
        conn.Open();
        Qry = "Select *from Rent_Details where Owner_ID=" +Session["Owner_ID"];
        SqlCommand cmd = new SqlCommand(Qry, conn);
        SqlDataAdapter DA = new SqlDataAdapter(cmd);
        DataTable DT = new DataTable();
        DA.Fill(DT);
        if (DT.Rows.Count > 0)
        {
            Gridview1.Visible = true;
            lbl.Text = "";
            lblRent.Text = DT.Rows[0]["House_Rent"].ToString();
            Gridview1.DataSource = DT;
            Gridview1.DataBind();

        }
        else
        {
            lbl.Text = "No Rent List ";
            Gridview1.Visible = false;
        }
        conn.Close();
    }

}
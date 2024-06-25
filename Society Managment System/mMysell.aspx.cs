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
public partial class mMysell : System.Web.UI.Page
{

    String Qry, Society;
    SqlCommand cmd;
    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Society_MANAGEMENTConnectionString2"].ConnectionString);


    protected void Page_Load(object sender, EventArgs e)
    {
        BindMyGrid();
        lblBlockNo.Text = Session["House_No"].ToString();
        lblSname.Text = Session["SocietyName"].ToString();
        lblType.Text = Session["House_Type"].ToString();
    }

    protected void BindMyGrid()
    {
        conn.Open();


        Qry = "Select *from Sell_Details where Owner_ID="+Session["Owner_ID"];
        SqlCommand cmd = new SqlCommand(Qry, conn);
        SqlDataAdapter DA = new SqlDataAdapter(cmd);
        DataTable DT = new DataTable();
        DA.Fill(DT);
        if (DT.Rows.Count > 0)
        {
            GridView1.Visible = true;
            lbl.Text = "";
            lblRent.Text=DT.Rows[0]["Sell_Price"].ToString();
            GridView1.DataSource = DT;
             GridView1.DataBind();

        }
        else
        {
            GridView1.Visible = false;
            lbl.Text = "No Sell List";
        }

        conn.Close();
    }

}
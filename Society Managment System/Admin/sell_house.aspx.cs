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


public partial class Admin_Default : System.Web.UI.Page
{

    String Qry, Society;
    SqlCommand cmd;
    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Society_MANAGEMENTConnectionString2"].ConnectionString);

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {

            bindSociety();
        }
        
        
          
    }
    public void bindSociety()
    {
        Society = "Select Society_ID, SName from [dbo].[SocietyDetails];";
        conn.Open();
        SqlCommand cmd = new SqlCommand(Society, conn);
        SqlDataReader DR = cmd.ExecuteReader();
        ddlSociety.DataSource = DR;
        ddlSociety.Items.Clear();
        ddlSociety.Items.Insert(0, "----Select Society-----");
        ddlSociety.DataTextField = "SName";
        ddlSociety.DataValueField = "Society_ID";
        ddlSociety.DataBind();
        conn.Close();

    }
    protected void BindMyGrid()
    {
        conn.Open();
        
        
            Qry = "Select *from Sell_Details where Society_ID=" + ddlSociety.SelectedValue;
            SqlCommand cmd = new SqlCommand(Qry, conn);
            SqlDataAdapter DA = new SqlDataAdapter(cmd);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            if (DT.Rows.Count > 0)
            {
                GRVSell.Visible = true;
                lbl.Text = "";
                GRVSell.DataSource = DT;
                GRVSell.DataBind();

            }
            else
            {
                GRVSell.Visible = false;
                lbl.Text = "No Sell List";
            }
        
        conn.Close();
    }



    protected void Button1_Click(object sender, EventArgs e)
    {
        BindMyGrid();
    }
}
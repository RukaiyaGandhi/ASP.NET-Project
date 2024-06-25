using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

public partial class search : System.Web.UI.Page
{
    String SocietySel;
    String Qry;
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
    protected void RentBind() 
    {
        Qry = "Select *from Rent_Details Where Society_ID="+ddlSociety.SelectedValue;
        myconn.Open();
        SqlCommand cmd = new SqlCommand(Qry,myconn);
        SqlDataAdapter DA = new SqlDataAdapter(cmd);
        DataTable DT = new DataTable();
        DA.Fill(DT);
        if (DT.Rows.Count > 0) {
            GrvRentDetails.Visible=true;
            lbl.Visible = false;
            GrvRentDetails.DataSource = DT;
            GrvRentDetails.DataBind();
            myconn.Close();

        }
        else {
            lbl.Visible = true;
            GrvRentDetails.Visible = false;
            lbl.Text = " No Data Found";
        }
    }
    //protected void BindMyGrid()
    //{


    //    myconn.Open();
    //    Qry = "Select *from House_Details";
    //    SqlCommand cmd = new SqlCommand(Qry, myconn);
    //    SqlDataAdapter DA = new SqlDataAdapter(cmd);
    //    DataTable DT = new DataTable();
    //    DA.Fill(DT);
    //    GrvHouseDetails.DataSource = DT;
    //    GrvHouseDetails.DataBind();
    //    myconn.Close();
    //}
    protected void SellBind()
    {

        Qry = "Select *from Sell_Details Where Society_ID="+ddlSociety.SelectedValue;
        myconn.Open();
        SqlCommand cmd = new SqlCommand(Qry,myconn);
        SqlDataAdapter DA = new SqlDataAdapter(cmd);
        DataTable DT = new DataTable();
        DA.Fill(DT);
        if (DT.Rows.Count > 0) {
            GRVSellDetails.Visible=true;
            lbl.Visible = false;
            GRVSellDetails.DataSource = DT;
            GRVSellDetails.DataBind();
            myconn.Close();

        }
        else {
            lbl.Visible = true;
            GRVSellDetails.Visible = false;
            lbl.Text = " No Data Found";
        }
    }

    protected void btnSearch_Click(object sender, EventArgs e)
    {
        if (drpSelectType.SelectedValue == "1" )
        {
            GRVSellDetails.Visible = false;
            RentBind();
        }
        else if (drpSelectType.SelectedValue == "2")
        {
            GrvRentDetails.Visible = false;
            SellBind();

        }
        else 
        {
            lbl.Text = "No Data Found Plese";
        }
    }
}

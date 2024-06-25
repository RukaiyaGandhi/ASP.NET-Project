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

public partial class Admin_committeeMember : System.Web.UI.Page
{

    String Qry, HouseSel, StateQry, SocietySel, Cityqry,Destination;

    SqlConnection myconn = new SqlConnection(ConfigurationManager.ConnectionStrings["Society_MANAGEMENTConnectionString2"].ConnectionString);

    protected void Page_Load(object sender, EventArgs e)
    {
        BindMyGrid();
        if (!IsPostBack)
        {
            bindSociety();            
            bindDestination();
        }
  
    }

    protected void BindMyGrid()
    {
        
            myconn.Open();
            Qry = "Select *from Commitee_Member";
            SqlCommand cmd = new SqlCommand(Qry, myconn);
            SqlDataAdapter DA = new SqlDataAdapter(cmd);
            DataTable DT = new DataTable();

            DA.Fill(DT);
            if (DT.Rows.Count > 0)
            {
                GrvCommitee.DataSource = DT;
                GrvCommitee.DataBind();
                myconn.Close();
            }
            else 
            {
                lblMsg.Text = "No Data Found";
            }
        
    }
    public void bindSociety()
    {
        SocietySel = "Select Society_ID, SName from [dbo].[SocietyDetails];";
        myconn.Open();
        SqlCommand cmd = new SqlCommand(SocietySel, myconn);
        SqlDataReader DR = cmd.ExecuteReader();
        ddlSociety.DataSource = DR;
        ddlSociety.Items.Clear();
        //ddlSociety.Items.Add("Select Society");
        ddlSociety.Items.Insert(0,"Select Society");
        ddlSociety.DataTextField = "SName";
        ddlSociety.DataValueField = "Society_ID";
        ddlSociety.DataBind();
        myconn.Close();

    }
    public void bindhousenumber()
    {
        myconn.Open();
        HouseSel="Select House_ID,House_No from [dbo].[House_Details] where Society_ID ="+ddlSociety.SelectedValue+";";
        SqlCommand cmd = new SqlCommand(HouseSel, myconn);
        SqlDataReader DR = cmd.ExecuteReader();
        ddlHouse.DataSource = DR;
        ddlHouse.Items.Clear();
        //ddlHouse.Items.Add("Select House No");
        ddlHouse.Items.Insert(0,"Select House Number");
        ddlHouse.DataTextField = "House_No";
        ddlHouse.DataValueField = "House_ID";
        ddlHouse.DataBind();
        myconn.Close();
    }

    protected void ddlSociety_SelectedIndexChanged(object sender, EventArgs e)
    {
        bindhousenumber();
    }
    protected void bindDestination()
    {
        myconn.Open();
        Destination = "Select Designation1_ID,Designation From [dbo].[DesignationCommitee]";
        SqlCommand cmd = new SqlCommand(Destination,myconn);
        SqlDataReader DR = cmd.ExecuteReader();
        ddlDesignation.DataSource = DR;
        ddlDesignation.Items.Clear();
        ddlDesignation.Items.Insert(0, "Select Designation");
        //ddlDesignation.Items.Add("--Select Designation--");
        ddlDesignation.DataTextField = "Designation";   
        ddlDesignation.DataValueField ="Designation1_ID";
        ddlDesignation.DataBind();
        myconn.Close();
    }
    protected void BindToControls() 
    {
        myconn.Open();
        Qry = "Select *from Owner_details where House_ID="+ddlHouse.SelectedValue+";";
        SqlCommand cmd = new SqlCommand(Qry,myconn);
        SqlDataAdapter DA = new SqlDataAdapter(cmd);
        DataTable DT = new DataTable();
        DA.Fill(DT);
        if (DT.Rows.Count > 0) 
        {
            txtFname.Text = DT.Rows[0]["Fname"].ToString();
            txtLname.Text=DT.Rows[0]["Lname"].ToString();
            txtAge.Text = DT.Rows[0]["OAge"].ToString();
            txtContact.Text = DT.Rows[0]["Contact_No"].ToString();
            
        }


    }
    protected void SaveComiteeMember()
    {
        Qry = "Insert Into [dbo].[Commitee_Member] (FName,LName,Age,Address,Contact_No,Gender,House_ID,Designation1_ID,Entry_Date)";
        Qry += "Values(@fname,@lname,@age,@add,@Phone,@gender,@HID,@DID,@date);";
        SqlCommand cmd = new SqlCommand(Qry, myconn);
        myconn.Open();
        cmd.Parameters.AddWithValue("fname",txtFname.Text);
        cmd.Parameters.AddWithValue("lname",txtLname.Text);
        cmd.Parameters.AddWithValue("age",txtAge.Text);
        cmd.Parameters.AddWithValue("add",txtAddress.Text);
        cmd.Parameters.AddWithValue("Phone",txtContact.Text);
        cmd.Parameters.AddWithValue("gender",ddlGender.SelectedItem.ToString());
        cmd.Parameters.AddWithValue("HID",ddlHouse.SelectedValue);
        cmd.Parameters.AddWithValue("DID",ddlDesignation.SelectedValue);
        cmd.Parameters.AddWithValue("date",SqlDbType.Date).Value = DateTime.Now;
        cmd.ExecuteNonQuery();
        lblMsg.Text = "Data Enter";
        myconn.Close();
    }
    protected void btnAdd_Click(object sender, EventArgs e)
    {
        
        if (Page.IsPostBack == true)
        {
            BindMyGrid();
            SaveComiteeMember();
            txtAddress.Text = null;
            txtAge.Text = null;
            txtContact.Text = null;
            txtFname.Text = null;
            txtLname.Text = null;
            ddlGender = null;
            ddlHouse.SelectedIndex = 0;
            ddlSociety .SelectedIndex= 0;
            ddlDesignation.SelectedIndex = 0;
         //   lblMsg.Text = null;
        }

    }
    protected void ddlHouse_SelectedIndexChanged(object sender, EventArgs e)
    {
        BindToControls();
    }
}
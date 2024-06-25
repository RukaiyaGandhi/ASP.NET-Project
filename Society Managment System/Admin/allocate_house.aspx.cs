using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

public partial class Admin_allocate_house : System.Web.UI.Page
{
    String Qry, HouseSel, StateQry, SocietySel,Cityqry;

    SqlConnection myconn = new SqlConnection(ConfigurationManager.ConnectionStrings["Society_MANAGEMENTConnectionString2"].ConnectionString);

    protected void Page_Load(object sender, EventArgs e)
    {
        
        if (!IsPostBack)
        {
            bindSociety();
            bindState();
        }
        BindMyGrid();   
    }
    public void bindSociety()
    {
        SocietySel = "Select Society_ID, SName from [dbo].[SocietyDetails];";
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
    public void bindhousenumber()
    {
        HouseSel="Select House_ID , House_No from [dbo].[House_Details] Where Society_ID="+ddlSociety.SelectedValue+";";
        myconn.Open();
        SqlCommand cmd = new SqlCommand(HouseSel, myconn);
        SqlDataReader DR = cmd.ExecuteReader();
        ddlHouse.DataSource = DR;
        ddlHouse.Items.Clear();  
        ddlHouse.Items.Add("Select House No");
        ddlHouse.DataTextField="House_No";
        ddlHouse.DataValueField="House_ID";
        ddlHouse.DataBind();
        myconn.Close();
    }

    protected void ddlSociety_SelectedIndexChanged(object sender, EventArgs e)
    {
        bindhousenumber();
    }


    public void bindState()
    {
        myconn.Open();
        StateQry = "Select State_ID,State_Name From [dbo].[State_Master]";
        SqlCommand getstate = new SqlCommand(StateQry, myconn);
        SqlDataReader dr = getstate.ExecuteReader();
        ddlState.DataSource = dr;
        ddlState.Items.Clear();
        ddlState.Items.Add("Select State");
        ddlState.DataTextField = "State_Name";
        ddlState.DataValueField = "State_ID";
        ddlState.DataBind();
        myconn.Close();
    }

    public void bindCity()
    {
        myconn.Open();
        Cityqry= "Select City_ID,City_Name From [dbo].[City_Master] where State_ID ='" + ddlState.SelectedValue + "';";
        SqlCommand getcity = new SqlCommand(Cityqry, myconn);
        SqlDataReader dr = getcity.ExecuteReader();
        ddlCity.DataSource = dr;
        ddlCity.Items.Clear();
        ddlCity.Items.Add("Select City");
        ddlCity.DataTextField = "City_Name";
        ddlCity.DataValueField = "City_ID";
        ddlCity.DataBind();
        myconn.Close();
    }

    protected void ddlState_SelectedIndexChanged(object sender, EventArgs e)
    {

        bindCity();

    }
    protected void SaveAllocatedToOwner()
    {
        myconn.Open();
        if(uploadOPhoto.HasFile)
        {
            int imagelength = uploadOPhoto.PostedFile.ContentLength;
            byte[] imagearray = new byte[imagelength];
            HttpPostedFile image = uploadOPhoto.PostedFile;
            image.InputStream.Read(imagearray, 0, imagelength);
     
            Qry="INSERT  INTO [dbo].[Owner_details] ( [Society_ID] ,[House_ID],[Fname],[Lname], [Contact_No], [Email_ID], [State_ID],[City_ID],";
            Qry+="[OAge],[O_No_Of_FamilyMember],[OImage], [Username],[Password],[Entry_Date] )";
            Qry+="VALUES(@SID,@HID,@FNAME,@LNAME,@PHONE,@EMAIL,@STID,@CID,@AGE,@MEMBERCOUNT,@IMAGE,@USERNAME,@PASSWORD,@DATE)";
            
            SqlCommand cmd = new SqlCommand(Qry,myconn);
            cmd.Parameters.AddWithValue("SID",ddlSociety.SelectedValue);
            cmd.Parameters.AddWithValue("HID",ddlHouse.SelectedValue);
            cmd.Parameters.AddWithValue("FNAME", txtFname.Text);
            cmd.Parameters.AddWithValue("LNAME", txtLname.Text);
            cmd.Parameters.AddWithValue("PHONE", txtContact.Text);
            cmd.Parameters.AddWithValue("EMAIL", txtemail.Text);
            cmd.Parameters.AddWithValue("STID",ddlState.SelectedValue);
            cmd.Parameters.AddWithValue("CID",ddlCity.SelectedValue);
            cmd.Parameters.AddWithValue("AGE",txtage.Text);
            cmd.Parameters.AddWithValue("MEMBERCOUNT", txtmembercount.Text);
            cmd.Parameters.AddWithValue("IMAGE", SqlDbType.Image).Value = imagearray;
            cmd.Parameters.AddWithValue("USERNAME",txtUname.Text);
            cmd.Parameters.AddWithValue("PASSWORD",txtUpassword.Text);
            cmd.Parameters.AddWithValue("DATE",SqlDbType.Date).Value = DateTime.Now;
            cmd.ExecuteNonQuery();
            lblMsg.Text = "Data Enter";
            myconn.Close();
        }
        txtage.Text = null;
        txtContact.Text = null;
        txtemail.Text = null;
        txtFname.Text = null;
        txtLname.Text = null;
        txtmembercount.Text = null;
        txtUname.Text = null;
        txtUpassword.Text = null;
        ddlCity = null;
        ddlHouse=null;
        ddlSociety=null;
        ddlState = null;
    }
    protected void btnAdd_Click(object sender, EventArgs e)
    {
        
        SaveAllocatedToOwner();
        BindMyGrid();
    }
    protected void BindMyGrid(){ 
      
            myconn.Open();
            Qry="Select *from Owner_details";
            SqlCommand cmd = new SqlCommand(Qry,myconn);
            SqlDataAdapter DA = new SqlDataAdapter(cmd);
            DataTable DT = new DataTable();

            DA.Fill(DT);
            if (DT.Rows.Count > 0)
            {
                GVAllocateHouse.DataSource = DT;
                GVAllocateHouse.DataBind();
                myconn.Close();

            }
            else { lblMsg.Text = "No Data"; }
      
    }

}
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

public partial class _Default : System.Web.UI.Page
{
    String Qry, HouseSel, State, Society, Designation;
    SqlCommand cmd;
    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Society_MANAGEMENTConnectionString2"].ConnectionString);

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            bindSociety();
            bindDestination();
            
        }
        BindMyGrid();        

    }
    public void bindSociety()
    {
        Society = "Select Society_ID, SName from [dbo].[SocietyDetails];";
        conn.Open();
        SqlCommand cmd = new SqlCommand(Society, conn);
        SqlDataReader DR = cmd.ExecuteReader();
        ddlSociety.DataSource = DR;
        ddlSociety.Items.Clear();
        ddlSociety.Items.Add("Select Society");
        ddlSociety.DataTextField = "SName";
        ddlSociety.DataValueField = "Society_ID";
        ddlSociety.DataBind();
        conn.Close();

    }
    
    protected void bindDestination()
    {
        conn.Open();
        Designation = "Select Designation_ID,Designation From [dbo].[DesignationHelpers]";
        SqlCommand cmd = new SqlCommand(Designation, conn);
        SqlDataReader DR = cmd.ExecuteReader();
        ddlDesignation.DataSource = DR;
        ddlDesignation.Items.Clear();
        ddlDesignation.Items.Add("--Select Designation--");
        ddlDesignation.DataTextField = "Designation";
        ddlDesignation.DataValueField = "Designation_ID";
        ddlDesignation.DataBind();
        conn.Close();
    }
    protected void BindMyGrid()
    {
            conn.Open();
            Qry = "Select *from Society_Helper_Details";
            SqlCommand cmd = new SqlCommand(Qry,conn);
            SqlDataAdapter DA = new SqlDataAdapter(cmd);
            DataTable DT = new DataTable();

            DA.Fill(DT);
            if (DT.Rows.Count > 0)
            {
                grvCmember.DataSource = DT;
                grvCmember.DataBind();
                conn.Close();
            }
            else 
            {
                lblMsg.Text = "No Date Found";
            }
    }
    protected void SaveHelpers()
    {
    //    Qry = "Select max(SHelper_ID) from Society_Helper_Details;";
    //    cmd = new SqlCommand(Qry, conn);
        conn.Open();
    //    int i = cmd.ExecuteNonQuery(); 
        if(Simageupload.HasFile)
        {
            
            int imagelength = Simageupload.PostedFile.ContentLength;
            byte[] imagearray = new byte[imagelength];
            HttpPostedFile image = Simageupload.PostedFile;
            image.InputStream.Read(imagearray, 0, imagelength);
            Qry = "Insert into [dbo].[Society_Helper_Details] ([HName],[HAddress],[Contact_No],[Age],[Gender],[Designation_ID],[Ref_Sname],[Ref_Contact_No],[Society_ID],[Swift],[Joining_Date],[HImage],[Entry_Date]) Values(";
            Qry += "@Name,@Address,@Contact,@Age,@Gender,@DID,@RSname,@Rcontact,@SID,@Shift,@Date,@Image,@Edate)";
            
            cmd = new SqlCommand(Qry, conn);
            
            cmd.Parameters.AddWithValue("Name",txtHname.Text);
            cmd.Parameters.AddWithValue("Address",txtHAdd.Text);
            cmd.Parameters.AddWithValue("Contact",txtphonenum.Text);
            cmd.Parameters.AddWithValue("Age",txtAge.Text);
            cmd.Parameters.AddWithValue("Gender",ddlGender.SelectedItem.ToString());
            cmd.Parameters.AddWithValue("DID",ddlDesignation.SelectedValue);
            cmd.Parameters.AddWithValue("RSname",txtrefsociety.Text);
            cmd.Parameters.AddWithValue("Rcontact",txtRefcontact.Text);
            cmd.Parameters.AddWithValue("SID",ddlSociety.SelectedValue);
            cmd.Parameters.AddWithValue("Shift",txtShift.Text);
            cmd.Parameters.AddWithValue("Date", SqlDbType.Date).Value = txtCal.Text;
            cmd.Parameters.AddWithValue("Image",SqlDbType.Image).Value=imagearray;
            
            cmd.Parameters.AddWithValue("Edate", DateTime.Now);
            cmd.ExecuteNonQuery();
            conn.Close();
            lblMsg.Text = "Data Entered";
        }

    }
    protected void btnAdd_Click(object sender, EventArgs e)
    {
        if (IsValid)
        {
            SaveHelpers();
            BindMyGrid();
        }
        ClearControls();
    }
    protected void ClearControls() 
    {
        txtAge.Text=null;
        txtCal.Text=null;
        txtHAdd.Text=null;
        txtHname.Text=null;
        txtphonenum.Text=null;
        txtRefcontact.Text=null;
        txtrefsociety.Text = null;
        txtShift.Text = null;
        ddlDesignation.SelectedIndex = 0;
        ddlGender.SelectedIndex = 0;
        ddlSociety.SelectedIndex = 0;
        txtCal.Text = null;
    }
}
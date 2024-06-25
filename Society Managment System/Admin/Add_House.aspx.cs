using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
public partial class _Default : System.Web.UI.Page
{
    String Qry, HouseType, HouseStatus, SocietySel;

    SqlConnection myconn = new SqlConnection(ConfigurationManager.ConnectionStrings["Society_MANAGEMENTConnectionString2"].ConnectionString);


    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            bindHousetype();
            bindhousestatus();
            bindSociety();
        }
        BindMyGrid();
        
    }

    public void bindHousetype()
    {
        HouseType = "Select House_Type,HouseType_ID from [dbo].[HouseType];";
        myconn.Open();
        SqlCommand cmd = new SqlCommand(HouseType, myconn);
        SqlDataReader dr = cmd.ExecuteReader();
        ddlHouseType.DataSource = dr;
        ddlHouseType.Items.Clear();
        ddlHouseType.Items.Add("Select House Type");
        ddlHouseType.DataTextField = "House_Type";
        ddlHouseType.DataValueField = "HouseType_ID";
        ddlHouseType.DataBind();
        myconn.Close();
    }
    public void bindhousestatus()
    {
        HouseStatus = "Select Status_ID,Status from [dbo].[House_Status];";
        myconn.Open();
        SqlCommand cmd = new SqlCommand(HouseStatus, myconn);
        SqlDataReader dr = cmd.ExecuteReader();
        ddlhouseStatus.DataSource = dr;
        ddlhouseStatus.Items.Clear();
        ddlhouseStatus.Items.Add("Select House Status");
        ddlhouseStatus.DataTextField = "Status";
        ddlhouseStatus.DataValueField = "Status_ID";
        ddlhouseStatus.DataBind();
        myconn.Close();
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
        ddlSociety.DataValueField="Society_ID";
        ddlSociety.DataBind();
        myconn.Close();
        
      }
    public void SaveHouseDetails()
    {
     
        
            if (Fudhimage.HasFile)
            {
                int imagelength = Fudhimage.PostedFile.ContentLength;
                byte[] imagearray = new byte[imagelength];
                HttpPostedFile image = Fudhimage.PostedFile;
                image.InputStream.Read(imagearray, 0, imagelength);
                myconn.Open();
                Qry = "Insert into [dbo].[House_Details] ([Society_ID],[House_No],[HouseType_ID],[Status_ID] ,[House_Price],[Other_Facility],[HImage],[Entry_Date]) Values(@Sid,@Nhouse,@htID,@StID,@price,@Other,@Image,@date)";
                SqlCommand cmd = new SqlCommand(Qry, myconn);
                cmd.Parameters.AddWithValue("Sid",ddlSociety.SelectedValue);
                cmd.Parameters.AddWithValue("Nhouse",texthouseNum.Text);
                cmd.Parameters.AddWithValue("htID", ddlHouseType.SelectedValue);
                cmd.Parameters.AddWithValue("StID", ddlhouseStatus.SelectedValue);
                cmd.Parameters.AddWithValue("price", txthouseprice.Text);
                cmd.Parameters.AddWithValue("Other", txtOtherDetail.Text);
                cmd.Parameters.AddWithValue("Image", SqlDbType.Image).Value = imagearray;
                cmd.Parameters.AddWithValue("date",DateTime.Now);
                cmd.ExecuteNonQuery();
                lblmsg.Text = "Entered Data";
                
            }
           
            myconn.Close();
        }

    

    protected void addHouseBtn_Click(object sender, EventArgs e)
    {
        SaveHouseDetails();
        BindMyGrid();
      //  calculatedAllotmentOfhouse();
        texthouseNum.Text = null;
        ddlSociety = null;
        ddlhouseStatus = null;
        ddlHouseType = null;
        txtOtherDetail.Text = null;
        txthouseprice.Text = null;
        Fudhimage = null;
        //lblmsg.Text = null;
        
    }

    protected void calculatedAllotmentOfhouse() 
    {
        myconn.Open();
        
        Qry = "Select House_No from House_Details where Society_ID="+ddlSociety.SelectedValue;
        SqlCommand cmd = new SqlCommand(Qry,myconn);
        SqlDataAdapter DA = new SqlDataAdapter(cmd);
        DataTable DT = new DataTable();
        DA.Fill(DT);
        if (DT.Rows.Count > 0)
        {
            string i = DT.Rows.Count.ToString();

            lblAllocate.Text = "Allocated House =" + i;
        }
        else
        {
            lblAllocate.Text = "Allocated House =0";
        }
        myconn.Close();
        
    }
    protected void TotalHouse()
    {

        myconn.Open();
        Qry = "SELECT No_Of_Houses from SocietyDetails where Society_ID=" + ddlSociety.SelectedValue;
        SqlCommand cmd = new SqlCommand(Qry, myconn);
        SqlDataAdapter DA = new SqlDataAdapter(cmd);
        DataTable DT = new DataTable();
        DA.Fill(DT);
        if (DT.Rows.Count > 0)
        {
            Total.Text = "Total Number Of Houses:" + DT.Rows[0]["No_Of_Houses"].ToString();
            myconn.Close();
        }
        else
        {
            Total.Text = "Please Select Society";
        }

    }
    protected void ddlSociety_SelectedIndexChanged(object sender, EventArgs e)
    {
        TotalHouse();
       calculatedAllotmentOfhouse();
    }

    protected void BindMyGrid()
    {
            myconn.Open();
            Qry = "Select *from House_Details";
            SqlCommand cmd = new SqlCommand(Qry, myconn);
            SqlDataAdapter DA = new SqlDataAdapter(cmd);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            if (DT.Rows.Count > 0)
            {
                GrvHouseDetails.DataSource = DT;
                GrvHouseDetails.DataBind();
                myconn.Close();
            }
            else
            {
                lblmsg.Text = "NodataFound";
            }

        }
    }

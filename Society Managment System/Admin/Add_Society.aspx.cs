using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
public partial class Add_Society : System.Web.UI.Page
{
    String Qry, StateQry, CitySelectQry;

    SqlConnection myconn = new SqlConnection(ConfigurationManager.ConnectionStrings["Society_MANAGEMENTConnectionString2"].ConnectionString);

    protected void Page_Load(object sender, EventArgs e){


        //calendarEst.Visible = false;

        if (!IsPostBack)
        {
            bindState();
           
        }
        BindMyGrid();
     }


    public void bindState() {
        myconn.Open();
        StateQry = "Select State_ID,State_Name From [dbo].[State_Master]";
        SqlCommand getstate = new SqlCommand(StateQry, myconn);
        SqlDataReader dr = getstate.ExecuteReader();
        ddlState.DataSource = dr;
        ddlState.Items.Clear();
        ddlState.Items.Insert(0,"Select State");
        //ddlState.Items.Add("Select State");
        ddlState.DataTextField = "State_Name";
        ddlState.DataValueField = "State_ID";
        ddlState.DataBind();
        myconn.Close();
}

    public void bindCity()
    {
        myconn.Open();
        CitySelectQry = "Select City_ID,City_Name From [dbo].[City_Master] where State_ID ='" + ddlState.SelectedValue + "';";
        SqlCommand getcity = new SqlCommand(CitySelectQry, myconn);
        SqlDataReader dr = getcity.ExecuteReader();
        ddlCity.DataSource = dr;
        ddlCity.Items.Clear();
        ddlCity.Items.Insert(0, "Select City");

        ddlCity.DataTextField = "City_Name";
        ddlCity.DataValueField = "City_ID";
        ddlCity.DataBind();
        myconn.Close();
    }

    protected void ddlState_SelectedIndexChanged(object sender, EventArgs e)
    {

        bindCity();
       
    }
    
    protected void addSocietyBtn_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            SaveSociety();
            txtSocietyname.Text = null;
            txtNoHouse.Text = null;
            txtAddress.Text = null;
            ddlState.Text = null;
            ddlCity.Text = null;
            txtCal.Text = null;
            Simageupload = null;

            BindMyGrid();
        }
        else { 
            
        }

    }

    protected void SaveSociety()
    {
        
        if (Simageupload.HasFile)
        {
            int imagelength = Simageupload.PostedFile.ContentLength;
            byte[] imagearray = new byte[imagelength];
            HttpPostedFile image = Simageupload.PostedFile;
            image.InputStream.Read(imagearray, 0, imagelength);

            myconn.Open();
            Qry = "Insert into [dbo].[SocietyDetails] (SName,SAddress,State_ID,City_ID,No_Of_Houses,Establishment_date,Image,Entry_Date) Values (@name,@add,@sid,@cid,@hcount,@edate,@IMAGE,@date);";
            SqlCommand cmd = new SqlCommand(Qry, myconn);
            cmd.Parameters.AddWithValue("name", txtSocietyname.Text);
            cmd.Parameters.AddWithValue("add", txtAddress.Text);
            cmd.Parameters.AddWithValue("sid", ddlState.SelectedValue);
            cmd.Parameters.AddWithValue("cid", ddlCity.SelectedValue);
            cmd.Parameters.AddWithValue("hcount", txtNoHouse.Text);
            cmd.Parameters.AddWithValue("edate", txtCal.Text);
            cmd.Parameters.AddWithValue("IMAGE", SqlDbType.Image).Value = imagearray;
            cmd.Parameters.AddWithValue("date", DateTime.Now);
            cmd.ExecuteNonQuery();
           // lblpractice.Text = "DataBind Enter";
              ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('Data entered successfully!');", true);

        }
    }
    protected void BindMyGrid()
    {
        

        
            Qry = "Select *from SocietyDetails";
            SqlCommand cmd = new SqlCommand(Qry, myconn);
            SqlDataAdapter DA = new SqlDataAdapter(cmd);
            DataTable DT = new DataTable();

            DA.Fill(DT);
            if(DT.Rows.Count>0)
            {

            Gvsociety.DataSource = DT;
            Gvsociety.DataBind();
            myconn.Close();
            }
            else
            {
                lblpractice.Text = "Nodata";
            }
    }


}
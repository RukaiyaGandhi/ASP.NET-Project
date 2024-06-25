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
public partial class MHome : System.Web.UI.Page
{
    String Qry;
    SqlConnection myconn = new SqlConnection(ConfigurationManager.ConnectionStrings["Society_MANAGEMENTConnectionString2"].ConnectionString);
    SqlCommand cmd;
    protected void Page_Load(object sender, EventArgs e)
    {
        retriveImage();
        AddingIntoLables();
    }
    protected void btnRent_Click(object sender, EventArgs e)
    {

        
        txtRent.Text = "";
        btnRentNow.Visible = true;
        txtRent.Visible = true;
        txtSell.Visible = false;
        btnSellNow.Visible = false;
    }  
    protected void retriveImage()
    {
        myconn.Open();
        Qry= "Select House_ID,Society_ID from Owner_details where Owner_ID="+Session["Owner_ID"];
        SqlCommand cmd = new SqlCommand(Qry, myconn);
        SqlDataAdapter DA = new SqlDataAdapter(cmd);
        DataTable DT = new DataTable();
        DA.Fill(DT);
        
        if (DT.Rows.Count > 0)
        {
            
            Qry ="Select SName From SocietyDetails where Society_ID="+DT.Rows[0]["Society_ID"];
            cmd = new SqlCommand(Qry, myconn);
             DA = new SqlDataAdapter(cmd);
             DT = new DataTable();
             DA.Fill(DT);
             if (DT.Rows.Count > 0)
             { 
                 lblSocietyName.Text = DT.Rows[0]["SName"].ToString();
             }
        }



        myconn.Close();
    }
    protected void AddingIntoLables()
    {
        //myconn.Open();
        Qry = "Select House_ID from Owner_details where Owner_ID="+Session["Owner_ID"];
        cmd = new SqlCommand(Qry, myconn);
        myconn.Open();
        SqlDataAdapter DA = new SqlDataAdapter(cmd);
        DataTable DT = new DataTable();
        DA.Fill(DT);
        String a = DT.Rows[0]["House_ID"].ToString();
        Qry = "Select HouseType_ID,House_No from House_Details where House_ID=" + Convert.ToInt16(a);
        cmd = new SqlCommand(Qry, myconn);
        DA = new SqlDataAdapter(cmd);
        DT = new DataTable();
        DA.Fill(DT);
        String H=DT.Rows[0]["House_No"].ToString();
        String b = DT.Rows[0]["HouseType_ID"].ToString();
        lblBlockNo.Text = H ;
        Session["House_No"] = lblBlockNo.Text; 
        Qry = "Select House_Type From HouseType Where HouseType_ID="+Convert.ToInt16(b);
        cmd = new SqlCommand(Qry, myconn);
        DA = new SqlDataAdapter(cmd);
        DT = new DataTable();
        DA.Fill(DT);
        lblType.Text = DT.Rows[0]["House_Type"].ToString();
       
        Session["House_Type"] = lblType.Text;
        myconn.Close();
    }
    protected void SaveRent()
    {
        myconn.Open();
        
            Qry ="Select House_ID,Society_ID,Owner_ID from Owner_details where Owner_ID=" + Session["Owner_ID"];
            cmd = new SqlCommand(Qry,myconn);
            SqlDataAdapter DA = new SqlDataAdapter(cmd);
            DataTable DT = new DataTable();
            DA.Fill(DT);
            if (DT.Rows.Count > 0)
            {
                String HID = DT.Rows[0]["House_ID"].ToString();
                String SID = DT.Rows[0]["Society_ID"].ToString();
                //String OID = 0;
                Qry = "INSERT INTO Rent_Details (House_ID,Society_ID,Owner_ID,House_Rent,Entry_Date) VALUES(";
                Qry += "@HID,@SID,@OID,@Hrent,@Date";
                Qry += ");";
                cmd = new SqlCommand(Qry, myconn);
                cmd.Parameters.AddWithValue("HID",Convert.ToInt16(HID));
                cmd.Parameters.AddWithValue("SID",Convert.ToInt16(SID));
                cmd.Parameters.AddWithValue("OID",Session["Owner_ID"]);
                cmd.Parameters.AddWithValue("Hrent", txtRent.Text);
                cmd.Parameters.AddWithValue("Date",DateTime.Now);
                cmd.ExecuteNonQuery();
                myconn.Close();
             }
    }

    protected void btnSell_Click(object sender, EventArgs e)
    {
        txtSell.Text = "";
        btnRentNow.Visible = false;
        txtRent.Visible = false;

        txtSell.Visible = true;
        btnSellNow.Visible = true;
    }
    protected void btnRentNow_Click(object sender, EventArgs e)
    {
        SaveRent();
    }
    protected void SaveSEll()
    {
        myconn.Open();

        Qry = "Select House_ID,Society_ID,Owner_ID from Owner_details where Owner_ID=" + Session["Owner_ID"];
        cmd = new SqlCommand(Qry, myconn);
        SqlDataAdapter DA = new SqlDataAdapter(cmd);
        DataTable DT = new DataTable();
        DA.Fill(DT);
        if (DT.Rows.Count > 0)
        {
            String HID = DT.Rows[0]["House_ID"].ToString();
            String SID = DT.Rows[0]["Society_ID"].ToString();
            //String OID = 0;
            Qry = "INSERT INTO Sell_Details (House_ID,Society_ID,Owner_ID,Sell_Price,Entry_Date) VALUES(";
            Qry += "@HID,@SID,@OID,@Hsell,@Date";
            Qry += ");";
            cmd = new SqlCommand(Qry, myconn);
            cmd.Parameters.AddWithValue("HID", Convert.ToInt16(HID));
            cmd.Parameters.AddWithValue("SID", Convert.ToInt16(SID));
            cmd.Parameters.AddWithValue("OID", Session["Owner_ID"]);
            cmd.Parameters.AddWithValue("Hsell", txtSell.Text);
            cmd.Parameters.AddWithValue("Date", DateTime.Now);
            cmd.ExecuteNonQuery();
            myconn.Close();
        }
    }

    protected void btnSellNow_Click(object sender, EventArgs e)
    {
        SaveSEll();
    }
}
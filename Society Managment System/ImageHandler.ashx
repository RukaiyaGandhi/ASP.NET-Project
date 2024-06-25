<%@ WebHandler Language="C#" Class="ImageHandler" %>

using System;
using System.Web;
using System.Data.SqlClient;
using System.IO;
using System.Configuration;
public class ImageHandler : IHttpHandler
{
    public void ProcessRequest(HttpContext context)
    {
        int id = Convert.ToInt32(context.Request.QueryString["id"]);
        SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["Society_MANAGEMENTConnectionString2"].ConnectionString);
        //using (SqlConnection connection = new SqlConnection("Data Source=DESKTOP-PG9HKCK;Initial Catalog=Society_MANAGEMENT;Integrated Security=True"))
        {
            connection.Open();

            using (SqlCommand command = new SqlCommand("SELECT OImage FROM Owner_Details WHERE Owner_ID = @Id", connection))
            {
                command.Parameters.AddWithValue("@Id", id);

                using (SqlDataReader reader = command.ExecuteReader())
                {
                    if (reader.Read())
                    {
                        context.Response.ContentType = "image/jpeg";
                        context.Response.BinaryWrite((byte[])reader["OImage"]);
                    }
                }
            }
        }
    }

    public bool IsReusable
    {
        get
        {
            return true;
        }
    }
}
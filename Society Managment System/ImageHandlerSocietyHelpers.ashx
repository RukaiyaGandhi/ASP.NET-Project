<%@ WebHandler Language="C#" Class="ImageHandlerSocietyHelpers" %>

using System;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
public class ImageHandlerSocietyHelpers : IHttpHandler {
    SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["Society_MANAGEMENTConnectionString2"].ConnectionString);
    public void ProcessRequest(HttpContext context)
    {
        int id = Convert.ToInt32(context.Request.QueryString["id"]);

        //using (SqlConnection connection = new SqlConnection("Data Source=DESKTOP-PG9HKCK;Initial Catalog=Society_MANAGEMENT;Integrated Security=True"))
        {
            connection.Open();

            using (SqlCommand command = new SqlCommand("SELECT HImage FROM Society_Helper_Details WHERE SHelper_ID = @Id", connection))
            {
                command.Parameters.AddWithValue("@Id", id);

                using (SqlDataReader reader = command.ExecuteReader())
                {
                    if (reader.Read())
                    {
                        context.Response.ContentType = "image/jpeg";
                        context.Response.BinaryWrite((byte[])reader["HImage"]);
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
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PrintStation.Student
{
    public partial class Account_Settings : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Username"] == null || Session["UserType"].ToString() != "Student")
            {
                Response.Redirect("../Login.aspx");
            }

            string suser = Session["Username"].ToString();

            SqlConnection con = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\\Database1.mdf;Integrated Security=True");
            con.Open();
            SqlCommand com = new SqlCommand("select * from [Student] where SRegNo='" + suser + "'", con);
            SqlDataReader r = com.ExecuteReader();
            if (r.Read())
            {
                Session["Sname"] = r.GetString(2);
                Session["Scred"] = r.GetInt32(6).ToString();
                Session["sdept"] = r.GetString(3);
                Session["semail"] = r.GetString(4);
                Session["smobile"] = r.GetInt32(5);
                Session["sspent"] = r.GetInt32(7);
            }
            else
            {
                Response.Write("SRETRIEVAL ERROR");
            }
            r.Close();
            con.Close();

            SqlConnection con1 = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\\Database1.mdf;Integrated Security=True");
            con1.Open();
            SqlCommand com1 = new SqlCommand("select * from [Login] where Username='" + Session["Username"] + "' ", con1);
            SqlDataReader r1 = com1.ExecuteReader();
            if (r1.Read())
            {
                Session["UserPassword"] = r1.GetString(2);
            }
            else
            {
                Response.Write("SRETRIEVAL ERROR");
            }
            r1.Close();
            con1.Close();
        }
    }
}
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PrintStation.Faculty
{
    public partial class Account_Settings : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Username"] == null || Session["UserType"].ToString() != "Faculty")
            {
                Response.Redirect("../Login.aspx");
            }

            string fuser = Session["Username"].ToString();

            SqlConnection con = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\\Database1.mdf;Integrated Security=True");
            con.Open();
            SqlCommand com = new SqlCommand("select * from [Faculty] where FRegNo='" + fuser + "'", con);
            SqlDataReader r = com.ExecuteReader();
            if (r.Read())
            {
                Session["Fname"] = r.GetString(2);
                Session["fdept"] = r.GetString(3);
                Session["femail"] = r.GetString(4);
                Session["fmobile"] = r.GetInt32(5);
            }
            else
            {
                Response.Write("FRETRIEVAL ERROR");
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
                Response.Write("FRETRIEVAL ERROR");
            }
            r1.Close();
            con1.Close();
        }
    }
}
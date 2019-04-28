using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PrintStation
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\\Database1.mdf;Integrated Security=True");
            con.Open();
            SqlCommand com = new SqlCommand("select * from [Login] where Username='" + TextBox1.Text + "' and Password='" + TextBox2.Text + "' ", con);
            SqlDataReader r = com.ExecuteReader();
            if (r.Read())
            {
                Session["Username"] = r.GetInt32(1);
                Session["UserType"] = r.GetString(3);
                Session["succ"] = false;

                if (Session["UserType"].ToString() == "Student")
                {
                    Response.Redirect("Student\\Dashboard.aspx");
                }

                if (Session["UserType"].ToString() == "Faculty")
                {
                    Response.Redirect("Faculty\\Dashboard.aspx");
                }

                if (Session["UserType"].ToString() == "Admin")
                {
                    Response.Redirect("Admin\\Dashboard.aspx");
                }

            }
            else
            {
                Response.Write("<script> alert('Incorrect Username or Password!'); window.location.href='Login.aspx'; </script>");
            }
        }
    }
}
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PrintStation.Faculty
{
    public partial class Change_Password : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Username"] == null || Session["UserType"].ToString() != "Faculty")
            {
                Response.Redirect("../Login.aspx");
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\\Database1.mdf;Integrated Security=True");
            con.Open();
            SqlCommand com = new SqlCommand("UPDATE [Login] SET Password='" + TextBox2.Text + "' WHERE Username='" + Session["Username"] + "' AND Password='" + TextBox1.Text + "' ", con);

            int a = com.ExecuteNonQuery();
            if (a > 0)
            {
                Response.Write("<script> alert('Your password has been changed.'); window.location.href='Account Settings.aspx'; </script>");
            }
            else
            {
                Response.Write("<script> alert('Current password entered is incorrect!'); window.location.href='Account Settings.aspx'; </script>");
            }
            con.Close();
        }
    }
}
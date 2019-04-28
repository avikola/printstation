using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PrintStation.Faculty
{
    public partial class Cart : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Username"] == null || Session["UserType"].ToString() != "Faculty")
            {
                Response.Redirect("../Login.aspx");
            }
        }

        protected void ChangetoPend(object sender, EventArgs e)
        {
            bool emptycheck1 ,emptycheck2;
            string constr = ConfigurationManager.ConnectionStrings["PSConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.CommandText = "SELECT * from [Prints] WHERE RegNo = '" + Session["Username"] + "' AND Status = 'In Cart'";
                    cmd.Connection = con;
                    con.Open();
                    SqlDataReader r = cmd.ExecuteReader();
                    if (r.Read())
                    {
                        emptycheck1 = true;
                    }
                    else
                    {
                        emptycheck1 = false;
                    }
                    con.Close();
                }
            }

            using (SqlConnection con = new SqlConnection(constr))
            {

                using (SqlCommand cmd1 = new SqlCommand())
                {
                    cmd1.CommandText = "SELECT * from [Product] WHERE RegID = '" + Session["Username"] + "' AND Status = 'In Cart'";
                    cmd1.Connection = con;
                    con.Open();
                    SqlDataReader r1 = cmd1.ExecuteReader();
                    if (r1.Read())
                    {
                        emptycheck2 = true;
                    }
                    else
                    {
                        emptycheck2 = false;
                    }

                    con.Close();
                }
            }

            if (emptycheck1 == false && emptycheck2 == false)
                Response.Write("<script> alert('Cart is Empty!'); window.location.href='Dashboard.aspx'; </script>");
            else
            {
                if (emptycheck1 == true)
                {
                    using (SqlConnection con = new SqlConnection(constr))
                    {
                        using (SqlCommand cmd3 = new SqlCommand())
                        {
                            cmd3.CommandText = "UPDATE [Prints] SET [Status] = 'Pending' WHERE RegNo = '" + Session["Username"] + "' AND Status='In Cart'";
                            cmd3.Connection = con;
                            con.Open();
                            cmd3.ExecuteReader();
                            con.Close();
                        }
                    }
                }

                if (emptycheck2 == true)
                {
                    using (SqlConnection con = new SqlConnection(constr))
                    {
                        using (SqlCommand cmd4 = new SqlCommand())
                        {
                            cmd4.CommandText = "UPDATE [Product] SET [Status] = 'Pending' WHERE RegID = '" + Session["Username"] + "' AND Status='In Cart'";
                            cmd4.Connection = con;
                            con.Open();
                            cmd4.ExecuteReader();
                            con.Close();
                        }
                    }
                }
                Response.Write("<script> alert('Your Order has been placed. You will receive a notification when your order is ready for collection'); window.location.href='Dashboard.aspx'; </script>");
            }
        }
    }
}
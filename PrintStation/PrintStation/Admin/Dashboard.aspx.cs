using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PrintStation.Admin
{
    public partial class Dashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Username"] == null || Session["UserType"].ToString() != "Admin")
            {
                Response.Redirect("../Login.aspx");
            }

            string auser = Session["Username"].ToString();

            SqlConnection con = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\\Database1.mdf;Integrated Security=True");
            con.Open();
            SqlCommand com = new SqlCommand("select * from [Admin] where ARegNo='" + auser + "'", con);
            SqlDataReader r = com.ExecuteReader();
            if (r.Read())
            {
                Session["Aname"] = r.GetString(2);
            }
            else
            {
                Response.Write("ANAME ERROR");
            }

            r.Close();
            con.Close();

            int printcount, productcount;
            string constr = ConfigurationManager.ConnectionStrings["PSConnectionString"].ConnectionString;

            using (SqlConnection con1 = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.CommandText = "SELECT Count(PrintID) from [Prints] WHERE Status = 'Pending'";
                    cmd.Connection = con1;
                    con1.Open();
                    object obj = cmd.ExecuteScalar();
                    if (obj != null && DBNull.Value != obj)
                    {
                        printcount = Convert.ToInt32(cmd.ExecuteScalar());
                    }
                    else
                    {
                        printcount = 0;
                    }
                    con1.Close();
                }
            }
            if(printcount<10)
                Label1.Text = "0"+printcount.ToString();
            else
                Label1.Text = printcount.ToString();

            using (SqlConnection con1 = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.CommandText = "SELECT Count(ID) from [Product] WHERE Status = 'Pending'";
                    cmd.Connection = con1;
                    con1.Open();
                    object obj = cmd.ExecuteScalar();
                    if (obj != null && DBNull.Value != obj)
                    {
                        productcount = Convert.ToInt32(cmd.ExecuteScalar());
                    }
                    else
                    {
                        productcount = 0;
                    }
                    con1.Close();
                }
            }
            if (productcount < 10)
                Label2.Text = "0" + productcount.ToString();
            else
                Label2.Text = productcount.ToString();
            this.RegisterPostBackControl();
        }

        private void RegisterPostBackControl()
        {
            foreach (GridViewRow row in GridView3.Rows)
            {
                LinkButton lnkDownload = row.FindControl("lnkDownload") as LinkButton;
                ScriptManager.GetCurrent(this).RegisterPostBackControl(lnkDownload);
            }
            foreach (GridViewRow row in GridView4.Rows)
            {
                LinkButton lnkDownload2 = row.FindControl("lnkDownload2") as LinkButton;
                ScriptManager.GetCurrent(this).RegisterPostBackControl(lnkDownload2);
            }
        }

        protected void DownloadFile(object sender, EventArgs e)
        {
            int id = int.Parse((sender as LinkButton).CommandArgument);
            byte[] bytes;
            string fileName, contentType;
            string constr = ConfigurationManager.ConnectionStrings["PSConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.CommandText = "SELECT [FileName], [File], [FileType] from Prints where PrintID=@PrintID";
                    cmd.Parameters.AddWithValue("@PrintID", id);
                    cmd.Connection = con;
                    con.Open();
                    using (SqlDataReader sdr = cmd.ExecuteReader())
                    {
                        sdr.Read();
                        bytes = (byte[])sdr["File"];
                        contentType = sdr["FileType"].ToString();
                        fileName = sdr["FileName"].ToString();
                    }
                    con.Close();
                }
            }
            Response.Clear();
            Response.Buffer = true;
            Response.Charset = "";
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.ContentType = contentType;
            Response.AppendHeader("Content-Disposition", "attachment; filename=" + fileName);
            Response.BinaryWrite(bytes);
            Response.Flush();
            Response.End();
        }

        protected void MarkAsCompleteFile(object sender, EventArgs e)
        {
            int id = int.Parse((sender as LinkButton).CommandArgument);

            string constr = ConfigurationManager.ConnectionStrings["PSConnectionString"].ConnectionString;

            
            using (SqlConnection con1 = new SqlConnection(constr))
            {
                using (SqlCommand cmd1 = new SqlCommand())
                {
                    cmd1.CommandText = "Select * from [Prints] where PrintID=@PrintID";
                    cmd1.Parameters.AddWithValue("@PrintID", id);
                    cmd1.Connection = con1;
                    con1.Open();
                    SqlDataReader r1 = cmd1.ExecuteReader();
                    if (r1.Read())
                    {
                        Session["StuPrintRegNo"] = r1.GetInt32(1);
                    }
                    r1.Close();
                }
            }

            using (SqlConnection con1 = new SqlConnection(constr))
            {
                using (SqlCommand com = new SqlCommand())
                {
                    com.CommandText = "Select * from [Student] where SRegNo='" + Session["StuPrintRegNo"] + "'";
                    com.Connection = con1;
                    con1.Open();
                    SqlDataReader r1 = com.ExecuteReader();
                    if (r1.Read())
                    {
                        Session["StuMarkUsername"] = r1.GetString(2);
                        Session["StuMarkEmail"] = r1.GetString(4);
                    }
                    r1.Close();
                }
            }


            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.CommandText = "Update [Prints] Set [Status] = 'Completed' where PrintID=@PrintID";
                    cmd.Parameters.AddWithValue("@PrintID", id);
                    cmd.Connection = con;
                    con.Open();
                    cmd.ExecuteReader();
                    con.Close();
                }
            }

            bool printchecker, productchecker;

            using (SqlConnection con = new SqlConnection(constr))
            {

                using (SqlCommand cmd2 = new SqlCommand())
                {
                    cmd2.CommandText = "SELECT * from [Prints] WHERE RegNo = '" + Session["StuPrintRegNo"] + "' AND Status = 'Pending'";
                    cmd2.Connection = con;
                    con.Open();
                    SqlDataReader r3 = cmd2.ExecuteReader();
                    if (r3.HasRows)
                    {
                        printchecker = true;
                    }
                    else
                    {
                        printchecker = false;
                    }
                    r3.Close();
                    con.Close();
                }
            }

            using (SqlConnection con = new SqlConnection(constr))
            {

                using (SqlCommand cmd2 = new SqlCommand())
                {
                    cmd2.CommandText = "SELECT * from [Product] WHERE RegID = '" + Session["StuPrintRegNo"] + "' AND Status = 'Pending'";
                    cmd2.Connection = con;
                    con.Open();
                    SqlDataReader r3 = cmd2.ExecuteReader();
                    if (r3.HasRows)
                    {
                        productchecker = true;
                    }
                    else
                    {
                        productchecker = false;
                    }
                    r3.Close();
                    con.Close();
                }
            }


            if (printchecker == false && productchecker == false)
            {
                MailMessage mail = new MailMessage();
                mail.To.Add(Session["StuMarkEmail"].ToString());
                mail.CC.Add(new MailAddress("avishkar1995@gmail.com"));
                mail.From = new MailAddress("printstation.team@gmail.com");
                mail.Subject = "PS: Order Complete";
                mail.Body = "Hello " + Session["StuMarkUsername"] + ",\n\nYour order has been completed and is now ready for collection from the stationery.\n\nRegards,\nPrintStation Team";


                SmtpClient smtp = new SmtpClient("smtp.gmail.com", 587);
                smtp.Credentials = new System.Net.NetworkCredential()
                {
                    UserName = "printstation.team@gmail.com",
                    Password = "PrintStation123"
                };
                smtp.EnableSsl = true;
                smtp.Send(mail);
            }

            Response.Redirect("Dashboard.aspx");
        }
   
        protected void MarkAsCompleteProduct(object sender, EventArgs e)
        {
            int id = int.Parse((sender as LinkButton).CommandArgument);

            string constr = ConfigurationManager.ConnectionStrings["PSConnectionString"].ConnectionString;


            using (SqlConnection con1 = new SqlConnection(constr))
            {
                using (SqlCommand cmd1 = new SqlCommand())
                {
                    cmd1.CommandText = "Select * from [Product] where ID=@ID";
                    cmd1.Parameters.AddWithValue("@ID", id);
                    cmd1.Connection = con1;
                    con1.Open();
                    SqlDataReader r1 = cmd1.ExecuteReader();
                    if (r1.Read())
                    {
                        Session["StuProductRegNo"] = r1.GetInt32(1);
                    }
                    r1.Close();
                }
            }

            using (SqlConnection con1 = new SqlConnection(constr))
            {
                using (SqlCommand com = new SqlCommand())
                {
                    com.CommandText = "Select * from [Student] where SRegNo='" + Session["StuProductRegNo"] + "'";
                    com.Connection = con1;
                    con1.Open();
                    SqlDataReader r1 = com.ExecuteReader();
                    if (r1.Read())
                    {
                        Session["StuMarkUsername"] = r1.GetString(2);
                        Session["StuMarkEmail"] = r1.GetString(4);
                    }
                    r1.Close();
                }
            }



            bool printchecker, productchecker;

            using (SqlConnection con = new SqlConnection(constr))
            {

                using (SqlCommand cmd2 = new SqlCommand())
                {
                    cmd2.CommandText = "SELECT * from [Prints] WHERE RegNo = '" + Session["StuProductRegNo"] + "' AND Status = 'Pending'";
                    cmd2.Connection = con;
                    con.Open();
                    SqlDataReader r3 = cmd2.ExecuteReader();
                    if (r3.Read())
                    {
                        printchecker = true;
                    }
                    else
                    {
                        printchecker = false;
                    }
                    r3.Close();
                    con.Close();
                }
            }

            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.CommandText = "UPDATE [Product] SET [Status]='Completed' WHERE ID=@ID";
                    cmd.Parameters.AddWithValue("@ID", id);
                    cmd.Connection = con;
                    con.Open();
                    cmd.ExecuteReader();
                    con.Close();
                }
            }

            using (SqlConnection con = new SqlConnection(constr))
            {

                using (SqlCommand cmd2 = new SqlCommand())
                {
                    cmd2.CommandText = "SELECT * from [Product] WHERE RegID = '" + Session["StuProductRegNo"] + "' AND Status = 'Pending'";
                    cmd2.Connection = con;
                    con.Open();
                    SqlDataReader r3 = cmd2.ExecuteReader();
                    if (r3.Read())
                    {
                        productchecker = true;
                    }
                    else
                    {
                        productchecker = false;
                    }
                    r3.Close();
                    con.Close();
                }
            }


            if (printchecker == false && productchecker == false)
            {
                MailMessage mail = new MailMessage();
                mail.To.Add(Session["StuMarkEmail"].ToString());
                mail.CC.Add(new MailAddress("avishkar1995@gmail.com"));
                mail.From = new MailAddress("printstation.team@gmail.com");
                mail.Subject = "PS: Order Complete";
                mail.Body = "Hello " + Session["StuMarkUsername"] + ",\n\nYour order has been completed and is now ready for collection from the stationery.\n\nRegards,\nPrintStation Team";


                SmtpClient smtp = new SmtpClient("smtp.gmail.com", 587);
                smtp.Credentials = new System.Net.NetworkCredential()
                {
                    UserName = "printstation.team@gmail.com",
                    Password = "PrintStation123"
                };
                smtp.EnableSsl = true;
                smtp.Send(mail);
            }

            Response.Redirect("Dashboard.aspx/#catalogue");
        }
    }
}
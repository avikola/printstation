using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PrintStation.Admin
{
    public partial class Recharge : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Username"] == null || Session["UserType"].ToString() != "Admin")
            {
                Response.Redirect("../Login.aspx");
            }
        }


        protected void rechargestudent(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\\Database1.mdf;Integrated Security=True");
            con.Open();

            SqlCommand com = new SqlCommand("select * from [Student] where SRegNo='" + rechargebox1.Text + "'", con);
            SqlDataReader r = com.ExecuteReader();
            if (r.Read())
            {
                Session["StuRechargeUsername"] = r.GetString(2);
                Session["StuRechargeEmail"] = r.GetString(4);
            }
            r.Close();

            SqlCommand com1 = new SqlCommand("UPDATE [Student] SET CreditsBal = CreditsBal +'" + rechargebox2.Text + "' WHERE SRegNo='" + rechargebox1.Text + "'", con);

            int a = com1.ExecuteNonQuery();
            if (a > 0)
            {

                MailMessage mail = new MailMessage();
                mail.To.Add(Session["StuRechargeEmail"].ToString());
                mail.CC.Add(new MailAddress("avishkar1995@gmail.com"));
                mail.From = new MailAddress("printstation.team@gmail.com");
                mail.Subject = "PS: ReCharge Successful!";
                mail.Body = "Hello " + Session["StuRechargeUsername"] + ",\n\n"+ rechargebox2.Text + " credits have been successfully added to your account.\n\nRegards,\nPrintStation Team";
                

                SmtpClient smtp = new SmtpClient("smtp.gmail.com", 587);
                smtp.Credentials = new System.Net.NetworkCredential()
                {
                    UserName = "printstation.team@gmail.com",
                    Password = "PrintStation123"
                };
                smtp.EnableSsl = true;
                smtp.Send(mail);
                Response.Write("<script> alert('" + rechargebox2.Text + " credits added to account: " + rechargebox1.Text + "'); window.location.href='Recharge.aspx'; </script>");
            }
            else
            {
                Response.Write("<script> alert('Error! Account: "+ rechargebox1.Text +" does not exist.'); window.location.href='Recharge.aspx'; </script>");
            }
            con.Close();
        }
    }
}
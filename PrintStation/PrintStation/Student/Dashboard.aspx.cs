using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.Office.Interop;
using Microsoft.Office.Interop.Word;
using iTextSharp.text.pdf;
using iTextSharp.text.xml;


namespace PrintStation.Student
{
    public partial class Dashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Username"] == null || Session["UserType"].ToString() != "Student")
            {
                Response.Redirect("../Login.aspx");
            }

            string suser = Session["Username"].ToString();
            bool printordcheck, productordcheck;
            SqlConnection con = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\\Database1.mdf;Integrated Security=True");
            con.Open();
            SqlCommand com = new SqlCommand("select * from [Student] where SRegNo='" + suser + "'", con);
            SqlDataReader r = com.ExecuteReader();
            if (r.Read())
            {
                Session["Sname"] = r.GetString(2);
                Session["Scred"] = r.GetInt32(6).ToString();
            }
            else
            {
                Response.Write("SNAME/SCRED ERROR");
            }
            r.Close();
            SqlCommand com1 = new SqlCommand("select * from [Prints] where RegNo='" + suser + "' and Status='In Cart'", con);
            SqlDataReader r1 = com1.ExecuteReader();
            if (r1.Read())
            {
                printordcheck = true;
            }
            else
            {
                printordcheck = false;
            }
            r1.Close();
            SqlCommand com2 = new SqlCommand("select * from [Product] where RegID='" + suser + "' and Status='In Cart'", con);
            SqlDataReader r2 = com2.ExecuteReader();
            if (r2.Read())
            {
                productordcheck = true;
            }
            else
            {
                productordcheck = false;
            }
            r2.Close();
            con.Close();

            if(printordcheck==true || productordcheck==true)
            {
                Label5.Attributes["style"] = "visibility: visible";
            }
            else
            {
                Label5.Attributes["style"] = "visibility: hidden";
            }

            uploadsuccess.Visible = (bool)Session["succ"];

            Session["succ"] = false;
            this.RegisterPostBackControl();
        }

        private void RegisterPostBackControl()
        {
            foreach (GridViewRow row in GridView2.Rows)
            {
                LinkButton lnkDownload = row.FindControl("lnkDownload") as LinkButton;
                ScriptManager.GetCurrent(this).RegisterPostBackControl(lnkDownload);
            }
        }

        protected void UploadFiles(object sender, EventArgs e)
        {
            try
            {
                if (FileUpload1.HasFile)
                {
                    string colour, sides, bind;
                    colour = DropDownList1.SelectedItem.Text;
                    sides = DropDownList2.SelectedItem.Text;
                    bind = DropDownList7.SelectedItem.Text;
                    int numberOfPages = 0;
                    double price = 0, multiplier;

                    string filename = Path.GetFileName(FileUpload1.PostedFile.FileName);
                    string contentType = FileUpload1.PostedFile.ContentType;

                    if (contentType != "application/pdf")
                    {
                        FileUpload1.SaveAs(Server.MapPath("~/Additional/files/") + FileUpload1.FileName);
                        var application = new Application();
                        
                        var document = application.Documents.Open(Server.MapPath("~/Additional/files/") + FileUpload1.FileName);
                        
                        numberOfPages = document.ComputeStatistics(WdStatistic.wdStatisticPages, false);

                        document.Close(null, null, null);
                        application.Quit();
                        GC.Collect();
                    }
                    else if (contentType == "application/pdf")
                    {
                        FileUpload1.SaveAs(Server.MapPath("~/Additional/files/") + FileUpload1.FileName);
                        PdfReader pdfReader = new PdfReader(System.IO.File.ReadAllBytes(Server.MapPath("~/Additional/files/") + FileUpload1.FileName));
                        numberOfPages = pdfReader.NumberOfPages;
                    }

                    if (colour == "Black & White")
                        multiplier = 5;
                    else
                        multiplier = 20;

                    if (sides == "Double Sided")
                        if (colour == "Black & White")
                            multiplier = multiplier + 5;
                        else
                            multiplier = multiplier + 10;

                    price = numberOfPages * multiplier;

                    if (bind == "Spiral Binding")
                        if (numberOfPages < 31)
                            price = price + 50;
                        else
                            price = price + 100;

                    if (bind == "Report Binding")
                            price = price + 200;

                    using (Stream fs = FileUpload1.PostedFile.InputStream)
                    {
                        using (BinaryReader br = new BinaryReader(fs))
                        {
                            byte[] bytes = br.ReadBytes((Int32)fs.Length);
                            string constr = ConfigurationManager.ConnectionStrings["PSConnectionString"].ConnectionString;
                            using (SqlConnection con = new SqlConnection(constr))
                            {
                                string query = "INSERT into Prints (RegNo,FileName,[File],FileType,Price,Status,Colour,Sides,Binding) values ('" + Session["Username"] + "', @FileName, @File, @FileType, @Price, 'In Cart', '" + colour + "', '" + sides + "', '" + bind + "')";
                                using (SqlCommand cmd = new SqlCommand(query))
                                {
                                    cmd.Connection = con;
                                    cmd.Parameters.AddWithValue("@FileName", filename);
                                    cmd.Parameters.AddWithValue("@File", bytes);
                                    cmd.Parameters.AddWithValue("@FileType", contentType);
                                    cmd.Parameters.AddWithValue("@Price", price);
                                    con.Open();
                                    cmd.ExecuteNonQuery();
                                    con.Close();
                                }
                            }
                        }
                    } 
                }


                if (FileUpload2.HasFile)
                {
                    string colour, sides, bind;
                    colour = DropDownList3.SelectedItem.Text;
                    sides = DropDownList4.SelectedItem.Text;
                    bind = DropDownList8.SelectedItem.Text;
                    int numberOfPages = 0;
                    double price = 0, multiplier;

                    string filename = Path.GetFileName(FileUpload2.PostedFile.FileName);
                    string contentType = FileUpload2.PostedFile.ContentType;

                    if (contentType != "application/pdf")
                    {
                        FileUpload2.SaveAs(Server.MapPath("~/Additional/files/") + FileUpload2.FileName);
                        var application = new Application();

                        var document = application.Documents.Open(Server.MapPath("~/Additional/files/") + FileUpload2.FileName);

                        numberOfPages = document.ComputeStatistics(WdStatistic.wdStatisticPages, false);

                        document.Close(null, null, null);
                        application.Quit();
                        GC.Collect();
                    }
                    else if (contentType == "application/pdf")
                    {
                        FileUpload2.SaveAs(Server.MapPath("~/Additional/files/") + FileUpload2.FileName);
                        PdfReader pdfReader = new PdfReader(System.IO.File.ReadAllBytes(Server.MapPath("~/Additional/files/") + FileUpload2.FileName));
                        numberOfPages = pdfReader.NumberOfPages;
                    }

                    if (colour == "Black & White")
                        multiplier = 5;
                    else
                        multiplier = 20;

                    if (sides == "Double Sided")
                        if (colour == "Black & White")
                            multiplier = multiplier + 5;
                        else
                            multiplier = multiplier + 10;

                    price = numberOfPages * multiplier;

                    if (bind == "Binding")
                        if (numberOfPages < 31)
                            price = price + 50;
                        else
                            price = price + 100;

                    using (Stream fs = FileUpload2.PostedFile.InputStream)
                    {
                        using (BinaryReader br = new BinaryReader(fs))
                        {
                            byte[] bytes = br.ReadBytes((Int32)fs.Length);
                            string constr = ConfigurationManager.ConnectionStrings["PSConnectionString"].ConnectionString;
                            using (SqlConnection con = new SqlConnection(constr))
                            {
                                string query = "INSERT into Prints (RegNo,FileName,[File],FileType,Price,Status,Colour,Sides,Binding) values ('" + Session["Username"] + "', @FileName, @File, @FileType, @Price, 'In Cart', '" + colour + "', '" + sides + "', '" + bind + "')";
                                using (SqlCommand cmd = new SqlCommand(query))
                                {
                                    cmd.Connection = con;
                                    cmd.Parameters.AddWithValue("@FileName", filename);
                                    cmd.Parameters.AddWithValue("@File", bytes);
                                    cmd.Parameters.AddWithValue("@FileType", contentType);
                                    cmd.Parameters.AddWithValue("@Price", price);
                                    con.Open();
                                    cmd.ExecuteNonQuery();
                                    con.Close();
                                }
                            }
                        }
                    }
                }



                if (FileUpload3.HasFile)
                {
                    string colour, sides, bind;
                    colour = DropDownList5.SelectedItem.Text;
                    sides = DropDownList6.SelectedItem.Text;
                    bind = DropDownList9.SelectedItem.Text;
                    int numberOfPages = 0;
                    double price = 0, multiplier;

                    string filename = Path.GetFileName(FileUpload3.PostedFile.FileName);
                    string contentType = FileUpload3.PostedFile.ContentType;

                    if (contentType != "application/pdf")
                    {
                        FileUpload3.SaveAs(Server.MapPath("~/Additional/files/") + FileUpload3.FileName);
                        var application = new Application();

                        var document = application.Documents.Open(Server.MapPath("~/Additional/files/") + FileUpload3.FileName);

                        numberOfPages = document.ComputeStatistics(WdStatistic.wdStatisticPages, false);

                        document.Close(null, null, null);
                        application.Quit();
                        GC.Collect();
                    }
                    else if (contentType == "application/pdf")
                    {
                        FileUpload3.SaveAs(Server.MapPath("~/Additional/files/") + FileUpload3.FileName);
                        PdfReader pdfReader = new PdfReader(System.IO.File.ReadAllBytes(Server.MapPath("~/Additional/files/") + FileUpload3.FileName));
                        numberOfPages = pdfReader.NumberOfPages;
                    }

                    if (colour == "Black & White")
                        multiplier = 5;
                    else
                        multiplier = 20;

                    if (sides == "Double Sided")
                        if (colour == "Black & White")
                            multiplier = multiplier + 5;
                        else
                            multiplier = multiplier + 10;

                    price = numberOfPages * multiplier;

                    if (bind == "Binding")
                        if (numberOfPages < 31)
                            price = price + 50;
                        else
                            price = price + 100;

                    using (Stream fs = FileUpload3.PostedFile.InputStream)
                    {
                        using (BinaryReader br = new BinaryReader(fs))
                        {
                            byte[] bytes = br.ReadBytes((Int32)fs.Length);
                            string constr = ConfigurationManager.ConnectionStrings["PSConnectionString"].ConnectionString;
                            using (SqlConnection con = new SqlConnection(constr))
                            {
                                string query = "INSERT into Prints (RegNo,FileName,[File],FileType,Price,Status,Colour,Sides,Binding) values ('" + Session["Username"] + "', @FileName, @File, @FileType, @Price, 'In Cart', '" + colour + "', '" + sides + "', '" + bind + "')";
                                using (SqlCommand cmd = new SqlCommand(query))
                                {
                                    cmd.Connection = con;
                                    cmd.Parameters.AddWithValue("@FileName", filename);
                                    cmd.Parameters.AddWithValue("@File", bytes);
                                    cmd.Parameters.AddWithValue("@FileType", contentType);
                                    cmd.Parameters.AddWithValue("@Price", price);
                                    con.Open();
                                    cmd.ExecuteNonQuery();
                                    con.Close();
                                }
                            }
                        }
                    }
                }
                Session["succ"] = true;
                Response.Redirect(Request.Url.AbsoluteUri);
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
           
        }

        protected void OnRowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                TableCell colour = e.Row.Cells[2];
                if (colour.Text.Contains("Black"))
                {
                    colour.Text = "B&W";
                }
                
                Label lblLabelWithToolTip = e.Row.FindControl("lblLabelWithToolTip") as Label;
                string strFullText = lblLabelWithToolTip.Text;

                if (lblLabelWithToolTip.Text.Length > 50)
                {
                    lblLabelWithToolTip.Text = lblLabelWithToolTip.Text.Substring(0, 45) + "...";
                }
                lblLabelWithToolTip.ToolTip = strFullText;
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



        protected void BlackPen(object sender, EventArgs e)
        {
            string quantity = Request.Form["quant[1]"];
            int qt = Convert.ToInt32(quantity);
            int tc = qt * 10;
            string constr = ConfigurationManager.ConnectionStrings["PSConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd3 = new SqlCommand())
                {
                    cmd3.CommandText = "INSERT INTO [Product] (RegID,ProductName,ProductPrice,ProductQuantity,TotalCost) VALUES ('" + Session["Username"] + "', 'Black Pen', 10, '"+qt+"', '"+tc+"');";
                    cmd3.Connection = con;
                    con.Open();
                    cmd3.ExecuteReader();
                    con.Close();
                }
            }
            ScriptManager.RegisterStartupScript(this,typeof(Dashboard),"Alert", "<script>alert('"+qt+" black pen(s) added to cart.'); location.reload();</script>", false);
        }

        protected void BluePen(object sender, EventArgs e)
        {
            string quantity = Request.Form["quant[2]"];
            int qt = Convert.ToInt32(quantity);
            int tc = qt * 10;
            string constr = ConfigurationManager.ConnectionStrings["PSConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd3 = new SqlCommand())
                {
                    cmd3.CommandText = "INSERT INTO [Product] (RegID,ProductName,ProductPrice,ProductQuantity,TotalCost) VALUES ('" + Session["Username"] + "', 'Blue Pen', 10, '" + qt + "', '" + tc + "');";
                    cmd3.Connection = con;
                    con.Open();
                    cmd3.ExecuteReader();
                    con.Close();
                }
            }
            ScriptManager.RegisterStartupScript(this, typeof(Dashboard), "Alert", "<script>alert('" + qt + " blue pen(s) added to cart.'); location.reload();</script>", false);
        }

        protected void Eraser(object sender, EventArgs e)
        {
            string quantity = Request.Form["quant[3]"];
            int qt = Convert.ToInt32(quantity);
            int tc = qt * 10;
            string constr = ConfigurationManager.ConnectionStrings["PSConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd3 = new SqlCommand())
                {
                    cmd3.CommandText = "INSERT INTO [Product] (RegID,ProductName,ProductPrice,ProductQuantity,TotalCost) VALUES ('" + Session["Username"] + "', 'Eraser', 10, '" + qt + "', '" + tc + "');";
                    cmd3.Connection = con;
                    con.Open();
                    cmd3.ExecuteReader();
                    con.Close();
                }
            }
            ScriptManager.RegisterStartupScript(this, typeof(Dashboard), "Alert", "<script>alert('" + qt + " eraser(s) added to cart.'); location.reload();</script>", false);
        }

        protected void Pencil(object sender, EventArgs e)
        {
            string quantity = Request.Form["quant[4]"];
            int qt = Convert.ToInt32(quantity);
            int tc = qt * 5;
            string constr = ConfigurationManager.ConnectionStrings["PSConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd3 = new SqlCommand())
                {
                    cmd3.CommandText = "INSERT INTO [Product] (RegID,ProductName,ProductPrice,ProductQuantity,TotalCost) VALUES ('" + Session["Username"] + "', 'Pencil', 5, '" + qt + "', '" + tc + "');";
                    cmd3.Connection = con;
                    con.Open();
                    cmd3.ExecuteReader();
                    con.Close();
                }
            }
            ScriptManager.RegisterStartupScript(this, typeof(Dashboard), "Alert", "<script>alert('" + qt + " pencil(s) added to cart.'); location.reload();</script>", false);
        }

        protected void Notebook(object sender, EventArgs e)
        {
            string quantity = Request.Form["quant[5]"];
            int qt = Convert.ToInt32(quantity);
            int tc = qt * 100;
            string constr = ConfigurationManager.ConnectionStrings["PSConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd3 = new SqlCommand())
                {
                    cmd3.CommandText = "INSERT INTO [Product] (RegID,ProductName,ProductPrice,ProductQuantity,TotalCost) VALUES ('" + Session["Username"] + "', 'Notebook', 100, '" + qt + "', '" + tc + "');";
                    cmd3.Connection = con;
                    con.Open();
                    cmd3.ExecuteReader();
                    con.Close();
                }
            }
            ScriptManager.RegisterStartupScript(this, typeof(Dashboard), "Alert", "<script>alert('" + qt + " notebook(s) added to cart.'); location.reload();</script>", false);
        }

        protected void Sharpener(object sender, EventArgs e)
        {
            string quantity = Request.Form["quant[6]"];
            int qt = Convert.ToInt32(quantity);
            int tc = qt * 30;
            string constr = ConfigurationManager.ConnectionStrings["PSConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd3 = new SqlCommand())
                {
                    cmd3.CommandText = "INSERT INTO [Product] (RegID,ProductName,ProductPrice,ProductQuantity,TotalCost) VALUES ('" + Session["Username"] + "', 'Sharpener', 30, '" + qt + "', '" + tc + "');";
                    cmd3.Connection = con;
                    con.Open();
                    cmd3.ExecuteReader();
                    con.Close();
                }
            }
            ScriptManager.RegisterStartupScript(this, typeof(Dashboard), "Alert", "<script>alert('" + qt + " sharpener(s) added to cart.'); location.reload();</script>", false);
        }

        protected void Stapler(object sender, EventArgs e)
        {
            string quantity = Request.Form["quant[7]"];
            int qt = Convert.ToInt32(quantity);
            int tc = qt * 90;
            string constr = ConfigurationManager.ConnectionStrings["PSConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd3 = new SqlCommand())
                {
                    cmd3.CommandText = "INSERT INTO [Product] (RegID,ProductName,ProductPrice,ProductQuantity,TotalCost) VALUES ('" + Session["Username"] + "', 'Stapler', 90, '" + qt + "', '" + tc + "');";
                    cmd3.Connection = con;
                    con.Open();
                    cmd3.ExecuteReader();
                    con.Close();
                }
            }
            ScriptManager.RegisterStartupScript(this, typeof(Dashboard), "Alert", "<script>alert('" + qt + " stapler(s) added to cart.'); location.reload();</script>", false);
        }

        protected void Tape(object sender, EventArgs e)
        {
            string quantity = Request.Form["quant[8]"];
            int qt = Convert.ToInt32(quantity);
            int tc = qt * 50;
            string constr = ConfigurationManager.ConnectionStrings["PSConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd3 = new SqlCommand())
                {
                    cmd3.CommandText = "INSERT INTO [Product] (RegID,ProductName,ProductPrice,ProductQuantity,TotalCost) VALUES ('" + Session["Username"] + "', 'Tape', 50, '" + qt + "', '" + tc + "');";
                    cmd3.Connection = con;
                    con.Open();
                    cmd3.ExecuteReader();
                    con.Close();
                }
            }
            ScriptManager.RegisterStartupScript(this, typeof(Dashboard), "Alert", "<script>alert('" + qt + " roll(s) of tape added to cart.'); location.reload();</script>", false);
        }

        protected void Scissors(object sender, EventArgs e)
        {
            string quantity = Request.Form["quant[9]"];
            int qt = Convert.ToInt32(quantity);
            int tc = qt * 40;
            string constr = ConfigurationManager.ConnectionStrings["PSConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd3 = new SqlCommand())
                {
                    cmd3.CommandText = "INSERT INTO [Product] (RegID,ProductName,ProductPrice,ProductQuantity,TotalCost) VALUES ('" + Session["Username"] + "', 'Scissors', 40, '" + qt + "', '" + tc + "');";
                    cmd3.Connection = con;
                    con.Open();
                    cmd3.ExecuteReader();
                    con.Close();
                }
            }
            ScriptManager.RegisterStartupScript(this, typeof(Dashboard), "Alert", "<script>alert('" + qt + " pair(s) of scissors added to cart.'); location.reload();</script>", false);
        }

        protected void Calculator(object sender, EventArgs e)
        {
            string quantity = Request.Form["quant[10]"];
            int qt = Convert.ToInt32(quantity);
            int tc = qt * 150;
            string constr = ConfigurationManager.ConnectionStrings["PSConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd3 = new SqlCommand())
                {
                    cmd3.CommandText = "INSERT INTO [Product] (RegID,ProductName,ProductPrice,ProductQuantity,TotalCost) VALUES ('" + Session["Username"] + "', 'Calculator', 150, '" + qt + "', '" + tc + "');";
                    cmd3.Connection = con;
                    con.Open();
                    cmd3.ExecuteReader();
                    con.Close();
                }
            }
            ScriptManager.RegisterStartupScript(this, typeof(Dashboard), "Alert", "<script>alert('" + qt + " calculator(s) added to cart.'); location.reload();</script>", false);
        }

        protected void Postits(object sender, EventArgs e)
        {
            string quantity = Request.Form["quant[11]"];
            int qt = Convert.ToInt32(quantity);
            int tc = qt * 50;
            string constr = ConfigurationManager.ConnectionStrings["PSConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd3 = new SqlCommand())
                {
                    cmd3.CommandText = "INSERT INTO [Product] (RegID,ProductName,ProductPrice,ProductQuantity,TotalCost) VALUES ('" + Session["Username"] + "', 'Post-Its', 50, '" + qt + "', '" + tc + "');";
                    cmd3.Connection = con;
                    con.Open();
                    cmd3.ExecuteReader();
                    con.Close();
                }
            }
            ScriptManager.RegisterStartupScript(this, typeof(Dashboard), "Alert", "<script>alert('" + qt + " stack(s) of post-its added to cart.'); location.reload();</script>", false);
        }
        
        protected void Paperclips(object sender, EventArgs e)
        {
            string quantity = Request.Form["quant[12]"];
            int qt = Convert.ToInt32(quantity);
            int tc = qt * 5;
            string constr = ConfigurationManager.ConnectionStrings["PSConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd3 = new SqlCommand())
                {
                    cmd3.CommandText = "INSERT INTO [Product] (RegID,ProductName,ProductPrice,ProductQuantity,TotalCost) VALUES ('" + Session["Username"] + "', 'Paper Clip', 5, '" + qt + "', '" + tc + "');";
                    cmd3.Connection = con;
                    con.Open();
                    cmd3.ExecuteReader();
                    con.Close();
                }
            }
            ScriptManager.RegisterStartupScript(this, typeof(Dashboard), "Alert", "<script>alert('" + qt + " paperclip(s) added to cart.'); location.reload();</script>", false);
        }

    }
}
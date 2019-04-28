<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="PrintStation.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="style.css?<?php echo time(); ?>" rel="stylesheet" />

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

    <link rel="icon" href="Additional/images/PrintStation%20Favicon.png" />
    <title>Log In</title>
    <script>
        window.onload = function () {
            document.getElementById("TextBox1").focus();
        };

         $(function () {
             $('[data-toggle="tooltip"]').tooltip()
         })

    </script>
</head>

<body>

        <div id="mininav" class="container-fluid">
            
            <div class="masthead clearfix">
            
            <div class="col-lg-12">
                <div class="inner">
                    <img class="masthead-brand" src="Additional/images/Manipal%20Logo.png" />

                    <a href="Home.aspx"><img id="PSLogo" src="Additional/images/PrintStation%20Mini%20Logo.png" /></a>
                </div>
             </div>

              <div id="FAQnav" class="inner col-md-12">
                    <ul class="nav masthead-nav">
                        <li>
                          <a href="Home.aspx">Home</a>
                        </li>
                        <li>
                          <a href="FAQ.aspx">FAQ<span class="glyphicon glyphicon-question-sign"></span></a>
                        </li>
                    </ul>
              </div>

            </div>

        </div>

  <div class="site-wrapper">
  <div class="site-wrapper-inner">
    <div class="cover-container">
     

            
    <form id="form1" runat="server" defaultbutton="Button2">

        <div class="row col-lg-12">
            <span id="whitetext2log"> <asp:Label ID="Label1" runat="server" Text="Username: "></asp:Label> </span>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ControlToValidate="TextBox1" Font-Size="30px" ForeColor="Red" ValidationGroup="loginvalid"></asp:RequiredFieldValidator>
            <span id="hometextbox"><asp:TextBox ID="TextBox1" runat="server" style="margin-left:10px; margin-right: 14px;" placeholder="Username" CssClass="form-control"></asp:TextBox></span>
        </div>

        <div class="row pushdown1 col-lg-12">
            <span id="whitetext2log"><asp:Label ID="Label2" runat="server" Text="Password:"></asp:Label></span>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" ControlToValidate="TextBox2" Font-Size="30px" ForeColor="Red" ValidationGroup="loginvalid"></asp:RequiredFieldValidator>
            <span id="hometextbox"> <asp:TextBox ID="TextBox2" runat="server" style="margin-left:13px;" TextMode="Password" placeholder="Password" CssClass="form-control"></asp:TextBox></span>
        </div>
       
        <div class="pushright row pushdown2 col-lg-3">
            <asp:Button ID="Button1" runat="server" Text="Cancel" CssClass="btn btn-lg cancelbutton homebutton" PostBackUrl="~/Home.aspx"/>
        </div>

        <div class="pushright row pushdown2 col-lg-9">
            <asp:Button ID="Button2" runat="server" Text="Login" CssClass="btn btn-lg loginbutton homebutton" OnClick="Button2_Click" ValidationGroup="loginvalid" />
        </div>

        
    </form>


      <div class="mastfoot">
        <div class="inner">
          <!-- Validation -->
           <p><span data-toggle="tooltip" data-placement="left" title="The Creators!">© 2017 Avishkar Kolahalu, Sreya Ratnika, Henisha Suru</span></p>
        </div>
      </div>


    </div>
</div>
</div>


        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:PSConnectionString %>" SelectCommand="SELECT * FROM [Login]"></asp:SqlDataSource>


</body>
</html>

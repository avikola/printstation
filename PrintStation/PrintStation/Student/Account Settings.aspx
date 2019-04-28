<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Account Settings.aspx.cs" Inherits="PrintStation.Student.Account_Settings" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">

    <link href="accountsettings.css?<?php echo time(); ?>" rel="stylesheet" />

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

    <link rel="icon" href="../Additional/images/PrintStation%20Favicon.png" />
    <title>Student - Account Settings</title>

    <script>
         $(function () {
             $('[data-toggle="tooltip"]').tooltip()
         })
    </script>

</head>
<body>

    <div id="mininav" class="container-fluid">
            
            <div class="masthead clearfix">
            
                <div class="col-lg-12">
                    <div id="bringtofront" class="inner">
                        <img class="masthead-brand" src="../Additional/images/Manipal%20Logo.png" />

                        <a href="Dashboard.aspx"><img id="PSLogo" src="../Additional/images/PrintStation%20Mini%20Logo.png" /></a>
                    </div>
                </div>


            </div>

        </div>

        <div class="site-wrapper">
            <div class="site-wrapper-inner">
                <div class="cover-container">
            
                    <div class="inner cover">
                        <div class="wholedashboard">


                                  <div class="row">

                                    <div class="col-md-6 col-md-offset-3">
                                        <h1 id="whitetext1" class="cover-heading">Account<span style= "color: #FC622F">Settings</span></h1>
                                    </div>

                                    <div class="col-md-3">
                                        <!-- Single button -->
                                        <div class="btn-group logoutposition">
                                          <button type="button" class="btn btn-default dropdown-toggle logoutbutton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                            Hey, <%:Session["Sname"]%> <span class="caret"></span>
                                          </button>
                                          <ul class="dropdown-menu logoutbutton">
                                            <li><a href="Dashboard.aspx">Dashboard</a></li>
                                            <li><a href="Cart.aspx">Shopping Cart</a></li>
                                            <li><a href="Card Payment.aspx">Recharge</a></li>
                                            <li role="separator" class="divider logoutsep"></li>
                                            <li><a href="../Login.aspx">Logout</a></li>
                                          </ul>
                                        </div>
                    
                                    </div>


                                    <div class="col-md-8 credpos">
                                        <asp:Label ID="Label1" runat="server" Text="Credits Remaining: " CssClass="remcredits"></asp:Label><%:Session["Scred"]%>
                                    </div>


                                </div>



                            <div class="student_dashboard">
                                <div class="container settingspos">

                                    <div class="row">
                                        <div class= "col-md-offset-2 col-md-4 settingsleft">
                                            <asp:Label ID="Label2" runat="server" Text="Registration Number (Username): "></asp:Label>
                                        </div>
                                        <div class= "col-md-3 settingsright">
                                            <span class="settingstextright"><%:Session["Username"]%></span>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class= "col-md-offset-2 col-md-4 settingsleft">
                                            <asp:Label ID="Label9" runat="server" Text="Password: "></asp:Label>
                                        </div>
                                        <div class= "col-md-3 settingsright">
                                            <span class="settingstextright"><a style= "color: #FC622F; " href="Change Password.aspx">(change password) </a><%:Session["UserPassword"]%></span>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class= "col-md-offset-2 col-md-4 settingsleft">
                                            <asp:Label ID="Label3" runat="server" Text="Name: "></asp:Label>
                                        </div>
                                        <div class= "col-md-3 settingsright">
                                            <span class="settingstextright"><%:Session["Sname"]%></span>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class= "col-md-offset-2 col-md-4 settingsleft">
                                            <asp:Label ID="Label4" runat="server" Text="Department: "></asp:Label>
                                        </div>
                                        <div class= "col-md-3 settingsright">
                                            <span class="settingstextright"><%:Session["sdept"]%></span>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class= "col-md-offset-2 col-md-4 settingsleft">
                                            <asp:Label ID="Label5" runat="server" Text="E-mail: "></asp:Label>
                                        </div>
                                        <div class= "col-md-3 settingsright">
                                            <span class="settingstextright"><%:Session["semail"]%></span>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class= "col-md-offset-2 col-md-4 settingsleft">
                                            <asp:Label ID="Label6" runat="server" Text="Mobile: "></asp:Label>
                                        </div>
                                        <div class= "col-md-3 settingsright">
                                            <span class="settingstextright"><%:Session["smobile"]%></span>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class= "col-md-offset-2 col-md-4 settingsleft">
                                            <asp:Label ID="Label7" runat="server" Text="Credit Balance: "></asp:Label>
                                        </div>
                                        <div class= "col-md-3 settingsright">
                                            <span class="settingstextright"><a style= "color: #FC622F; " href="Card Payment.aspx">(recharge) </a><%:Session["Scred"]%></span>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class= "col-md-offset-2 col-md-4 settingsleft">
                                            <asp:Label ID="Label8" runat="server" Text="Credits Spent: "></asp:Label>
                                        </div>
                                        <div class= "col-md-3 settingsright">
                                            <span class="settingstextright"><%:Session["sspent"]%></span>
                                        </div>
                                    </div>


                                </div>
                            </div>



                        </div>
                    </div>
                </div>

            </div>
        </div>





</body>
</html>

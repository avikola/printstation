<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Checkout.aspx.cs" Inherits="PrintStation.Faculty.Checkout" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <link href="accountsettings.css?<?php echo time(); ?>" rel="stylesheet" />

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

    <link rel="icon" href="../Additional/images/PrintStation%20Favicon.png" />
    <title>Faculty - Checkout</title>

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
                                    <h1 id="whitetext1" class="cover-heading">Check<span style= "color: #FC622F">Out</span></h1>
                                </div>

                                <div class="col-md-3">
                                    <!-- Single button -->
                                    <div class="btn-group logoutposition">
                                      <button type="button" class="btn btn-default dropdown-toggle logoutbutton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        Hello, <%:Session["Fname"]%> <span class="caret"></span>
                                      </button>
                                      <ul class="dropdown-menu logoutbutton">
                                        <li><a href="Dashboard.aspx">Dashboard</a></li>
                                        <li><a href="Account Settings.aspx">Account Details</a></li>
                                        <li><a href="Cart.aspx">Shopping Cart</a></li>
                                        <li role="separator" class="divider logoutsep"></li>
                                        <li><a href="../Login.aspx">Logout</a></li>
                                      </ul>
                                    </div>
                    
                                </div>


                            </div>


                            <div class="student_dashboard">


                            </div>

                        </div>
                    </div>
                </div>

            </div>
        </div>

</body>
</html>

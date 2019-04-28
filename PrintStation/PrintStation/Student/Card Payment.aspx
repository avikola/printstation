<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Card Payment.aspx.cs" Inherits="PrintStation.Student.Card_Payment" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">

    <link href="accountsettings.css?<?php echo time(); ?>" rel="stylesheet" />

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

    <link rel="icon" href="../Additional/images/PrintStation%20Favicon.png" />
    <title>Student - Card Payment</title>

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
                                        <h1 id="whitetext1" class="cover-heading">Re<span style= "color: #FC622F">Charge</span></h1>
                                    </div>

                                    <div class="col-md-3">
                                        <!-- Single button -->
                                        <div class="btn-group logoutposition">
                                          <button type="button" class="btn btn-default dropdown-toggle logoutbutton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                            Hey, <%:Session["Sname"]%> <span class="caret"></span>
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


                                    <div class="col-md-8 credpos">
                                        <asp:Label ID="Label1" runat="server" Text="Credits Remaining: " CssClass="remcredits"></asp:Label><%:Session["Scred"]%>
                                    </div>


                                </div>



                            <div class="student_dashboard" style="height: 450px">
                                
                                <form id="form1" runat="server">

                                <div class="row">
                                    <h3>Recharge Payment Method:</h3>
                                </div>

                                <div class="row">
                                    <asp:RadioButtonList ID="RadioButtonList1" CssClass="payments" runat="server" ValidationGroup="radioset" RepeatDirection="Horizontal" RepeatLayout="Flow">
                                        <asp:ListItem Text="Visa" Value="Visa"></asp:ListItem>
                                        <asp:ListItem Text="Mastercard" Value="Mastercard"></asp:ListItem>
                                        <asp:ListItem Text="PayPal" Value="PayPal"></asp:ListItem>
                                        <asp:ListItem Text="CashU" Value="CashU"></asp:ListItem>
                                    </asp:RadioButtonList>
                                </div>

                                <div style="margin-top: 5px; margin-bottom: -15px;">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please Select a Payment Method." ControlToValidate="RadioButtonList1" ValidationGroup="radioset" ForeColor="Red"></asp:RequiredFieldValidator>
                                </div>

                                <div class="row">
                                    <div class="col-md-6">
                                        <asp:Button ID="Button2" runat="server" Text="Continue" CssClass="btn btn-default Button3" PostBackUrl="~/Placeholder.aspx" ValidationGroup="radioset" />
                                    </div>
                                </div>

                                </form>

                            </div>


                        </div>
                    </div>
                </div>

            </div>
        </div>



</body>
</html>

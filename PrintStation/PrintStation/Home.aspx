<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="PrintStation.Student.Home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <link href="style.css?<?php echo time(); ?>" rel="stylesheet" />

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

    <link rel="icon" href="Additional/images/PrintStation%20Favicon.png" />
    <title>Home</title>
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
                <div class="inner">
                    <img class="masthead-brand" src="Additional/images/Manipal%20Logo.png" />

                    <a href="Home.aspx"><img id="PSLogo" src="Additional/images/PrintStation%20Mini%20Logo.png" /></a>
                </div>
             </div>

              <div id="FAQnav" class="inner col-md-12">
                    <ul class="nav masthead-nav">
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
     

            
      <div class="inner cover">
        <div class="reposition">
            <h1 id="whitetext1" class="cover-heading">Print<span style=" color: #FC622F">Station</span></h1>

            <p id="whitetext2" class="lead">Your Printing Requirements, Made Easy.</p>

            <p id="whitetext3" class="lead">PrintStation will help you streamline your process of printing and shopping for stationery.<br />Save time by saying no to long queues and use PrintStation to order the printing of your documents and the stationery that you need online.<br /> </p>

            <p class="lead"><a class="btn btn-lg homebutton" href="Login.aspx">Log In</a></p>
        </div>
      </div>


      <div class="mastfoot">
        <div class="inner">
          <!-- Validation -->
          <p><span data-toggle="tooltip" data-placement="left" title="The Creators!">© 2017 Avishkar Kolahalu, Sreya Ratnika, Henisha Suru</span></p>
        </div>
      </div>


    </div>
</div>
</div>


</body>

</html>

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FAQ.aspx.cs" Inherits="PrintStation.FAQ" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="style.css?<?php echo time(); ?>" rel="stylesheet" />

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

    <link rel="icon" href="Additional/images/PrintStation%20Favicon.png" />
    <title>FAQ</title>
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
                              <a href="Home.aspx">Home</a>
                            </li>
                        </ul>
                  </div>
                  

            </div>

        </div>




    <div class="site-wrapper">
      <div class="site-wrapper-inner">
        <div class="cover-container">
          <div class="inner cover">
            <div class="panel FAQpanel">
                <h1 id="FAQtext">Frequently Asked Questions</h1>
            </div>

            <div class="FAQs">
            <div class="panel-group row col-lg-12" id="accordion" role="tablist" aria-multiselectable="true">

            <!--Account-->

            <div class="panel-group col-lg-6" id="accordion" role="tablist" aria-multiselectable="true">
                        
                        <div class="panel panel-primary">
                                <a class="collapsed panellink" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseAccount" aria-expanded="true" aria-controls="collapseAccount">
                                    <div class="panel-heading" role="tab" id="headingAccount">
                                        <h4 class="panel-title">Account</h4>
                                    </div>
                                </a>

                                <div id="collapseAccount" class="panel-collapse collapse outerpanel" role="tabpanel" aria-labelledby="headingAccount">
                                  <div class="panel-body">

                                      <div class="panel panel-primary">

                                        <a class="collapsed panellink" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="false" aria-controls="collapseOne">
                                            <div class="panel-heading" role="tab" id="headingOne">
                                                <h4 class="panel-title">How do I create an account?</h4>
                                            </div>
                                        </a>

                                        <div id="collapseOne" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingOne">
                                          <div class="panel-body">
                                            Your e-mail ID and default password would be provided to you by the University.
                                          </div>
                                        </div>

                                    </div>

                                      <div class="panel panel-primary">

                                        <a class="collapsed panellink"  role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                                            <div class="panel-heading" role="tab" id="headingTwo">
                                                <h4 class="panel-title">Can I use another e-mail account instead?</h4>
                                            </div>
                                        </a>

                                        <div id="collapseTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo">
                                          <div class="panel-body">
                                            No, you must use the official university email ID to access the service.
                                          </div>
                                        </div>

                                      </div>

                                      <div class="panel panel-primary">

                                        <a class="collapsed panellink"  role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                                            <div class="panel-heading" role="tab" id="headingThree">
                                                <h4 class="panel-title">How do I change my password?</h4>
                                            </div>
                                        </a>

                                        <div id="collapseThree" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingThree">
                                          <div class="panel-body">
                                            You can do so using the Account Settings section on your profile.
                                          </div>
                                        </div>

                                      </div>
                          
                                  </div>
                                </div>
                        </div>  
              </div>


              <!--Printing-->

              <div class="panel-group col-lg-6" id="accordion" role="tablist" aria-multiselectable="true">
                        
                        <div class="panel panel-primary">
                                <a class="collapsed panellink" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapsePrinting" aria-expanded="true" aria-controls="collapsePrinting">
                                    <div class="panel-heading" role="tab" id="headingPrinting">
                                        <h4 class="panel-title">Printing</h4>
                                    </div>
                                </a>

                                <div id="collapsePrinting" class="panel-collapse collapse outerpanel" role="tabpanel" aria-labelledby="headingPrinting">
                                  <div class="panel-body">

                          <div class="panel panel-primary">
                            
                            <a class="collapsed panellink"  role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseFour" aria-expanded="false" aria-controls="collapseFour">
                            <div class="panel-heading" role="tab" id="headingFour">
                              <h4 class="panel-title">Is there a file size limit for uploading documents to print?</h4>
                            </div>
                            </a>

                            <div id="collapseFour" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingThree">
                              <div class="panel-body">
                                Yes, the file size limit is 15MB.
                              </div>
                            </div>
                          
                          </div>

                          <div class="panel panel-primary">

                            <a class="collapsed panellink"  role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseFive" aria-expanded="false" aria-controls="collapseFive">
                                <div class="panel-heading" role="tab" id="headingFive">
                                    <h4 class="panel-title">How do I collect my printouts?</h4>
                                </div>
                            </a>
                            
                            <div id="collapseFive" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingThree">
                              <div class="panel-body">
                                Once you have placed your order and received confirmation you can collect your printouts from the Photocopy Centre.
                              </div>
                            </div>

                          </div>
                                  
                                  </div>
                                </div>
                        </div>
              </div>

              </div>
              <div class="panel-group row col-lg-12" id="accordion" role="tablist" aria-multiselectable="true">

              <!--Stationery-->

              <div class="panel-group col-lg-6" id="accordion" role="tablist" aria-multiselectable="true">
                  
                <div class="panel panel-primary">
                        <a class="collapsed panellink" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseStationery" aria-expanded="true" aria-controls="collapseStationery">
                            <div class="panel-heading" role="tab" id="headingStationery">
                                <h4 class="panel-title">Stationery</h4>
                            </div>
                        </a>

                        <div id="collapseStationery" class="panel-collapse collapse outerpanel" role="tabpanel" aria-labelledby="headingStationery">
                            <div class="panel-body">

                               
                                <div class="panel panel-primary">

                                        <a class="collapsed panellink"  role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseSix" aria-expanded="false" aria-controls="collapseSix">
                                            <div class="panel-heading" role="tab" id="headingSix">
                                                <h4 class="panel-title">Is there a limit on the number of stationery items we can buy?</h4>
                                            </div>
                                        </a>

                                        <div id="collapseSix" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingThree">
                                          <div class="panel-body">
                                            No, we do not impose a limit on the number of stationery items you can buy. The only limitation is the stock quantity of a particular item available.
                                          </div>
                                        </div>

                                </div>

                                <div class="panel panel-primary">

                                        <a class="collapsed panellink"  role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseSeven" aria-expanded="false" aria-controls="collapseSeven">
                                            <div class="panel-heading" role="tab" id="headingSeven">
                                                <h4 class="panel-title">How do I collect my stationery?</h4>
                                            </div>
                                        </a>
                                
                                        <div id="collapseSeven" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingThree">
                                          <div class="panel-body">
                                            Once you have placed your order and received confirmation you can collect your stationery items from the Photocopy Centre.
                                          </div>
                                        </div>

                                </div>

                                <div class="panel panel-primary">
                                
                                        <a class="collapsed panellink"  role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseEight" aria-expanded="false" aria-controls="collapseEight">
                                            <div class="panel-heading " role="tab" id="headingEight">
                                                <h4 class="panel-title">How often do you restock?</h4>
                                            </div>
                                        </a>
                                
                                        <div id="collapseEight" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingThree">
                                          <div class="panel-body">
                                            We restock every week.
                                          </div>
                                        </div>

                                </div>

                            </div>
                        </div>

                    </div>
            </div>

              <!--Payments - STUDENTS-->

              <div class="panel-group col-lg-6" id="accordion" role="tablist" aria-multiselectable="true">

                <div class="panel panel-primary">
                        <a class="collapsed panellink" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapsePayment" aria-expanded="true" aria-controls="collapsePayment">
                            <div class="panel-heading" role="tab" id="headingPayment">
                                <h4 class="panel-title">Payment</h4>
                            </div>
                        </a>

                        <div id="collapsePayment" class="panel-collapse collapse outerpanel" role="tabpanel" aria-labelledby="headingPayment">
                            <div class="panel-body">
                            
                                <div class="panel panel-primary">

                                    <a class="collapsed panellink"  role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseNine" aria-expanded="false" aria-controls="collapseNine">
                                        <div class="panel-heading" role="tab" id="headingNine">
                                            <h4 class="panel-title">How do I get Credits?</h4>
                                        </div>
                                    </a>

                                    <div id="collapseNine" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingThree">
                                        <div class="panel-body">
                                        When you first sign in, you will get <strong>100</strong> credits. After which you will have to purchase more credits to place orders.
                                        </div>
                                    </div>

                                </div>

                                <div class="panel panel-primary">

                                    <a class="collapsed panellink"  role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseTen" aria-expanded="false" aria-controls="collapseTen">
                                        <div class="panel-heading" role="tab" id="headingTen">
                                            <h4 class="panel-title">Can I pay Cash on Delivery?</h4>
                                        </div>
                                    </a>
                                    <div id="collapseTen" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingThree">
                                        <div class="panel-body">
                                        No, we do not accept cash.
                                        </div>
                                    </div>

                                </div>

                            </div>
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

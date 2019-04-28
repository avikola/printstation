<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="PrintStation.Student.Cart" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <link href="accountsettings.css?<?php echo time(); ?>" rel="stylesheet" />

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

    <link rel="icon" href="../Additional/images/PrintStation%20Favicon.png" />
    <title>Student - Cart</title>

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
                                        <h1 id="whitetext1" class="cover-heading">Shopping<span style= "color: #FC622F">Cart</span></h1>
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
                                <form id="form1" runat="server">
                                <h3 class="cartprint">Prints:</h3>
                                <h3 class="cartproduct">Products:</h3>
                                <div id="outercase" class="col-md-12">
                                    <div id="packitin" class="row">
                                        <div id="printreceipts" class="col-md-3" style="height:375px; overflow:scroll; overflow-x:hidden; width: 600px;">
                                    
                                                <asp:ListView DataKeyNames="PrintID" ID="ListView1" runat="server" DataSourceID="SqlDataSource1" OnItemDeleted="ListView2_ItemDeleted">
                                        
                                                <ItemTemplate>
                                                <table align="center">
                                                    <tr runat="server" >
                                                        <td >
                                                            <br />
                                                            <asp:Label ID="FileName1" ForeColor="#FC622F" runat="server" Text='<%#Eval("FileName")%>' OnLoad="costchanges" />
                                                            <br />
                                                            <asp:Label ID="Colour1" runat="server" Text='<%#Eval("Colour") %>' />
                                                            <br />
                                                            <asp:Label ID="Sides1" runat="server" Text='<%#Eval("Sides") %>' />
                                                            <br />
                                                            <asp:Label ID="Binding1" runat="server" Text='<%#Eval("Binding") %>' />
                                                            <br />
                                                            <asp:Label ID="Price1" runat="server" Text='<%#string.Concat("Cost: ", Eval("Price"))%>' />
                                                            <br />
                                                            <asp:LinkButton ID="DeletePrints" runat="server" ForeColor="Red" Font-Size="13px" CommandName="Delete">Delete Order</asp:LinkButton>
                                                        </td>
                                                    </tr>
                                                </table>
                                                <br />
                                                </ItemTemplate>
                                                <LayoutTemplate>
                                                    <div style="padding-left:70px; font-size: 15px;">
                                                        <table>
                                                            <tr>
                                                            <td>
                                                                <table>
                                                                    <asp:PlaceHolder runat="server" ID="itemPlaceHolder"></asp:PlaceHolder>
                                                                </table>
                                                            </td>
                                                            </tr>
                                                        </table>
                                                    </div>
                                                </LayoutTemplate>
                                                <EmptyDataTemplate>
                                                    <table class="emptyTable">
                                                        <tr>
                                                            <td>
                                                            You do not have any print orders placed.
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </EmptyDataTemplate>

                                                </asp:ListView>
                                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:PSConnectionString %>" SelectCommand="SELECT * FROM [Prints] WHERE ([RegNo] = @RegNo) AND ([Status] = 'In Cart') ORDER BY [Time]" DeleteCommand="DELETE FROM [Prints] WHERE [PrintID] = @PrintID" >
                                                    <DeleteParameters>
                                                        <asp:Parameter Name="PrintID" Type="Int32" />
                                                    </DeleteParameters>
                                                    <SelectParameters>
                                                        <asp:SessionParameter Name="RegNo" SessionField="Username" Type="Int32" />
                                                    </SelectParameters>
                                                </asp:SqlDataSource>
                                        </div>

                                        <div id="productreceipts" class="col-md-3" style="height:375px; overflow:scroll; overflow-x:hidden;">

                                                <asp:ListView ID="ListView2" DataKeyNames="ID" runat="server" DataSourceID="SqlDataSource2" OnItemDeleted="ListView2_ItemDeleted">
                                        
                                                <ItemTemplate>
                                                <table align="center">
                                                    <tr runat="server" >
                                                        <td >
                                                            <br />
                                                            <asp:Label ID="ProductName1" ForeColor="#FC622F" runat="server" Text='<%#Eval("ProductName")%>' OnLoad="costchanges" />
                                                            <br />
                                                            <asp:Label ID="ProductQuantity1" runat="server" Text='<%#string.Concat("Quantity: ", Eval("ProductQuantity"))%>' />
                                                            <asp:Label ID="ProductPrice1" runat="server" Text='<%#string.Concat("Cost/Unit: ", Eval("ProductPrice"))%>' />
                                                            <br />
                                                            <asp:Label ID="TotalProductPrice" runat="server" Text='<%#string.Concat("Total Cost: ", Eval("TotalCost"))%>' />
                                                            <br />
                                                            <asp:LinkButton ID="DeleteProducts" runat="server" ForeColor="Red" Font-Size="13px"  CommandName="Delete">Delete Order</asp:LinkButton>
                                                        </td>
                                                    </tr>
                                                </table>
                                                <br />
                                                </ItemTemplate>
                                                <LayoutTemplate>
                                                    <div style="padding-left:50px; font-size: 15px;">
                                                        <table>
                                                            <tr>
                                                            <td>
                                                                <table>
                                                                    <asp:PlaceHolder runat="server" ID="itemPlaceHolder"></asp:PlaceHolder>
                                                                </table>
                                                            </td>
                                                            </tr>
                                                        </table>
                                                    </div>
                                                </LayoutTemplate>
                                                <EmptyDataTemplate>
                                                    <table class="emptyTable">
                                                        <tr>
                                                            <td>
                                                            You do not have any catalogue orders placed.
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </EmptyDataTemplate>

                                                </asp:ListView>
                                                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:PSConnectionString %>" SelectCommand="SELECT * FROM [Product] WHERE (([RegID] = @RegID) AND [Status] = 'In Cart') ORDER BY [Time]" DeleteCommand="DELETE FROM [Product] WHERE ([ID] = @ID)" >
                                                    <DeleteParameters>
                                                        <asp:Parameter Name="ID" Type="Int32" />
                                                    </DeleteParameters>
                                                    <SelectParameters>
                                                        <asp:SessionParameter Name="RegID" SessionField="Username" Type="Int32" />
                                                    </SelectParameters>
                                                </asp:SqlDataSource>
                                        </div>

                                        <div class="col-md-3">
                                            <div class="endcosts">
                                                <asp:Label ID="PrintCost" runat="server" Text="Label" OnLoad="costchanges"></asp:Label>
                                                <br />
                                                <asp:Label ID="ProductCost" runat="server" Text="Label"></asp:Label>
                                                <br />
                                                <br />
                                                <asp:Label ID="TheTotalCost" ForeColor="#00cc00" runat="server" Text="Label"></asp:Label>
                                                <br />
                                            </div>
                                            <asp:Button ID="SubmitCart" runat="server" Text="Confirm Orders" OnClick="ChangetoPend" data-loading-text="Confirming..." CssClass="btn btn-lg btn-primary col-md-12"/>
                                            <asp:Label ID="Insufficient" ForeColor="red" runat="server" Text="Insufficient Credits!<br />Please ReCharge or Delete Items from Cart." Visible="false"></asp:Label>
                                        </div>
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

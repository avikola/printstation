<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="PrintStation.Faculty.Cart" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <link href="accountsettings.css?<?php echo time(); ?>" rel="stylesheet" />

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

    <link rel="icon" href="../Additional/images/PrintStation%20Favicon.png" />
    <title>Faculty - Cart</title>

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
                                        Hello, <%:Session["Fname"]%> <span class="caret"></span>
                                      </button>
                                      <ul class="dropdown-menu logoutbutton">
                                        <li><a href="Dashboard.aspx">Dashboard</a></li>
                                        <li><a href="Account Settings.aspx">Account Details</a></li>
                                        <li role="separator" class="divider logoutsep"></li>
                                        <li><a href="../Login.aspx">Logout</a></li>
                                      </ul>
                                    </div>
                    
                                </div>


                            </div>


                            <div class="student_dashboard">
    
                                <form id="form1" runat="server">
                                <h3 class="cartprint">Prints:</h3>
                                <h3 class="cartproduct">Products:</h3>
                                <div id="outercase" class="col-md-12">
                                    <div id="packitin" class="row">
                                        <div id="printreceipts" class="col-md-3" style="height:375px; overflow:scroll; overflow-x:hidden; width: 600px;">
                                    
                                            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                                            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                              <ContentTemplate>
                                                <asp:ListView DataKeyNames="PrintID" ID="ListView1" runat="server" DataSourceID="SqlDataSource1">
                                        
                                                <ItemTemplate>
                                                <table align="center">
                                                    <tr runat="server" >
                                                        <td >
                                                            <br />
                                                            <asp:Label ID="FileName1" ForeColor="#FC622F" runat="server" Text='<%#Eval("FileName")%>' />
                                                            <br />
                                                            <asp:Label ID="Colour1" runat="server" Text='<%#Eval("Colour") %>' />
                                                            <br />
                                                            <asp:Label ID="Sides1" runat="server" Text='<%#Eval("Sides") %>' />
                                                            <br />
                                                            <asp:Label ID="Binding1" runat="server" Text='<%#Eval("Binding") %>' />
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
                                              </ContentTemplate>
                                            </asp:UpdatePanel>
                                        </div>

                                        <div id="productreceipts" class="col-md-3" style="height:375px; overflow:scroll; overflow-x:hidden;">

                                            <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                              <ContentTemplate>
                                                <asp:ListView ID="ListView2" DataKeyNames="ID" runat="server" DataSourceID="SqlDataSource2">
                                        
                                                <ItemTemplate>
                                                <table align="center">
                                                    <tr runat="server" >
                                                        <td >
                                                            <br />
                                                            <asp:Label ID="ProductName1" ForeColor="#FC622F" runat="server" Text='<%#Eval("ProductName")%>' />
                                                            <br />
                                                            <asp:Label ID="ProductQuantity1" runat="server" Text='<%#string.Concat("Quantity: ", Eval("ProductQuantity"))%>' />
                                                            <br />
                                                            <asp:LinkButton ID="DeleteProducts" runat="server" ForeColor="Red" Font-Size="13px"  CommandName="Delete">Delete Order</asp:LinkButton>
                                                        </td>
                                                    </tr>
                                                </table>
                                                <br />
                                                </ItemTemplate>
                                                <LayoutTemplate>
                                                    <div style="padding-left:110px; font-size: 16px;">
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
                                              </ContentTemplate>
                                            </asp:UpdatePanel>
                                        </div>

                                        <div class="col-md-3">
                                            <asp:Button ID="Button1" runat="server" Text="Confirm Orders" OnClick="ChangetoPend" data-loading-text="Confirming..." CssClass="btn btn-lg btn-primary col-md-12"/>
                                        </div>
                                    </div>
                                </div>
                                
                                </form>
                            </div>
                                <script>
                                    $('#myButton').on('click', function () {
                                    var $btn = $(this).button('loading')
                                    // business logic...
                                    $btn.button('reset')
                                    })
                                </script>

                        </div>
                    </div>
                </div>

            </div>
        </div>


</body>
</html>

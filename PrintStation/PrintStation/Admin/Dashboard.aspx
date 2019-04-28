<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="PrintStation.Admin.Dashboard" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <link href="accountsettings.css?<?php echo time(); ?>" rel="stylesheet" />

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

    <link rel="icon" href="../Additional/images/PrintStation%20Favicon.png" />
        <title>Admin - Dashboard</title>

    <script>
         var time = new Date().getTime();
         $(document.body).bind("mousemove keypress", function(e) {
             time = new Date().getTime();
         });

         function refresh() {
             if(new Date().getTime() - time >= 60000) 
                 window.location.reload(true);
             else 
                 setTimeout(refresh, 10000);
         }

         setTimeout(refresh, 10000);

         function pageref()
         {
                location.reload();
         }
    </script>


</head>
<body>


        <div id="mininav" class="container-fluid">
            
            <div class="masthead clearfix">
            
                <div class="col-lg-12">
                    <div class="inner">
                        <p style="margin-left: 40px">
                        <img class="masthead-brand" src="../Additional/images/Manipal%20Logo.png" />

                        <a href="Dashboard.aspx"><img id="PSLogo" src="../Additional/images/PrintStation%20Mini%20Logo.png" /></a>
                        </p>
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
                                    <h1 id="whitetext1" class="cover-heading">Admin<span style= "color: #FC622F">Dashboard</span></h1>
                                </div>

                                <div class="col-md-3">
                                    <!-- Single button -->
                                    <div class="btn-group logoutposition">
                                      <button type="button" class="btn btn-default dropdown-toggle logoutbutton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        Hello, <%:Session["Aname"]%> <span class="caret"></span>
                                      </button>
                                      <ul class="dropdown-menu logoutbutton">
                                        <li><a href="Account Settings.aspx">Account Details</a></li>
                                        <li><a href="Recharge.aspx">Recharge</a></li>
                                        <li role="separator" class="divider logoutsep"></li>
                                        <li><a href="../Home.aspx">Logout</a></li>
                                      </ul>
                                    </div>

                                </div>

                                <div class="col-md-8 credpos">
                                    <button type="button" onclick="pageref();" class="remcredits btn btn-link" style="text-shadow: none; font-weight: 800; text-decoration: underline; color: black; ">(Refresh Page)</button>
                                </div>

                            </div>


                            <div class="student_dashboard">

                            


                            <ul class="nav nav-tabs" id="mainTabs">
                                <li class="active"><a id="lefttab" data-toggle="tab" href="#print">Print Orders(<asp:Label ID="Label1" runat="server" Text=""></asp:Label>)</a></li>
                                <li><a id="righttab" data-toggle="tab" href="#catalogue">Catalogue Orders(<asp:Label ID="Label2" runat="server" Text=""></asp:Label>&nbsp&nbsp&nbsp&nbsp)</a></li>
                            </ul>
    
                            <form id="form1" runat="server">
                            <div class="tab-content row">

                                <div id="print" class="tab-pane fade in active">

                                    <div class="catcontainer">
                                        
                                        <div class="row">
                                            <div id="setover" class="col-md-12">
                                                <h3 class="comph33">Pending Orders</h3>
                                                <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                                                <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                                                    <ContentTemplate>
                                                        <asp:GridView ID="GridView3" DataKeyNames="PrintID" ViewStateMode="Enabled" ShowHeaderWhenEmpty="True" EmptyDataText="No Records Found" HeaderStyle-Font-Underline="false" HeaderStyle-HorizontalAlign="Center" AllowSorting="True" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource4" CssClass="table table-striped table-bordered table-hover table-responsive" AllowPaging="True" PageSize="5">
                                                                <Columns>
                                                                    <asp:BoundField DataField="Time" HeaderText="Date" SortExpression="Time" DataFormatString="{0:dd/MM/yy}" />
                                                                    <asp:BoundField DataField="RegNo" HeaderText="Registration Number" SortExpression="RegNo" />
                                                                    <asp:TemplateField HeaderText="File Name">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblLabelWithToolTip" runat="server" Text='<%#Eval("FileName") %>'></asp:Label>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:BoundField DataField="Colour" SortExpression="Colour" />
                                                                    <asp:BoundField DataField="Sides" SortExpression="Sides" />
                                                                    <asp:BoundField DataField="Binding" SortExpression="Binding" />
                                                                    <asp:BoundField DataField="Status" HeaderText="Status" SortExpression="Status" />
                                                                    <asp:TemplateField ItemStyle-HorizontalAlign = "Center">
                                                                        <ItemTemplate>
                                                                            <asp:LinkButton ID="lnkDownload" runat="server" Text="Download" OnClick="DownloadFile"
                                                                                CommandArgument='<%# Eval("PrintID") %>'></asp:LinkButton>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField ItemStyle-HorizontalAlign = "Center">
                                                                        <ItemTemplate>
                                                                            <asp:LinkButton ID="lnkFileMark" runat="server" Text="Mark As Complete" OnClick="MarkAsCompleteFile"
                                                                                CommandArgument='<%# Eval("PrintID") %>'></asp:LinkButton>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                </Columns>
                                                            <pagerstyle CssClass="paginationstyler"/>
                                                            </asp:GridView>

                                                            <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:PSConnectionString %>" DeleteCommand="UPDATE [Prints] SET [Status]='Completed' WHERE [PrintID]=@PrintID;" SelectCommand="SELECT * FROM [Prints] WHERE ([Status] = 'Pending') ORDER BY [Time]">
                                                                <SelectParameters>
                                                                    <asp:SessionParameter Name="RegNo" SessionField="Username" Type="Int32" />
                                                                </SelectParameters>
                                                            </asp:SqlDataSource>
                                                    </ContentTemplate>
                                                </asp:UpdatePanel>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-md-12">
                                                <h3 class="comph34">Completed Orders</h3>
                                                <asp:UpdatePanel ID="UpdatePanel4" runat="server">
                                                    <ContentTemplate>
                                                        <asp:GridView ID="GridView4" DataKeyNames="PrintID" ViewStateMode="Enabled" ShowHeaderWhenEmpty="True" EmptyDataText="No Records Found" HeaderStyle-Font-Underline="false" HeaderStyle-HorizontalAlign="Center" AllowSorting="True" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource3" CssClass="table table-striped table-bordered table-hover table-responsive" AllowPaging="True" PageSize="5">
                                                                <Columns>
                                                                    <asp:BoundField DataField="Time" HeaderText="Date" SortExpression="Time" DataFormatString="{0:dd/MM/yy}" />
                                                                    <asp:BoundField DataField="RegNo" HeaderText="Registration Number" SortExpression="RegNo" />
                                                                    <asp:TemplateField HeaderText="File Name">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblLabelWithToolTip" runat="server" Text='<%#Eval("FileName") %>'></asp:Label>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:BoundField DataField="Colour" SortExpression="Colour" />
                                                                    <asp:BoundField DataField="Sides" SortExpression="Sides" />
                                                                    <asp:BoundField DataField="Binding" SortExpression="Binding" />
                                                                    <asp:BoundField DataField="Status" HeaderText="Status" SortExpression="Status" />
                                                                    <asp:TemplateField ItemStyle-HorizontalAlign = "Center">
                                                                        <ItemTemplate>
                                                                            <asp:LinkButton ID="lnkDownload2" runat="server" Text="Download" OnClick="DownloadFile"
                                                                                CommandArgument='<%# Eval("PrintID") %>'></asp:LinkButton>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                </Columns>
                                                            <pagerstyle CssClass="paginationstyler"/>
                                                            </asp:GridView>

                                                            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:PSConnectionString %>" SelectCommand="SELECT * FROM [Prints] WHERE ([Status] = 'Completed') ORDER BY [Time]">
                                                                <SelectParameters>
                                                                    <asp:SessionParameter Name="RegNo" SessionField="Username" Type="Int32" />
                                                                </SelectParameters>
                                                            </asp:SqlDataSource>
                                                    </ContentTemplate>
                                                </asp:UpdatePanel>
                                            </div>
                                        </div>

                                    </div>

                                </div>


                                <div id="catalogue" class="tab-pane fade">
                                    
                                    <div class="catcontainer">
                                        <div class="row">
                                            <div class="col-md-12">
                                                <h3>Pending Orders</h3>
                                                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                                <ContentTemplate>
                                                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" ShowHeaderWhenEmpty="True" EmptyDataText="No Records Found" DataKeyNames="ID" HeaderStyle-Font-Underline="false"  DataSourceID="SqlDataSource1" AllowPaging="True" AllowSorting="True" CssClass="table table-striped table-bordered table-hover table-responsive" PageSize="5">
                                                        <Columns>
                                                            <asp:BoundField DataField="Time" HeaderText="Date" SortExpression="Time" DataFormatString="{0:dd/MM/yyyy}" />
                                                            <asp:BoundField DataField="RegID" HeaderText="Registration ID" SortExpression="RegID" />
                                                            <asp:BoundField DataField="ProductName" HeaderText="Product" SortExpression="ProductName" />
                                                            <asp:BoundField DataField="ProductQuantity" HeaderText="Quantity" SortExpression="ProductQuantity" />
                                                            <asp:BoundField DataField="Status" HeaderText="Status" SortExpression="Status" />
                                                            <asp:TemplateField ItemStyle-HorizontalAlign = "Center">
                                                                <ItemTemplate>
                                                                    <asp:LinkButton ID="lnkProductMark" runat="server" Text="Mark As Complete" OnClick="MarkAsCompleteProduct"
                                                                        CommandArgument='<%# Eval("ID") %>'></asp:LinkButton>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                        </Columns>
                                                        <pagerstyle CssClass="paginationstyler"/>
                                                    </asp:GridView>
                                                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:PSConnectionString %>" SelectCommand="SELECT * FROM [Product] WHERE ([Status] = 'Pending') ORDER BY [Time]" ></asp:SqlDataSource>
                                                </ContentTemplate>
                                            </asp:UpdatePanel>
                                            </div>

                                        </div>

                                        <div class="row">
                                            <div class="col-md-12">
                                                <h3 class="comph32">Completed Orders</h3>
                                                <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                                <ContentTemplate>
                                                    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" ShowHeaderWhenEmpty="True" EmptyDataText="No Records Found" DataKeyNames="ID" DataSourceID="SqlDataSource2" AllowPaging="True" AllowSorting="True" CssClass="table table-striped table-bordered table-hover table-responsive" PageSize="5">
                                                        <Columns>
                                                            <asp:BoundField DataField="Time" HeaderText="Date" SortExpression="Time" DataFormatString="{0:dd/MM/yyyy}" />
                                                            <asp:BoundField DataField="RegID" HeaderText="Registration ID" SortExpression="RegID" />
                                                            <asp:BoundField DataField="ProductName" HeaderText="Product" SortExpression="ProductName" />
                                                            <asp:BoundField DataField="ProductQuantity" HeaderText="Quantity" SortExpression="ProductQuantity" />
                                                            <asp:BoundField DataField="Status" HeaderText="Status" SortExpression="Status" />
                                                        </Columns>
                                                        <pagerstyle CssClass="paginationstyler"/>
                                                    </asp:GridView>
                                                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:PSConnectionString %>" SelectCommand="SELECT * FROM [Product] WHERE ([Status] = 'Completed') ORDER BY [Time]"></asp:SqlDataSource>
                                                </ContentTemplate>
                                            </asp:UpdatePanel>
                                            </div>

                                        </div>
                                    </div>

                                </div>




                                
                            </div>

                            <script>
                                $(document).ready(function () {
                                    if (location.hash) {
                                        $("a[href='" + location.hash + "']").tab("show");
                                    }
                                    $(document.body).on("click", "a[data-toggle]", function (event) {
                                        location.hash = this.getAttribute("href");
                                    });
                                });
                                $(window).on("popstate", function () {
                                    var anchor = location.hash || $("a[data-toggle='tab']").first().attr("href");
                                    $("a[href='" + anchor + "']").tab("show");
                                });
                            </script>


                                




                                





                                




                                




                            </form>



                            </div>

                        </div>
                </div>
            </div>

        </div>

    </div>




</body>
</html>

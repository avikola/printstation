<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="PrintStation.Faculty.Dashboard" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">

    <link href="facultystyle.css?<?php echo time(); ?>" rel="stylesheet" />

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

    <link rel="icon" href="../Additional/images/PrintStation%20Favicon.png" />
        <title>Faculty - Dashboard</title>

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
                                    <h1 id="whitetext1" class="cover-heading maintitle">Faculty<span style= "color: #FC622F">Dashboard</span></h1>
                                </div>
                                
                                        <div><asp:Label ID="Label5" runat="server" Text="There are item(s) in your shopping cart."></asp:Label><a href="Cart.aspx" title="Go to Cart"><span id="carticon" class="glyphicon glyphicon-shopping-cart"></span></a></div>

                                <div class="col-md-3">
                                    <!-- Single button -->
                                    <div class="btn-group logoutposition">
                                      <button type="button" class="btn btn-default dropdown-toggle logoutbutton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        Hello, <%:Session["Fname"]%> <span class="caret"></span>
                                      </button>
                                      <ul class="dropdown-menu logoutbutton">
                                        <li><a href="Cart.aspx">Shopping Cart</a></li>
                                        <li><a href="Account Settings.aspx">Account Details</a></li>
                                        <li role="separator" class="divider logoutsep"></li>
                                        <li><a href="../Home.aspx">Logout</a></li>
                                      </ul>
                                    </div>
                    
                                </div>


                            </div>


                            <div class="student_dashboard">

                                <ul class="nav nav-tabs">
                                    <li class="active"><a id="lefttab" data-toggle="tab" href="#print">Orders</a></li>
                                    <li><a id="righttab" data-toggle="tab" href="#catalogue">Catalogue</a></li>
                                </ul>
                                <form id="form1" runat="server">
                                <div class="tab-content row">

                                    <div id="print" class="tab-pane fade in active">

                                        <div class="printcontainer row">

                                            <div class="col-lg-6">
                                                <ul class="nav nav-pills">
                                                    <li id="placeorderpill" class="active"><a data-toggle="pill" href="#placeorders">Place Print Orders</a></li>
                                                    <li id="vieworderpill" ><a id="downpill" data-toggle="pill" href="#vieworders">View Print Orders</a></li>
                                                    <li id="viewcatorderpill" ><a id="downpill" data-toggle="pill" href="#viewcatorders">View Catalogue Orders</a></li>
                                                </ul>
                                            </div>

                                            <div class="tab-content pillinfo col-lg-6">
                                            
                                                <div id="placeorders" class="tab-pane fade in active col-md-6">
                                                <asp:ValidationSummary ID="ValidationSummary1" runat="server" HeaderText="Only .pdf, .doc, .docx, & .rtf are accepted formats." ValidationGroup="typevalid"/>
                                                <asp:CustomValidator ID="customValidatorUpload" runat="server" ErrorMessage="" ControlToValidate="FileUpload1" ClientValidationFunction="setUploadButtonState();" />
                                                <asp:CustomValidator ID="customValidator1" runat="server" ErrorMessage="" ControlToValidate="FileUpload2" ClientValidationFunction="setUploadButtonState2();" />
                                                <asp:CustomValidator ID="customValidator2" runat="server" ErrorMessage="" ControlToValidate="FileUpload3" ClientValidationFunction="setUploadButtonState3();"  />
                                                    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                                                        <br />
                                                        <div id="uploadsuccess" class="alert alert-success alert-dismissable fade in" runat="server" visible="false" disabled>
                                                            <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                                                            <span><strong>Upload Successful!</strong> Files added to Cart.</span>
                                                        </div>
                                                        <h3>Upload Your Document(s) For Print :</h3>
                                                        Supported Formats include: .doc(x), .rtf, .pdf; Max File Size: 15MB
                                                        <br />
                                                        <br />
                                                        <div>
                                                            <div class="col-md-12">
                                                                <asp:FileUpload class="form-control" ID="FileUpload1" runat="server"  OnChange="EmptyTest1()"/>
                                                            </div>
                                                            <br />
                                                            <br />
                                                            <div class="col-md-4">
                                                                <asp:DropDownList ID="DropDownList1" runat="server" CssClass="form-control">
                                                                    <asp:ListItem Selected="True">Black &amp; White</asp:ListItem>
                                                                    <asp:ListItem>Colour</asp:ListItem>
                                                                </asp:DropDownList>
                                                            </div>
                                                            <div class="col-md-4">
                                                                <asp:DropDownList ID="DropDownList2" runat="server" CssClass="form-control">
                                                                    <asp:ListItem Selected="True">Single Sided</asp:ListItem>
                                                                    <asp:ListItem>Double Sided</asp:ListItem>
                                                                </asp:DropDownList>
                                                            </div>
                                                            <div class="col-md-4">
                                                                <asp:DropDownList ID="DropDownList7" runat="server" CssClass="form-control">
                                                                    <asp:ListItem Selected="True">No Binding</asp:ListItem>
                                                                    <asp:ListItem>Spiral Binding</asp:ListItem>
                                                                    <asp:ListItem>Report Binding</asp:ListItem>
                                                                </asp:DropDownList>
                                                            </div>
                                                            <asp:Label ID="Label2" runat="server" Text=""></asp:Label>
                                                        </div>
                                                        <br />
                                                        <br />
                                                        <br />
                                                        <br />
                                                        <div>
                                                            <div class="col-md-12">
                                                                <asp:FileUpload class="form-control" ID="FileUpload2" runat="server"  OnChange="EmptyTest2()" />
                                                            </div>
                                                            <br />
                                                            <br />
                                                            <div class="col-md-4">
                                                                <asp:DropDownList ID="DropDownList3" runat="server" CssClass="form-control">
                                                                    <asp:ListItem Selected="True">Black &amp; White</asp:ListItem>
                                                                    <asp:ListItem>Colour</asp:ListItem>
                                                                </asp:DropDownList>
                                                            </div>
                                                            <div class="col-md-4">
                                                                <asp:DropDownList ID="DropDownList4" runat="server" CssClass="form-control">
                                                                    <asp:ListItem Selected="True">Single Sided</asp:ListItem>
                                                                    <asp:ListItem>Double Sided</asp:ListItem>
                                                                </asp:DropDownList>
                                                            </div>
                                                            <div class="col-md-4">
                                                                <asp:DropDownList ID="DropDownList8" runat="server" CssClass="form-control">
                                                                    <asp:ListItem Selected="True">No Binding</asp:ListItem>
                                                                    <asp:ListItem>Binding</asp:ListItem>
                                                                    <asp:ListItem>Report Binding</asp:ListItem>
                                                                </asp:DropDownList>
                                                            </div>
                                                            <asp:Label ID="Label3" runat="server" Text=""></asp:Label>
                                                        </div>
                                                        <br />
                                                        <br />
                                                        <br />
                                                        <br />
                                                        <div>
                                                            <div class="col-md-12">
                                                                <asp:FileUpload class="form-control" ID="FileUpload3" runat="server"  OnChange="EmptyTest3()" />
                                                            </div>
                                                            <br />
                                                            <br />
                                                            <div class="col-md-4">
                                                                <asp:DropDownList ID="DropDownList5" runat="server" CssClass="form-control">
                                                                    <asp:ListItem Selected="True">Black &amp; White</asp:ListItem>
                                                                    <asp:ListItem>Colour</asp:ListItem>
                                                                </asp:DropDownList>
                                                            </div>
                                                            <div class="col-md-4">
                                                                <asp:DropDownList ID="DropDownList6" runat="server" CssClass="form-control">
                                                                    <asp:ListItem Selected="True">Single Sided</asp:ListItem>
                                                                    <asp:ListItem>Double Sided</asp:ListItem>
                                                                </asp:DropDownList>
                                                            </div>
                                                            <div class="col-md-4">
                                                                <asp:DropDownList ID="DropDownList9" runat="server" CssClass="form-control">
                                                                    <asp:ListItem Selected="True">No Binding</asp:ListItem>
                                                                    <asp:ListItem>Binding</asp:ListItem>
                                                                    <asp:ListItem>Report Binding</asp:ListItem>
                                                                </asp:DropDownList>
                                                            </div>
                                                            <asp:Label ID="Label4" runat="server" Text=""></asp:Label>
                                                        </div>
                                                        <br />
                                                        <br />
                                                        <br />
                                                        <br />
                                                        <div class="col-md-12">
                                                            <asp:Button ID="Button1" runat="server" Text="Upload" Cssclass="btn btn-lg btn-primary col-md-12" disabled="disabled" OnClick="UploadFiles" ValidationGroup="typevalid" />
                                                        </div>
                                                        
                                                        <script>

                                                            function setUploadButtonState()
                                                            {
                                                                var maxFileSize = 15728640; // 15MB -> 15 * 1024 * 1024
                                                                var fileUpload = $('#FileUpload1');
                                                                var other1 = document.getElementById('Label3').textContent;
                                                                var other2 = document.getElementById('Label4').textContent;

                                                                if (fileUpload.val() == '')
                                                                {
                                                                    return false;
                                                                }
                                                                else
                                                                {
                                                                    if (fileUpload[0].files[0].size < maxFileSize)
                                                                    {
                                                                        if (other1 == "" && other2 == "") {
                                                                            $('#Button1').prop('disabled', false);
                                                                        }
                                                                        $('#Label2').text('')
                                                                        document.getElementById('Label2').style.display = 'initial';
                                                                        return true;
                                                                    }
                                                                    else
                                                                    {
                                                                        document.getElementById('Label2').style.display = 'inherit';
                                                                        $('#Label2').text('File is larger than 15MB!')
                                                                        document.getElementById("Button1").disabled = true;
                                                                        check++;
                                                                        return false;
                                                                    }
                                                                }
                                                            }

                                                            function setUploadButtonState2() {
                                                                var maxFileSize = 15728640; // 15MB -> 15 * 1024 * 1024
                                                                var fileUpload = $('#FileUpload2');
                                                                var other1 = document.getElementById('Label2').textContent;
                                                                var other2 = document.getElementById('Label4').textContent;

                                                                if (fileUpload.val() == '') {
                                                                    return false;
                                                                }
                                                                else {
                                                                    if (fileUpload[0].files[0].size < maxFileSize) {
                                                                        if (other1 == "" && other2 == "") {
                                                                            $('#Button1').prop('disabled', false);
                                                                        }
                                                                        $('#Label3').text('')
                                                                        document.getElementById('Label3').style.display = 'initial';
                                                                        return true;
                                                                    }
                                                                    else {
                                                                        document.getElementById('Label3').style.display = 'inherit';
                                                                        $('#Label3').text('File is larger than 15MB!')
                                                                        document.getElementById("Button1").disabled = true;
                                                                        return false;
                                                                    }
                                                                }
                                                            }

                                                            function setUploadButtonState3() {
                                                                var maxFileSize = 15728640; // 15MB -> 15 * 1024 * 1024
                                                                var fileUpload = $('#FileUpload3');
                                                                var other1 = document.getElementById('Label2').textContent;
                                                                var other2 = document.getElementById('Label3').textContent;

                                                                if (fileUpload.val() == '') {
                                                                    return false;
                                                                }
                                                                else {
                                                                    if (fileUpload[0].files[0].size < maxFileSize) {
                                                                        if (other1 == "" && other2 == "") {
                                                                            $('#Button1').prop('disabled', false);
                                                                        }
                                                                        $('#Label4').text('')
                                                                        document.getElementById('Label4').style.display = 'initial';
                                                                        return true;
                                                                    }
                                                                    else {
                                                                        document.getElementById('Label4').style.display = 'inherit';
                                                                        $('#Label4').text('File is larger than 15MB!')
                                                                        document.getElementById("Button1").disabled = true;
                                                                        return false;
                                                                    }
                                                                }
                                                            }


                                                            function EmptyTest1()
                                                            {
                                                                var uploader1 = $get("<%= FileUpload1.ClientID%>");
                                                                var uploader2 = $get("<%= FileUpload2.ClientID%>");
                                                                var uploader3 = $get("<%= FileUpload3.ClientID%>");
                                                                if (uploader1.value == "")
                                                                {
                                                                    $('#Label2').text('')
                                                                    document.getElementById('Label2').style.display = 'initial';
                                                                    if (uploader1.value == "" && uploader2.value == "" && uploader3.value == "") {
                                                                        document.getElementById("Button1").disabled = true;
                                                                    }
                                                                }
                                                            }

                                                            function EmptyTest2()
                                                            {
                                                                var uploader1 = $get("<%= FileUpload1.ClientID%>");
                                                                var uploader2 = $get("<%= FileUpload2.ClientID%>");
                                                                var uploader3 = $get("<%= FileUpload3.ClientID%>");
                                                                if (uploader2.value == "")
                                                                {
                                                                    $('#Label3').text('')
                                                                    document.getElementById('Label3').style.display = 'initial';
                                                                    if (uploader1.value == "" && uploader2.value == "" && uploader3.value == "") {
                                                                        document.getElementById("Button1").disabled = true;
                                                                    }
                                                                }
                                                            }

                                                            function EmptyTest3()
                                                            {
                                                                var uploader1 = $get("<%= FileUpload1.ClientID%>");
                                                                var uploader2 = $get("<%= FileUpload2.ClientID%>");
                                                                var uploader3 = $get("<%= FileUpload3.ClientID%>");
                                                                if (uploader3.value == "")
                                                                {
                                                                    $('#Label4').text('')
                                                                    document.getElementById('Label4').style.display = 'initial';
                                                                    if (uploader1.value == "" && uploader2.value == "" && uploader3.value == "") {
                                                                        document.getElementById("Button1").disabled = true;
                                                                    }
                                                                }
                                                            }

                                                            $('.btn-number').click(function (e) {
                                                                e.preventDefault();

                                                                fieldName = $(this).attr('data-field');
                                                                type = $(this).attr('data-type');
                                                                var input = $("input[name='" + fieldName + "']");
                                                                var currentVal = parseInt(input.val());
                                                                if (!isNaN(currentVal)) {
                                                                    if (type == 'minus')
                                                                        input.val(currentVal - 1);
                                                                    else if (type == 'plus')
                                                                        input.val(currentVal + 1);
                                                                } else {
                                                                    input.val(0);
                                                                }
                                                            });

                                                        </script>
                                                        
                                                        
                                                        <asp:RegularExpressionValidator ID="uplValidator1" runat="server" ControlToValidate="FileUpload1" ValidationExpression="(.+\.([Pp][Dd][Ff])|.+\.([Dd][Oo][Cc][Xx])|.+\.([Dd][Oo][Cc])|.+\.([Rr][Tt][Ff]))" ValidationGroup="typevalid"></asp:RegularExpressionValidator>
                                                        <asp:RegularExpressionValidator ID="uplValidator2" runat="server" ControlToValidate="FileUpload2" ValidationExpression="(.+\.([Pp][Dd][Ff])|.+\.([Dd][Oo][Cc][Xx])|.+\.([Dd][Oo][Cc])|.+\.([Rr][Tt][Ff]))" ValidationGroup="typevalid"></asp:RegularExpressionValidator>
                                                        <asp:RegularExpressionValidator ID="uplValidator3" runat="server" ControlToValidate="FileUpload3" ValidationExpression="(.+\.([Pp][Dd][Ff])|.+\.([Dd][Oo][Cc][Xx])|.+\.([Dd][Oo][Cc])|.+\.([Rr][Tt][Ff]))" ValidationGroup="typevalid"></asp:RegularExpressionValidator>



                                            </div>

                                            
                                                <div id="vieworders" class="tab-pane fade">
                                                    <h3>Your Print Orders:</h3>
                                                    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                                        <ContentTemplate>
                                                            <asp:GridView ID="GridView2" OnRowDataBound="OnRowDataBound" ViewStateMode="Enabled" ShowHeaderWhenEmpty="True" EmptyDataText="No Records Found" HeaderStyle-Font-Underline="false" HeaderStyle-ForeColor="Black" HeaderStyle-HorizontalAlign="Center" AllowSorting="True" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource4" CssClass="table table-striped table-bordered table-hover table-responsive" AllowPaging="True">
                                                                <Columns>
                                                                    <asp:BoundField DataField="Time" HeaderText="Date" SortExpression="Time" DataFormatString="{0:dd/MM/yy}" />
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
                                                                </Columns>
                                                            <pagerstyle CssClass="paginationstyler"/>
                                                            </asp:GridView>

                                                            <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:PSConnectionString %>" SelectCommand="SELECT * FROM [Prints] WHERE ([RegNo] = @RegNo) ORDER BY [Time]">
                                                                <SelectParameters>
                                                                    <asp:SessionParameter Name="RegNo" SessionField="Username" Type="Int32" />
                                                                </SelectParameters>
                                                            </asp:SqlDataSource>
                                                        </ContentTemplate>
                                                    </asp:UpdatePanel>
                                                </div>
                                                         
                                                                                            
                                                <div id="viewcatorders" class="tab-pane fade">
                                                    <h3>Your Catalogue Orders:</h3>
                                                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                                        <ContentTemplate>
                                                        <asp:GridView ID="GridView1" runat="server" HeaderStyle-Font-Underline="false" HeaderStyle-ForeColor="Black"  ShowHeaderWhenEmpty="True" EmptyDataText="No Records Found" HeaderStyle-HorizontalAlign="Center" AllowSorting="True"  AutoGenerateColumns="False" DataSourceID="SqlDataSource2" CssClass="table table-striped table-bordered table-hover table-responsive" AllowPaging="True">
                                                            <Columns>
                                                                <asp:BoundField DataField="Time" HeaderText="Date" SortExpression="Time" DataFormatString="{0:dd/MM/yyyy}" />
                                                                <asp:BoundField DataField="ProductName" HeaderText="Product" SortExpression="ProductName" />
                                                                <asp:BoundField DataField="ProductQuantity" HeaderText="Quantity" SortExpression="ProductQuantity" />
                                                                <asp:BoundField DataField="Status" HeaderText="Status" SortExpression="Status" />
                                                            </Columns>
                                                            <pagerstyle CssClass="paginationstyler"/>
                                                        </asp:GridView>
                                                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:PSConnectionString %>" SelectCommand="SELECT * FROM [Product] WHERE ([RegID] = @RegID) ORDER BY [Time]">
                                                            <SelectParameters>
                                                                <asp:SessionParameter Name="RegID" SessionField="Username" Type="Int32" />
                                                            </SelectParameters>
                                                        </asp:SqlDataSource>
                                                        </ContentTemplate>
                                                    </asp:UpdatePanel>
                                                </div>

                                            </div>

                                        </div>

                                    </div>

                                    <div id="catalogue" class="tab-pane fade">

                                        <div class="catrowcontainer">
                                        <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                                        <ContentTemplate>
                                        

                                            <div class="cataloguecontainer row">

                                                <div class="col-md-3 col-md-offset-1 itemgrid">
                                                    <img class="gridimage" src="../Additional/images/stationery/pen1.jpeg" />
                                                    <div class="blackpentext">
                                                        <h3>Black Pen</h3>
                                                    </div>
                                                    <div class="input-group quantity">
                                                        <span class="input-group-btn">
                                                            <button type="button" class="btn-number btn btn-default gridpm" data-type="minus" data-field="quant[1]"><span class="glyphicon glyphicon-minus"></span></button>
                                                        </span>
                                                        <input id="blackpenquant" type="text" data-field="blackpen" name="quant[1]" class="form-control input-number" value="1" readonly/>
                                                        <span class="input-group-btn">
                                                            <button type="button" class="btn-number btn btn-default gridpm" data-type="plus" data-field="quant[1]"><span class="glyphicon glyphicon-plus"></span></button>
                                                        </span>
                                                    </div>
                                                
                                                    <asp:Button ID="Button2" runat="server" Text="Add to Cart" CssClass="addtocart btn btn-primary" OnClick="BlackPen"/>
                                                </div>

                                                <div class="col-md-3 col-md-offset-1 itemgrid">
                                                    <img class="gridimage" src="../Additional/images/stationery/pen2.jpeg" />
                                                    <div class="blackpentext">
                                                        <h3>Blue Pen</h3>
                                                    </div>
                                                    <div class="input-group quantity">
                                                        <span class="input-group-btn">
                                                            <button type="button" class="btn-number btn btn-default gridpm" data-type="minus" data-field="quant[2]"><span class="glyphicon glyphicon-minus"></span></button>
                                                        </span>
                                                        <input id="bluepenquant" type="text" name="quant[2]" class="form-control input-number" value="1" readonly/>
                                                        <span class="input-group-btn">
                                                            <button type="button" class="btn-number btn btn-default gridpm" data-type="plus" data-field="quant[2]"><span class="glyphicon glyphicon-plus"></span></button>
                                                        </span>
                                                    </div>
                                                
                                                    <asp:Button ID="Button3" runat="server" Text="Add to Cart" CssClass="addtocart btn btn-primary" OnClick="BluePen"/>
                                                </div>
                                        
                                                <div class="col-md-3 col-md-offset-1 itemgrid">
                                                    <img class="gridimage" src="../Additional/images/stationery/eraser1.jpeg" />
                                                    <div class="blackpentext">
                                                        <h3>Eraser</h3>
                                                    </div>
                                                    <div class="input-group quantity">
                                                        <span class="input-group-btn">
                                                            <button type="button" class="btn-number btn btn-default gridpm" data-type="minus" data-field="quant[3]"><span class="glyphicon glyphicon-minus"></span></button>
                                                        </span>
                                                        <input id="eraserquant" type="text" name="quant[3]" class="form-control input-number" value="1" readonly/>
                                                        <span class="input-group-btn">
                                                            <button type="button" class="btn-number btn btn-default gridpm" data-type="plus" data-field="quant[3]"><span class="glyphicon glyphicon-plus"></span></button>
                                                        </span>
                                                    </div>
                                                
                                                    <asp:Button ID="Button4" runat="server" Text="Add to Cart" CssClass="addtocart btn btn-primary" OnClick="Eraser"/>
                                                </div>

                                            </div>


                                            <div class="cataloguecontainer row">

                                                <div class="col-md-3 col-md-offset-1 itemgrid">
                                                    
                                                    <img class="gridimage" src="../Additional/images/stationery/pencil.jpg" />
                                                    <div class="blackpentext">
                                                        <h3>Pencil</h3>
                                                    </div>
                                                    <div class="input-group quantity">
                                                        <span class="input-group-btn">
                                                            <button type="button" class="btn-number btn btn-default gridpm" data-type="minus" data-field="quant[4]"><span class="glyphicon glyphicon-minus"></span></button>
                                                        </span>
                                                        <input id="pencilquant" type="text" name="quant[4]" class="form-control input-number" value="1" readonly/>
                                                        <span class="input-group-btn">
                                                            <button type="button" class="btn-number btn btn-default gridpm" data-type="plus" data-field="quant[4]"><span class="glyphicon glyphicon-plus"></span></button>
                                                        </span>
                                                    </div>
                                                
                                                    <asp:Button ID="Button5" runat="server" Text="Add to Cart" CssClass="addtocart btn btn-primary" OnClick="Pencil"/>

                                                </div>

                                                <div class="col-md-3 col-md-offset-1 itemgrid">
                                                
                                                    <img class="gridimage" src="../Additional/images/stationery/notebook.jpg" />
                                                    <div class="blackpentext">
                                                        <h3>Notebook</h3>
                                                    </div>
                                                    <div class="input-group quantity">
                                                        <span class="input-group-btn">
                                                            <button type="button" class="btn-number btn btn-default gridpm" data-type="minus" data-field="quant[5]"><span class="glyphicon glyphicon-minus"></span></button>
                                                        </span>
                                                        <input id="notebookquant" type="text" name="quant[5]" class="form-control input-number" value="1" readonly/>
                                                        <span class="input-group-btn">
                                                            <button type="button" class="btn-number btn btn-default gridpm" data-type="plus" data-field="quant[5]"><span class="glyphicon glyphicon-plus"></span></button>
                                                        </span>
                                                    </div>
                                                
                                                    <asp:Button ID="Button6" runat="server" Text="Add to Cart" CssClass="addtocart btn btn-primary" OnClick="Notebook"/>

                                                </div>
                                        
                                                <div class="col-md-3 col-md-offset-1 itemgrid">
                                                
                                                    <img class="gridimage" src="../Additional/images/stationery/sharpener.jpeg" />
                                                    <div class="blackpentext">
                                                        <h3>Sharpener</h3>
                                                    </div>
                                                    <div class="input-group quantity">
                                                        <span class="input-group-btn">
                                                            <button type="button" class="btn-number btn btn-default gridpm" data-type="minus" data-field="quant[6]"><span class="glyphicon glyphicon-minus"></span></button>
                                                        </span>
                                                        <input id="sharpenerquant" type="text" name="quant[6]" class="form-control input-number" value="1" readonly/>
                                                        <span class="input-group-btn">
                                                            <button type="button" class="btn-number btn btn-default gridpm" data-type="plus" data-field="quant[6]"><span class="glyphicon glyphicon-plus"></span></button>
                                                        </span>
                                                    </div>
                                                
                                                    <asp:Button ID="Button7" runat="server" Text="Add to Cart" CssClass="addtocart btn btn-primary" OnClick="Sharpener"/>

                                                </div>

                                            </div>


                                            <div class="cataloguecontainer row">

                                                <div class="col-md-3 col-md-offset-1 itemgrid">
                                                
                                                    <img class="gridimage" src="../Additional/images/stationery/stapler.jpeg" />
                                                    <div class="blackpentext">
                                                        <h3>Stapler</h3>
                                                    </div>
                                                    <div class="input-group quantity">
                                                        <span class="input-group-btn">
                                                            <button type="button" class="btn-number btn btn-default gridpm" data-type="minus" data-field="quant[7]"><span class="glyphicon glyphicon-minus"></span></button>
                                                        </span>
                                                        <input id="staplerquant" type="text" name="quant[7]" class="form-control input-number" value="1" readonly/>
                                                        <span class="input-group-btn">
                                                            <button type="button" class="btn-number btn btn-default gridpm" data-type="plus" data-field="quant[7]"><span class="glyphicon glyphicon-plus"></span></button>
                                                        </span>
                                                    </div>
                                                
                                                    <asp:Button ID="Button8" runat="server" Text="Add to Cart" CssClass="addtocart btn btn-primary" OnClick="Stapler"/>

                                                </div>

                                                <div class="col-md-3 col-md-offset-1 itemgrid">
                                                
                                                    <img class="gridimage" src="../Additional/images/stationery/tape1.jpg" />
                                                    <div class="blackpentext">
                                                        <h3>Tape</h3>
                                                    </div>
                                                    <div class="input-group quantity">
                                                        <span class="input-group-btn">
                                                            <button type="button" class="btn-number btn btn-default gridpm" data-type="minus" data-field="quant[8]"><span class="glyphicon glyphicon-minus"></span></button>
                                                        </span>
                                                        <input id="tapequant" type="text" name="quant[8]" class="form-control input-number" value="1" readonly/>
                                                        <span class="input-group-btn">
                                                            <button type="button" class="btn-number btn btn-default gridpm" data-type="plus" data-field="quant[8]"><span class="glyphicon glyphicon-plus"></span></button>
                                                        </span>
                                                    </div>
                                                
                                                    <asp:Button ID="Button9" runat="server" Text="Add to Cart" CssClass="addtocart btn btn-primary" OnClick="Tape"/>

                                                </div>
                                        
                                                <div class="col-md-3 col-md-offset-1 itemgrid">
                                                
                                                    <img class="gridimage" src="../Additional/images/stationery/scissors.jpeg" />
                                                    <div class="blackpentext">
                                                        <h3>Scissors</h3>
                                                    </div>
                                                    <div class="input-group quantity">
                                                        <span class="input-group-btn">
                                                            <button type="button" class="btn-number btn btn-default gridpm" data-type="minus" data-field="quant[9]"><span class="glyphicon glyphicon-minus"></span></button>
                                                        </span>
                                                        <input id="scissorsquant" type="text" name="quant[9]" class="form-control input-number" value="1" readonly/>
                                                        <span class="input-group-btn">
                                                            <button type="button" class="btn-number btn btn-default gridpm" data-type="plus" data-field="quant[9]"><span class="glyphicon glyphicon-plus"></span></button>
                                                        </span>
                                                    </div>
                                                
                                                    <asp:Button ID="Button10" runat="server" Text="Add to Cart" CssClass="addtocart btn btn-primary" OnClick="Scissors"/>

                                                </div>

                                            </div>


                                            <div class="cataloguecontainer row">

                                                <div class="col-md-3 col-md-offset-1 itemgrid">
                                                
                                                    <img class="gridimage" src="../Additional/images/stationery/calculator.jpeg" />
                                                    <div class="blackpentext">
                                                        <h3>Calculator</h3>
                                                    </div>
                                                    <div class="input-group quantity">
                                                        <span class="input-group-btn">
                                                            <button type="button" class="btn-number btn btn-default gridpm" data-type="minus" data-field="quant[10]"><span class="glyphicon glyphicon-minus"></span></button>
                                                        </span>
                                                        <input id="calcquant" type="text" name="quant[10]" class="form-control input-number" value="1" readonly/>
                                                        <span class="input-group-btn">
                                                            <button type="button" class="btn-number btn btn-default gridpm" data-type="plus" data-field="quant[10]"><span class="glyphicon glyphicon-plus"></span></button>
                                                        </span>
                                                    </div>
                                                
                                                    <asp:Button ID="Button11" runat="server" Text="Add to Cart" CssClass="addtocart btn btn-primary" OnClick="Calculator"/>

                                                </div>

                                                <div class="col-md-3 col-md-offset-1 itemgrid">
                                                
                                                    <img class="gridimage" src="../Additional/images/stationery/postits.jpeg" />
                                                    <div class="blackpentext">
                                                        <h3>Post-its</h3>
                                                    </div>
                                                    <div class="input-group quantity">
                                                        <span class="input-group-btn">
                                                            <button type="button" class="btn-number btn btn-default gridpm" data-type="minus" data-field="quant[11]"><span class="glyphicon glyphicon-minus"></span></button>
                                                        </span>
                                                        <input id="postitsquant" type="text" name="quant[11]" class="form-control input-number" value="1" readonly/>
                                                        <span class="input-group-btn">
                                                            <button type="button" class="btn-number btn btn-default gridpm" data-type="plus" data-field="quant[11]"><span class="glyphicon glyphicon-plus"></span></button>
                                                        </span>
                                                    </div>
                                                
                                                    <asp:Button ID="Button12" runat="server" Text="Add to Cart" CssClass="addtocart btn btn-primary" OnClick="Postits"/>

                                                </div>
                                        
                                                <div class="col-md-3 col-md-offset-1 itemgrid">
                                                
                                                    <img class="gridimage" src="../Additional/images/stationery/paperclips.jpeg" />
                                                    <div class="blackpentext">
                                                        <h3>Paper Clip</h3>
                                                    </div>
                                                    <div class="input-group quantity">
                                                        <span class="input-group-btn">
                                                            <button type="button" class="btn-number btn btn-default gridpm" data-type="minus" data-field="quant[12]"><span class="glyphicon glyphicon-minus"></span></button>
                                                        </span>
                                                        <input id="postitquant" type="text" name="quant[12]" class="form-control input-number" value="1" readonly/>
                                                        <span class="input-group-btn">
                                                            <button type="button" class="btn-number btn btn-default gridpm" data-type="plus" data-field="quant[12]"><span class="glyphicon glyphicon-plus"></span></button>
                                                        </span>
                                                    </div>
                                                
                                                    <asp:Button ID="Button13" runat="server" Text="Add to Cart" CssClass="addtocart btn btn-primary" OnClick="Paperclips"/>

                                                </div>

                                            </div>


                                        </ContentTemplate>
                                        </asp:UpdatePanel>
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


                                        $('.quantity').on('click','.btn-number', function (e) {
                                            e.preventDefault();
                                            fieldName = $(this).attr('data-field');
                                            type = $(this).attr('data-type');
                                            var input = $("input[name='" + fieldName + "']");
                                            var currentVal = parseInt(input.val());

                                            if (!isNaN(currentVal)) {
                                                if (type == 'minus')
                                                    input.val(currentVal - 1);
                                                else if (type == 'plus')
                                                    input.val(currentVal + 1);
                                            }

                                            else {
                                                input.val(1);
                                            }
                                        });

                                    </script>

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

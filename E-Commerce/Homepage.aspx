<%@ Page Title="" Language="C#" MasterPageFile="~/masterpage.Master" AutoEventWireup="true" CodeBehind="Homepage.aspx.cs" Inherits="E_Commerce.Homepage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .productList {
            margin: 5px 5px 5px 5px;
            padding: 10px;
            border-radius: 3px;
        }
    </style>
    <script lang="javascript" type="text/javascript">

        function userlogin() {
            $('[id*=loginmodal]').modal('show');
        }


        function alertsuccess() {
            $('[id*=msgsuccess]').modal('show');
        }
        function alerterror() {
            $('[id*=msgerror]').modal('show');
        }
        function alertwarning() {

            $('[id*=msgwarning]').modal('show');
        }
        function productexist() {
            $('[id*=existingproduct]').modal('show');
        }

        function alerterror() {
            $('[id*=msgerror]').modal('show');
        }
        function alertwishlist() {
            $('[id*=msgwishlist]').modal('show');
        }

    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- Hero section -->
    <section class="hero-section">
        <div class="hero-slider owl-carousel">
            <div class="hs-item set-bg" data-setbg="img/bg.jpg">
                <div class="container">
                    <div class="row">
                        <div class="col-xl-6 col-lg-7 text-white">
                            <span>New Arrivals</span>
                            <h2>denim jackets</h2>


                        </div>
                    </div>
                    <div class="offer-card text-white">
                        <span>from</span>
                        <h2>2900</h2>
                        <p>SHOP NOW</p>
                    </div>
                </div>
            </div>
            <div class="hs-item set-bg" data-setbg="img/bg-2.jpg">
                <div class="container">
                    <div class="row">
                        <div class="col-xl-6 col-lg-7 text-white">
                            <span>New Arrivals</span>
                            <h2>denim jackets</h2>

                        </div>
                    </div>
                    <div class="offer-card text-white">
                        <span>from</span>
                        <h2>2400</h2>
                        <p>SHOP NOW</p>
                    </div>
                </div>
            </div>
        </div>
        <div class="container">
            <div class="slide-num-holder" id="snh-1"></div>
        </div>
    </section>
    <!-- Hero section end -->



    <!-- Features section -->
    <section class="features-section">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-4 p-0 feature">
                    <div class="feature-inner">
                        <div class="feature-icon">
                            <img src="img/icons/1.png" alt="#">
                        </div>
                        <h2>Fast Secure Payments</h2>
                    </div>
                </div>
                <div class="col-md-4 p-0 feature">
                    <div class="feature-inner">
                        <div class="feature-icon">
                            <img src="img/icons/2.png" alt="#">
                        </div>
                        <h2>Premium Products</h2>
                    </div>
                </div>
                <div class="col-md-4 p-0 feature">
                    <div class="feature-inner">
                        <div class="feature-icon">
                            <img src="img/icons/3.png" alt="#">
                        </div>
                        <h2>Free & fast Delivery</h2>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Features section end -->
    <br />

  <%--  <!-- letest product section -->
    <section class="top-letest-product-section">
        <div class="container">
            <div class="section-title">
                <h2>LATEST PRODUCTS</h2>
            </div>

            <div class="product-slider owl-carousel">

                <% for (int i = 0; i < dt.Rows.Count; i++)
                    {%>


                <div class="product-item">
                    <div class="pi-pic">
                        <img src="<%= dt.Rows[i]["itemimage"].ToString().TrimEnd(mychar) %>" />
                        <div class="pi-links">
                            <a href="<%="cart.aspx?id="+ dt.Rows[i]["Id"].ToString()%>" class="add-card"><i class="flaticon-bag"></i><span>ADD TO CART</span></a>

                        </div>
                    </div>
                    <div class="pi-text">
                        <h6>'<%= dt.Rows[i]["itemprice"].ToString().TrimEnd(mychar)%>'</h6>
                        <p>'<%= dt.Rows[i]["itemdesc"].ToString().TrimEnd(mychar)%>'</p>
                    </div>
                </div>
                <%  } %>
            </div>
        </div>
    </section>
    <!-- letest product section end -->--%>



    <!-- Product filter section -->
    <section class="product-filter-section">
        <div class="container">
            <div class="section-title">
                <h2>BROWSE TOP SELLING PRODUCTS</h2>
            </div>
            <ul class="product-filter-menu">
                <li><a href="list-items.aspx">TOPS</a></li>
                <li><a href="list-items.aspx">JUMPSUITS</a></li>
                <li><a href="list-items.aspx">LINGERIE</a></li>
                <li><a href="list-items.aspx">JEANS</a></li>
                <li><a href="list-items.aspx">DRESSES</a></li>
                <li><a href="list-items.aspx">COATS</a></li>
                <li><a href="list-items.aspx">JUMPERS</a></li>
                <li><a href="list-items.aspx">LEGGINGS</a></li>
            </ul>
            <div class="row">
                <asp:DataList ID="dlitems" OnItemCommand="dlitems_ItemCommand" runat="server" CssClass="row" RepeatColumns="4" RepeatDirection="Horizontal">
                    <ItemTemplate>
                        <div class="row productList">

                            <div class="col-md-12">

                                <div class="product-item">
                                    <div class="pi-pic">

                                        <img runat="server" src='<%# Eval("itemimage") %>' alt="" style="width: 250px; height: 300px">
                                        <div class="pi-links">
                                            <asp:LinkButton ID="btncart" CommandName="add" CommandArgument='<%# Eval("Id") %>' runat="server" CssClass="flaticon-bag" ToolTip="Add Item"></asp:LinkButton>
                                           

                                        </div>
                                    </div>
                                    <div class="pi-text">
                                        <h5 class="text-danger">MRP:-<%# Eval("itemprice") %></h5>
                                       <%--  <p><%# Eval("itemdesc") %></p>--%>
                                                                        
                                        <p><%# Eval("daysold") %> Days Old</p>
                                          <h5 style="color:green">Selling price:-<%# Eval("sellingprice") %></h5>     
                                        <p>Seller Name:-<%# Eval("name") %></p>
                                         <p style="color:red">Contact No:-<%# Eval("contactno") %></p>
                                        <p style="color:black">City:-<%# Eval("city") %></p>
                                    </div>
                                    <br />
                                    <br />
                                </div>

                            </div>
                    </ItemTemplate>

                </asp:DataList>
            </div>
            <div class="text-center pt-5">
                <button class="site-btn sb-line sb-dark">LOAD MORE</button>
            </div>
        </div>
    </section>
    <!-- Product filter section end -->


    <!-- Banner section -->
    <section class="banner-section">
        <div class="container">
            <div class="banner set-bg" data-setbg="img/banner-bg.jpg">
                <div class="tag-new">NEW</div>
                <span>New Arrivals</span>
                <h2>STRIPED SHIRTS</h2>
                <a href="#" class="site-btn">SHOP NOW</a>
            </div>
        </div>
    </section>
    <!-- Banner section end  -->
    <section class="top-letest-product-section">
        <div class="container">
            <div class="section-title">
                <h2>About Us</h2>
            </div>
            <p>
                There are plenty of benefits of having an E-commerce website for your business – and these benefit not only you, the business owner, but also your customers. Customer satisfaction is of the utmost importance when you’re running a business, so the fact that an E-commerce website has the potential to improve your customer’s experience is worth it alone.
            </p>
            <p>
                Having your products available to browse and purchase online makes life easier for your customer and saves them time. Working people often only find time to browse shopping centres on the weekend – and most of the time we don’t even have time for that! E-commerce allows your customers to sit back in the comfort of their own homes and browse your catalogue and make the purchase right there and then, rather than waiting for some time over the weekend. This definitely also suits the night owls out there. An E-commerce site means that your shop is open 24 hours a day – ideal for those who wish to do some shopping when the shops have already shut their doors.
            </p>

            <div class="col-lg-12  order-1 order-lg-12 mb-5 mb-lg-0">


                <div class="row">
                    <div class="col-lg-6 col-sm-6">
                        <div class="product-item">
                            <div class="pi-pic">

                                <img src="./img/3.png" alt="">
                                <div class="pi-links">
                                </div>
                            </div>

                        </div>
                    </div>
                    <div class="col-lg-6 col-sm-6">
                        <div class="product-item">
                            <div class="pi-pic">

                                <img src="./img/4.jpg" alt="">
                                <div class="pi-links">
                                </div>
                            </div>

                        </div>
                    </div>

                </div>
            </div>
        </div>

    </section>

    <div class="modal fade " id="loginmodal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel11" aria-hidden="true">
        <div class="modal-dialog modal-sm" role="document" style="margin-top: 120px">
            <div class="modal-content">
                <div class="modal-header bg-dark">
                    <h5 class="modal-title text-center" id="exampleModalLabel11" style="color: white; font-weight: 700"><i class="fa fa-sign-in"></i>&nbsp;Customer Login</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>



                <div class="cart-table text-center" style="border-radius: 5px 5px">

                    <div class="promo-code-form">
                        <div class="form-group text-left">



                            <h5>Email Id</h5>
                            <input type="text" placeholder="Enter Email Id" runat="server" id="txtemail" pattern="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" title="Please enter a valid email-Id.." required="required">
                            <div class="form-group"></div>
                            <h5>Password</h5>
                            <input type="Password" placeholder="Enter Password" runat="server" id="txtpwd" required="required">

                            <div class="form-group"></div>

                            <asp:Button runat="server" ID="btnlogin" CssClass="site-btn submit-order-btn" Text="Login" OnClick="btnlogin_Click"></asp:Button>

                        </div>

                    </div>
                </div>

            </div>
        </div>
    </div>
    <div class="modal fade " id="msgerror" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel11" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header text-center bg-danger">
                    <h5 class="modal-title text-center" style="color: white; font-weight: 700"><i class="fa fa-exclamation-triangle"></i>&nbsp;Message Box</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="col-md-12" style="overflow: auto;">
                        <div class="form-group text-center">
                            <asp:Label runat="server" CssClass="text-danger" ID="Label2" Font-Bold="true" Font-Size="Large" Text="Technical Error !!! Please Consult It With The Company..."></asp:Label>


                        </div>

                    </div>


                </div>

            </div>
        </div>
    </div>

    <div class="modal fade " id="msgsuccess" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel11" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header text-center bg-success">
                    <h5 class="modal-title text-center" style="color: white; font-weight: 700"><i class="fa fa-exclamation-triangle"></i>&nbsp;Message Box</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="col-md-12" style="overflow: auto;">
                        <div class="form-group text-center">
                            <asp:Label runat="server" CssClass="text-danger" ID="Label4" Font-Bold="true" Font-Size="Large" Text="Product Added To The Cart..."></asp:Label>


                        </div>

                    </div>


                </div>

            </div>
        </div>
    </div>

    <div class="modal fade " id="msgwishlist" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel11" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header text-center bg-success">
                    <h5 class="modal-title text-center" style="color: white; font-weight: 700"><i class="fa fa-exclamation-triangle"></i>&nbsp;Message Box</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="col-md-12" style="overflow: auto;">
                        <div class="form-group text-center">
                            <asp:Label runat="server" CssClass="text-danger" ID="Label1" Font-Bold="true" Font-Size="Large" Text="Product Added To Wishlist..."></asp:Label>


                        </div>

                    </div>


                </div>

            </div>
        </div>
    </div>

    <div class="modal fade " id="msgwarning" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel11" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header text-center bg-warning">
                    <h5 class="modal-title text-center" style="color: white; font-weight: 700"><i class="fa fa-exclamation-triangle"></i>&nbsp;Message Box</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="col-md-12" style="overflow: auto;">
                        <div class="form-group text-center">
                            <asp:Label runat="server" CssClass="text-danger" ID="Label3" Font-Bold="true" Font-Size="Large" Text="Sorry ,You Have To Login First..."></asp:Label>


                        </div>

                    </div>


                </div>

            </div>
        </div>
    </div>

    <div class="modal fade " id="existingproduct" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel11" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header text-center bg-warning">
                    <h5 class="modal-title text-center" style="color: white; font-weight: 700"><i class="fa fa-exclamation-triangle"></i>&nbsp;Message Box</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="col-md-12" style="overflow: auto;">
                        <div class="form-group text-center">
                            <asp:Label runat="server" CssClass="text-danger" ID="Label5" Font-Bold="true" Font-Size="Large" Text="Product Is Already In The Cart..."></asp:Label>


                        </div>

                    </div>


                </div>

            </div>
        </div>
    </div>
</asp:Content>

<%@ Page Title="" Language="C#" MasterPageFile="~/masterpage.Master" AutoEventWireup="true" CodeBehind="cart.aspx.cs" Inherits="E_Commerce.cart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script lang="javascript" type="text/javascript">


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

        function reload() {
            window.location='cart.aspx'
        }



    </script>
    <style>
        .formatradio label {
            width: 230px;
        }

        .gridview {
            background-color: #fff;
            padding: 2px;
            margin: 2% auto;
        }

            .gridview a {
                margin: auto 1%;
                border-radius: 50%;
                background-color: #444;
                padding: 5px 10px 5px 10px;
                color: #fff;
                text-decoration: none;
                -moz-box-shadow: 1px 1px 1px #111;
                -webkit-box-shadow: 1px 1px 1px #111;
                box-shadow: 1px 1px 1px #111;
            }

                .gridview a:hover {
                    background-color: #1e8d12;
                    color: #fff;
                }

            .gridview span {
                background-color: #ae2676;
                color: #fff;
                -moz-box-shadow: 1px 1px 1px #111;
                -webkit-box-shadow: 1px 1px 1px #111;
                box-shadow: 1px 1px 1px #111;
                border-radius: 50%;
                padding: 5px 10px 5px 10px;
            }
    </style>
    <style type="text/css">
        .height {
            height: 30px;
            border-radius: 2px 2px;
            border-width: 1px;
        }
    </style>
    <style type="text/css">
        .productList {
            margin: 5px 5px 5px 5px;
            padding: 10px;
            border-radius: 3px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:UpdatePanel runat="server">
        <ContentTemplate>
            <!-- Page info -->
            <div class="page-top-info">
                <div class="container">
                    <h4>Your cart</h4>
                    <div class="site-pagination">
                        <a href="Homepage.aspx">Home</a> /
				<a href="">Your cart</a>
                    </div>
                </div>
            </div>
            <!-- Page info end -->


            <!-- cart section end -->
            <section class="cart-section spad">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-8">
                            <div class="cart-table">
                                <h3 runat="server" id="lblcart">Your Cart</h3>
                                <asp:DataList ID="dlitems" runat="server" CssClass="row" RepeatColumns="2" RepeatDirection="Horizontal" OnItemCommand="dlitems_ItemCommand">
                                    <ItemTemplate>
                                        <div class="row productList">

                                            <div class="col-md-12">

                                                <div class="product-item">
                                                    <div class="pi-pic">

                                                        <img runat="server" src='<%# Eval("itemimage") %>' alt="" style="width: 300px; height: 350px">
                                                        <div class="pi-links">
                                                            <asp:LinkButton ID="btncart" CommandArgument='<%# Eval("Id") %>' runat="server" CssClass="flaticon-remove" ForeColor="Red" ToolTip="Remove Item"></asp:LinkButton>
                                                            <%--<i class="flaticon-bag" ></i><span>ADD TO CART</span>--%>
                                                        </div>
                                                    </div>
                                                    <div class="pi-text">
                                                        <h6><%# Eval("sellingprice") %></h6>
                                                        <p><%# Eval("categoryname") %></p>
                                                    </div>
                                                </div>

                                            </div>
                                    </ItemTemplate>

                                </asp:DataList>
                                <div class="total-cost">
                                    <h6>Total <span><%= ds1.Tables[0].Rows[0]["total"].ToString() %></span></h6>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 card-right">

                            <a href="checkout.aspx" class="site-btn" runat="server" id="btnchkout">Proceed to checkout</a>
                            <a href="list-items.aspx" class="site-btn sb-dark">Continue shopping</a>
                        </div>
                    </div>
                </div>
            </section>
            <!-- cart section end -->


        </ContentTemplate>
    </asp:UpdatePanel>
    <div class="modal fade " id="msgsuccess" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel11" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header text-center bg-success">
                    <h5 class="modal-title text-center" style="color: white; font-weight: 700"><i class="fa fa-check"></i>&nbsp;Message Box</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close" onclick="reload()">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="col-md-12" style="overflow: auto;">
                        <div class="form-group text-center">
                            <asp:Label runat="server" CssClass="text-danger" ID="Label4" Font-Bold="true" Font-Size="Large" Text="Item Removed From Cart Sucessfully..."></asp:Label>


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
                            <asp:Label runat="server" CssClass="text-danger" ID="Label1" Font-Bold="true" Font-Size="Large" Text="Sorry ,You Have To Login First..."></asp:Label>


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
                            <asp:Label runat="server" CssClass="text-danger" ID="Label2" Font-Bold="true" Font-Size="Large" Text="Product Is Already In The Cart..."></asp:Label>


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
                    <h5 class="modal-title text-center" id="exampleModalLabel11" style="color: white; font-weight: 700"><i class="fa fa-exclamation-triangle"></i>&nbsp;Message Box</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="col-md-12" style="overflow: auto;">
                        <div class="form-group text-center">
                            <asp:Label runat="server" CssClass="text-danger" ID="Label3" Font-Bold="true" Font-Size="Large" Text="Technical Error !!! Please Consult It With The Company..."></asp:Label>


                        </div>

                    </div>


                </div>

            </div>
        </div>
    </div>
</asp:Content>

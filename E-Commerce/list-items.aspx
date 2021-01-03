<%@ Page Title="" Language="C#" MasterPageFile="~/masterpage.Master" AutoEventWireup="true" CodeBehind="list-items.aspx.cs" Inherits="E_Commerce.list_items" %>

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
        function alertcityerror() {
            $('[id*=citymsgmodal').modal('show');
        }
        function alertwishlist() {
            $('[id*=msgwishlist]').modal('show');
        }


    </script>
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
            <div class="page-top-info">
                <div class="container">
                    <h4>Items</h4>
                    <div class="site-pagination">
                        <a href="Homepage.aspx">Home</a> /
				<a href="list-items.aspx">Shop</a> /
                    </div>
                </div>
            </div>
            <!-- Page info end -->


            <!-- Category section -->
            <section class="category-section spad">
                <div class="container">
                    <div class="row" style="margin-top:-90px;margin-bottom:-80px"> 
                        <h5>Choose City &nbsp;&nbsp;  </h5>
                            <div class="filter-widget text-right">                              

                                <asp:DropDownList ID="ddlcities" OnSelectedIndexChanged="ddlcities_SelectedIndexChanged" AutoPostBack="true" runat="server" CssClass="form-control">
                                </asp:DropDownList>
                            </div>

                       
                    </div>
                    <div class="row">
                       

                        <div class="col-lg-12  order-1 order-lg-2 mb-5 mb-lg-0">
                            <asp:DataList ID="dlitems" runat="server" CssClass="row" RepeatColumns="3" RepeatDirection="Horizontal" OnItemCommand="dlitems_ItemCommand">
                                <ItemTemplate>
                                    <div class="row productList">

                                        <div class="col-md-12">

                                            <div class="product-item">
                                                <div class="pi-pic">

                                                    <img runat="server" src='<%# Eval("itemimage") %>' alt="" style="width: 300px; height: 350px">
                                                    <div class="pi-links">
                                                        <asp:LinkButton ID="btncart" CommandArgument='<%# Eval("Id") %>' runat="server" CssClass="flaticon-bag" ToolTip="Add Item" CommandName="add"></asp:LinkButton>

                                                    </div>
                                                </div>
                                                <div class="pi-text">
                                                     <h5 style="color:red">MRP:-<%# Eval("itemprice") %></h5>
                                        <%-- <p><%# Eval("itemdesc") %></p>--%>
                                                                        
                                        <p><%# Eval("daysold") %> Days Old</p>
                                          <h5 style="color:green">Selling price:-<%# Eval("sellingprice") %></h5>     
                                      <%--  <p>Seller Name:-<%# Eval("name") %></p>--%>
                                         <p style="color:red">Contact No:-<%# Eval("contactno") %></p>
                                        <p style="color:black">City:-<%# Eval("city") %></p>
                                                <br />
                                                </div>
                                                   <br />
                                            </div>
                                               <br />
                                        </div>
                                         <br />
                                </ItemTemplate>

                            </asp:DataList>



                        </div>
                    </div>
                </div>
                </div>
            </section>
            <!-- Category section end -->
        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="dlitems" />
        </Triggers>
    </asp:UpdatePanel>
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

    <div class="modal fade " id="citymsgmodal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel11" aria-hidden="true">
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
                            <asp:Label runat="server" CssClass="text-danger" ID="Label5" Font-Bold="true" Font-Size="Large" Text="Sorry ,This Item Is Not Available In Your City"></asp:Label>


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
                            <asp:Label runat="server" CssClass="text-danger" ID="Label3" Font-Bold="true" Font-Size="Large" Text="Product Added To Wishlist..."></asp:Label>


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
</asp:Content>

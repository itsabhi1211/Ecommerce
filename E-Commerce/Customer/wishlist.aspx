<%@ Page Title="" Language="C#" MasterPageFile="~/Customer/Master.Master" AutoEventWireup="true" CodeBehind="wishlist.aspx.cs" Inherits="E_Commerce.Customer.wishlist" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script lang="javascript" type="text/javascript">

        function alertwarning() {
            $('[id*=msgwarning]').modal('show');
        }
        function alertsuccess() {
            $('[id*=wishlist]').modal('show');
        }
        function alerterror() {
            $('[id*=msgerror]').modal('show');
        }
        function alertcart() {
            $('[id*=msgsuccess]').modal('show');
        }
        function productexist() {
            $('[id*=existingproduct]').modal('show');
        }

    </script>

    <style type="text/css">
        .productList {
            margin: 5px 5px 5px 5px;
            padding: 10px;
            border-radius: 3px;
        }
    </style>

    <style type="text/css">
        ::-webkit-input-placeholder {
            color: black;
        }

        input::first-line {
            color: black;
        }
    </style>





</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:UpdatePanel ID="update" runat="server">
        <ContentTemplate>
            <div class="container">
                <div class="row">

                    <div class="col-md-12">

                        <div class="card border-bottom-primary border-top shadow-lg">
                            <div class="card-header bg-gradient-primary">
                                <div class="text-left">
                                    <h4 class="text-white"><i class="fa fa-heart"></i>&nbsp;Wishlist</h4>

                                </div>
                            </div>
                            <div class="card-body">
                                <div id="msgdiv" runat="server" visible="false">
                                    <h3 class="text-danger font-weight-bold">Not Any Item Wishlisted..</h3>
                                </div>
                                <asp:DataList ID="dlitems" runat="server" CssClass="row" RepeatColumns="4" RepeatDirection="Horizontal" OnItemCommand="dlitems_ItemCommand">
                                    <ItemTemplate>
                                        <div class="row productList">
                                            <div class="col-md-12">

                                                <div class="card text-right">

                                                    <asp:LinkButton ID="lnkremove" CommandName="remove" CommandArgument='<%# Eval("Id") %>' runat="server" ForeColor="red" CssClass="fa fa-times" Font-Underline="false" ToolTip="Remove Item"></asp:LinkButton>

                                                    <img runat="server" src='<%# Eval("itemimage") %>' alt="" style="width: 200px; height: 230px">




                                                    <h6 style="color: black; font-weight: bolder"><%# Eval("categoryname") %></h6>
                                                    <h6 style="color: black; font-weight: bolder">&#8377;&nbsp;<%# Eval("itemprice") %></h6>




                                                </div>

                                                <asp:Button ID="btnadd" CommandArgument='<%# Eval("itemid") %>' CommandName="add" runat="server" CssClass="btn btn-outline-primary" Text="Add To Cart" Width="200px" />

                                            </div>


                                        </div>
                                    </ItemTemplate>

                                </asp:DataList>

                            </div>

                        </div>
                    </div>

                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>

    <!-- Logout Modal-->


    <div class="modal fade" id="changepasswordModal1" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel1" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header text-center bg-gradient-success">
                    <h5 class="modal-title text-center" style="color: white; font-weight: 700"><i class="fa fa-check"></i>&nbsp;Sucess Message</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body text-center">

                    <asp:Label ID="lblmsg1" Font-Bold="true" runat="server" Text="Password Successfully Changed..." CssClass="text-danger" Font-Size="16px"></asp:Label>
                </div>

            </div>
        </div>
    </div>
    <div class="modal fade " id="wishlist" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel21" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header text-center bg-gradient-success">
                    <h5 class="modal-title text-center" id="exampleModalLabel21" style="color: white; font-weight: 700"><i class="fa fa-check"></i>&nbsp;Message Box</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="col-md-12" style="overflow: auto;">
                        <div class="form-group text-center">
                            <asp:Label runat="server" CssClass="text-danger" ID="Label1" Font-Bold="true" Font-Size="Large" Text="Product Removed Successfully..."></asp:Label>

                        </div>

                    </div>


                </div>

            </div>
        </div>
    </div>
    <div class="modal fade " id="msgsuccess" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel21" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header text-center bg-success">
                    <h5 class="modal-title text-center" style="color: white; font-weight: 700"><i class="fa fa-check"></i>&nbsp;Message Box</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="col-md-12" style="overflow: auto;">
                        <div class="form-group text-center">
                            <asp:Label runat="server" CssClass="text-danger" ID="Label3" Font-Bold="true" Font-Size="Large" Text="Product Added To Cart Sucsessfully... "></asp:Label>

                        </div>

                    </div>


                </div>

            </div>
        </div>
    </div>
    <div class="modal fade " id="msgerror" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel11" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header text-center bg-gradient-danger">
                    <h5 class="modal-title text-center" id="exampleModalLabel11" style="color: white; font-weight: 700"><i class="fa fa-exclamation-triangle"></i>&nbsp;Message Box</h5>
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
                            <asp:Label runat="server" CssClass="text-danger" ID="Label4" Font-Bold="true" Font-Size="Large" Text="Product Is Already In The Cart..."></asp:Label>


                        </div>

                    </div>


                </div>

            </div>
        </div>
    </div>
</asp:Content>


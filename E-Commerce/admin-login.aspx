<%@ Page Title="" Language="C#" MasterPageFile="~/masterpage.Master" AutoEventWireup="true" CodeBehind="admin-login.aspx.cs" Inherits="E_Commerce.admin_login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script lang="javascript" type="text/javascript">

        function alertwarning() {
            $('[id*=msgwarning]').modal('show');
        }
        function alertsuccess() {
            $('[id*=msgsuccess]').modal('show');
        }
        function alerterror() {
            $('[id*=msgerror]').modal('show');
        }
        function alertdelete() {
            $('[id*=msgdelete]').modal('show');
        }
        function alertupdate() {
            $('[id*=msgupdate]').modal('show');
        }

    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:UpdatePanel runat="server">
        <ContentTemplate>



            <!-- cart section end -->
            <section class="cart-section spad">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-3">
                        </div>
                        <div class="col-lg-6">
                            <div class="cart-table text-center">
                                <h3>Seller Login</h3>
                                <div class="promo-code-form">
                                    <div class="form-group text-left">

                                        <h5>Email Id</h5>
                                       <input type="text" placeholder="Enter Email" runat="server" id="txtemail" pattern="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" title="Please enter a valid email-Id.." required="required">
                                        <div class="form-group"></div>
                                        <h5>Password</h5>
                                        <input type="Password" placeholder="Enter Password" runat="server" id="txtpwd" required="required">

                                        <div class="form-group"></div>

                                        <asp:Button runat="server" ID="btnlogin" CssClass="site-btn submit-order-btn" Text="Login" OnClick="btnlogin_Click"></asp:Button>

                                    </div>

                                </div>
                            </div>
                        </div>
                        <div class="col-lg-3 card-right">

                            <%-- <a href="" class="site-btn">Proceed to checkout</a>
                    <a href="" class="site-btn sb-dark">Continue shopping</a>--%>
                        </div>
                    </div>
                </div>
            </section>
        </ContentTemplate>
    </asp:UpdatePanel>
    <!-- cart section end -->
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
                            <asp:Label runat="server" CssClass="text-danger" ID="Label1" Font-Bold="true" Font-Size="Large" Text="Wrong Id Or Password..."></asp:Label>


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
                            <asp:Label runat="server" CssClass="text-danger" ID="Label2" Font-Bold="true" Font-Size="Large" Text="Technical Error !!! Please Consult It With The Company..."></asp:Label>


                        </div>

                    </div>


                </div>

            </div>
        </div>
    </div>
</asp:Content>

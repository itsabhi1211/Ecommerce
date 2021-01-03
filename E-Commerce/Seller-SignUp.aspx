<%@ Page Title="" Language="C#" MasterPageFile="~/masterpage.Master" AutoEventWireup="true" CodeBehind="Seller-SignUp.aspx.cs" Inherits="E_Commerce.Seller_SignUp" %>
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
        function alertpwd() {
            $('[id*=msgpwd]').modal('show');
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
                        
                        <div class="col-lg-6" >
                            <div class="cart-table text-center">
                                <h3>Seller Sign Up</h3>
                                <div class="promo-code-form">
                                    <div class="form-group text-left">
                                        <h5>First Name</h5>
                                        <input type="text" placeholder="Enter First name" runat="server" id="txtsellerfname" required="required">

                                        <div class="form-group"></div>
                                        <h5>Last Name</h5>
                                        <input type="text" placeholder="Enter Last name" runat="server" id="txtsellerlname" required="required">

                                        <div class="form-group"></div>
                                        <h5>Contact Number</h5>
                                        <input type="text" placeholder="Enter Contact No." runat="server" id="txtsellercontactno" pattern="[0-9]{10}" title="Please enter a valid contact no.." required="required">
                                        <div class="form-group"></div>
                                        <h5>E-Mail Id</h5>
                                        <input type="text" placeholder="Enter E-Mail Id" runat="server" id="txtselleremail" pattern="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" title="Please enter a valid email-Id.." required="required">
                                        <div class="form-group"></div>
                                        <h5>City</h5>
                                         <input type="text" placeholder="City" runat="server" id="txtsellercity" required="required">
                                         <div class="form-group"></div>
                                        <h5>Password</h5>
                                        <input type="Password" placeholder="Enter Password" runat="server" id="txtsellerpwd" required="required">
                                        <div class="form-group"></div>
                                        <h5>Confirm Password</h5>
                                       <input type="Password" placeholder="Enter Password" runat="server" id="txtsellercnfpwd" required="required">
                                        <div class="form-group"></div>
                                         

                                        <asp:Button runat="server" ID="btnseller" CssClass="site-btn submit-order-btn" Text="Sign Up" OnClick="btnseller_Click"></asp:Button>
                                       
                                    </div>

                                </div>
                            </div>
                        </div>
                        <div class="col-lg-3 card-right">

                          
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
                            <asp:Label runat="server" CssClass="text-danger" ID="Label3" Font-Bold="true" Font-Size="Large" Text="You Have Already Been Registered..."></asp:Label>


                        </div>

                    </div>


                </div>

            </div>
        </div>
    </div>

    <div class="modal fade " id="msgpwd" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel11" aria-hidden="true">
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
                            <asp:Label runat="server" CssClass="text-danger" ID="Label1" Font-Bold="true" Font-Size="Large" Text="Passwords Not Matched"></asp:Label>


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
                            <asp:Label runat="server" CssClass="text-danger" ID="Label4" Font-Bold="true" Font-Size="Large" Text="You Have Been Registered Successfully "></asp:Label>


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
</asp:Content>


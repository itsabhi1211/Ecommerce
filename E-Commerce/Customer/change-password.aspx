<%@ Page Title="" Language="C#" MasterPageFile="~/Customer/Master.Master" AutoEventWireup="true" CodeBehind="change-password.aspx.cs" Inherits="E_Commerce.Customer.change_password" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script lang="javascript" type="text/javascript">

        function alertwarning() {
            $('[id*=msgwarning]').modal('show');
        }
        function alertsuccess() {
            $('[id*=changepasswordModal1]').modal('show');
        }
        function alerterror() {
            $('[id*=msgerror]').modal('show');
        }
        function alertwrongpwd() {
            $('[id*=msgwrongpassword]').modal('show');
        }
        function alertupdate() {
            $('[id*=msgupdate]').modal('show');
        }

    </script>



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
                    <div class="col-md-4">
                    </div>
                    <div class="col-md-4">
                        <div class="row">
                        </div>
                        <div class="card border-bottom-primary border-top shadow-lg">
                            <div class="card-header bg-gradient-primary">
                                <div class="text-center">
                                    <h4 class="text-white">Change Password</h4>

                                </div>
                            </div>
                            <div class="card-body">


                                <div class="form-group">
                                    <asp:TextBox ID="txtoldpassword" runat="server" TextMode="Password" CssClass="form-control" Placeholder="Old Password" />
                                </div>
                                <div class="form-group">
                                    <asp:TextBox ID="txtpassword" runat="server" TextMode="Password" CssClass="form-control" Placeholder="New Password" />
                                </div>
                                <div class="form-group">
                                    <asp:TextBox ID="txtnewpassword" TextMode="Password" runat="server" CssClass="form-control" Placeholder="Confirm Password" />
                                </div>
                                <div class="form-group">

                                    <a class="btn btn-primary btn-block" data-toggle="modal" data-target="#changepasswordModal"><b class="text-white">Change Password</b></a>
                                </div>
                            </div>

                        </div>
                    </div>
                    <div class="col-md-4">
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>

    <!-- Logout Modal-->
    <div class="modal fade" id="changepasswordModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header text-center bg-gradient-primary">
                    <h5 class="modal-title text-center" style="color: white; font-weight: 700"><i class="fa fa-list"></i>&nbsp;Confirmation Box</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">
                    <p style="color: black">Select "Change password" below if you are ready to change your current password..</p>

                </div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                    <asp:Button ID="btnchangepassword" runat="server" Text="Change Password" CssClass="btn btn-primary" OnClick="btnchangepassword_Click" />
                </div>
            </div>
        </div>
    </div>

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
    <div class="modal fade " id="msgwarning" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel21" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header text-center bg-gradient-warning">
                    <h5 class="modal-title text-center" id="exampleModalLabel21" style="color: white; font-weight: 700"><i class="fa fa-exclamation-triangle"></i>&nbsp;Warning Message</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="col-md-12" style="overflow: auto;">
                        <div class="form-group text-center">
                            <asp:Label runat="server" CssClass="text-danger" ID="Label1" Font-Bold="true" Font-Size="Large" Text="Your Old Password was wrong...."></asp:Label>

                        </div>

                    </div>


                </div>

            </div>
        </div>
    </div>
    <div class="modal fade " id="msgwrongpassword" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel21" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header text-center bg-gradient-warning">
                    <h5 class="modal-title text-center" style="color: white; font-weight: 700"><i class="fa fa-exclamation-triangle"></i>&nbsp;Warning</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="col-md-12" style="overflow: auto;">
                        <div class="form-group text-center">
                            <asp:Label runat="server" CssClass="text-danger" ID="Label3" Font-Bold="true" Font-Size="Large" Text="Password Not Matched , Please Try Again..."></asp:Label>

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


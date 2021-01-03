<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/master.Master" AutoEventWireup="true" CodeBehind="user-profile.aspx.cs" Inherits="E_Commerce.Admin.user_profile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .formatradio label {
            width: 84px;
        }
    </style>
    <script type="text/javascript">

        function successmodal() {
            $('[id*=msgsuccess]').modal('show');
        }
        function errormodal() {
            $('[id*=msgerror]').modal('show');
        }
        function updatemodal() {
            $('[id*=msgupdate]').modal('show');
        }
        function warningmodal() {
            $('[id*=msgwarning]').modal('show');
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:UpdatePanel runat="server">
        <ContentTemplate>
            <div id="page-wrapper">
                <div id="page-inner">
                    <div class="row">
                        <div class="col-md-4 col-sm-4">
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    Profile Picture
                                </div>
                                <div class="panel-body text-center">
                                    <img id="imgprofilepic" src="assets/img/find_user.png" runat="server" cssclass=" user-image img-responsive" style="height: 200px; width: 200px" />

                                    <div class="clearfix"></div>
                                    <div class="col-md-12">

                                        <asp:FileUpload ID="txtfile" runat="server" CssClass="form-control"></asp:FileUpload>
                                    </div>

                                    <div class="text-center">
                                        <br />
                                        <br />
                                        <asp:Button ID="btnprofilepic" runat="server" CssClass="btn btn-primary" Text="Upload Profile Picture" OnClick="btnprofilepic_Click" />
                                    </div>

                                </div>

                            </div>
                        </div>
                        <div class="col-md-8 col-sm-8">
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    User Details
                                </div>
                                <div class="panel-body">
                                    <div class="form-group">
                                        <div class="row">

                                            <div class="col-md-6">
                                                <asp:TextBox ID="txtname" runat="server" CssClass="form-control" placeholder="Name"></asp:TextBox>
                                            </div>
                                            <div class="col-md-6">
                                                <asp:TextBox ID="txtcontactno" runat="server" CssClass="form-control" placeholder="Contact No"></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="row">

                                            <div class="col-md-6">
                                                <asp:TextBox ID="txtemail" runat="server" CssClass="form-control" placeholder="Email"></asp:TextBox>
                                            </div>
                                            <div class="col-md-6">
                                                <asp:TextBox ID="txtcity" runat="server" CssClass="form-control" placeholder="City"></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="row">

                                            <div class="col-md-6">
                                                <asp:TextBox ID="txtstate" runat="server" CssClass="form-control" placeholder="State"></asp:TextBox>
                                            </div>
                                            <div class="col-md-6">
                                                <asp:TextBox ID="txtpincode" pattern="[0-9]{6}" title="Enter A Valid Pincode Number" runat="server" CssClass="form-control" placeholder="Pincode"></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="row">

                                            <div class="col-md-6">
                                                <asp:RadioButtonList runat="server" CssClass="checkbox-inline formatradio" TextAlign="Right" RepeatDirection="Horizontal" ID="radiogender">
                                                    <asp:ListItem Text="Male" Value="M"></asp:ListItem>
                                                    <asp:ListItem Text="Female" Value="F"></asp:ListItem>
                                                    <asp:ListItem Text="Other" Value="O"></asp:ListItem>
                                                </asp:RadioButtonList>
                                            </div>
                                            <div class="col-md-6">
                                               


                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="row">

                                            <div class="col-md-12">
                                                <textarea class="form-control" placeholder="Address" cols="20" rows="2" runat="server" id="txtaddress"></textarea>
                                            </div>

                                        </div>
                                    </div>

                                    <div class="row">

                                        <div class="col-md-12 text-right">
                                            <asp:Button runat="server" CssClass="btn btn-danger" Text="Reset" OnClick="btnreset_Click" />
                                            <asp:Button runat="server" CssClass="btn btn-primary" Text="Update" OnClick="btnupload_Click" />
                                        </div>

                                    </div>
                                </div>


                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="btnprofilepic" />
        </Triggers>
    </asp:UpdatePanel>


    <div class="modal fade" id="msgsuccess" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-sm">
            <div class="modal-content modal-open">
                <div class="modal-header bg-color-green">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title" id="myModalLabel"><i class="fa fa-check"></i>&nbsp;Alert Box</h4>
                </div>
                <div class="modal-body">
                    <h4 style="font-weight: bolder">You Have Successfully Saved The Details...</h4>
                </div>

            </div>
        </div>
    </div>

    <div class="modal fade" id="msgupdate" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-sm">
            <div class="modal-content modal-open">
                <div class="modal-header bg-color-green">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title"><i class="fa fa-check"></i>&nbsp;Alert Box</h4>
                </div>
                <div class="modal-body">
                    <h4 style="font-weight: bolder">You Have Successfully Updated The Details...</h4>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>

                </div>
            </div>
        </div>
    </div>
    <div class="modal fade" id="msgerror" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-sm">
            <div class="modal-content modal-open">
                <div class="modal-header bg-color-red">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title"><i class="fa fa-exclamation-triangle"></i>&nbsp;Alert Box</h4>
                </div>
                <div class="modal-body">
                    <h4 style="font-weight: bolder">Technical Error !!! Please Consult It With The Company...</h4>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>

                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="msgwarning" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog moda-sm">
            <div class="modal-content modal-open">
                <div class="modal-header bg-gradient-warning">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title"><i class="fa fa-exclamation-triangle"></i>&nbsp;Alert Box</h4>
                </div>
                <div class="modal-body">
                    <h4>You Have Successfully Saved The Details...</h4>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>

                </div>
            </div>
        </div>
    </div>

</asp:Content>


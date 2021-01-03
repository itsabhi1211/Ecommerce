<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/master.Master" AutoEventWireup="true" CodeBehind="change-password.aspx.cs" Inherits="E_Commerce.Admin.change_password" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
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
            <div class="row" style="margin-top: 100px">
                <div class="col-md-4 col-sm-4">
                </div>
                <div class="col-md-4 col-sm-4">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <i class="fa fa-lock"></i>&nbsp;Change Password
                        </div>
                        <div class="panel-body">
                            <div class="form-group">
                                <div class="row">

                                    <div class="col-md-12">
                                        <asp:TextBox ID="txtoldpassword" TextMode="Password" runat="server" CssClass="form-control" placeholder="Old Password"></asp:TextBox><br />
                                    </div>
                                    <div class="col-md-12">
                                        <asp:TextBox ID="txtnewpassword" TextMode="Password" runat="server" CssClass="form-control" placeholder="New Password"></asp:TextBox><br />
                                    </div>
                                    <div class="col-md-12">
                                        <asp:TextBox ID="txtconfirpassword" TextMode="Password" runat="server" CssClass="form-control" placeholder="Confirm Password"></asp:TextBox><br />
                                    </div>
                                    <div class="col-md-12">
                                        <asp:Button ID="btnchangepwd" runat="server" CssClass="btn btn-primary btn-block" Text="Change Password" OnClick="btnchangepwd_Click"/>
                                    </div>
                                </div>
                            </div>


                        </div>

                    </div>
                </div>

                <div class="col-md-4 col-sm-4">
                </div>
            </div>
        </div>
    </div>
     </ContentTemplate>
        <Triggers>
          <asp:PostBackTrigger ControlID="btnchangepwd"/>
        </Triggers>
    </asp:UpdatePanel>
      <div class="modal fade" id="msgsuccess" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content modal-open">
                <div class="modal-header bg-color-green">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title" id="myModalLabel"><i class="fa fa-check"></i>&nbsp;Alert Box</h4>
                </div>
                <div class="modal-body">
                    <h4 style="font-weight: bolder">You Have Successfully Saved The Details...</h4>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>

                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="msgupdate" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
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
        <div class="modal-dialog">
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
        <div class="modal-dialog">
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


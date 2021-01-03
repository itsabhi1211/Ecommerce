<%@ Page Title="" Language="C#" MasterPageFile="~/Customer/Master.Master" AutoEventWireup="true" CodeBehind="user-profile.aspx.cs" Inherits="E_Commerce.Customer.user_profile" %>

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
    <asp:UpdatePanel ID="update" runat="server">
        <ContentTemplate>
            <div class="container">

                <div class="row">
                    <div class="col-md-4">
                        <div class="card border-bottom-primary border-top shadow-lg">

                            <div class="card-body">

                                <div class="form-group">
                                    <div class="text-center">
                                        <img id="imgprofile" runat="server" class="img-profile rounded-circle" src="" style="height: 150px; width: 150px; border-radius: 10px 10px" />
                                    </div>

                                </div>
                                <div class="form-group">
                                    <asp:FileUpload ID="txtfile" runat="server" CssClass="form-control" />
                                </div>
                                <div class="form-group text-right">
                                    <asp:Button ID="btnupload" runat="server" Text="Upload Profile Picture" CssClass="btn btn-primary btn-block" OnClick="btnupload_Click" />
                                </div>
                            </div>
                            
                            <br />
                        </div>
                    </div>
                    <div class="col-md-8">
                        <div class="card border-bottom-primary border-top shadow-lg">

                            <div class="card-body">

                                <div class="row">

                                    <div class="col-md-6">
                                        <div class="form-group">

                                            <input type="text" id="txtname" runat="server" class="form-control" placeholder="Name" />
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">

                                            <input type="text" id="txtcontactno" runat="server" class="form-control" placeholder="Contact Number" />
                                        </div>
                                    </div>


                                </div>
                                <div class="row">

                                    <div class="col-md-6">
                                        <div class="form-group">

                                            <input type="text" id="txtemail" runat="server" class="form-control" placeholder="Email" />
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">

                                            <input type="text" id="txtpincode" pattern="[0-9]{6}" title="Enter A Valid Pincode Number" runat="server" class="form-control" placeholder="Pincode" />
                                        </div>
                                    </div>


                                </div>
                                <div class="row">

                                    <div class="col-md-6">
                                        <div class="form-group">


                                            <input type="text" id="txtcity" runat="server" class="form-control" placeholder="City" />
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">

                                            <input type="text" runat="server" id="txtstate" class="form-control" placeholder="State" />
                                        </div>
                                    </div>


                                </div>
                                <div class="row">

                                    <div class="col-md-6">
                                        <div class="form-group">


                                            <asp:RadioButtonList runat="server" CssClass="checkbox-inline formatradio" TextAlign="Right" RepeatDirection="Horizontal" ID="radiogender">
                                                <asp:ListItem Text="Male" Value="M"></asp:ListItem>
                                                <asp:ListItem Text="Female" Value="F"></asp:ListItem>
                                                <asp:ListItem Text="Other" Value="O"></asp:ListItem>
                                            </asp:RadioButtonList>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                          
                                            <input type="text" runat="server" id="txtdob" class="form-control" placeholder="Date Of Birth" />
                                        </div>
                                    </div>


                                </div>
                                <div class="row">

                                    <div class="col-md-12">

                                        <div class="form-group">

                                            <textarea cols="10" rows="1" id="txtaddress" runat="server" class="form-control" placeholder="Address"></textarea>
                                        </div>
                                    </div>


                                </div>
                                <div class="row">

                                    <div class="col-md-12 text-right">
                                        <asp:Button runat="server" CssClass="btn btn-danger" Text="Reset" OnClick="btnreset_Click" ID="btnreset" />
                                        <asp:Button runat="server" CssClass="btn btn-primary" Text="Update" ID="btnupdate" OnClick="btnupdate_Click" />
                                    </div>

                                </div>
                                <div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="btnupload" />

        </Triggers>
    </asp:UpdatePanel>
</asp:Content>

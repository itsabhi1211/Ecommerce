<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/master.Master" AutoEventWireup="true" CodeBehind="contact-us.aspx.cs" Inherits="E_Commerce.Admin.contact_us" %>

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
    <style type="text/css">
        .formatradio label {
            width: 120px;
        }
    </style>
    <script lang="javascript" type="text/javascript">
        function searchTable(obj, index) {

            var filter = obj.value.toUpperCase();
            var grid = document.getElementById('<%= grdcontact.ClientID%>');
            for (var i = 1; i < grid.rows.length; i++)
                grid.rows[i].style.display = grid.rows[i].cells[index].innerText.toUpperCase().indexOf(filter) > -1 ? '' : 'none';

        }

        function custdetailsmodal() {
            $('[id*=customerdetailsmodal]').modal('show');
        }


    </script>
    <style>
        .modal-sm1 {
            margin-top: 120px;
        }

        .height {
            height: 30px;
            border-radius: 2px 2px;
            border-width: 1px;
        }

        .radiostyle {
            height: auto;
        }

            .radiostyle label {
                margin-left: 20px !important;
                margin-right: 30px !important;
            }
    </style>
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
        ::-webkit-input-placeholder {
            color: black;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:UpdatePanel runat="server">
        <ContentTemplate>
            <div id="page-wrapper">
                <div id="page-inner">
                    <div class="row">
                        <div class="col-md-12 text-center">
                            <asp:Label runat="server" CssClass="alert alert-warning" Visible="false" ID="lblmsg"></asp:Label>

                        </div>

                        <div class="col-md-12 col-sm-12">
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <i class="fa fa-user"></i>&nbsp;Contact Details
                                </div>
                                <div class="panel-body">
                                    <div class="row">
                                        <div class="col-md-12">

                                            <div style="overflow: auto;">
                                                <asp:GridView ID="grdcontact" runat="server" CssClass="height" AutoGenerateColumns="false" AllowPaging="true" PageSize="5" OnPageIndexChanging="grdcontact_PageIndexChanging" EmptyDataText="No Record Available As Of Now" EmptyDataRowStyle-CssClass="text-white" Font-Bold="true" Font-Size="12px" HeaderStyle-Font-Names="CourierNew" HeaderStyle-ForeColor="White" HeaderStyle-BackColor="Black" ShowFooter="true">
                                                    <HeaderStyle Height="30px" />
                                                    <AlternatingRowStyle Height="30px" CssClass="text-center" />
                                                    <RowStyle Height="30px" CssClass="text-center" />
                                                    <PagerStyle HorizontalAlign="Center" CssClass="gridview" />
                                                    <FooterStyle Height="30px" BackColor="#cccccc" />
                                                    <PagerStyle HorizontalAlign="Center" CssClass="gridview" />
                                                    <Columns>
                                                        <asp:TemplateField HeaderText="S.No" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center text-white" HeaderStyle-Width="5%">
                                                            <HeaderTemplate>
                                                                <asp:TextBox ID="txtsnno" runat="server" CssClass="dropdownlists height" placeholder="S.No" ForeColor="Black" Width="60px" Font-Size="Medium" ReadOnly="true"></asp:TextBox>

                                                            </HeaderTemplate>
                                                            <ItemTemplate>
                                                                <%# Container.DataItemIndex+1 %>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Id " ItemStyle-CssClass="text-left" HeaderStyle-CssClass="text-center text-white" Visible="false">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblid" runat="server" Text='<%# Eval("Id") %>' Visible="false"></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>

                                                        <asp:TemplateField ItemStyle-CssClass="text-left" HeaderStyle-CssClass="text-center text-white" HeaderStyle-Width="8%">
                                                            <HeaderTemplate>
                                                                <asp:TextBox runat="server" CssClass="dropdownlists height" placeholder=" Date" ForeColor="Black" Width="100px" Font-Size="Medium" ReadOnly="true"></asp:TextBox>

                                                            </HeaderTemplate>
                                                            <ItemTemplate>
                                                                <asp:Label ID="lbldate" runat="server" Text='<%# Eval("crdt","{0:dd-MM-yyyy}") %>'></asp:Label>


                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField ItemStyle-CssClass="text-left" HeaderStyle-CssClass="text-center text-white" HeaderStyle-Width="8%">
                                                            <HeaderTemplate>
                                                                <asp:TextBox runat="server" CssClass="dropdownlists height" onkeyup="searchTable(this,2)" placeholder=" Name" ForeColor="Black" Width="120px" Font-Size="Medium"></asp:TextBox>

                                                            </HeaderTemplate>
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblregno" runat="server" Text='<%# Eval("name") %>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>

                                                        <asp:TemplateField ItemStyle-CssClass="text-left" HeaderStyle-CssClass="text-center text-white" HeaderStyle-Width="8%">
                                                            <HeaderTemplate>
                                                                <asp:TextBox runat="server" CssClass="dropdownlists height" onkeyup="searchTable(this,3)" placeholder=" Email-Id" ForeColor="Black" Width="220px" Font-Size="Medium"></asp:TextBox>

                                                            </HeaderTemplate>
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblname" runat="server" Text='<%# Eval("email") %>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>

                                                        <asp:TemplateField ItemStyle-CssClass="text-left" HeaderStyle-CssClass="text-center text-white" HeaderStyle-Width="8%">
                                                            <HeaderTemplate>
                                                                <asp:TextBox runat="server" CssClass="dropdownlists height" placeholder="Subject" ForeColor="Black" Width="140px" Font-Size="Medium" onkeyup="searchTable(this,4)"></asp:TextBox>

                                                            </HeaderTemplate>
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblcontact" runat="server" Text='<%# Eval("subject") %>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>

                                                        <asp:TemplateField ItemStyle-CssClass="text-left" HeaderStyle-CssClass="text-center text-white" HeaderStyle-Width="8%">
                                                            <HeaderTemplate>
                                                                <asp:TextBox runat="server" CssClass="dropdownlists height" placeholder="Message" ForeColor="Black" Width="320px" Font-Size="Medium" ReadOnly="true"></asp:TextBox>

                                                            </HeaderTemplate>
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblmsg" runat="server" Text='<%# Eval("message") %>'></asp:Label>


                                                            </ItemTemplate>
                                                        </asp:TemplateField>



                                                    </Columns>
                                                    <EmptyDataTemplate>
                                                        <div style="font-size: 20px; font-weight: bolder; text-align: left; color: #e83a3a">
                                                            Not Any Recent Record Found..
                                                        </div>
                                                    </EmptyDataTemplate>
                                                </asp:GridView>
                                                <div>
                                                </div>
                                            </div>

                                        </div>
                                    </div>
                                </div>


                            </div>
                        </div>
                    </div>


                </div>
            </div>
        </ContentTemplate>
       <%-- <Triggers>
            <asp:AsyncPostBackTrigger ControlID="grdcustomer" EventName="rowcommand" />
        </Triggers>--%>
    </asp:UpdatePanel>

    <div class="modal fade" id="msgsuccess" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content modal-open">
                <div class="modal-header bg-color-green">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title" id="myModalLabel"><i class="fa fa-check"></i>&nbsp;Alert Box</h4>
                </div>
                <div class="modal-body">
                    <h4 style="font-weight: bolder">You Have Successfully Deny The Customers Permission...</h4>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>

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
        <div class="modal-dialog modal-sm">
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


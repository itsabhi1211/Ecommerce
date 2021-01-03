<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/master.Master" AutoEventWireup="true" CodeBehind="delivered-orders.aspx.cs" Inherits="E_Commerce.Admin.delivered_orders" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .formatradio label {
            width: 120px;
        }
    </style>
    <script lang="javascript" type="text/javascript">
        function searchTable(obj, index) {

            var filter = obj.value.toUpperCase();
            var grid = document.getElementById('<%= grdorders.ClientID%>');
            for (var i = 1; i < grid.rows.length; i++)
                grid.rows[i].style.display = grid.rows[i].cells[index].innerText.toUpperCase().indexOf(filter) > -1 ? '' : 'none';

        }




    </script>
    <style type="text/css">
        .productList {
            margin: 5px 5px 5px 5px;
            padding: 10px;
            border-radius: 3px;
        }
    </style>

    <script type="text/javascript">



        function approvemodal() {
            $('[id*=msgapprove]').modal('show');
        }

        function delivermodal() {
            $('[id*=msgdeliver]').modal('show');
        }


        function errormodal() {
            $('[id*=msgerror]').modal('show');
        }
        function updatemodal() {
            $('[id*=msgupdate]').modal('show');
        }
        function itemmodal() {
            $('[id*=orderdetails]').modal('show');
        }
    </script>
    <style>
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
                                    <i class="fa fa-shopping-cart"></i>&nbsp;Delivered Order Details
                                </div>
                                <div class="panel-body">
                                    <div class="row">
                                        <div class="col-md-12">

                                            <div style="overflow: auto;">
                                                <asp:GridView ID="grdorders" runat="server" CssClass="height" AutoGenerateColumns="false" AllowPaging="true" PageSize="15" OnPageIndexChanging="grdorders_PageIndexChanging" EmptyDataText="No Record Available As Of Now" EmptyDataRowStyle-CssClass="text-white" Font-Bold="true" Font-Size="12px" HeaderStyle-Font-Names="CourierNew" HeaderStyle-ForeColor="White" HeaderStyle-BackColor="Black" ShowFooter="true" OnRowEditing="grdorders_RowEditing" OnRowDeleting="grdorders_RowDeleting" OnRowCommand="grdorders_RowCommand">
                                                    <HeaderStyle Height="30px" />
                                                    <AlternatingRowStyle Height="30px" CssClass="text-center" />
                                                    <RowStyle Height="30px" CssClass="text-center" />
                                                    <PagerStyle HorizontalAlign="Center" CssClass="gridview" />
                                                    <FooterStyle Height="30px" BackColor="#cccccc" />
                                                    <PagerStyle HorizontalAlign="Center" CssClass="gridview" />
                                                    <Columns>
                                                        <asp:TemplateField HeaderText="S.No" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center text-white" HeaderStyle-Width="5%">
                                                            <HeaderTemplate>
                                                                <asp:TextBox ID="txtsnno" runat="server" CssClass="dropdownlists height" placeholder="S.No" ForeColor="Black" Width="40px" Font-Size="Medium" ReadOnly="true"></asp:TextBox>

                                                            </HeaderTemplate>
                                                            <ItemTemplate>
                                                                <%# Container.DataItemIndex+1 %>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>


                                                        <asp:TemplateField ItemStyle-CssClass="text-left" HeaderStyle-CssClass="text-center text-white" HeaderStyle-Width="8%">
                                                            <HeaderTemplate>
                                                                <asp:TextBox runat="server" CssClass="dropdownlists height" placeholder="Order Date" ForeColor="Black" Width="105px" Font-Size="Medium" onkeyup="searchTable(this,1)"></asp:TextBox>

                                                            </HeaderTemplate>
                                                            <ItemTemplate>
                                                                <asp:Label ID="lbldate" runat="server" Text='<%# Eval("orderdate","{0:dd-MM-yyyy}") %>'></asp:Label>


                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField ItemStyle-CssClass="text-left" HeaderStyle-CssClass="text-center text-white" HeaderStyle-Width="8%">
                                                            <HeaderTemplate>
                                                                <asp:TextBox runat="server" CssClass="dropdownlists height" placeholder="Approval Date" ForeColor="Black" Width="105px" Font-Size="Medium" onkeyup="searchTable(this,2)"></asp:TextBox>

                                                            </HeaderTemplate>
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblappdate" runat="server" Text='<%# Eval("approvaldate","{0:dd-MM-yyyy}") %>'></asp:Label>


                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField ItemStyle-CssClass="text-left" HeaderStyle-CssClass="text-center text-white" HeaderStyle-Width="8%">
                                                            <HeaderTemplate>
                                                                <asp:TextBox runat="server" CssClass="dropdownlists height" placeholder="Delivered Date" ForeColor="Black" Width="130px" Font-Size="Medium" onkeyup="searchTable(this,3)"></asp:TextBox>

                                                            </HeaderTemplate>
                                                            <ItemTemplate>
                                                                <asp:Label ID="lbldelvdate" runat="server" Text='<%# Eval("deliverydate","{0:dd-MM-yyyy}") %>'></asp:Label>


                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField ItemStyle-CssClass="text-left" HeaderStyle-CssClass="text-center text-white" HeaderStyle-Width="8%">
                                                            <HeaderTemplate>
                                                                <asp:TextBox runat="server" CssClass="dropdownlists height" placeholder=" Order Number" ForeColor="Black" Width="130px" Font-Size="Medium" onkeyup="searchTable(this,4)"></asp:TextBox>

                                                            </HeaderTemplate>
                                                            <ItemTemplate>
                                                                <asp:LinkButton ID="lnkorderno" CommandName="details" CommandArgument='<%# Eval("orderno") %>' runat="server" Text='<%# Eval("orderno") %>'></asp:LinkButton>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>


                                                        <asp:TemplateField ItemStyle-CssClass="text-left" HeaderStyle-CssClass="text-center text-white" HeaderStyle-Width="8%">
                                                            <HeaderTemplate>
                                                                <asp:TextBox runat="server" CssClass="dropdownlists height" onkeyup="searchTable(this,5)" placeholder="Customer Name" ForeColor="Black" Width="140px" Font-Size="Medium"></asp:TextBox>

                                                            </HeaderTemplate>
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblname" runat="server" Text='<%# Eval("name") %>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField ItemStyle-CssClass="text-left" HeaderStyle-CssClass="text-center text-white" HeaderStyle-Width="8%">
                                                            <HeaderTemplate>
                                                                <asp:TextBox runat="server" CssClass="dropdownlists height" onkeyup="searchTable(this,6)" placeholder="Total Amount" ForeColor="Black" Width="100px" Font-Size="Medium"></asp:TextBox>

                                                            </HeaderTemplate>
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblamt" runat="server" Text='<%# Eval("totalamt") %>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField ItemStyle-CssClass="text-left" HeaderStyle-CssClass="text-center text-white" HeaderStyle-Width="8%">
                                                            <HeaderTemplate>
                                                                <asp:TextBox runat="server" CssClass="dropdownlists height" onkeyup="searchTable(this,7)" placeholder="Approved" ForeColor="Black" Width="105px" Font-Size="Medium"></asp:TextBox>

                                                            </HeaderTemplate>
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblapproved" runat="server" Text='<%# (Convert.ToBoolean(Eval("isapproved")))==false?"Not Approved":"Approved" %>' ForeColor='<%# (Convert.ToBoolean(Eval("isapproved")))==false?System.Drawing.Color.Red : System.Drawing.Color.Green %>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>

                                                        <asp:TemplateField ItemStyle-CssClass="text-left" HeaderStyle-CssClass="text-center text-white" HeaderStyle-Width="8%">
                                                            <HeaderTemplate>
                                                                <asp:TextBox runat="server" CssClass="dropdownlists height" onkeyup="searchTable(this,8)" placeholder="Delivered" ForeColor="Black" Width="110px" Font-Size="Medium"></asp:TextBox>

                                                            </HeaderTemplate>
                                                            <ItemTemplate>
                                                                <asp:Label ID="lbldelivered" runat="server" Text='<%# (Convert.ToBoolean(Eval("isdelivered")))==false?"Not Delivered":"Delivered" %>' ForeColor='<%# (Convert.ToBoolean(Eval("isdelivered")))==false?System.Drawing.Color.Red : System.Drawing.Color.Green %>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>











                                                    </Columns>
                                                    <EmptyDataTemplate>
                                                        <div style="font-size: 20px; font-weight: bolder; text-align: left; color: #e83a3a">
                                                            Not Any Order Delivered Recently....
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
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="grdorders" EventName="rowcommand" />
        </Triggers>
    </asp:UpdatePanel>
    <div class="modal fade" id="msgdeliver" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-sm">
            <div class="modal-content modal-open">
                <div class="modal-header bg-color-green">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title" id="myModalLabel"><i class="fa fa-check"></i>&nbsp;Message Box</h4>
                </div>
                <div class="modal-body">
                    <h4 style="font-weight: bolder">Order Delivered Successfully...</h4>
                </div>

            </div>
        </div>
    </div>

    <div class="modal fade" id="msgapprove" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-sm">
            <div class="modal-content modal-open">
                <div class="modal-header bg-color-green">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title"><i class="fa fa-check"></i>&nbsp;Message Box</h4>
                </div>
                <div class="modal-body">
                    <h4 style="font-weight: bolder">Order Approved...</h4>
                </div>

            </div>
        </div>
    </div>

    <div class="modal fade" id="orderdetails" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content modal-open">
                <div class="modal-header bg-color-red">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title"><i class="fa fa-list"></i>&nbsp;Item Details</h4>
                </div>
                <div class="modal-body">
                    <asp:DataList ID="dlitems" runat="server" CssClass="row" RepeatColumns="4" RepeatDirection="Horizontal">
                        <ItemTemplate>
                            <div class="row productList">
                                <div class="col-md-12">

                                    <div class="product-item">
                                        <div class="pi-pic">

                                            <img runat="server" src='<%# Eval("itemimage") %>' alt="" style="width: 150px; height: 200px" />
                                        </div>

                                        <h6><b><%# Eval("itemprice") %></b></h6>
                                        <h6><b><%# Eval("categoryname") %></b></h6>

                                    </div>

                                </div>
                        </ItemTemplate>

                    </asp:DataList>

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


</asp:Content>



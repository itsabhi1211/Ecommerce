<%@ Page Title="" Language="C#" MasterPageFile="~/Customer/Master.Master" AutoEventWireup="true" CodeBehind="delivered-orders.aspx.cs" Inherits="E_Commerce.Customer.delivered_orders" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .productList {
            margin: 5px 5px 5px 5px;
            padding: 10px;
            border-radius: 3px;
        }
    </style>
    <style>
        .height {
            height: 30px;
            border-radius: 2px 2px;
            border-width: 0px;
        }

        .modal-lg1, .modal-xl {
            max-width: 920px;
            margin: 1.75rem auto
        }

        .modal-sm1 {
            max-width: 420px;
            margin: 2.75rem auto
        }

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
        function modaldetail() {
            $('[id*=orderdetails]').modal('show');
        }

    </script>
    <script lang="javascript" type="text/javascript">
        function searchTable(obj, index) {

            var filter = obj.value.toUpperCase();
            var grid = document.getElementById('<%= grdorders.ClientID%>');
            for (var i = 1; i < grid.rows.length; i++)
                grid.rows[i].style.display = grid.rows[i].cells[index].innerText.toUpperCase().indexOf(filter) > -1 ? '' : 'none';

        }




    </script>
    <script>
        function MouseEvents(objRef, evt) {
            if (evt.type == "mouseover") {
                objRef.style.cursor = 'default';
                objRef.style.backgroundColor = "Yellow";
            }
            else {
                if (evt.type == "mouseout") objRef.style.backgroundColor = "#FFF";
            }
        }
    </script>

    <style type="text/css">
        ::-webkit-input-placeholder {
            color: black;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:UpdatePanel ID="update" runat="server">
        <ContentTemplate>
            <div class="container-fluid">





                <div class="card shadow-lg mb-4 border-bottom-primary">
                    <div class="card-header bg-gradient-primary">
                        <div class="text-left">
                            <h5 class="text-white"><i class="fa fa-shopping-cart"></i>&nbsp;Recently Delivered Orders</h5>

                        </div>
                    </div>
                    <div class="card-body">

                        <div class="row">
                            <div class="col-md-12">

                                <div class="table-bordered" style="overflow: auto;">
                                    <asp:GridView ID="grdorders" ShowFooter="true" runat="server" CssClass="height" AutoGenerateColumns="false" AllowPaging="true" PageSize="10" EmptyDataText="No Record Available As Of Now" EmptyDataRowStyle-CssClass="text-danger" Font-Bold="true" Font-Size="12px" HeaderStyle-Font-Names="CourierNew" HeaderStyle-Font-Italic="true" HeaderStyle-ForeColor="White" HeaderStyle-BackColor="Black" OnPageIndexChanging="grdorder_PageIndexChanging" ForeColor="Black" OnRowDataBound="grdorder_RowDataBound" OnRowCommand="grdorders_RowCommand" OnRowEditing="grdorders_RowEditing" OnRowDeleting="grdorders_RowDeleting">
                                        <PagerStyle HorizontalAlign="Center" CssClass="gridview" />
                                        <HeaderStyle Height="30px" />
                                        <AlternatingRowStyle Height="30px" CssClass="text-center" />
                                        <RowStyle Height="30px" CssClass="text-center" />
                                        <PagerStyle HorizontalAlign="Center" CssClass="gridview" />
                                        <FooterStyle Height="30px" />
                                        <Columns>
                                            <asp:TemplateField HeaderText="S.No" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center text-white" HeaderStyle-Width="5%">
                                                <HeaderTemplate>
                                                    <asp:TextBox ID="txtsnno" runat="server" CssClass="dropdownlists height" placeholder="S.No" ForeColor="Black" Width="60px" Font-Size="Medium" ReadOnly="true"></asp:TextBox>

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
                                                    <asp:TextBox runat="server" CssClass="dropdownlists height" placeholder="Delivered Date" ForeColor="Black" Width="160px" Font-Size="Medium" onkeyup="searchTable(this,3)"></asp:TextBox>

                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="lbldelvdate" runat="server" Text='<%# Eval("deliverydate","{0:dd-MM-yyyy}") %>'></asp:Label>


                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField ItemStyle-CssClass="text-left" HeaderStyle-CssClass="text-center text-white" HeaderStyle-Width="8%">
                                                <HeaderTemplate>
                                                    <asp:TextBox runat="server" CssClass="dropdownlists height" placeholder=" Order Number" ForeColor="Black" Width="180px" Font-Size="Medium" onkeyup="searchTable(this,4)"></asp:TextBox>

                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="lnkorderno" CommandName="details" CommandArgument='<%# Eval("orderno") %>' runat="server" Text='<%# Eval("orderno") %>'></asp:LinkButton>
                                                </ItemTemplate>
                                            </asp:TemplateField>


                                            <asp:TemplateField ItemStyle-CssClass="text-left" HeaderStyle-CssClass="text-center text-white" HeaderStyle-Width="8%">
                                                <HeaderTemplate>
                                                    <asp:TextBox runat="server" CssClass="dropdownlists height" onkeyup="searchTable(this,5)" placeholder="Customer Name" ForeColor="Black" Width="200px" Font-Size="Medium"></asp:TextBox>

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
                                                    <asp:TextBox runat="server" CssClass="dropdownlists height" onkeyup="searchTable(this,8)" placeholder="Delivered" ForeColor="Black" Width="110px" Font-Size="Medium"></asp:TextBox>

                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="lbldelivered" runat="server" Text='<%# (Convert.ToBoolean(Eval("isdelivered")))==false?"Not Delivered":"Delivered" %>' ForeColor='<%# (Convert.ToBoolean(Eval("isdelivered")))==false?System.Drawing.Color.Red : System.Drawing.Color.Green %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>











                                        </Columns>
                                        <EmptyDataTemplate>
                                            <div style="font-size: 16px; font-weight: bolder; text-align: left">
                                                No Any Order Recently Placed
                                            </div>
                                        </EmptyDataTemplate>
                                        <EditRowStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <FooterStyle BackColor="#CCCCCC" />
                                        <HeaderStyle BackColor="Black" CssClass="Header" Font-Bold="True" ForeColor="White" />
                                        <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <RowStyle HorizontalAlign="Center" VerticalAlign="Middle" BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                        <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                                        <SortedAscendingCellStyle BackColor="#F1F1F1" />
                                        <SortedAscendingHeaderStyle BackColor="#808080" />
                                        <SortedDescendingCellStyle BackColor="#CAC9C9" />
                                        <SortedDescendingHeaderStyle BackColor="#383838" />
                                    </asp:GridView>
                                    <div>
                                    </div>
                                </div>

                            </div>
                        </div>

                    </div>
                </div>




            </div>



        </ContentTemplate>
        <Triggers>
        </Triggers>
    </asp:UpdatePanel>




    <div class="modal fade " id="msgwarning" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel212" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header text-center bg-gradient-warning">
                    <h5 class="modal-title text-center" id="exampleModalLabel212" style="color: white; font-weight: 700"><i class="fa fa-exclamation-triangle"></i>&nbsp;Alert Box</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="col-md-12" style="overflow: auto;">
                        <div class="form-group text-center">
                            <asp:Label runat="server" CssClass="text-danger" ID="lblmessage" Font-Bold="true" Font-Size="Large"></asp:Label>

                        </div>

                    </div>


                </div>

            </div>
        </div>
    </div>

    <div class="modal fade " id="msgsuccess" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel121" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header text-center bg-gradient-success">
                    <h5 class="modal-title text-center" id="exampleModalLabel121" style="color: white; font-weight: 700"><i class="fa fa-check"></i>&nbsp;Message Box</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="col-md-12" style="overflow: auto;">
                        <div class="form-group text-center">
                            <asp:Label runat="server" CssClass="text-danger" ID="Label2" Font-Bold="true" Font-Size="Large" Text="You have submitted the data Successfully..."></asp:Label>

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
                            <asp:Label runat="server" CssClass="text-danger" ID="Label3" Font-Bold="true" Font-Size="Large" Text="Technical Error !!! Please Consult It With The Company..."></asp:Label>

                        </div>

                    </div>


                </div>

            </div>
        </div>
    </div>

    <div class="modal fade " id="orderdetails" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel11" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header text-center bg-gradient-primary">
                    <h5 class="modal-title text-center" style="color: white; font-weight: 700"><i class="fa fa-list"></i>&nbsp;Order Details</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">
                    <asp:DataList ID="dlitems" runat="server" CssClass="row" RepeatColumns="4" RepeatDirection="Horizontal">
                        <ItemTemplate>
                            <div class="row productList">
                                <div class="col-md-12">

                                    <div class="product-item">
                                        <div class="pi-pic">

                                            <img runat="server" src='<%# Eval("itemimage") %>' alt="" style="width: 140px; height: 140px" />
                                        </div>

                                        <h6 style="color: black"><b><%# Eval("itemprice") %></b></h6>
                                        <h6 style="color: black"><b><%# Eval("categoryname") %></b></h6>

                                    </div>

                                </div>
                        </ItemTemplate>

                    </asp:DataList>


                </div>

            </div>
        </div>
    </div>
</asp:Content>



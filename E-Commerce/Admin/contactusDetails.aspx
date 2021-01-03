<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/master.Master" AutoEventWireup="true" CodeBehind="contactusDetails.aspx.cs" Inherits="E_Commerce.Admin.contactusDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <style>
        .height {
            height: 33px;
            border-radius: 2px 2px;
            border-width: 1px;
        }

        .gridviewrow {
            padding-bottom: 10px;
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
    <script lang="javascript" type="text/javascript">
        function searchTable(obj, index) {

            var filter = obj.value.toUpperCase();
            var grid = document.getElementById('<%= grdcategory.ClientID%>');
            for (var i = 1; i < grid.rows.length; i++)
                grid.rows[i].style.display = grid.rows[i].cells[index].innerText.toUpperCase().indexOf(filter) > -1 ? '' : 'none';

        }




    </script>

    <style type="text/css">
        ::-webkit-input-placeholder {
            color: black;
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

                     <%--   <div class="col-md-5 col-sm-5">
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <i class="fa fa-list"></i>&nbsp;      Add Category
                                </div>
                                <div class="panel-body">
                                    <div class="form-group">
                                        <div class="row">

                                            <div class="col-md-12">
                                                <asp:TextBox ID="txtcategory" required="required" runat="server" CssClass="form-control" placeholder="Category Name"></asp:TextBox><br />
                                            </div>


                                            <div class="col-md-12 text-right">

                                                <asp:Button runat="server" ID="btnsmt" CssClass="btn btn-primary" Text="Submit" OnClick="btnsmt_Click" />
                                                <asp:Button runat="server" ID="btnreset" CssClass="btn btn-danger" Text="Reset" OnClick="btnreset_Click" />
                                            </div>
                                        </div>
                                    </div>


                                </div>

                            </div>
                        </div>--%>
                        <div class="col-md-10 col-sm-10">
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <i class="fa fa-list"></i>&nbsp;   Contact Us Details
                                </div>
                                <div class="panel-body">
                                    <div class="row">
                                        <div class="col-md-12">


                                            <asp:GridView ID="grdcategory" runat="server" CssClass="height" AutoGenerateColumns="false" AllowPaging="true" PageSize="5" OnPageIndexChanging="grdcategory_PageIndexChanging" EmptyDataText="No Record Available As Of Now" EmptyDataRowStyle-CssClass="text-white" Font-Bold="true" Font-Size="12px" HeaderStyle-Font-Names="CourierNew" HeaderStyle-ForeColor="White" HeaderStyle-BackColor="Black" ShowFooter="true" OnRowEditing="grdcategory_RowEditing" OnRowDeleting="grdcategory_RowDeleting" OnRowCommand="grdcategory_RowCommand">
                                                <HeaderStyle Height="33px" />
                                                <AlternatingRowStyle Height="33px" CssClass="text-center gridviewrow" />
                                                <RowStyle Height="33px" CssClass="text-center" />
                                                <PagerStyle HorizontalAlign="Center" CssClass="gridview" />
                                                <FooterStyle Height="33px" BackColor="#cccccc" />
                                                <PagerStyle HorizontalAlign="Center" CssClass="gridview" />
                                                <Columns>
                                                    <asp:TemplateField HeaderText="S.No" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center text-white" HeaderStyle-Width="5%">
                                                        <HeaderTemplate>
                                                            <asp:TextBox ID="txtsnno" runat="server" CssClass="dropdownlists height" placeholder="S.No" ForeColor="Black" Width="50px" Font-Size="Medium" ReadOnly="true"></asp:TextBox>

                                                        </HeaderTemplate>
                                                        <ItemTemplate>
                                                            <%# Container.DataItemIndex+1 %>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Id " ItemStyle-CssClass="text-left" HeaderStyle-CssClass="text-center text-white" Visible="false" >
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblid" runat="server" Text='<%# Eval("Id") %>' Visible="false"></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>




                                                    <asp:TemplateField ItemStyle-CssClass="text-left" HeaderStyle-CssClass="text-center text-white" HeaderStyle-Width="15%">
                                                        <HeaderTemplate>
                                                            <asp:TextBox runat="server" CssClass="dropdownlists height" onkeyup="searchTable(this,1)" placeholder="Name" ForeColor="Black" Width="100px" Font-Size="Medium"></asp:TextBox>

                                                        </HeaderTemplate>
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblname" runat="server" Text='<%# Eval("name") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>


                                                     <asp:TemplateField ItemStyle-CssClass="text-left" HeaderStyle-CssClass="text-center text-white" HeaderStyle-Width="15%">
                                                        <HeaderTemplate>
                                                            <asp:TextBox runat="server" CssClass="dropdownlists height" onkeyup="searchTable(this,1)" placeholder="Name" ForeColor="Black" Width="80px" Font-Size="Medium"></asp:TextBox>

                                                        </HeaderTemplate>
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblsubject" runat="server" Text='<%# Eval("subject") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>

                                                    <asp:TemplateField ItemStyle-CssClass="text-left" HeaderStyle-CssClass="text-center text-white" HeaderStyle-Width="15%">
                                                        <HeaderTemplate>
                                                            <asp:TextBox runat="server" CssClass="dropdownlists height" onkeyup="searchTable(this,1)" placeholder="Name" ForeColor="Black" Width="80px" Font-Size="Medium"></asp:TextBox>

                                                        </HeaderTemplate>
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblmessage" runat="server" Text='<%# Eval("message") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>


                                                    <asp:TemplateField ItemStyle-CssClass="text-left" HeaderStyle-CssClass="text-center text-white" HeaderStyle-Width="8%">
                                                        <HeaderTemplate>
                                                            <asp:TextBox runat="server" CssClass="dropdownlists height" placeholder="Email" ForeColor="Black" Width="80px" Font-Size="Medium" onkeyup="searchTable(this,2)"></asp:TextBox>

                                                        </HeaderTemplate>
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblemail" runat="server" Text='<%# Eval("email") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>



                                                    <asp:TemplateField ItemStyle-CssClass="text-left" HeaderStyle-CssClass="text-center text-white" HeaderStyle-Width="15%">
                                                        <HeaderTemplate>
                                                            <asp:TextBox runat="server" CssClass="dropdownlists height" placeholder=" Date" ForeColor="Black" Width="100px" Font-Size="Medium" ReadOnly="true"></asp:TextBox>

                                                        </HeaderTemplate>
                                                        <ItemTemplate>
                                                            <asp:Label ID="lbldate" runat="server" Text='<%# Eval("crdt","{0:dd-MM-yyyy}") %>'></asp:Label>


                                                        </ItemTemplate>
                                                    </asp:TemplateField>


                                                  <%--  <asp:TemplateField HeaderText="Action" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center text-white" HeaderStyle-Width="15%">
                                                        <HeaderTemplate>
                                                            <asp:TextBox ReadOnly="true" runat="server" CssClass="dropdownlists height" placeholder="Action" ForeColor="Black" Width="100px" Font-Size="Medium"></asp:TextBox>

                                                        </HeaderTemplate>
                                                        <ItemTemplate>

                                                            <asp:LinkButton ID="lnkedit" runat="server" CssClass="fa fa-edit fa-1x" ForeColor="Blue" CommandName="Edit" CommandArgument='<%# Eval("Id") %>' Font-Bold="true"></asp:LinkButton>
                                                            |
                                                        <asp:LinkButton ID="lnkdelete" runat="server" CssClass="fa fa-trash-o fa-1x" ForeColor="Red" CommandName="Delete" CommandArgument='<%# Eval("Id") %>' Font-Bold="true" OnClientClick="if ( !confirm('Do you want to receive this Item?')) return false;"></asp:LinkButton>

                                                        </ItemTemplate>
                                                    </asp:TemplateField>--%>

                                                </Columns>
                                                <EmptyDataTemplate>
                                                    <div style="font-size: 16px; font-weight: bolder; text-align: center">
                                                        No Record Found in Database
                                                    </div>
                                                </EmptyDataTemplate>
                                            </asp:GridView>

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

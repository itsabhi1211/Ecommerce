<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/master.Master" AutoEventWireup="true" CodeBehind="add-items.aspx.cs" Inherits="E_Commerce.Admin.add_items" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script lang="javascript" type="text/javascript">
        var size = 2;
        var id = 0;

        function ProgressBar() {
            var fileUpload = document.getElementById("txtfile");
            if (fileUpload.value != "") {
                document.getElementById("divProgress").style.display = "block";
                document.getElementById("divUpload").style.display = "block";
                id = setInterval(progress, 20);
            }
            else {
                alert("Select a file to upload");
                return false;
            }
        }

        function progress() {
            size = size + 1;
            if (size > 299) {
                clearTimeout(id);
            }
            document.getElementById("divProgress").style.width = size + "pt";
            document.getElementById("<%=lblPercentage.ClientID %>").firstChild.data = parseInt(size / 3) + "%";
        }

    </script>

    <style type="text/css">
        body {
            margin: 0;
            padding: 0;
            height: 100%;
        }

        .hidebr br {
            display: none;
        }

        .modal1 {
            display: none;
            position: absolute;
            top: 0px;
            left: 0px;
            background-color: black;
            z-index: 100;
            opacity: 0.8;
            filter: alpha(opacity=60);
            -moz-opacity: 0.8;
            min-height: 100%;
        }



        #divImage {
            display: none;
            z-index: 1000;
            position: fixed;
            top: 0;
            left: 0;
            background-color: White;
            height: 550px;
            width: 600px;
            padding: 3px;
            border: solid 1px black;
        }

        .height {
            height: 30px;
        }

        .productList {
            margin-bottom: 5px;
            padding: 22px;
            border-radius: 3px;
        }
    </style>
    <script type="text/javascript">
        function LoadDiv(url) {
            var img = new Image();
            var bcgDiv = document.getElementById("divBackground");
            var imgDiv = document.getElementById("divImage");
            var imgFull = document.getElementById("imgFull");
            var imgLoader = document.getElementById("imgLoader");
            imgLoader.style.display = "block";
            img.onload = function () {
                imgFull.src = img.src;
                imgFull.style.display = "block";
                imgLoader.style.display = "none";
            };
            img.src = url;
            var width = document.body.clientWidth;
            if (document.body.clientHeight > document.body.scrollHeight) {
                bcgDiv.style.height = document.body.clientHeight + "px";
            }
            else {
                bcgDiv.style.height = document.body.scrollHeight + "px";
            }
            imgDiv.style.left = (width - 650) / 2 + "px";
            imgDiv.style.top = "20px";
            bcgDiv.style.width = "100%";

            bcgDiv.style.display = "block";
            imgDiv.style.display = "block";
            return false;
        }
        function HideDiv() {
            var bcgDiv = document.getElementById("divBackground");
            var imgDiv = document.getElementById("divImage");
            var imgFull = document.getElementById("imgFull");
            if (bcgDiv != null) {
                bcgDiv.style.display = "none";
                imgDiv.style.display = "none";
                imgFull.style.display = "none";
            }

        }
    </script>
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
            var grid = document.getElementById('<%= grditems.ClientID%>');
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
            <asp:HiddenField ID="hdfimg" runat="server" />
            <div id="page-wrapper">
                <div id="page-inner">
                    <div class="row">

                        <div class="col-md-4 col-sm-4">
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <i class="fa fa-list"></i>&nbsp;      Add Items 
                                </div>
                                <div class="panel-body">
                                    <div class="form-group">
                                        <div class="row">
                                            <div class="col-md-12">
                                                <b>Category</b>
                                                <asp:DropDownList ID="ddlcategory" required="required" runat="server" CssClass="form-control">
                                                </asp:DropDownList>

                                            </div>
                                            <div class="clearfix"></div>


                                            <div class="col-md-12">
                                                <b>Product Title</b>
                                                <asp:TextBox ID="txtproducttitle" required="required" runat="server" CssClass="form-control" placeholder="Product Title"></asp:TextBox>
                                            </div>
                                            <div class="clearfix"></div>
                                            <div class="col-md-12">
                                                <b>Price</b>
                                                <asp:TextBox ID="txtitemprice" required="required" runat="server" CssClass="form-control" placeholder="Item Price"></asp:TextBox>
                                            </div>
                                            <div class="clearfix"></div>
                                             <div class="col-md-12">
                                                <b>Date Of Purchase</b>
                                                <asp:TextBox ID="txtdop" TextMode="Date" required="required" runat="server" CssClass="form-control" placeholder="Date Of Purchase"></asp:TextBox>
                                            </div>
                                            <div class="clearfix"></div>
                                            <div class="col-md-12">
                                                <b>Selling Price</b>
                                                <asp:TextBox ID="txtsellingprice" required="required" runat="server" CssClass="form-control" placeholder="Selling Price"></asp:TextBox>
                                            </div>
                                           
                                            <div class="clearfix"></div>
                                            <div class="col-md-12">
                                                <b>Upload Image</b>
                                                <asp:FileUpload ID="txtfile" runat="server" CssClass="form-control"></asp:FileUpload>
                                            </div>
                                            <div class="clearfix"></div>
                                            <div class="col-md-12">
                                                <b>Item Description</b>
                                                <asp:TextBox TextMode="MultiLine" ID="txtdesc" required="required" runat="server" CssClass="form-control" placeholder="Item Description"></asp:TextBox>
                                            </div>
                                            <div class="clearfix"></div>

                                            <div class="col-md-12 text-right">

                                                <asp:Button runat="server" ID="btnsmt" CssClass="btn btn-primary" Text="Submit" OnClick="btnsmt_Click"  />
                                                <asp:Button runat="server" ID="btnreset" CssClass="btn btn-danger" Text="Reset" OnClick="btnreset_Click" />
                                            </div>
                                            <div class="clearfix"></div>
                                            <div id="divUpload" style="display: none">
                                                <div class="col-md-12 text-center">
                                                    <%--style="width: 300pt; text-align: center;"--%>
                                                    <b>Uploading...</b>
                                                </div>
                                                <div style="width: 300pt; height: 20px; border: solid 1pt gray">
                                                    <div id="divProgress" runat="server" style="width: 1pt; height: 20px; background-color: red; display: none">
                                                    </div>
                                                </div>
                                                <div style="width: 300pt; text-align: center;">
                                                    <asp:Label ID="lblPercentage" runat="server" Text="Label"></asp:Label>
                                                </div>
                                                <br />
                                                <asp:Label ID="Label1" runat="server" ForeColor="Red" Text=""></asp:Label>
                                            </div>
                                        </div>
                                    </div>


                                </div>

                            </div>
                        </div>
                        <div class="col-md-8 col-sm-8">
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <i class="fa fa-list"></i>&nbsp;   Items With Details
                                </div>
                                <div class="panel-body">
                                    <div class="row">
                                        <div class="col-md-12">


                                            <asp:GridView ID="grditems" runat="server" CssClass="height" AutoGenerateColumns="false" AllowPaging="true" PageSize="5" OnPageIndexChanging="grditems_PageIndexChanging" EmptyDataText="No Record Available As Of Now" EmptyDataRowStyle-CssClass="text-white" Font-Bold="true" Font-Size="9px" HeaderStyle-Font-Names="CourierNew" HeaderStyle-ForeColor="White" HeaderStyle-BackColor="Black" ShowFooter="true" OnRowEditing="grditems_RowEditing" OnRowDeleting="grditems_RowDeleting" OnRowCommand="grditems_RowCommand">
                                                <HeaderStyle Height="30px" />
                                                <AlternatingRowStyle Height="30px" CssClass="text-center gridviewrow" />
                                                <RowStyle Height="30px" CssClass="text-center" />
                                                <PagerStyle HorizontalAlign="Center" CssClass="gridview" Height="30px" />
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
                                                    <asp:TemplateField HeaderText="Id " ItemStyle-CssClass="text-left" HeaderStyle-CssClass="text-center text-white" Visible="false">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblid" runat="server" Text='<%# Eval("Id") %>' Visible="false"></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>




                                                    <asp:TemplateField ItemStyle-CssClass="text-left" HeaderStyle-CssClass="text-center text-white" HeaderStyle-Width="8%">
                                                        <HeaderTemplate>
                                                            <asp:TextBox runat="server" CssClass="dropdownlists height" onkeyup="searchTable(this,1)" placeholder="Name" ForeColor="Black" Width="80px" Font-Size="Medium"></asp:TextBox>

                                                        </HeaderTemplate>
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblbarcode" runat="server" Text='<%# Eval("producttitle") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>

                                                    <asp:TemplateField ItemStyle-CssClass="text-left" HeaderStyle-CssClass="text-center text-white" HeaderStyle-Width="8%">
                                                        <HeaderTemplate>
                                                            <asp:TextBox runat="server" CssClass="dropdownlists height" placeholder="Category" ForeColor="Black" Width="80px" Font-Size="Small" onkeyup="searchTable(this,2)"></asp:TextBox>

                                                        </HeaderTemplate>
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblcategory" runat="server" Text='<%# Eval("categoryname") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>

                                                    <asp:TemplateField ItemStyle-CssClass="text-left" HeaderStyle-CssClass="text-center text-white" HeaderStyle-Width="1%">
                                                        <HeaderTemplate>
                                                            <asp:TextBox runat="server" CssClass="dropdownlists height" placeholder="selling price" ForeColor="Black" Width="60px" Font-Size="Medium" onkeyup="searchTable(this,3)"></asp:TextBox>

                                                        </HeaderTemplate>
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblgender" runat="server" Text='<%# Eval("sellingprice") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>


                                                    <asp:TemplateField ItemStyle-CssClass="text-left" HeaderStyle-CssClass="text-center text-white" HeaderStyle-Width="8%">
                                                        <HeaderTemplate>
                                                            <asp:TextBox runat="server" CssClass="dropdownlists height" placeholder="Price" ForeColor="Black" Width="60px" Font-Size="Small" onkeyup="searchTable(this,4)"></asp:TextBox>

                                                        </HeaderTemplate>
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblprice" runat="server" Text='<%# Eval("itemprice") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>


                                                    
                                                      <asp:TemplateField ItemStyle-CssClass="text-left" HeaderStyle-CssClass="text-center text-white" HeaderStyle-Width="8%">
                                                        <HeaderTemplate>
                                                            <asp:TextBox runat="server" CssClass="dropdownlists height" placeholder="DOP" ForeColor="Black" Width="125px" Font-Size="Small" onkeyup="searchTable(this,5)"></asp:TextBox>

                                                        </HeaderTemplate>
                                                        <ItemTemplate>
                                                            <asp:Label  runat="server" Text='<%# Eval("DOP") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>


                                                    <asp:TemplateField ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center text-white" HeaderStyle-Width="8%">
                                                        <HeaderTemplate>
                                                            <asp:TextBox runat="server" CssClass="dropdownlists height" placeholder="Image" ForeColor="Black" Width="60px" Font-Size="Medium" ReadOnly="true"></asp:TextBox>

                                                        </HeaderTemplate>
                                                        <ItemTemplate>
                                                            <asp:ImageButton ID="itemimage" runat="server" class="img-profile rounded-circle" Style="height: 30px; width: 30px" ImageUrl='<%# Eval("itemimage") %>' OnClientClick="return LoadDiv(this.src);" />


                                                        </ItemTemplate>
                                                    </asp:TemplateField>






                                                    


                                                    <asp:TemplateField HeaderText="Action" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center text-white" HeaderStyle-Width="5%">
                                                        <HeaderTemplate>
                                                            <asp:TextBox ReadOnly="true" runat="server" CssClass="dropdownlists height" placeholder="Action" ForeColor="Black" Width="50px" Font-Size="Medium"></asp:TextBox>

                                                        </HeaderTemplate>
                                                        <ItemTemplate>

                                                            <asp:LinkButton ID="lnkedit" runat="server" CssClass="fa fa-edit fa-1x" ForeColor="Blue" CommandName="Edit" CommandArgument='<%# Eval("Id") %>' Font-Bold="true"></asp:LinkButton>
                                                            |
                                                        <asp:LinkButton ID="lnkdelete" runat="server" CssClass="fa fa-trash-o fa-1x" ForeColor="Red" CommandName="Delete" CommandArgument='<%# Eval("Id") %>' Font-Bold="true" OnClientClick="if ( !confirm('Do you want to receive this Item?')) return false;"></asp:LinkButton>

                                                        </ItemTemplate>
                                                    </asp:TemplateField>

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
        <Triggers>
            <asp:PostBackTrigger ControlID="btnsmt" />
            <%--  <asp:AsyncPostBackTrigger ControlID="btnsmt" EventName="Click" />--%>
        </Triggers>
    </asp:UpdatePanel>
    <div id="divBackground" class="modal1">
    </div>

    <div id="divImage">
        <table style="height: 100%; width: 100%">
            <tr>
                <td valign="middle" align="center">
                    <img id="imgLoader" alt="" src="../images/logo/giphy.gif" />
                    <img id="imgFull" alt="" src="" style="display: none; height: 500px; width: 590px" />
                </td>
            </tr>
            <tr>
                <td align="center" valign="bottom">

                    <input id="btnClose" type="button" value="Close" class="btn btn-danger" onclick="HideDiv()" />
                </td>
            </tr>
        </table>
    </div>

    <div class="modal fade" id="msgsuccess" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-sm">
            <div class="modal-content modal-open">
                <div class="modal-header bg-success">
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
        <div class="modal-dialog modal-sm">
            <div class="modal-content modal-open">
                <div class="modal-header bg-danger">
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

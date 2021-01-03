<%@ Page Title="" Language="C#" MasterPageFile="~/masterpage.Master" AutoEventWireup="true" CodeBehind="checkout.aspx.cs" Inherits="E_Commerce.checkout" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .productList {
            margin: 5px 5px 5px 5px;
            padding: 10px;
            border-radius: 3px;
        }
    </style>
    <script lang="javascript" type="text/javascript">

        function successmodal() {
            $('[id*=msgsuccess]').modal('show');
        }
        function errormodal() {
            $('[id*=msgerror]').modal('show');
        }
        function warningmodal() {
            $('[id*=msgwarning]').modal('show');
        }


    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:UpdatePanel runat="server">
        <ContentTemplate>


            <!-- Page info -->
            <div class="page-top-info">
                <div class="container">
                    <h4>Your cart</h4>
                    <div class="site-pagination">
                        <a href="Homepage.aspx">Home</a> /
				<a href="checkout.aspx">Your cart</a>
                    </div>
                </div>
            </div>
            <!-- Page info end -->


            <!-- checkout section  -->
            <section class="checkout-section spad" id="cartdiv" runat="server">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-8 order-2 order-lg-1">
                            <div class="checkout-form">
                                <div class="cf-title">Billing Address</div>
                                <div class="row">
                                    <div class="col-md-7">
                                        <p>*Billing Information</p>
                                    </div>
                                    <div class="col-md-5">
                                        <div class="cf-radio-btns address-rb">
                                            <div class="cfr-item">
                                                <asp:RadioButtonList class="cf-radio-btns" ForeColor="" ID="rdbaddress" runat="server" OnSelectedIndexChanged="rdbaddress_SelectedIndexChanged" AutoPostBack="true">
                                                    <asp:ListItem Value="R" Text="Use my regular address"></asp:ListItem>
                                                    <asp:ListItem Value="D" Text="Use a different address"></asp:ListItem>
                                                </asp:RadioButtonList>
                                                <asp:RequiredFieldValidator ID="rf" ControlToValidate="rdbaddress" runat="server" ErrorMessage="Please Choose The Address" CssClass="text-danger" Font-Bold="true" Font-Size="16px" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row address-inputs">
                                    <div class="col-md-12">
                                        <input type="text" placeholder="Address" runat="server" id="txtaddress"  required="required">
                                    </div>
                                    <div class="col-md-12">
                                        <input type="text" placeholder="E-Mail" runat="server" id="txtemail" readonly="readonly" pattern="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" title="Please enter a valid email-Id.." required="required">
                                    </div>
                                    <div class="col-md-6">
                                        <input type="text" placeholder="State" runat="server" id="txtstate"  required="required">
                                    </div>
                                    <div class="col-md-6">
                                        <input type="text" placeholder="City" runat="server" id="txtcity"  required="required">
                                    </div>
                                    <div class="col-md-6">
                                        <input type="text" placeholder="Pincode" pattern="[0-9]{6}" title="Please enter a valid contact no.." required="required" runat="server" id="txtpincode" >
                                    </div>
                                    <div class="col-md-6">
                                        <input type="text" placeholder="Phone no." pattern="[0-9]{10}" title="Please enter a valid contact no.." required="required" runat="server" id="txtcontactno" >
                                    </div>

                                </div>

                                <div class="cf-title">Payment</div>
                                <div class="cf-radio-btns address-rb text-left">
                                    <div class="cfr-item ">
                                        <asp:RadioButtonList class="cf-radio-btns" ForeColor="" ID="rdbpayment" runat="server" OnSelectedIndexChanged="rdbpayment_SelectedIndexChanged" AutoPostBack="true" required="required">
                                            <asp:ListItem Value="upi" Text="UPI"></asp:ListItem>
                                            <asp:ListItem Value="cc-dc" Text="CREDIT/DEBIT CARD"></asp:ListItem>
                                            <asp:ListItem Value="cod" Text="Pay When You Get The Package"></asp:ListItem>
                                        </asp:RadioButtonList>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="rdbpayment" runat="server" ErrorMessage="Please Choose The Payment Mode" CssClass="text-danger" Font-Bold="true" Font-Size="16px" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                                <div class="row" id="upidiv" runat="server" visible="false">
                                    <div class="col-md-12">
                                        <input type="text" placeholder="UPI ID" runat="server" id="txtupiid" required="required">
                                    </div>
                                </div>
                                <div class="row" id="debitcarddiv" runat="server" visible="false">
                                    <div class="col-md-3">
                                        <input type="text" runat="server" id="txtdb1" maxlength="4" required="required">
                                    </div>
                                    <div class="col-md-3">
                                        <input type="text" runat="server" id="txtdb2" maxlength="4" required="required">
                                    </div>
                                    <div class="col-md-3">
                                        <input type="text" runat="server" id="txtdb3" maxlength="4" required="required">
                                    </div>
                                    <div class="col-md-3">
                                        <input type="text" runat="server" id="txtdb4" maxlength="4" required="required">
                                    </div>

                                    <div class="col-md-3">
                                        <b>CVV</b>
                                        <input type="text" runat="server" id="txtcvv" maxlength="3" required="required">
                                    </div>
                                </div>




                                <asp:Button CssClass="site-btn submit-order-btn" Text="Place Order" runat="server" ID="btnorder" OnClick="btnorder_Click" />
                            </div>
                        </div>
                        <div class="col-lg-4 order-1 order-lg-2">



                            <div class="checkout-cart">
                                <h3 runat="server" id="lblcartmsg">Your Cart</h3>

                                <asp:DataList ID="dlitems" runat="server" CssClass="row" RepeatColumns="2" RepeatDirection="Horizontal" OnItemDataBound="dlitems_ItemDataBound">
                                    <ItemTemplate>
                                        <div class="row productList">

                                            <div class="col-md-12">
                                                <asp:HiddenField ID="hdfid" runat="server" Value='<%# Eval("Id") %>' />
                                                <div class="product-item">
                                                    <div class="pi-pic">

                                                        <img runat="server" src='<%# Eval("itemimage") %>' alt="" style="width: 100px; height: 100px">
                                                    </div>
                                                    <div class="text-left">
                                                        <br />
                                                        <h6><%# Eval("sellingprice") %></h6>
                                                        <p><%# Eval("categoryname") %></p>
                                                    </div>
                                                </div>

                                            </div>
                                    </ItemTemplate>

                                </asp:DataList>
                                <ul class="price-list" id="lblprice" runat="server">
                                    <li>Total<span><b><%= ds1.Tables[0].Rows[0]["total"].ToString() %></b></span></li>
                                    <li>Shipping<span>free</span></li>

                                </ul>
                                <a href="list-items.aspx" id="btnshopping" runat="server" visible="false" class="site-btn sb-dark">Continue shopping</a>
                            </div>



                        </div>
                    </div>
                </div>
            </section>
            <%--  <div class="col-lg-12 card-right" id="shoppingbtn" runat="server" visible="false">


                <a href="list-items.aspx" class="site-btn sb-dark">Continue shopping</a>
            </div>--%>
            <!-- checkout section end -->
        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="rdbaddress" EventName="SelectedIndexChanged" />
        </Triggers>
    </asp:UpdatePanel>

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
                            <b style="font-size: 16px" class="text-danger">Order Placed Successfully... 
                                <asp:Label ID="lblorderno" runat="server" CssClass="text-danger"></asp:Label></b>


                        </div>

                    </div>


                </div>

            </div>
        </div>
    </div>

    <div class="modal fade " id="msgwarning" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel11" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header text-center bg-success">
                    <h5 class="modal-title text-center" style="color: white; font-weight: 700"><i class="fa fa-exclamation-triangle"></i>&nbsp;Warning Box</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="col-md-12" style="overflow: auto;">
                        <div class="form-group text-center">
                            <b style="font-size: 16px" class="text-danger">All Fields Are Mandatory...
                                <asp:Label ID="Label1" runat="server" CssClass="text-danger"></asp:Label></b>


                        </div>

                    </div>


                </div>

            </div>
        </div>
    </div>

    <div class="modal fade " id="msgerror" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel11" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header text-center bg-danger">
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

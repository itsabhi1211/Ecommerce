<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/master.Master" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="E_Commerce.Admin.Dashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="page-wrapper">
        <div id="page-inner">
            <div class="row">
                <div class="col-md-12">
                    <h2>Dashboard</h2>
                    <h5>Welcome
                        <asp:Label ID="lblname" Text="Admin" runat="server"></asp:Label>
                        , Love to see you back. </h5>
                </div>
            </div>
            <!-- /. ROW  -->
            <hr />
            <h2 style="color: black">Today's</h2>
            <div class="row">
                <a href="pending-customers.aspx">
                    <div class="col-md-3 col-sm-6 col-xs-6">
                        <div class="panel panel-back noti-box">
                            <span class="icon-box bg-color-red set-icon">
                                <i class="fa fa-users"></i>
                            </span>
                            <div class="text-box">
                                <p class="main-text">
                                    <asp:Label ID="lbldisappcustnow" runat="server"></asp:Label>
                                </p>
                                <p class="text-muted">Disapproved Customers</p>
                            </div>
                        </div>
                    </div>
                </a>
                <a href="approved-customers.aspx">
                    <div class="col-md-3 col-sm-6 col-xs-6">
                        <div class="panel panel-back noti-box">
                            <span class="icon-box bg-color-green set-icon">
                                <i class="fa fa-users"></i>
                            </span>
                            <div class="text-box">
                                <p class="main-text">
                                    <asp:Label ID="lblappcustnow" runat="server"></asp:Label>
                                </p>
                                <p class="text-muted">Approved Customers</p>
                            </div>
                        </div>
                    </div>
                </a>
                <a href="approve-orders.aspx">
                    <div class="col-md-3 col-sm-6 col-xs-6">
                        <div class="panel panel-back noti-box">
                            <span class="icon-box bg-color-blue set-icon">
                                <i class="fa fa-shopping-cart"></i>
                            </span>
                            <div class="text-box">
                                <p class="main-text">
                                    <asp:Label ID="lblpendingordernow" runat="server"></asp:Label>
                                </p>
                                <p class="text-muted">Pending Orders</p>
                            </div>
                        </div>
                    </div>
                </a>
                <a href="delivered-orders.aspx">
                    <div class="col-md-3 col-sm-6 col-xs-6">
                        <div class="panel panel-back noti-box">
                            <span class="icon-box bg-color-brown set-icon">
                                <i class="fa fa-rocket"></i>
                            </span>
                            <div class="text-box">
                                <p class="main-text">
                                    <asp:Label ID="lbldelivrdordernow" runat="server"></asp:Label>
                                </p>
                                <p class="text-muted">Delivered Order</p>
                            </div>
                        </div>
                    </div>
                </a>
            </div>
            <hr />
            <h2 style="color: black">Over All</h2>
            <div class="row">
                <a href="pending-customers.aspx">
                    <div class="col-md-3 col-sm-6 col-xs-6">
                        <div class="panel panel-back noti-box">
                            <span class="icon-box bg-color-red set-icon">
                                <i class="fa fa-users"></i>
                            </span>
                            <div class="text-box">
                                <p class="main-text">
                                    <asp:Label ID="lbldisappcust" runat="server"></asp:Label>
                                </p>
                                <p class="text-muted">Disapproved Customers</p>
                            </div>
                        </div>
                    </div>
                </a>
                <a href="approved-customers.aspx">
                    <div class="col-md-3 col-sm-6 col-xs-6">
                        <div class="panel panel-back noti-box">
                            <span class="icon-box bg-color-green set-icon">
                                <i class="fa fa-users"></i>
                            </span>
                            <div class="text-box">
                                <p class="main-text">
                                    <asp:Label ID="lblappcust" runat="server"></asp:Label>
                                </p>
                                <p class="text-muted">Approved Customers</p>
                            </div>
                        </div>
                    </div>
                </a>
                <a href="approve-orders.aspx">
                    <div class="col-md-3 col-sm-6 col-xs-6">
                        <div class="panel panel-back noti-box">
                            <span class="icon-box bg-color-blue set-icon">
                                <i class="fa fa-shopping-cart"></i>
                            </span>
                            <div class="text-box">
                                <p class="main-text">
                                    <asp:Label ID="lblpendingorder" runat="server"></asp:Label>
                                </p>
                                <p class="text-muted">Pending Orders</p>
                            </div>
                        </div>
                    </div>
                </a>
                <a href="delivered-orders.aspx">
                    <div class="col-md-3 col-sm-6 col-xs-6">
                        <div class="panel panel-back noti-box">
                            <span class="icon-box bg-color-brown set-icon">
                                <i class="fa fa-rocket"></i>
                            </span>
                            <div class="text-box">
                                <p class="main-text">
                                    <asp:Label ID="lbldelvorder" runat="server"></asp:Label>
                                </p>
                                <p class="text-muted">Delivered Order</p>
                            </div>
                        </div>
                    </div>
                </a>
            </div>

            <!-- /. ROW  -->

            <!-- /. ROW  -->
        </div>
        <!-- /. PAGE INNER  -->
    </div>
</asp:Content>

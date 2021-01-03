<%@ Page Title="" Language="C#" MasterPageFile="~/masterpage.Master" AutoEventWireup="true" CodeBehind="contact-us.aspx.cs" Inherits="E_Commerce.contact_us" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">

        function successmodal() {
            $('[id*=msgsuccess]').modal('show');
        }
        function errormodal() {
            $('[id*=msgerror]').modal('show');
        }

    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:UpdatePanel runat="server">
        <ContentTemplate>


            <!-- Page info -->
            <div class="page-top-info">
                <div class="container">
                    <h4>Contact</h4>
                    <div class="site-pagination">
                        <a href="Homepage.aspx">Home</a> /
				<a href="contact-us.aspx">Contact</a>
                    </div>
                </div>
            </div>
            <!-- Page info end -->


            <!-- Contact section -->
            <section class="contact-section">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-6 contact-info">
                            <h3>Get in touch</h3>
                            <p>Main Str, no 23, New York</p>
                            <p>+546 990221 123</p>
                            <p>hosting@contact.com</p>
                            <div class="contact-social">
                                <a href="#"><i class="fa fa-pinterest"></i></a>
                                <a href="#"><i class="fa fa-facebook"></i></a>
                                <a href="#"><i class="fa fa-twitter"></i></a>
                                <a href="#"><i class="fa fa-dribbble"></i></a>
                                <a href="#"><i class="fa fa-behance"></i></a>
                            </div>
                            <div class="contact-form">
                                <input type="text" placeholder="Your name" runat="server" id="txtname" required="required">
                                <input type="text" placeholder="Your e-mail" pattern="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" title="Please enter a valid email-Id.." runat="server" id="txtemail" required="required">
                                <input type="text" placeholder="Subject" runat="server" id="txtsub" required="required">
                                <textarea placeholder="Message" id="txtmsg" runat="server" required="required"></textarea>

                                <asp:Button ID="btnsend" runat="server" Text="Send Message" CssClass="btn-block btn-primary" OnClick="btnsend_Click" />
                            </div>
                        </div>
                    </div>
                </div>
                <div class="map">
                    <iframe src="https://www.google.com/maps/embed?pb=!1m14!1m12!1m3!1d14376.077865872314!2d-73.879277264103!3d40.757667781624285!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!5e0!3m2!1sen!2sbd!4v1546528920522" style="border: 0" allowfullscreen></iframe>
                </div>
            </section>
            <!-- Contact section end -->


            <!-- Related product section -->

            <!-- Related product section end -->
        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="btnsend" EventName="Click" />
        </Triggers>
    </asp:UpdatePanel>
    <div class="modal fade " id="msgsuccess" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel11" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header text-center bg-success">
                    <h5 class="modal-title text-center" style="color: white; font-weight: 700"><i class="fa fa-check"></i>&nbsp;Message Box</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="col-md-12" style="overflow: auto;">
                        <div class="form-group text-center">
                            <asp:Label runat="server" CssClass="text-danger" ID="Label4" Font-Bold="true" Font-Size="Large" Text="Message Sent Successfully, We Will Contact You Soon.."></asp:Label>


                        </div>

                    </div>


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

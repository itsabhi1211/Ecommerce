using System;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;
using E_Commerce.DataLayer;


namespace E_Commerce
{
    public partial class Homepage : System.Web.UI.Page
    {
        showdatalayer objshow = new showdatalayer();
        Insertionlayer objinsert = new Insertionlayer();
        public static DataTable dt;
        public char[] mychar = { '~', '/' };
        logindatalayer objlogin = new logindatalayer();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["customeruserid"] == null)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Popup", "userlogin()", true);

            }



            if (!IsPostBack)
            {

                bindItems();
                bindItemsAll();

            }
        }

        #region code to bind items in grid

        void bindItems()
        {
            try
            {
                dt = objshow.showtopItemsWithDetails();

            }
            catch (Exception ex)
            {

                ScriptManager.RegisterStartupScript(this, this.GetType(), "Popup", "errormodal()", true);
            }
        }

        #endregion

        #region code to bind items in grid

        void bindItemsAll()
        {
            try
            {
                DataTable objdt = objshow.showtop8ItemsWithDetails();
                if (objdt.Rows.Count > 0)
                {
                    dlitems.DataSource = objdt;
                    dlitems.DataBind();
                }
                else
                {
                    dlitems.DataSource = null;
                    dlitems.DataBind();
                }
            }
            catch (Exception ex)
            {

                ScriptManager.RegisterStartupScript(this, this.GetType(), "Popup", "errormodal()", true);
            }
        }


        #endregion

        #region code to login

        void login()
        {
            try
            {
                string pwd = txtpwd.Value;
                string email = (txtemail.Value);
                DataTable objdt = objlogin.customerLogin(pwd, email);
                if (objdt.Rows.Count > 0)
                {


                    Session["customeruserid"] = objdt.Rows[0]["userid"].ToString();
                    Session["customername"] = objdt.Rows[0]["name"].ToString();
                    Session["city"] = objdt.Rows[0]["city"].ToString();
                    Response.Redirect("Homepage.aspx");
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Popup", "alertwarning()", true);
                }
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Popup", "alerterror()", true);
            }
        }

        #endregion

        #region click event  to login

        protected void btnlogin_Click(object sender, EventArgs e)
        {
            try
            {
                login();
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Popup", "alerterror()", true);
            }
        }


        #endregion

        #region item command for dlitems

        protected void dlitems_ItemCommand(object source, DataListCommandEventArgs e)
        {

            try
            {
                string userid = Convert.ToString(Session["customeruserid"]);

                int Id = Convert.ToInt32(e.CommandArgument);

                string currentcity = Convert.ToString(Session["city"]);

                #region command name = Add Items

                if (e.CommandName == "add")
                {
                    if (userid != "")
                    {
                        #region code to checking existing order


                        DataTable objdt = objshow.cartItems(userid, Id);
                        if (objdt.Rows.Count == 0)
                        {
                            #region code to make order


                            DataTable objdtcity = objshow.chkItemsCity(Id);
                            if (objdtcity.Rows.Count > 0)
                            {
                                string city = Convert.ToString(objdtcity.Rows[0]["city"]);

                                if (city.ToUpper() == currentcity.ToUpper())
                                {
                                    int Issuccessfull = objinsert.makeOrder(Id, userid);
                                    if (Issuccessfull == 1)
                                    {
                                        masterpage master = Master as masterpage;
                                        master.cartItems();

                                        ScriptManager.RegisterStartupScript(this, this.GetType(), "Popup", "alertsuccess()", true);
                                    }
                                    else
                                    {
                                        ScriptManager.RegisterStartupScript(this, this.GetType(), "Popup", "alerterror()", true);
                                    }
                                }
                                else
                                {
                                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Popup", "alertcityerror()", true);
                                }
                            }


                            #endregion
                        }
                        else
                        {
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "Popup", "productexist()", true);
                        }

                        #endregion
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "Popup", "alertwarning()", true);
                    }
                }

                #endregion

                #region command name = Wishlist


                else if (e.CommandName == "wishlist")
                {
                    if (userid != "")
                    {
                        #region code to checking existing wishlist


                        DataTable objdt = objshow.wishlistItems(userid, Id);
                        if (objdt.Rows.Count == 0)
                        {
                            #region code to make wishlist

                            int Issuccessfull = objinsert.makeWishlist(Id, userid);
                            if (Issuccessfull == 1)
                            {


                                ScriptManager.RegisterStartupScript(this, this.GetType(), "Popup", "alertwishlist()", true);
                            }
                            else
                            {
                                ScriptManager.RegisterStartupScript(this, this.GetType(), "Popup", "alerterror()", true);
                            }

                            #endregion
                        }
                        else
                        {
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "Popup", "productexist()", true);
                        }

                        #endregion
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "Popup", "alertwarning()", true);
                    }
                }

                #endregion


            }
            catch (Exception ex)
            {

                ScriptManager.RegisterStartupScript(this, this.GetType(), "Popup", "alerterror()", true);
            }
        }

        #endregion


    }
}
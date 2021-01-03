using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;
using E_Commerce.DataLayer;


namespace E_Commerce
{
    public partial class masterpage : System.Web.UI.MasterPage
    {
        showdatalayer objshow = new showdatalayer();
        protected void Page_Load(object sender, EventArgs e)
        {

            divVisibility();
            if (!IsPostBack)
            {
                cartItems();
            }
        }

        #region code for div visibility

        void divVisibility()
        {
            try
            {
                if (Session["customername"] != null)
                {
                    lbldiv.Visible = true;
                    regdiv.Visible = false;
                    hpyname.Text = Session["customername"].ToString();
                    shoppingdiv.Visible = true;
                    admindiv.Visible = false;
                    logindiv.Visible = false;
                    logoutdiv.Visible = true;
                    sellerregdiv.Visible = false;
                  
                }
                else
                {

                    logindiv.Visible = true;
                    lbldiv.Visible = false;
                    regdiv.Visible = true;
                    sellerregdiv.Visible = true;
                    shoppingdiv.Visible = false;
                    admindiv.Visible = true;
                    logoutdiv.Visible = false;
                }
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        #endregion

        #region count of cart items

        public void cartItems()
        {
            try
            {
                string userid = Session["customeruserid"].ToString();
                DataTable objdt = objshow.itemsCount(userid);
                if (objdt.Rows.Count > 0)
                {
                    lblcount.Text = objdt.Rows[0]["totalitems"].ToString();
                }
                else
                {
                    lblcount.Text = "0";
                }
            }
            catch (Exception ex)
            {


            }
        }

        #endregion

        protected void btnlogout_Click(object sender, EventArgs e)
        {
            try
            {
                Session.Abandon();
                Session.Clear();
                Response.ClearHeaders();
                Response.AddHeader("Cache-Control", "no-cache, no-store, max-age=0, must-revalidate");
                Response.AddHeader("Pragma", "no-cache");
                System.Web.Security.FormsAuthentication.SignOut();
                Response.Redirect("Homepage.aspx", true);
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
    }
}
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;
using E_Commerce.DataLayer;
namespace E_Commerce.Customer
{
    public partial class wishlist : System.Web.UI.Page
    {
        showdatalayer objshow = new showdatalayer();
        Insertionlayer objinsert = new Insertionlayer();
        Editlayer objedit = new Editlayer();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["customeruserid"] == null)
            {
                Response.Redirect("../Homepage.aspx");

            }

            if (!IsPostBack)
            {

                bindItems();

            }
        }

        #region code to bind items in datalist

        void bindItems()
        {
            try
            {
                string userid = Convert.ToString(Session["customeruserid"]);
                DataTable objdt = objshow.wishlistItems(userid);
                if (objdt.Rows.Count > 0)
                {
                    dlitems.DataSource = objdt;
                    dlitems.DataBind();
                }
                else
                {
                    dlitems.DataSource = null;
                    dlitems.DataBind();
                    msgdiv.Visible = true;
                }
            }
            catch (Exception ex)
            {

                ScriptManager.RegisterStartupScript(this, this.GetType(), "Popup", "alerterror()", true);
            }
        }

        #endregion

        #region wishlist items


        protected void dlitems_ItemCommand(object source, DataListCommandEventArgs e)
        {
            string userid = Convert.ToString(Session["customeruserid"]);

            #region command name = Add Items

            if (e.CommandName == "add")
            {

                #region code to checking existing order

                int item = Convert.ToInt32(e.CommandArgument);

                DataTable objdt = objshow.cartItems(userid, item);
                if (objdt.Rows.Count == 0)
                {
                    #region code to make order from wishlist

                    int Issuccessfull = objinsert.makeOrder_Wishlist(item, userid);
                    if (Issuccessfull == 1)
                    {
                        bindItems();

                        ScriptManager.RegisterStartupScript(this, this.GetType(), "Popup", "alertcart()", true);
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

            #endregion

            #region command name = remove


            else if (e.CommandName == "remove")
            {

                #region code to remove item from wishlist

                int Id = Convert.ToInt32(e.CommandArgument);
                int Issuccessfull = objedit.deletewishlistItems(userid, Id);
                if (Issuccessfull == 1)
                {
                    bindItems();

                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Popup", "alertsuccess()", true);
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Popup", "alerterror()", true);
                }

                #endregion

            }


            #endregion

        }



        #endregion
    }

}
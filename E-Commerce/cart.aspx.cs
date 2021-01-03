using System;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;
using E_Commerce.DataLayer;


namespace E_Commerce
{
    public partial class cart : System.Web.UI.Page
    {
        showdatalayer objshow = new showdatalayer();
        Editlayer objedit = new Editlayer();

        public static DataSet ds1;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["customeruserid"] == null)
            {
                Response.Redirect("Homepage.aspx");
            }
            if (!IsPostBack)
            {
                cartItemDetails();
            }
        }

        #region cart items

        void cartItemDetails()
        {
            try
            {
                string userid = Convert.ToString(Session["customeruserid"]);
                DataTable ds = objshow.cartItemsDetails(userid);
                if (ds.Rows.Count > 0)
                {
                    dlitems.DataSource = ds;
                    dlitems.DataBind();
                }
                else
                {
                    lblcart.InnerText = "Your Cart Is Empty...";
                    btnchkout.Visible = false;
                }
                ds1 = objshow.cartItemsTotal(userid);

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
                int Id = Convert.ToInt32(e.CommandArgument);
                string userid = Convert.ToString(Session["customeruserid"]);
                int Issuccessfull = objedit.deleteCartItems(userid, Id);
                if (Issuccessfull == 1)
                {
                    masterpage master = Master as masterpage;
                    master.cartItems();
                    cartItemDetails();
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Popup", "alertsuccess()", true);
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Popup", "alerterror()", true);
                }
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Popup", "alerterror()", true);

            }
        }

        #endregion
    }
}
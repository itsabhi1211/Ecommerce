using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;
using E_Commerce.DataLayer;

namespace E_Commerce.Customer
{
    public partial class track_order : System.Web.UI.Page
    {
        showdatalayer objshow = new showdatalayer();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["customeruserid"] == null)
            {
                Response.Redirect("../Homepage.aspx");
            }
        }

        #region code for order tracking

        void orderTrack()
        {
            try
            {
                string userid = Convert.ToString(Session["customeruserid"]);
                string orderno = txtorderno.Value;
                DataTable objdt = objshow.orderTracking(userid, orderno);
                if (objdt.Rows.Count > 0)
                {
                    grdorders.DataSource = objdt;
                    grdorders.DataBind();
                }
                else
                {
                    grdorders.DataSource = null;
                    grdorders.DataBind();
                }
            }
            catch (Exception ex)
            {

                ScriptManager.RegisterStartupScript(this, this.GetType(), "Popup", "errormodal()", true);
            }
        }

        #endregion


        protected void btndetails_Click(object sender, EventArgs e)
        {
            try
            {
                try
                {
                    orderTrack();
                }
                catch (Exception ex)
                {

                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Popup", "errormodal()", true);
                }
            }
            catch (Exception ex)
            {

                ScriptManager.RegisterStartupScript(this, this.GetType(), "Popup", "errormodal()", true);
            }
        }

        protected void btnreset_Click(object sender, EventArgs e)
        {
            try
            {
                Response.Redirect("track-order.aspx");
            }
            catch (Exception ex)
            {

                ScriptManager.RegisterStartupScript(this, this.GetType(), "Popup", "errormodal()", true);
            }
        }
    }
}
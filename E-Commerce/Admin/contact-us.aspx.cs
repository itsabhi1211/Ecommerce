using E_Commerce.DataLayer;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace E_Commerce.Admin
{
    public partial class contact_us : System.Web.UI.Page
    {
        showdatalayer objshow = new showdatalayer();
        string strcon = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["userid"] == null)
            {
                Response.Redirect("../admin-login.aspx");
            }

            if (!IsPostBack)
            {
                contactDetails();
            }
        }

        #region code to bind approved customer

        void contactDetails()
        {
            try
            {
                DataTable objdt = objshow.showContactUs();
                if (objdt.Rows.Count > 0)
                {
                    grdcontact.DataSource = objdt;
                    grdcontact.DataBind();
                }
                else
                {
                    grdcontact.DataSource = null;
                    grdcontact.DataBind();
                }
            }
            catch (Exception ex)
            {

                ScriptManager.RegisterStartupScript(this, this.GetType(), "Popup", "errormodal()", true);
            }
        }

        #endregion

        protected void grdcontact_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            try
            {
                grdcontact.PageIndex = e.NewPageIndex;
                contactDetails();
            }
            catch (Exception ex)
            {

                ScriptManager.RegisterStartupScript(this, this.GetType(), "Popup", "errormodal()", true);
            }
        }
    }
}
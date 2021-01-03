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
    public partial class Dashboard : System.Web.UI.Page
    {
        showdatalayer objshow = new showdatalayer();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["userid"] == null)
            {
                Response.Redirect("../Homepage.aspx");
            }
            if (!IsPostBack)
            {
                dashboardCount();

            }
        }

        #region code to bind order list

        void dashboardCount()
        {
            try
            {
                DataTable objdt = objshow.showDashboard();
                if (objdt.Rows.Count > 0)
                {
                    lblappcust.Text = objdt.Rows[0]["approvedcustomers"].ToString();
                    lblappcustnow.Text = objdt.Rows[0]["approvedcustomersnow"].ToString();
                    lbldisappcust.Text = objdt.Rows[0]["registeredcustomers"].ToString();
                    lbldisappcustnow.Text = objdt.Rows[0]["registeredcustomersnow"].ToString();
                    lbldelivrdordernow.Text = objdt.Rows[0]["deliveredordernow"].ToString();
                    lbldelvorder.Text = objdt.Rows[0]["deliveredorder"].ToString();
                    lblpendingorder.Text = objdt.Rows[0]["recentorders"].ToString();
                    lblpendingordernow.Text = objdt.Rows[0]["recentordersnow"].ToString();


                }
                else
                {
                    lblappcust.Text = "0";
                    lblappcustnow.Text = "0";
                    lbldisappcust.Text = "0";
                    lbldisappcustnow.Text = "0";
                    lbldelivrdordernow.Text = "0";
                    lbldelvorder.Text = "0";
                    lblpendingorder.Text = "0";
                    lblpendingordernow.Text = "0";
                }
            }
            catch (Exception ex)
            {

                ScriptManager.RegisterStartupScript(this, this.GetType(), "Popup", "errormodal()", true);
            }
        }

        #endregion


    }
}
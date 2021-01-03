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

namespace E_Commerce.Customer
{
    public partial class recent_orders : System.Web.UI.Page
    {
        showdatalayer objshow = new showdatalayer();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["customeruserid"] == null)
            {
                Response.Redirect("../Homepage.aspx");
            }
            if (!IsPostBack)
            {
                orderList();
            }
        }

        #region code to bind order list

        void orderList()
        {
            try
            {
                string userid = Convert.ToString(Session["customeruserid"]);
                DataTable objdt = objshow.showOrder_Customer(userid);
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

        #region page index changing

        protected void grdorder_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            try
            {
                grdorders.PageIndex = e.NewPageIndex;
                orderList();
            }
            catch (Exception ex)
            {

                ScriptManager.RegisterStartupScript(this, this.GetType(), "Popup", "alerterror()", true);
            }
        }

        #endregion

        protected void grdorder_RowDataBound(object sender, GridViewRowEventArgs e)
        {

        }

        #region row command for grd

        protected void grdorders_RowEditing(object sender, GridViewEditEventArgs e)
        {

        }

        protected void grdorders_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {

        }

        protected void grdorders_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try

            {
                string orderno = Convert.ToString(e.CommandArgument);

                #region command name=see details

                if (e.CommandName == "details")
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Popup", "modaldetail()", true);



                    DataTable objdt = objshow.showOrderDetails(orderno);

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
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
    public partial class delivered_orders : System.Web.UI.Page
    {
        showdatalayer objshow = new showdatalayer();
        Editlayer objedit = new Editlayer();


        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["userid"] == null)
            {
                Response.Redirect("../admin-login.aspx");
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
                DataTable objdt = objshow.showDeliveredOrder_Admin();
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

        #region page index for grd

        protected void grdorders_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            try
            {
                grdorders.PageIndex = e.NewPageIndex;
                orderList();
            }
            catch (Exception ex)
            {

                ScriptManager.RegisterStartupScript(this, this.GetType(), "Popup", "errormodal()", true);
            }
        }

        #endregion

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
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Popup", "itemmodal()", true);



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

                #region command name=approve order


                else if (e.CommandName == "approved")
                {
                    int Issucessfull = objedit.approveOrder(orderno);
                    if (Issucessfull == 1)
                    {
                        orderList();
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "Popup", "approvemodal()", true);
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "Popup", "errormodal()", true);
                    }
                }


                #endregion

                #region command name=deliver order


                else if (e.CommandName == "delivered")
                {
                    int Issucessfull = objedit.deliverOrder(orderno);
                    if (Issucessfull == 1)
                    {
                        orderList();
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "Popup", "delivermodal()", true);
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "Popup", "errormodal()", true);
                    }
                }


                #endregion
            }
            catch (Exception ex)
            {

                ScriptManager.RegisterStartupScript(this, this.GetType(), "Popup", "errormodal()", true);
            }
        }

        #endregion
    }
}
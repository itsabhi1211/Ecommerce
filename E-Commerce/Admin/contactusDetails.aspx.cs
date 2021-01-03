using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using E_Commerce.DataLayer;
using System.Data.SqlClient;

namespace E_Commerce.Admin
{
    public partial class contactusDetails : System.Web.UI.Page
    {
        Insertionlayer objinsert = new Insertionlayer();
        Editlayer objedit = new Editlayer();
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
                bindItemsCategory();
            }
        }

        #region code to bind items category in grid

        void bindItemsCategory()
        {
            try
            {
                DataTable objdt = objshow.showContactUs();
                if (objdt.Rows.Count > 0)
                {
                    grdcategory.DataSource = objdt;
                    grdcategory.DataBind();
                }
                else
                {
                    grdcategory.DataSource = null;
                    grdcategory.DataBind();
                }
            }
            catch (Exception ex)
            {

                ScriptManager.RegisterStartupScript(this, this.GetType(), "Popup", "errormodal()", true);
            }
        }

        #endregion

        #region row command 

        protected void grdcategory_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {

        }

        protected void grdcategory_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                //if( )  
                //{

                //}
                #region command name = delete

                //else
                if (e.CommandName == "Delete")
                {

                    string Id = Convert.ToString(e.CommandArgument);
                    int Issuccessfull = objedit.deleteItemsCategory(Convert.ToString(Id));
                    bindItemsCategory();
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Popup", "alertdelete()", true);


                }

                #endregion
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Popup", "errormodal()", true);

            }
        }

        protected void grdcategory_RowEditing(object sender, GridViewEditEventArgs e)
        {

        }


        #endregion

        #region page index changing

        protected void grdcategory_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            try
            {
                try
                {
                    grdcategory.PageIndex = e.NewPageIndex;
                    bindItemsCategory();
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

        #endregion

    }
}
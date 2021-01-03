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
    public partial class add_category : System.Web.UI.Page
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
                DataTable objdt = objshow.showCategory();
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

        #region code to add items category

        void addItemsCategory()
        {
            try
            {


                string category = txtcategory.Text;




                #region submit

                if (btnsmt.Text == "Submit")
                {
                    int Issuccessfull = objinsert.addCategory(category);
                    if (Issuccessfull == 1)
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "Popup", "successmodal()", true);

                        bindItemsCategory();
                        clear();
                    }
                    else
                    {


                        ScriptManager.RegisterStartupScript(this, this.GetType(), "Popup", "errormodal()", true);

                    }
                }

                #endregion

                #region update

                else
                {
                    int Id = Convert.ToInt32(ViewState["Id"].ToString());
                    int Issuccessfull = objedit.updateCategory(Id, category);
                    if (Issuccessfull == 1)
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "Popup", "updatemodal()", true);

                        bindItemsCategory();
                        clear();
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

        #region code to clear

        void clear()
        {
            try
            {

                (txtcategory.Text) = "";
                btnsmt.Text = "Submit";

            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Popup", "errormodal()", true);

            }
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

        #region row command 

        protected void grdcategory_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {

        }

        protected void grdcategory_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {

                #region command name = edit

                if (e.CommandName == "Edit")
                {
                    var con = new SqlConnection(strcon);
                    SqlDataReader dr;
                    string Id = Convert.ToString(e.CommandArgument);
                    ViewState["Id"] = Id;
                    con.Open();
                    SqlCommand cmd = new SqlCommand("Select * from tblcategory where Id=@id", con);
                    cmd.Parameters.AddWithValue("@id", Id);
                    dr = cmd.ExecuteReader();
                    if (dr.Read())
                    {
                        txtcategory.Text = dr["categoryname"].ToString();



                    }
                    con.Close();
                    btnsmt.Text = "Update";
                }

                #endregion

                #region command name = delete

                else if (e.CommandName == "Delete")
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

        #region click event to reset the details

        protected void btnreset_Click(object sender, EventArgs e)
        {
            try
            {
                Response.Redirect(HttpContext.Current.Request.Url.PathAndQuery);
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Popup", "errormodal()", true);

            }
        }

        #endregion

        #region code to submit details

        protected void btnsmt_Click(object sender, EventArgs e)
        {
            try
            {
                addItemsCategory();
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Popup", "errormodal()", true);

            }
        }

        #endregion
    }
}
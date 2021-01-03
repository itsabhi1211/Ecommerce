using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using E_Commerce.DataLayer;

namespace E_Commerce.Admin
{
    public partial class add_items : System.Web.UI.Page
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
                itemsCategory();
                bindItems();
                
            }
        }

        #region code to bind items in grid

        void bindItems()
        {
            try
            {
                DataTable objdt = objshow.showSellerItemsWithDetails(Convert.ToString(Session["UserId"]));
                if (objdt.Rows.Count > 0)
                {
                    grditems.DataSource = objdt;
                    grditems.DataBind();
                }
                else
                {
                    grditems.DataSource = null;
                    grditems.DataBind();
                }
            }
            catch (Exception ex)
            {

                ScriptManager.RegisterStartupScript(this, this.GetType(), "Popup", "errormodal()", true);
            }
        }

        #endregion

        #region code to bind category in ddl

        void itemsCategory()
        {
            try
            {
                DataTable objdt = objshow.showCategory();
                if (objdt.Rows.Count > 0)
                {
                    ddlcategory.DataSource = objdt;
                    ddlcategory.DataTextField = "categoryname";
                    ddlcategory.DataValueField = "Id";
                    ddlcategory.DataBind();
                    ddlcategory.Items.Insert(0, "Choose Category");


                }
                else
                {
                    ddlcategory.DataSource = null;
                    ddlcategory.DataBind();
                }
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
                ddlcategory.ClearSelection();

                hdfimg.Value = "";
              
                txtdesc.Text = "";
                (txtitemprice.Text) = "";
                (txtproducttitle.Text) = "";
                (txtitemprice.Text) = "";
                txtsellingprice.Text = "";
                txtdop.Text = "";
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Popup", "errormodal()", true);

            }
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

        #region click event to submit the details

        protected void btnsmt_Click(object sender, EventArgs e)
        {
            try
            {
                if (btnsmt.Text == "Submit")
                {
                    insertItemDetails();
                }
                if (btnsmt.Text == "Update")
                {
                    updateItemDetails();
                }

            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Popup", "errormodal()", true);

            }
        }

        #endregion

        #region page index changing

        protected void grditems_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            try
            {
                grditems.PageIndex = e.NewPageIndex;
                bindItems();
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Popup", "errormodal()", true);

            }
        }

        #endregion

        #region row command for grid

        protected void grditems_RowEditing(object sender, GridViewEditEventArgs e)
        {


        }

        protected void grditems_RowCommand(object sender, GridViewCommandEventArgs e)
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
                    SqlCommand cmd = new SqlCommand("sp_edititemsdetails", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@id", Id);
                    dr = cmd.ExecuteReader();
                    if (dr.Read())
                    {
                      
                       
                        ddlcategory.ClearSelection();
                        ddlcategory.Items.FindByText(Convert.ToString(dr["categoryname"])).Selected = true;
                       
                        txtitemprice.Text = dr["itemprice"].ToString();
                        txtproducttitle.Text = dr["producttitle"].ToString();
                        txtsellingprice.Text = dr["sellingprice"].ToString();
                        txtdop.Text = dr["dop"].ToString();
                        txtdesc.Text = dr["itemdesc"].ToString();
                        hdfimg.Value = dr["itemimage"].ToString();
                    }
                    con.Close();
                    btnsmt.Text = "Update";
                }

                #endregion

                #region command name = delete

                else if (e.CommandName == "Delete")
                {

                    string Id = Convert.ToString(e.CommandArgument);
                    int Issuccessfull = objedit.deleteItems(Convert.ToString(Id));
                    bindItems();
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Popup", "alertdelete()", true);


                }

                #endregion
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Popup", "errormodal()", true);

            }
        }

        protected void grditems_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {

        }

        #endregion

        #region code to insert items

        void insertItemDetails()
        {

            string userid = Convert.ToString(Session["userid"]);
            string s1 = "";
            try
            {
                string FileName = "";
                string FilePath = "~/Admin/product/";
                if (txtfile.PostedFile.ContentLength > 0 && txtfile.PostedFile != null)
                {
                    Random r = new Random();
                    string num = Convert.ToString(r.Next());
                    FileName = num + Path.GetExtension(txtfile.FileName);
                    string Extension = Path.GetExtension(txtfile.FileName);
                    int Length = txtfile.PostedFile.ContentLength;

                    #region checking out File Length

                    if (Length <= 5000000)
                    {
                        #region Checking file Extensions
                        switch (Extension.ToLower())
                        {
                            case ".jpg":
                                txtfile.SaveAs(Server.MapPath(FilePath + FileName));
                              
                                break;

                            case ".jpeg":
                                txtfile.SaveAs(Server.MapPath(FilePath + FileName));
                                
                                break;

                            case ".png":
                                txtfile.SaveAs(Server.MapPath(FilePath + FileName));
                               
                                break;

                            default:
                                ScriptManager.RegisterStartupScript(this, this.GetType(), "Popup", "errormodal()", true);
                                break;

                        }
                        #endregion
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "Popup", "errormodal()", true);
                    }
                    #endregion
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Popup", "errormodal()", true);
                }
                s1 = FilePath + FileName;
                int Issucessfull = objinsert.addItems(Convert.ToInt32(ddlcategory.SelectedValue), Convert.ToDecimal(txtitemprice.Text), txtdesc.Text, s1,Convert.ToDateTime(txtdop.Text),txtproducttitle.Text,Convert.ToDecimal(txtsellingprice.Text), Convert.ToString(Session["UserId"]));

                if (Issucessfull > 0)
                {
                    
                    bindItems();
                    clear();
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Popup", "successmodal()", true);

                }
                else
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

        #region code to update items

        void updateItemDetails()
        {

            string userid = Convert.ToString(Session["userid"]);
            string s1 = "";
            try
            {
                string FileName = "";
                Int32 id = Convert.ToInt32(ViewState["Id"]);
                string FilePath = "~/Admin/product/";
                if (txtfile.PostedFile.ContentLength > 0 && txtfile.PostedFile != null)
                {
                    Random r = new Random();
                    string num = Convert.ToString(r.Next());
                    FileName = num + Path.GetExtension(txtfile.FileName);
                    string Extension = Path.GetExtension(txtfile.FileName);
                    int Length = txtfile.PostedFile.ContentLength;

                    #region checking out File Length

                    if (Length <= 1000000)
                    {
                        #region Checking file Extensions
                        switch (Extension.ToLower())
                        {
                            case ".jpg":
                                txtfile.SaveAs(Server.MapPath(FilePath + FileName));
                                //img1.ImageUrl = FilePath + FileName;
                                break;

                            case ".jpeg":
                                txtfile.SaveAs(Server.MapPath(FilePath + FileName));
                                //img1.ImageUrl = FilePath + FileName;
                                break;

                            case ".png":
                                txtfile.SaveAs(Server.MapPath(FilePath + FileName));
                                //img1.ImageUrl = FilePath + FileName;
                                break;

                            default:
                                ScriptManager.RegisterStartupScript(this, this.GetType(), "Popup", "errormodal()", true);
                                break;

                        }
                        #endregion
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "Popup", "errormodal()", true);
                    }
                    #endregion
                   
                    s1 = FilePath + FileName;
                    
                    int Issucessfull = objedit.updateItems(id, Convert.ToInt32(ddlcategory.SelectedValue), Convert.ToDecimal(txtitemprice.Text), txtdesc.Text, s1, txtproducttitle.Text, Convert.ToDecimal(txtsellingprice.Text),Convert.ToDateTime(txtdop.Text));

                    if (Issucessfull > 0)
                    {
                        itemsCategory();
                        bindItems();
                        clear();
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "Popup", "successmodal()", true);

                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "Popup", "errormodal()", true);
                    }
                }
                else
                {

                    int Issucessfull = objedit.updateItems(id, Convert.ToInt32(ddlcategory.SelectedValue), Convert.ToDecimal(txtitemprice.Text), txtdesc.Text, hdfimg.Value, txtproducttitle.Text, Convert.ToDecimal(txtsellingprice.Text), Convert.ToDateTime(txtdop.Text));

                    if (Issucessfull > 0)
                    {
                        itemsCategory();
                        bindItems();
                        clear();
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "Popup", "successmodal()", true);

                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "Popup", "errormodal()", true);
                    }
                  
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
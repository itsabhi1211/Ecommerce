using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;
using E_Commerce.DataLayer;

namespace E_Commerce
{
    public partial class list_items : System.Web.UI.Page
    {
        showdatalayer objshow = new showdatalayer();
        Insertionlayer objinsert = new Insertionlayer();

        protected void Page_Load(object sender, EventArgs e)
        {


            if (!IsPostBack)
            {

                bindItems();
                bindCities();

            }
        }

        #region code to bind items in grid

        void bindItems()
        {
            try
            {
                
                DataTable objdt = objshow.showItemsWithDetails();
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
            catch (Exception ex)
            {

                ScriptManager.RegisterStartupScript(this, this.GetType(), "Popup", "alerterror()", true);
            }
        }

        #endregion

        #region code to bind items in grid by city

        void bindItemsbyGender()
        {
            try
            {
                string city= ddlcities.SelectedItem.Text== "Choose City"?"Lucknow": ddlcities.SelectedItem.Text;
                DataTable objdt = objshow.showItemsWithDetails(city);
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
            catch (Exception ex)
            {

                ScriptManager.RegisterStartupScript(this, this.GetType(), "Popup", "alerterror()", true);
            }
        }

        #endregion

        #region code to bind city

        void bindCities()
        {
            try
            {

                



                DataTable objdt = objshow.showCity();
                if (objdt.Rows.Count > 0)
                {
                    ddlcities.DataSource = objdt;
                    ddlcities.DataTextField = "City";
                    ddlcities.DataTextField = "City";
                    ddlcities.DataBind();
                    ddlcities.Items.Insert(0, "Choose City");
                   
                   
                }
                else
                {
                    ddlcities.DataSource = null;
                    ddlcities.DataBind();
                }
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
                string userid = Convert.ToString(Session["customeruserid"]);

                int Id = Convert.ToInt32(e.CommandArgument);

                string currentcity = Convert.ToString(Session["city"]);

                #region command name = Add Items

                if (e.CommandName == "add")
                {
                    if (userid != "")
                    {
                        #region code to checking existing order


                        DataTable objdt = objshow.cartItems(userid, Id);
                        if (objdt.Rows.Count == 0)
                        {
                            #region code to make order


                            DataTable objdtcity = objshow.chkItemsCity( Id);
                            if(objdtcity.Rows.Count>0)
                            {
                                string city = Convert.ToString(objdtcity.Rows[0]["city"]);

                                if(city.ToUpper()==currentcity.ToUpper())
                                {
                                    int Issuccessfull = objinsert.makeOrder(Id, userid);
                                    if (Issuccessfull == 1)
                                    {
                                        masterpage master = Master as masterpage;
                                        master.cartItems();

                                        ScriptManager.RegisterStartupScript(this, this.GetType(), "Popup", "alertsuccess()", true);
                                    }
                                    else
                                    {
                                        ScriptManager.RegisterStartupScript(this, this.GetType(), "Popup", "alerterror()", true);
                                    }
                                }
                                else
                                {
                                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Popup", "alertcityerror()", true);
                                }
                            }
                            

                            #endregion
                        }
                        else
                        {
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "Popup", "productexist()", true);
                        }

                        #endregion
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "Popup", "alertwarning()", true);
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

        protected void ddlcities_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                bindItemsbyGender();
            }
            catch (Exception ex)
            {

                ScriptManager.RegisterStartupScript(this, this.GetType(), "Popup", "alerterror()", true);
            }

        }
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using E_Commerce.DataLayer;
using System.Data;

namespace E_Commerce
{
    public partial class customer_login : System.Web.UI.Page
    {
        logindatalayer objlogin = new logindatalayer();

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        #region code to login

        void login()
        {
            try
            {
                string pwd = txtpwd.Value;
                string email = Convert.ToString(txtemail.Value);
                DataTable objdt = objlogin.customerLogin(pwd, email);
                if (objdt.Rows.Count > 0)
                {

                    Session["customeruserid"] = objdt.Rows[0]["userid"].ToString();
                    Session["customername"] = objdt.Rows[0]["name"].ToString();
                    Session["city"] = objdt.Rows[0]["city"].ToString();

                    Response.Redirect("Homepage.aspx");
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Popup", "alertwarning()", true);
                }
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Popup", "alerterror()", true);
            }
        }

        #endregion

        #region click event  to login

        protected void btnlogin_Click(object sender, EventArgs e)
        {
            try
            {
                login();
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Popup", "alerterror()", true);
            }
        }


        #endregion
    }
}
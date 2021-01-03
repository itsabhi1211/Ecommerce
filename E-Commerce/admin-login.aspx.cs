using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using E_Commerce.DataLayer;
using System.Data;

namespace E_Commerce
{
    public partial class admin_login : System.Web.UI.Page
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
                string emailid = Convert.ToString(txtemail.Value);
                DataTable objdt = objlogin.adminLogin(pwd, emailid);
                if (objdt.Rows.Count > 0)
                {
                    Session["userid"] = objdt.Rows[0]["userid"].ToString();
                    Response.Redirect("Admin/Dashboard.aspx",false);
                    
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
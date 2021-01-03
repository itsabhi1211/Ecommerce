using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using E_Commerce.DataLayer;
namespace E_Commerce.Admin
{
    public partial class change_password : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;
        logindatalayer objlogin = new logindatalayer();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["userid"] == null)
            {
                Response.Redirect("../admin-login.aspx");
            }
            if (!IsPostBack)
            {
               
            }
        }

        protected void btnchangepwd_Click(object sender, EventArgs e)
        {
            if (txtnewpassword.Text == txtconfirpassword.Text)
            {
                changepassword();
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Popup", "errormodal()", true);
            }
            
        }

        #region code to change password

        void changepassword()
        {
            try
            {
                string userid = Session["userid"].ToString();
                int sucess = objlogin.changepassword(userid,txtnewpassword.Text,txtoldpassword.Text);
                if (sucess == 1)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Popup", "successmodal()", true);       
                    txtconfirpassword.Text = "";
                    txtnewpassword.Text = "";
                    txtoldpassword.Text = "";
                }
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Popup", "errormodal()", true);
                //lblmsg.Text = "Technical Error !!! Please Contact With The Company...";
                //lblmsg.Visible = true;
            }
        }

        #endregion

    }
}
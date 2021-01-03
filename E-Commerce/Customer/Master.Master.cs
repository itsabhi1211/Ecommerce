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
    public partial class Master : System.Web.UI.MasterPage
    {
        string strcon = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                details();
                adminprofile();
            }
        }

        void details()
        {
            try
            {
                lblname.Text = Session["customername"].ToString();
                lblnamesession.Text = "Welcome:"+Session["customername"].ToString();
                lblid.Text = Session["customeruserid"].ToString();
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Popup", "errormodal()", true);
            }
        }



        void adminprofile()
        {
            try
            {
                string userid = Session["customeruserid"].ToString();
                var con = new SqlConnection(strcon);
                con.Open();
                var cmd = new SqlCommand("select profilepic from tbluserprofile where userid=@userid", con);
                cmd.Parameters.AddWithValue("@userid", userid);
                SqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    imgprofile.Src = reader["profilepic"].ToString();
                  
                }
            }
            catch (Exception ex)
            {

            }
        }

        protected void btnlogout_Click(object sender, EventArgs e)
        {
            try
            {
                Session.Abandon();
                Session.Clear();
                Response.ClearHeaders();
                Response.AddHeader("Cache-Control", "no-cache, no-store, max-age=0, must-revalidate");
                Response.AddHeader("Pragma", "no-cache");
                System.Web.Security.FormsAuthentication.SignOut();
                Response.Redirect("../Homepage.aspx", true);
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
    }
}
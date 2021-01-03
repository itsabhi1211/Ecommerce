using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using E_Commerce.DataLayer;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;


namespace E_Commerce.Admin
{
    public partial class master : System.Web.UI.MasterPage
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
                username();
                adminprofile();
            }

        }

        #region admin profile details

        public void username()
        {
            try
            {
                string userid = Session["userid"].ToString();
                var con = new SqlConnection(strcon);
                con.Open();
                var cmd = new SqlCommand("sp_adminregdetails", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@userid", userid);
                SqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    lblname.Text = reader["name"].ToString();
                    lblregno.Text = reader["name"].ToString();
                }
            }
            catch (Exception ex)
            {

            }
        }

        #endregion

        #region admin profile picture

        void adminprofile()
        {
            try
            {
                string userid = Session["userid"].ToString();
                var con = new SqlConnection(strcon);
                con.Open();
                var cmd = new SqlCommand("sp_adminpic", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@userid", userid);
                SqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    adminpic.Src = reader["profilepic"].ToString();

                }
            }
            catch (Exception ex)
            {

            }
        }

        #endregion

        #region click event to logout

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

        #endregion
    }
}
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
using System.Drawing;
using System.Drawing.Drawing2D;
using System.IO;

namespace E_Commerce.Admin
{
    public partial class user_profile : System.Web.UI.Page
    {
        
        Editlayer objedit = new Editlayer();
        
        string strcon = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["userid"] == null)
            {
                Response.Redirect("../admin-login.aspx");
            }
            if (!IsPostBack)
            {
                showUserProfile();
                showAdminProfile();
            }
        }

        #region code to update profile details

        void updateuserprofilepicture()
        {

            try
            {

                string userid = Session["userid"].ToString();

                string address = txtaddress.Value;
                string city = txtcity.Text;
                string state = txtstate.Text;
               

                int Issuccessfull = objedit.updateAdminProfile(userid,"", radiogender.SelectedItem.Text, state, city, address, Convert.ToInt64(txtpincode.Text));
                if (Issuccessfull == 1)
                {

                    showUserProfile();
                    showAdminProfile();
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Popup", "alertsucess()", true);

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

        #region code to show admin registration details

        void showUserProfile()
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
                    txtcontactno.Text = reader["contactno"].ToString();
                    txtname.Text = reader["fname"].ToString()+" "+ reader["lname"].ToString();
                    txtemail.Text = reader["email"].ToString();

                    txtcity.Text = reader["city"].ToString();
                    //txtcontactno.Text = reader["contactno"].ToString();
                    //txtname.Text = reader["name"].ToString();
                    // txtemail.Text = reader["email"].ToString();
                    //txtstate.Value = reader["state"].ToString();
                    // txtpincode.Value = reader["fname"].ToString();


                }
                con.Close();


            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Popup", "errormodal()", true);
            }
        }

        #endregion

        #region code to show admin profile details

        void showAdminProfile()
        {
            try
            {

                string userid = Session["userid"].ToString();
                var con = new SqlConnection(strcon);
                con.Open();
                var cmd = new SqlCommand("sp_adminProfiledetails", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@userid", userid);
                SqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    imgprofilepic.Src = reader["profilepic"].ToString();
                    txtaddress.Value = reader["address"].ToString();
                    txtcity.Text = reader["city"].ToString();
                    txtstate.Text = reader["state"].ToString();
                    txtpincode.Text = reader["pincode"].ToString();
                  
                    string gender = reader["gender"].ToString();
                    if (gender == "Male")
                        radiogender.Items[0].Selected = true;
                    else if (gender == "Female")
                        radiogender.Items[1].Selected = true;
                    else
                        radiogender.Items[2].Selected = true;


                }
                con.Close();


            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Popup", "errormodal()", true);
            }
        }

        #endregion


        protected void btnsave_Click(object sender, EventArgs e)
        {

        }

        protected void btnreset_Click(object sender, EventArgs e)
        {
            reset();
        }

        protected void btnupload_Click(object sender, EventArgs e)
        {
            try
            {
                updateuserprofilepicture();

            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Popup", "errormodal()", true);
            }
        }

        #region code for update profile pic

        void updateAdminnprofilepicture()
        {

            try
            {
                string userid = Session["userid"].ToString();
                string s1 = "";
                string FileName = "";
                string FilePath = "~/Admin/product/";



                #region image upload

                if (txtfile.HasFile)
                {
                    if ((txtfile.PostedFile.ContentType.ToLower() == "image/jpeg") || (txtfile.PostedFile.ContentType.ToLower() == "image/png"))

                    {
                        Stream strm = txtfile.PostedFile.InputStream;
                        using (var image = System.Drawing.Image.FromStream(strm))
                        {

                            int newWidth = 256; // New Width of Image in Pixel  
                            int newHeight = 256; // New Height of Image in Pixel  
                            var thumbImg = new Bitmap(newWidth, newHeight);
                            var thumbGraph = Graphics.FromImage(thumbImg);
                            thumbGraph.CompositingQuality = CompositingQuality.HighQuality;
                            thumbGraph.SmoothingMode = SmoothingMode.HighQuality;
                            thumbGraph.InterpolationMode = InterpolationMode.HighQualityBicubic;
                            var imgRectangle = new Rectangle(0, 0, newWidth, newHeight);
                            thumbGraph.DrawImage(image, imgRectangle);
                            FileName = userid + Path.GetExtension(txtfile.FileName);
                            string targetPath = Server.MapPath(FilePath + FileName);
                            thumbImg.Save(targetPath, image.RawFormat);
                            s1 = FilePath + FileName;
                        }
                    }
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Plz select the file')", true);
                }
                var con = new SqlConnection(strcon);
                con.Open();
                var cmd = new SqlCommand("sp_updateadminpicture", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@userid", userid);
                cmd.Parameters.AddWithValue("@profilepic", s1);
                cmd.ExecuteNonQuery();
                con.Close();
                Response.Redirect("user-profile.aspx", false);


                #endregion
            }
            catch (Exception ex)
            {

                ScriptManager.RegisterStartupScript(this, this.GetType(), "Popup", "errormodal()", true);
            }

        }




        #endregion

        protected void btnprofilepic_Click(object sender, EventArgs e)
        {
            updateAdminnprofilepicture();
        }



        #region code for clearfield

        void reset()
        {
            txtname.Text = "";
            txtcontactno.Text = "";
            txtemail.Text = "";
            txtcity.Text = "";
            txtstate.Text = "";
            txtpincode.Text = "";
          
            txtaddress.Value = "";
        }
        #endregion
    }
}
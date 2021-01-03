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

namespace E_Commerce.Customer
{
    public partial class user_profile : System.Web.UI.Page
    {
        Editlayer objedit = new Editlayer();

        string strcon = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["customeruserid"] == null)
            {
                Response.Redirect("../Homepage.aspx");
            }
            if (!IsPostBack)
            {
                showuserProfile();
                showUserregProfile();
            }
        }

        #region code to update profile details

        void updateuserprofilepicture()
        {

            try
            {

                string userid = Session["customeruserid"].ToString();

                string address = txtaddress.Value;
                string city = txtcity.Value;
                string state = txtstate.Value;
                string dob = txtdob.Value;

                int Issuccessfull = objedit.updateCustomerProfile(userid, txtdob.Value, radiogender.SelectedItem.Text, state, city, address, Convert.ToInt64(txtpincode.Value));
                if (Issuccessfull == 1)
                {


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

        #region code to show customer registration details

        void showUserregProfile()
        {
            try
            {

                string userid = Session["customeruserid"].ToString();
                var con = new SqlConnection(strcon);
                con.Open();
                var cmd = new SqlCommand("select * from tbluserreg where userid=@userid", con);

                cmd.Parameters.AddWithValue("@userid", userid);
                SqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    txtcontactno.Value = reader["contactno"].ToString();
                    txtname.Value = reader["name"].ToString();
                    txtemail.Value = reader["email"].ToString();




                }
                con.Close();


            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Popup", "errormodal()", true);
            }
        }

        #endregion

        #region code to show customer profile details

        void showuserProfile()
        {
            try
            {

                string userid = Session["customeruserid"].ToString();
                var con = new SqlConnection(strcon);
                con.Open();
                var cmd = new SqlCommand("select * from tbluserprofile where userid=@userid", con);
                cmd.Parameters.AddWithValue("@userid", userid);
                SqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    imgprofile.Src = reader["profilepic"].ToString();
                    txtaddress.Value = reader["address"].ToString();
                    txtcity.Value = reader["city"].ToString();
                    txtstate.Value = reader["state"].ToString();
                    txtpincode.Value = reader["pincode"].ToString();
                    txtdob.Value = reader["dob"].ToString();
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

        #region code for update profile pic

        void updateprofilepicture()
        {

            try
            {
                string userid = Session["customeruserid"].ToString();
                string s1 = "";
                string FileName = "";
                string FilePath = "~/Customer/profilepic/";



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
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Popup", "errormodal()", true);
                }
                var con = new SqlConnection(strcon);
                con.Open();
                var cmd = new SqlCommand("sp_updateuserprofilepic", con);
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

        protected void btnupload_Click(object sender, EventArgs e)
        {
            try
            {
                updateprofilepicture();
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Popup", "errormodal()", true);
            }
        }

        protected void btnupdate_Click(object sender, EventArgs e)
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
    }
}
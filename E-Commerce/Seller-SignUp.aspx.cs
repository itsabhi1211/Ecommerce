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
    public partial class Seller_SignUp : System.Web.UI.Page
    {
        Insertionlayer objinsert = new Insertionlayer();
        logindatalayer objlogin = new logindatalayer();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        #region code to Seller registration

        void SellerRegistration()
        {
            try
            {
                string fname = txtsellerfname.Value;
                string lname = txtsellerlname.Value;
                string email = txtselleremail.Value;
                string pwd = txtsellerpwd.Value;
                string cnfpwd = txtsellercnfpwd.Value;
                string city = txtsellercity.Value;
                long contactno = Convert.ToInt64(txtsellercontactno.Value);
                string userid = txtsellerfname.Value.ToUpper().Substring(0, 3) + txtsellercontactno.Value.Substring(0, 5);

                if (txtsellercnfpwd.Value == txtsellerpwd.Value)
                {
                    DataTable objdt = objlogin.chkExistingSeller(contactno, email);
                    if (objdt.Rows.Count == 0)
                    {
                        int Issucccessfull = objinsert.SellerRegistration(fname,lname, userid, contactno, pwd, email, city);
                        if (Issucccessfull == 1)
                        {
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "Popup", "alertsuccess()", true);
                            txtsellerfname.Value = "";
                            txtsellerlname.Value = "";
                            txtselleremail.Value = "";
                            txtsellercontactno.Value = "";
                            txtsellercity.Value = "";

                        }
                        else
                        {
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "Popup", "alerterror()", true);
                        }
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "Popup", "alertwarning()", true);
                    }
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Popup", "alertpwd()", true);
                }
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Popup", "errormodal()", true);
            }
        }

        #endregion

        #region click event to sign in

        

        #endregion
        protected void btnseller_Click(object sender, EventArgs e)
        {
            try
            {
                SellerRegistration();
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Popup", "errormodal()", true);
            }
        }
    }
}
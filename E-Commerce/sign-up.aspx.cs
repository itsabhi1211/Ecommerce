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
    public partial class sign_up : System.Web.UI.Page
    {
        Insertionlayer objinsert = new Insertionlayer();
        logindatalayer objlogin = new logindatalayer();

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        #region code to customer registration

        void customerRegistration()
        {
            try
            {
                string name = txtname.Value;
                string email = txtemail.Value;
                string pwd = txtpwd.Value;
                string cnfpwd = txtcnfpwd.Value;
                string city = txtcity.Value;
                long contactno = Convert.ToInt64(txtcontactno.Value);
                string userid = txtname.Value.ToUpper().Substring(0, 3) + txtcontactno.Value.Substring(0, 5);

                if (txtcnfpwd.Value == txtpwd.Value)
                {
                    DataTable objdt = objlogin.chkExistingCustomer(contactno, email);
                    if (objdt.Rows.Count == 0)
                    {
                        int Issucccessfull = objinsert.customerRegistration(name, userid, contactno, pwd, email,city);
                        if (Issucccessfull == 1)
                        {
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "Popup", "alertsuccess()", true);
                            txtcontactno.Value = "";
                            txtemail.Value = "";
                            txtname.Value = "";
                            txtcity.Value="";

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

        protected void btnsignin_Click(object sender, EventArgs e)
        {
            try
            {
                customerRegistration();
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Popup", "errormodal()", true);
            }
        }

        #endregion

       

        
    }
}
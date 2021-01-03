using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using E_Commerce.DataLayer;

namespace E_Commerce
{
    public partial class contact_us : System.Web.UI.Page
    {
        Insertionlayer objinsert = new Insertionlayer();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        void contact()
        {
            try
            {
                string name = txtname.Value;
                string msg = txtmsg.Value;
                string email = txtemail.Value;
                string sub = txtsub.Value;

                int Issuccessfull = objinsert.contactus(name, email, sub, msg);
                if (Issuccessfull == 1)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Popup", "successmodal()", true);
                    txtname.Value = "";
                    txtmsg.Value = "";
                    txtemail.Value = "";
                    txtsub.Value = "";
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

        protected void btnsend_Click(object sender, EventArgs e)
        {
            try
            {
                contact();
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Popup", "errormodal()", true);

            }
        }
    }
}
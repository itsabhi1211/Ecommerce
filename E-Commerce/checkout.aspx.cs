using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;
using E_Commerce.DataLayer;

namespace E_Commerce
{
    public partial class checkout : System.Web.UI.Page
    {
        showdatalayer objshow = new showdatalayer();
        string strcon = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;
        Editlayer objedit = new Editlayer();
        Insertionlayer objinsert = new Insertionlayer();

        public static DataSet ds1;


        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["customeruserid"] == null)
            {
                Response.Redirect("Homepage.aspx");
            }
            if (!IsPostBack)
            {
                
                cartItemDetails();
                showUserregProfile();
                //showuserProfile();
            }
        }

     

        #region code to show customer registration details

        void showUserregProfile()
        {
            try
            {
              // var cmd=objshow.userdetails(Session["customeruserid"].ToString());
                string userid = Session["customeruserid"].ToString();
                var con = new SqlConnection(strcon);
                con.Open();
                var cmd = new SqlCommand("sp_showuserDetails", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@userid", userid);
                SqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    txtcontactno.Value = reader["contactno"].ToString();
                    txtemail.Value = reader["email"].ToString();
                    txtaddress.Value=reader["address"].ToString();
                    txtstate.Value= reader["state"].ToString();
                    txtcity.Value= reader["city"].ToString();
                    txtpincode.Value= reader["pincode"].ToString();
                }
                con.Close();


            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Popup", "errormodal()", true);
            }
        }

        #endregion

        #region cart items details

        void cartItemDetails()
        {
            try
            {
                string userid = Convert.ToString(Session["customeruserid"]);

                DataTable ds = objshow.cartItemsDetails(userid);
                if (ds.Rows.Count > 0)
                {
                    dlitems.DataSource = ds;
                    dlitems.DataBind();
                    ds1 = objshow.cartItemsTotal(userid);

                }



                else
                {
                    dlitems.DataSource = null;
                    dlitems.DataBind();
                    lblcartmsg.InnerText = "Your Cart Is Empty";
                    lblprice.Visible = false;
                    masterpage master = Master as masterpage;
                    master.cartItems();
                    btnshopping.Visible = true;
                }



            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Popup", "alerterror()", true);

            }
        }

        #endregion

        #region code for new details

        void newDetails()
        {
            try
            {
                txtaddress.Value = "";
                txtcity.Value = "";
                txtcontactno.Value = "";
                txtemail.Value = "";
                txtpincode.Value = "";
                txtstate.Value = "";

            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Popup", "errormodal()", true);
            }
        }

        #endregion

        #region selected index changed for rdb address

        protected void rdbaddress_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                if (rdbaddress.SelectedValue == "R")
                {
                    showUserregProfile();
                   // showuserProfile();
                }
                else if (rdbaddress.SelectedValue == "D")
                {

                    newDetails();
                }
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Popup", "errormodal()", true);
            }
        }

        #endregion

        #region selected index changed for rdbpayment

        protected void rdbpayment_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                string paymenttype = rdbpayment.SelectedValue;
                switch (paymenttype)
                {
                    case "upi":
                        upidiv.Visible = true;
                        debitcarddiv.Visible = false;
                        break;
                    case "cc-dc":
                        upidiv.Visible = false;
                        debitcarddiv.Visible = true;
                        break;
                    case "cod":
                        upidiv.Visible = false;
                        debitcarddiv.Visible = false;
                        break;
                }
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Popup", "errormodal()", true);
            }
        }

        #endregion

        #region code for confirming order 

        void confirmOrder()
        {
            try
            {

                Page.Validate();
                if (!Page.IsValid)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Popup", "warningmodal()", true);
                }
                else
                {


                    #region receiptno

                    string receiptno = "";
                    DataTable dt = objshow.receiptnoGeneration();
                    if (dt.Rows.Count > 0)
                    {
                        receiptno = "rec00" + dt.Rows[0]["LastID"].ToString();
                    }

                    #endregion

                    #region order no


                    string orderno = "orderno10" + dt.Rows[0]["LastID"].ToString();

                    #endregion

                    string totalamt = "";

                    string userid = Convert.ToString(Session["customeruserid"]);
                    string address = txtaddress.Value;
                    string email = txtemail.Value;
                    string state = txtstate.Value;
                    string city = txtcity.Value;
                    long pincode = Convert.ToInt64(txtpincode.Value);
                    long contactno = Convert.ToInt64(txtcontactno.Value);
                    string paymentmode = rdbpayment.SelectedValue;


                    #region receipt generation

                    DataSet ds = objshow.cartItemsTotal(userid);

                    if (ds.Tables.Count > 0)
                    {
                        totalamt = ds.Tables[0].Rows[0]["total"].ToString();



                        objinsert.receipt(userid, receiptno, totalamt, orderno);


                    }

                    #endregion

                    #region upi details

                    string upiid = txtupiid.Value;

                    #endregion

                    #region debit card details

                    string cvv = txtcvv.Value;
                    string deb1 = txtdb1.Value;
                    string deb2 = txtdb2.Value;
                    string deb3 = txtdb3.Value;
                    string deb4 = txtdb4.Value;
                    string debitcard = txtdb1.Value + txtdb2.Value + txtdb3.Value + txtdb4.Value;

                    #endregion                    

                    #region payment mode

                    objinsert.paymentmode(userid, orderno, paymentmode, upiid, debitcard, cvv);

                    #endregion

                    #region data insertion

                    int count = dlitems.Items.Count;

                    int Issuccessfull = 0;

                    for (int i = 0; i < count; i++)
                    {
                        HiddenField hdfid = dlitems.Items[i].FindControl("hdfid") as HiddenField;
                        int Id = Convert.ToInt32(hdfid.Value);



                        Issuccessfull = objedit.makeOrderConfirm(userid, orderno, address, city, state, pincode, contactno, paymentmode, email, Id);





                    }

                    #endregion

                    if (Issuccessfull == 1)
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "Popup", "successmodal()", true);
                        cartItemDetails();
                        masterpage master = Master as masterpage;
                        master.cartItems();





                    }

                    else
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "Popup", "errormodal()", true);
                    }






                }

            }


            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Popup", "errormodal()", true);
            }
        }

        #endregion

        #region click event to place order

        protected void btnorder_Click(object sender, EventArgs e)
        {
            try
            {
                confirmOrder();
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Popup", "errormodal()", true);
            }
        }

        #endregion

        #region item datatbound for dlitems

        protected void dlitems_ItemDataBound(object sender, DataListItemEventArgs e)
        {
            try
            {

            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Popup", "errormodal()", true);
            }
        }

        #endregion
    }
}
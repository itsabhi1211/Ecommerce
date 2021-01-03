using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

namespace E_Commerce.DataLayer
{
    public class Insertionlayer
    {
        string strcon = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;

        #region code to add items category

        public int addCategory(string category)
        {
            try
            {

                using (var con = new SqlConnection(strcon))
                {
                    con.Open();
                    var cmd = new SqlCommand("sp_category", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@categoryname", category);
                    cmd.ExecuteNonQuery();
                    con.Close();
                    return 1;

                }


            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        #endregion

        #region code for contact us

        public int contactus(string name, string email, string sub, string msg)
        {
            try
            {

                using (var con = new SqlConnection(strcon))
                {
                    con.Open();
                    var cmd = new SqlCommand("sp_insertcontacts", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@name", name);
                    cmd.Parameters.AddWithValue("@email", email);
                    cmd.Parameters.AddWithValue("@subject", sub);
                    cmd.Parameters.AddWithValue("@message", msg);
                    cmd.ExecuteNonQuery();
                    con.Close();
                    return 1;

                }


            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        #endregion

        #region code to make receipt

        public int receipt(string userid, string receiptno, string totalamt, string orderno)
        {
            try
            {

                using (var con = new SqlConnection(strcon))
                {
                    con.Open();
                    var cmd = new SqlCommand("sp_insertreceipt", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@userid", userid);
                    cmd.Parameters.AddWithValue("@receiptno", receiptno);
                    cmd.Parameters.AddWithValue("@orderno", orderno);
                    cmd.Parameters.AddWithValue("@totalamt", totalamt);
                    cmd.ExecuteNonQuery();
                    con.Close();
                    return 1;

                }


            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        #endregion

        #region code to customer registration

        public int customerRegistration(string name, string userid, long contact, string pwd, string email,string city)
        {
            try
            {
                using (var con = new SqlConnection(strcon))
                {
                    con.Open();
                    var cmd = new SqlCommand("sp_userreg", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@name", name);
                    cmd.Parameters.AddWithValue("@city", city);
                    cmd.Parameters.AddWithValue("@userid", userid);
                    cmd.Parameters.AddWithValue("@contactno", contact);
                    cmd.Parameters.AddWithValue("@pwd", pwd);
                    cmd.Parameters.AddWithValue("@email", email);
                    cmd.ExecuteNonQuery();
                    con.Close();
                    return 1;
                }

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        #endregion

        #region code to customer registration

        public int SellerRegistration(string fname,string lname, string userid, long contact, string pwd, string email, string city)
        {
            try
            {
                using (var con = new SqlConnection(strcon))
                {
                    con.Open();
                    var cmd = new SqlCommand("sp_adminreg", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@fname", fname);
                    cmd.Parameters.AddWithValue("@lname", lname);
                    cmd.Parameters.AddWithValue("@city", city);
                    cmd.Parameters.AddWithValue("@userid", userid);
                    cmd.Parameters.AddWithValue("@contactno", contact);
                    cmd.Parameters.AddWithValue("@pwd", pwd);
                    cmd.Parameters.AddWithValue("@email", email);
                    cmd.ExecuteNonQuery();
                    con.Close();
                    return 1;
                }

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        #endregion

        #region code to add items

        public int addItems(Int32 categoryid, decimal price, string desc, string image,DateTime dop,string producttitle,decimal sellingprice,string sellerid)
        {
            try
            {

                using (var con = new SqlConnection(strcon))
                {
                    con.Open();
                    var cmd = new SqlCommand("sp_items", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@categoryid", categoryid);
                    cmd.Parameters.AddWithValue("@sellerid", sellerid);
                    cmd.Parameters.AddWithValue("@itemprice", price);
                    cmd.Parameters.AddWithValue("@itemdesc", desc);
                    cmd.Parameters.AddWithValue("@itemimage", image);
                    cmd.Parameters.AddWithValue("@dop", dop);
                    cmd.Parameters.AddWithValue("@sellingprice", sellingprice);
                    cmd.Parameters.AddWithValue("@producttitle", producttitle);

                    cmd.ExecuteNonQuery();
                    con.Close();
                    return 1;
                }

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        #endregion

        #region code to insert contactus

        public int insertContactUs(string name, string email, string subject, string message)
        {
            try
            {

                using (var con = new SqlConnection(strcon))
                {
                    con.Open();
                    var cmd = new SqlCommand("sp_insertcontacts", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@name", name);
                    cmd.Parameters.AddWithValue("@email", email);
                    cmd.Parameters.AddWithValue("@subject", subject);
                    cmd.Parameters.AddWithValue("@message", @message);

                    cmd.ExecuteNonQuery();
                    con.Close();
                    return 1;
                }

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        #endregion

        #region code to make order

        public int makeOrder(int item, string userid)
        {
            try
            {

                using (var con = new SqlConnection(strcon))
                {
                    con.Open();
                    var cmd = new SqlCommand("sp_order", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@item", item);
                    cmd.Parameters.AddWithValue("@userid", userid);
                    cmd.ExecuteNonQuery();
                    con.Close();
                    return 1;
                }

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        #endregion

        #region code to make order from wishlist

        public int makeOrder_Wishlist(int item, string userid)
        {
            try
            {

                using (var con = new SqlConnection(strcon))
                {
                    con.Open();
                    var cmd = new SqlCommand("sp_makeorder_wishlist", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@item", item);
                    cmd.Parameters.AddWithValue("@userid", userid);
                    cmd.ExecuteNonQuery();
                    con.Close();
                    return 1;
                }

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        #endregion

        #region code for payment mode

        public int paymentmode(string userid, string orderno, string paymentmode, string upiid, string debitcardno, string cvv)
        {
            try
            {

                using (var con = new SqlConnection(strcon))
                {
                    con.Open();
                    var cmd = new SqlCommand("sp_insertpaymentmode", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@orderno", orderno);
                    cmd.Parameters.AddWithValue("@userid", userid);
                    cmd.Parameters.AddWithValue("@paymentmode", paymentmode);
                    cmd.Parameters.AddWithValue("@upiid", upiid);
                    cmd.Parameters.AddWithValue("@debitcardno", debitcardno);
                    cmd.Parameters.AddWithValue("@cvv", cvv);
                    cmd.ExecuteNonQuery();
                    con.Close();
                    return 1;
                }

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        #endregion     

        #region code to make wishlist

        public int makeWishlist(int item, string userid)
        {
            try
            {

                using (var con = new SqlConnection(strcon))
                {
                    con.Open();
                    var cmd = new SqlCommand("sp_wishlist", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@item", item);
                    cmd.Parameters.AddWithValue("@userid", userid);
                    cmd.ExecuteNonQuery();
                    con.Close();
                    return 1;
                }

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        #endregion

    }
}
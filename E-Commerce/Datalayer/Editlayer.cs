using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

namespace E_Commerce.DataLayer
{
    public class Editlayer
    {
        string strcon = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;

        #region code for order details

        public int makeOrderConfirm(string userid, string orderno, string address, string city, string state, long pincode, long contactno, string paymentmode, string email, int Id)
        {
            try
            {

                using (var con = new SqlConnection(strcon))
                {
                    con.Open();
                    var cmd = new SqlCommand("sp_makeorder", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@orderno", orderno);
                    cmd.Parameters.AddWithValue("@userid", userid);
                    cmd.Parameters.AddWithValue("@address", address);
                    cmd.Parameters.AddWithValue("@city", city);
                    cmd.Parameters.AddWithValue("@state", state);
                    cmd.Parameters.AddWithValue("@pincode", pincode);
                    cmd.Parameters.AddWithValue("@contactno", contactno);
                    cmd.Parameters.AddWithValue("@paymentmode", paymentmode);
                    cmd.Parameters.AddWithValue("@email", email);
                    cmd.Parameters.AddWithValue("@Id", Id);
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

        #region code to update customer profile details

        public int updateCustomerProfile(string userid, string dob, string gender, string state, string city, string address, long pincode)
        {
            try
            {
                using (var con = new SqlConnection(strcon))
                {
                    con.Open();
                    using (var cmd = new SqlCommand("sp_updateuserprofile", con))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@userid", userid);
                        cmd.Parameters.AddWithValue("@dob", dob);
                        cmd.Parameters.AddWithValue("@gender", gender);
                        cmd.Parameters.AddWithValue("@state", state);
                        cmd.Parameters.AddWithValue("@city", city);
                        cmd.Parameters.AddWithValue("@address", address);
                        cmd.Parameters.AddWithValue("@pincode", pincode);
                        cmd.ExecuteNonQuery();
                        con.Close();
                        return 1;
                    }
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        #endregion

        #region code to update admin profile details

        public int updateAdminProfile(string userid, string dob, string gender, string state, string city, string address, long pincode)
        {
            try
            {
                using (var con = new SqlConnection(strcon))
                {
                    con.Open();
                    using (var cmd = new SqlCommand("sp_updateadminprofile", con))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@userid", userid);
                        cmd.Parameters.AddWithValue("@dob", dob);
                        cmd.Parameters.AddWithValue("@gender", gender);
                        cmd.Parameters.AddWithValue("@state", state);
                        cmd.Parameters.AddWithValue("@city", city);
                        cmd.Parameters.AddWithValue("@address", address);
                        cmd.Parameters.AddWithValue("@pincode", pincode);
                        cmd.ExecuteNonQuery();
                        con.Close();
                        return 1;
                    }
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        #endregion

        #region code to update items category

        public int updateCategory(int Id, string category)
        {
            try
            {
                using (var con = new SqlConnection(strcon))
                {
                    con.Open();
                    using (var cmd = new SqlCommand("sp_updatecategory", con))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@Id", Id);
                        cmd.Parameters.AddWithValue("@categoryname", category);

                        cmd.ExecuteNonQuery();
                        con.Close();
                        return 1;
                    }
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        #endregion

        #region code to approve order

        public int approveOrder(string orderno)
        {
            try
            {
                using (var con = new SqlConnection(strcon))
                {
                    con.Open();
                    using (var cmd = new SqlCommand("update tblorder set isapproved=1,approvaldate=getdate() where orderno=@orderno", con))
                    {

                        cmd.Parameters.AddWithValue("@orderno", orderno);


                        cmd.ExecuteNonQuery();
                        con.Close();
                        return 1;
                    }
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        #endregion

        #region code to deliver order

        public int deliverOrder(string orderno)
        {
            try
            {
                using (var con = new SqlConnection(strcon))
                {
                    con.Open();
                    using (var cmd = new SqlCommand("update tblorder set isdelivered=1,deliverydate=getdate() where orderno=@orderno", con))
                    {

                        cmd.Parameters.AddWithValue("@orderno", orderno);


                        cmd.ExecuteNonQuery();
                        con.Close();
                        return 1;
                    }
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        #endregion

        #region code for customer profile

        public int customerProfile(string profilepic, long pincode, string city, string address, string state, string gender, string userid)
        {
            try
            {

                using (var con = new SqlConnection(strcon))
                {
                    con.Open();
                    var cmd = new SqlCommand("sp_updateuserprofile", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@profilepic", profilepic);
                    cmd.Parameters.AddWithValue("@userid", userid);
                    cmd.Parameters.AddWithValue("@city", city);
                    cmd.Parameters.AddWithValue("@address", address);
                    cmd.Parameters.AddWithValue("@state", state);
                    cmd.Parameters.AddWithValue("@gender", gender);
                    cmd.Parameters.AddWithValue("@pincode", pincode);
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

        #region code for Admin user profile

        public int adminUserProfile(string profilepic, long pincode, string city, string address, string state, string gender, string userid)
        {
            try
            {

                using (var con = new SqlConnection(strcon))
                {
                    con.Open();
                    var cmd = new SqlCommand("sp_updateadminprofile", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@profilepic", profilepic);
                    cmd.Parameters.AddWithValue("@userid", userid);
                    cmd.Parameters.AddWithValue("@city", city);
                    cmd.Parameters.AddWithValue("@address", address);
                    cmd.Parameters.AddWithValue("@state", state);
                    cmd.Parameters.AddWithValue("@gender", gender);
                    cmd.Parameters.AddWithValue("@pincode", pincode);
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

        #region code to update items

        public int updateItems(int Id, int category, decimal price, string desc, string image, string producttitle,decimal sellingprice,DateTime dop)
        {
            try
            {
                using (var con = new SqlConnection(strcon))
                {
                    con.Open();
                    using (var cmd = new SqlCommand("sp_updateitems", con))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@categoryid", category);                    
                        cmd.Parameters.AddWithValue("@itemprice", price);
                        cmd.Parameters.AddWithValue("@itemdesc", desc);
                        cmd.Parameters.AddWithValue("@itemimage", image);
                        cmd.Parameters.AddWithValue("@dop", dop);
                        cmd.Parameters.AddWithValue("@Id", Id);
                        cmd.Parameters.AddWithValue("@sellingprice", sellingprice);
                        cmd.Parameters.AddWithValue("@producttitle", producttitle);
                        
                        cmd.ExecuteNonQuery();
                        con.Close();
                        return 1;
                    }
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        #endregion

        #region code to delete items

        public int deleteItems(string Id)
        {
            try
            {
                using (var con = new SqlConnection(strcon))
                {
                    con.Open();
                    using (var cmd = new SqlCommand("update tblitems set isactive=1 where Id=@id", con))
                    {
                        cmd.Parameters.AddWithValue("@id", Id);
                        cmd.ExecuteNonQuery();
                        con.Close();
                        return 1;
                    }
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        #endregion

        #region code to delete items from cart

        public int deleteCartItems(string userid, int Id)
        {
            try
            {
                using (var con = new SqlConnection(strcon))
                {
                    con.Open();
                    using (var cmd = new SqlCommand("delete from tblorder where Id=@id and userid=@userid and iscart=1", con))
                    {

                        cmd.Parameters.AddWithValue("@id", Id);
                        cmd.Parameters.AddWithValue("@userid", userid);
                        cmd.ExecuteNonQuery();
                        con.Close();
                        return 1;
                    }
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        #endregion

        #region code to remove items from wishlist

        public int deletewishlistItems(string userid, int Id)
        {
            try
            {
                using (var con = new SqlConnection(strcon))
                {
                    con.Open();
                    using (var cmd = new SqlCommand("delete from tblwishlist where Id=@id and userid=@userid and iswishlist=1", con))
                    {

                        cmd.Parameters.AddWithValue("@id", Id);
                        cmd.Parameters.AddWithValue("@userid", userid);
                        cmd.ExecuteNonQuery();
                        con.Close();
                        return 1;
                    }
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        #endregion

        #region code to delete items category

        public int deleteItemsCategory(string Id)
        {
            try
            {
                using (var con = new SqlConnection(strcon))
                {
                    con.Open();
                    using (var cmd = new SqlCommand("delete from tblcategory where Id=@id", con))
                    {

                        cmd.Parameters.AddWithValue("@id", Id);
                        cmd.ExecuteNonQuery();
                        con.Close();
                        return 1;
                    }
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
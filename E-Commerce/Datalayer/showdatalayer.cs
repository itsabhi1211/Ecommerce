using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

namespace E_Commerce.DataLayer
{
    public class showdatalayer
    {
        string strcon = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;

        #region code to show approved customer


        public DataTable approvedCustomer()
        {
            try
            {
                using (var con = new SqlConnection(strcon))
                {
                    con.Open();
                    var cmd = new SqlCommand("select * from tbluserreg where isactive=1  order By Id desc", con);
                    var da = new SqlDataAdapter(cmd);
                    var dt = new DataTable();
                    da.Fill(dt);
                    return dt;
                }

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }



        #endregion

        #region code to show items in cart


        public DataTable cartItems(string userid)
        {
            try
            {
                using (var con = new SqlConnection(strcon))
                {
                    con.Open();
                    var cmd = new SqlCommand("select * from tblorder where iscart=1 and userid=@userid  order By Id desc", con);
                    cmd.Parameters.AddWithValue("@userid", userid);
                    var da = new SqlDataAdapter(cmd);
                    var dt = new DataTable();
                    da.Fill(dt);
                    return dt;
                }

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public DataTable cartItems(string userid, int item)
        {
            try
            {
                using (var con = new SqlConnection(strcon))
                {
                    con.Open();
                    var cmd = new SqlCommand("select * from tblorder where iscart=1 and userid=@userid and itemid=@item", con);
                    cmd.Parameters.AddWithValue("@userid", userid);
                    cmd.Parameters.AddWithValue("@item", item);
                    var da = new SqlDataAdapter(cmd);
                    var dt = new DataTable();
                    da.Fill(dt);
                    return dt;
                }

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public DataTable chkItemsCity( int item)
        {
            try
            {
                using (var con = new SqlConnection(strcon))
                {
                    con.Open();
                    var cmd = new SqlCommand("sp_chkitemcity", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@id", item);
                    var da = new SqlDataAdapter(cmd);
                    var dt = new DataTable();
                    da.Fill(dt);
                    return dt;
                }

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }



        #endregion

        #region code to show items in wishlist


        public DataTable wishlistItems(string userid)
        {
            try
            {
                using (var con = new SqlConnection(strcon))
                {
                    con.Open();
                    var cmd = new SqlCommand("sp_wishlistitemdetails", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@userid", userid);
                    var da = new SqlDataAdapter(cmd);
                    var dt = new DataTable();
                    da.Fill(dt);
                    return dt;
                }

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public DataTable wishlistItems(string userid, int item)
        {
            try
            {
                using (var con = new SqlConnection(strcon))
                {
                    con.Open();
                    var cmd = new SqlCommand("select * from tblwishlist where iswishlist=1 and userid=@userid and item=@item", con);
                    cmd.Parameters.AddWithValue("@userid", userid);
                    cmd.Parameters.AddWithValue("@item", item);
                    var da = new SqlDataAdapter(cmd);
                    var dt = new DataTable();
                    da.Fill(dt);
                    return dt;
                }

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }



        #endregion

        #region code to show pending customer


        public DataTable pendingCustomer()
        {
            try
            {
                using (var con = new SqlConnection(strcon))
                {
                    con.Open();
                    var cmd = new SqlCommand("select * from tbluserreg where isactive=0  order By Id desc", con);
                    var da = new SqlDataAdapter(cmd);
                    var dt = new DataTable();
                    da.Fill(dt);
                    return dt;
                }

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }



        #endregion

        #region code to show category


        public DataTable showCategory()
        {
            try
            {
                using (var con = new SqlConnection(strcon))
                {
                    con.Open();
                    var cmd = new SqlCommand("select * from tblcategory", con);
                    var da = new SqlDataAdapter(cmd);
                    var dt = new DataTable();
                    da.Fill(dt);
                    return dt;
                }

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }



        #endregion

        #region code to show category


        public DataTable showCity()
        {
            try
            {
                using (var con = new SqlConnection(strcon))
                {
                    con.Open();
                    var cmd = new SqlCommand("select distinct city from tbladminreg where isactive=0", con);
                    var da = new SqlDataAdapter(cmd);
                    var dt = new DataTable();
                    da.Fill(dt);
                    return dt;
                }

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }



        #endregion

        #region code for order tracking


        public DataTable orderTracking(string userid,string orderno)
        {
            try
            {
                using (var con = new SqlConnection(strcon))
                {
                    con.Open();
                    var cmd = new SqlCommand("sp_ordertrack", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@userid", userid);
                    cmd.Parameters.AddWithValue("@orderno", orderno);
                    var da = new SqlDataAdapter(cmd);
                    var dt = new DataTable();
                    da.Fill(dt);
                    return dt;
                }

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }



        #endregion

        #region code to show dasboard count


        public DataTable showDashboard()
        {
            try
            {
                using (var con = new SqlConnection(strcon))
                {
                    con.Open();
                    var cmd = new SqlCommand("sp_dashboard", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    var da = new SqlDataAdapter(cmd);
                    var dt = new DataTable();
                    da.Fill(dt);
                    return dt;
                }

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }



        #endregion

        #region code to show total cart items of particular customer


        public DataTable itemsCount(string userid)
        {
            try
            {
                using (var con = new SqlConnection(strcon))
                {
                    con.Open();
                    var cmd = new SqlCommand("select count(*) as totalitems from tblorder where iscart=1 and userid=@userid", con);
                    cmd.Parameters.AddWithValue("@userid", userid);
                    var da = new SqlDataAdapter(cmd);
                    var dt = new DataTable();
                    da.Fill(dt);
                    return dt;
                }

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }



        #endregion

        #region code to show contactus details


        public DataTable showContactUs()
        {
            try
            {
                using (var con = new SqlConnection(strcon))
                {
                    con.Open();
                    var cmd = new SqlCommand("select * from tblcontact", con);
                    var da = new SqlDataAdapter(cmd);
                    var dt = new DataTable();
                    da.Fill(dt);
                    return dt;
                }

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }



        #endregion

        #region code to show cart item details 


        public DataTable cartItemsDetails(string userid)
        {
            try
            {
                using (var con = new SqlConnection(strcon))
                {
                    con.Open();
                    var cmd = new SqlCommand("sp_cartitemdetails", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@userid", userid);

                    var da = new SqlDataAdapter(cmd);
                    var ds = new DataTable();
                    da.Fill(ds);
                    return ds;
                }

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public DataSet cartItemsTotal(string userid)
        {
            try
            {
                using (var con = new SqlConnection(strcon))
                {
                    con.Open();
                    var cmd = new SqlCommand("sp_cartitemtotal", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@userid", userid);
                    var da = new SqlDataAdapter(cmd);
                    var ds = new DataSet();
                    da.Fill(ds);
                    return ds;
                }

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }



        #endregion

        #region code to show items with details


        public DataTable showSellerItemsWithDetails(string sellerid)
        {
            try
            {
                using (var con = new SqlConnection(strcon))
                {
                    con.Open();
                    var cmd = new SqlCommand("sp_showitemsdetails", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@sellerid", sellerid);
                    var da = new SqlDataAdapter(cmd);
                    var dt = new DataTable();
                    da.Fill(dt);
                    return dt;
                }

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }



        #endregion

        #region code to make receipt


        public DataTable receiptnoGeneration()
        {
            try
            {
                using (var con = new SqlConnection(strcon))
                {
                    con.Open();
                    var cmd = new SqlCommand("sp_receiptno", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    var da = new SqlDataAdapter(cmd);
                    var dt = new DataTable();
                    da.Fill(dt);
                    return dt;
                }

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }



        #endregion

        #region code to show orders to admin


        public DataTable showOrder_Admin()
        {
            try
            {
                using (var con = new SqlConnection(strcon))
                {
                    con.Open();
                    var cmd = new SqlCommand("sp_showorderAdmin", con);
                    cmd.CommandType = CommandType.StoredProcedure;                    
                    var da = new SqlDataAdapter(cmd);
                    var dt = new DataTable();
                    da.Fill(dt);
                    return dt;
                }

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public DataTable showDeliveredOrder_Admin()
        {
            try
            {
                using (var con = new SqlConnection(strcon))
                {
                    con.Open();
                    var cmd = new SqlCommand("sp_showdeliveredorderAdmin", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    var da = new SqlDataAdapter(cmd);
                    var dt = new DataTable();
                    da.Fill(dt);
                    return dt;
                }

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }



        #endregion

        #region code to show orders details


        public DataTable showOrderDetails(string orderno)
        {
            try
            {
                using (var con = new SqlConnection(strcon))
                {
                    con.Open();
                    var cmd = new SqlCommand("sp_orderdetails", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@orderno", orderno);
                    var da = new SqlDataAdapter(cmd);
                    var dt = new DataTable();
                    da.Fill(dt);
                    return dt;
                }

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public DataTable showOrderTotal(string orderno)
        {
            try
            {
                using (var con = new SqlConnection(strcon))
                {
                    con.Open();
                    var cmd = new SqlCommand("sp_orderitemtotal", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@orderno", orderno);
                    var da = new SqlDataAdapter(cmd);
                    var dt = new DataTable();
                    da.Fill(dt);
                    return dt;
                }

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }



        #endregion

        #region code to show orders to customer


        public DataTable showOrder_Customer(string userid)
        {
            try
            {
                using (var con = new SqlConnection(strcon))
                {
                    con.Open();
                    var cmd = new SqlCommand("sp_showrecentordercustomer", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@userid", userid);
                    var da = new SqlDataAdapter(cmd);
                    var dt = new DataTable();
                    da.Fill(dt);
                    return dt;
                }

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public DataTable showDeliveredOrder_Customer(string userid)
        {
            try
            {
                using (var con = new SqlConnection(strcon))
                {
                    con.Open();
                    var cmd = new SqlCommand("sp_showdeliveredordercustomer", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@userid", userid);
                    var da = new SqlDataAdapter(cmd);
                    var dt = new DataTable();
                    da.Fill(dt);
                    return dt;
                }

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }



        #endregion

        #region code to show items with details


        public DataTable showtopItemsWithDetails()
        {
            try
            {
                using (var con = new SqlConnection(strcon))
                {
                    con.Open();
                    var cmd = new SqlCommand("sp_showtopitems", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    var da = new SqlDataAdapter(cmd);
                    var dt = new DataTable();
                    da.Fill(dt);
                    return dt;
                }

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public DataTable showtop8ItemsWithDetails()
        {
            try
            {
                using (var con = new SqlConnection(strcon))
                {
                    con.Open();
                    var cmd = new SqlCommand("select top 8 *,(select categoryname from tblcategory where tblcategory.Id=tblitems.categoryid) as category,(select city from tbladminreg where tbladminreg.userid=tblitems.SellerId) as city,(select contactno from tbladminreg where tbladminreg.userid=tblitems.SellerId) as contactno,(select fname+lname from tbladminreg where tbladminreg.userid=tblitems.SellerId) as name,DATEDIFF(day,dop,GETDATE()) as daysold from tblitems where isactive=0 order By Id desc", con);
                    var da = new SqlDataAdapter(cmd);
                    var dt = new DataTable();
                    da.Fill(dt);
                    return dt;
                }

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }



        #endregion

        #region code to show items with city


        public DataTable showItemsWithDetails(string city)
        {
            try
            {
                using (var con = new SqlConnection(strcon))
                {
                    con.Open();
                    var cmd = new SqlCommand("sp_showitems", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                   
                    cmd.Parameters.AddWithValue("@city", city);
                    var da = new SqlDataAdapter(cmd);
                    var dt = new DataTable();
                    da.Fill(dt);
                    return dt;
                }

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public DataTable showItemsWithDetails()
        {
            try
            {
                using (var con = new SqlConnection(strcon))
                {
                    con.Open();
                    var cmd = new SqlCommand("sp_Showallitems", con);
                    cmd.CommandType = CommandType.StoredProcedure;

                    
                    var da = new SqlDataAdapter(cmd);
                    var dt = new DataTable();
                    da.Fill(dt);
                    return dt;
                }

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }



        #endregion

        #region code to bind registered customer


        public DataTable registeredCustomer()
        {
            try
            {
                using (var con = new SqlConnection(strcon))
                {
                    con.Open();
                    var cmd = new SqlCommand("select * from tblcustomerreg  order By Id desc", con);
                    var da = new SqlDataAdapter(cmd);
                    var dt = new DataTable();
                    da.Fill(dt);
                    return dt;
                }

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }



        #endregion

        #region code to show admin details


        public DataTable admindetails(string userid)
        {
            try
            {
                using (var con = new SqlConnection(strcon))
                {
                    con.Open();
                    var cmd = new SqlCommand("sp_adminregdetails", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@userid", userid);
                    var da = new SqlDataAdapter(cmd);
                    var dt = new DataTable();
                    da.Fill(dt);
                    return dt;
                }

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }



        #endregion

        #region code to show User details


        public DataTable userdetails(string userid)
        {
            try
            {
                using (var con = new SqlConnection(strcon))
                {
                    con.Open();
                    var cmd = new SqlCommand("sp_showuserDetails", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@userid", userid);
                    var da = new SqlDataAdapter(cmd);
                    var dt = new DataTable();
                    da.Fill(dt);
                    return dt;
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
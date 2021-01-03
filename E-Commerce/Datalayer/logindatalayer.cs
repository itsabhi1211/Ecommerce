using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

namespace E_Commerce.DataLayer
{
    public class logindatalayer
    {
        string strcon = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;

        #region code for customer login

        public DataTable customerLogin(string password, string email)
        {
            try
            {
                using (var con = new SqlConnection(strcon))
                {
                    con.Open();
                    using (var cmd = new SqlCommand("sp_customerlogin", con))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@email", email);
                        cmd.Parameters.AddWithValue("@pwd", password);
                        var sda = new SqlDataAdapter(cmd);
                        var dt = new DataTable();
                        sda.Fill(dt);
                        return dt;
                    }
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        #endregion

        #region code for customer login

        public DataTable adminLogin(string password, string email)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    con.Open();
                    using (SqlCommand cmd = new SqlCommand("sp_adminlogin", con))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@email", email);
                        cmd.Parameters.AddWithValue("@pwd", password);
                        SqlDataAdapter sda = new SqlDataAdapter(cmd);
                        DataTable dt = new DataTable();
                        sda.Fill(dt);
                        return dt;
                    }
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        #endregion

        #region code to change password

        public int changepassword(string userid, string newpassword, string oldpassword)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    con.Open();
                    using (SqlCommand cmd = new SqlCommand("sp_adminchangepwd", con))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@userid", userid);
                        cmd.Parameters.AddWithValue("@oldpwd", oldpassword);
                        cmd.Parameters.AddWithValue("@newpwd", newpassword);
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

        #region code to change password Admin Module

        public DataTable changepasswordAdmin(string userid, string newpassword, string oldpassword)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    con.Open();
                    using (SqlCommand cmd = new SqlCommand("sp_changepasswordAdmin", con))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@userid", userid);
                        cmd.Parameters.AddWithValue("@oldpassword", oldpassword);
                        cmd.Parameters.AddWithValue("@newpassword", newpassword);
                        SqlDataAdapter sda = new SqlDataAdapter(cmd);
                        using (DataTable dt = new DataTable())
                        {
                            sda.Fill(dt);
                            return dt;
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        #endregion

        #region code for checking password

        public DataTable chkPassword(string regno, string password)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    con.Open();
                    using (SqlCommand cmd = new SqlCommand("select password from tblstudentprofile where regno=@regno and password=@password", con))
                    {
                        SqlDataAdapter sda = new SqlDataAdapter(cmd);
                        cmd.Parameters.AddWithValue("@regno", regno);
                        cmd.Parameters.AddWithValue("@password", password);
                        using (DataTable dt = new DataTable())
                        {
                            sda.Fill(dt);
                            return dt;
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        #endregion

        #region code for checking password Admin Module

        public DataTable chkPasswordAdmin(string userid, string password)
        {
            try
            {
                using (var con = new SqlConnection(strcon))
                {
                    con.Open();
                    using (var cmd = new SqlCommand("select password from User_Administrator where userid=@userid and password=@password", con))
                    {
                        var sda = new SqlDataAdapter(cmd);
                        cmd.Parameters.AddWithValue("@userid", userid);
                        cmd.Parameters.AddWithValue("@password", password);
                        using (var dt = new DataTable())
                        {
                            sda.Fill(dt);
                            return dt;
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        #endregion

        #region code for checking Existing Customer

        public DataTable chkExistingSeller(long contactno, string email)
        {
            try
            {
                using (var con = new SqlConnection(strcon))
                {
                    con.Open();
                    using (var cmd = new SqlCommand("select contactno,email from tbladminreg where contactno=@contactno or email=@email", con))
                    {
                        var sda = new SqlDataAdapter(cmd);
                        cmd.Parameters.AddWithValue("@email", email);
                        cmd.Parameters.AddWithValue("@contactno", contactno);
                        using (var dt = new DataTable())
                        {
                            sda.Fill(dt);
                            return dt;
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        #endregion

        #region code for checking Existing Customer

        public DataTable chkExistingCustomer(long contactno, string email)
        {
            try
            {
                using (var con = new SqlConnection(strcon))
                {
                    con.Open();
                    using (var cmd = new SqlCommand("select contactno,email from tbluserreg where contactno=@contactno or email=@email", con))
                    {
                        var sda = new SqlDataAdapter(cmd);
                        cmd.Parameters.AddWithValue("@email", email);
                        cmd.Parameters.AddWithValue("@contactno", contactno);
                        using (var dt = new DataTable())
                        {
                            sda.Fill(dt);
                            return dt;
                        }
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
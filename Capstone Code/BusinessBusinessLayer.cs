using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


namespace BusinessLayer
{
    public class BusinessBusinessLayer
    {
        #region Add
        /// <summary>
        /// Adds a new record.
        /// </summary>
        public void Add(Business newBusiness)
        {
            String connectionString = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                String sql = @"INSERT INTO [Business]
								(
									[BusinessName],
									[ContactFirstName],
									[ContactLastName],
									[AddressLIne1],
									[AddressLine2],
									[City],
									[State],
									[Zip],
									[Website],
									[ContactTelephone],
									[BusinessTelephone],
									[UserID]
								)
								VALUES
								(
									@BusinessName,
									@ContactFirstName,
									@ContactLastName,
									@AddressLIne1,
									@AddressLine2,
									@City,
									@State,
									@Zip,
									@Website,
									@ContactTelephone,
									@BusinessTelephone,
									@UserID
								);";

                sql += "SELECT SCOPE_IDENTITY();";

                con.Open();

                using (SqlCommand cmd = new SqlCommand(sql, con))
                {
                    cmd.Parameters.Add("@BusinessName", SqlDbType.NVarChar, 150).Value = newBusiness.BusinessName == null ? (Object)DBNull.Value : newBusiness.BusinessName;
                    cmd.Parameters.Add("@ContactFirstName", SqlDbType.NVarChar, 50).Value = newBusiness.ContactFirstName == null ? (Object)DBNull.Value : newBusiness.ContactFirstName;
                    cmd.Parameters.Add("@ContactLastName", SqlDbType.NVarChar, 50).Value = newBusiness.ContactLastName == null ? (Object)DBNull.Value : newBusiness.ContactLastName; 
                    cmd.Parameters.Add("@AddressLIne1", SqlDbType.NVarChar, 50).Value = newBusiness.AddressLIne1 == null ? (Object)DBNull.Value : newBusiness.AddressLIne1; ;
                    cmd.Parameters.Add("@AddressLine2", SqlDbType.NVarChar, 50).Value = newBusiness.AddressLine2 == null ? (Object)DBNull.Value : newBusiness.AddressLine2;
                    cmd.Parameters.Add("@City", SqlDbType.NVarChar, 80).Value = newBusiness.City == null ? (Object)DBNull.Value : newBusiness.City;
                    cmd.Parameters.Add("@State", SqlDbType.NChar, 2).Value = newBusiness.State == null ? (Object)DBNull.Value : newBusiness.State;
                    cmd.Parameters.Add("@Zip", SqlDbType.NVarChar, 10).Value = newBusiness.Zip == null ? (Object)DBNull.Value : newBusiness.Zip;
                    cmd.Parameters.Add("@Website", SqlDbType.NVarChar, 60).Value = newBusiness.Website == null ? (Object)DBNull.Value : newBusiness.Website;
                    cmd.Parameters.Add("@ContactTelephone", SqlDbType.NVarChar, 50).Value = newBusiness.ContactTelephone == null ? (Object)DBNull.Value : newBusiness.ContactTelephone;
                    cmd.Parameters.Add("@BusinessTelephone", SqlDbType.NVarChar, 50).Value = newBusiness.BusinessTelephone == null ? (Object)DBNull.Value : newBusiness.BusinessTelephone;
                    cmd.Parameters.Add("@UserID", SqlDbType.Int, 4).Value = newBusiness.UserID;

                    // Execute the insert statement and get value of the identity column.
                    newBusiness.BusinessID = Convert.ToInt32(cmd.ExecuteScalar());
                }

                con.Close();
            }
        }
        #endregion

        #region Get
        /// <summary>
        /// Gets an existing record.
        /// </summary>
        public Business GetBusinessRecord(string identityID)
        {
            String connectionString = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                String sql = @"SELECT	b.[BusinessID],
										b.[BusinessName],
										b.[ContactFirstName],
										b.[ContactLastName],
										b.[AddressLIne1],
										b.[AddressLine2],
										b.[City],
										b.[State],
										b.[Zip],
										b.[Website],
										b.[ContactTelephone],
										b.[BusinessTelephone],
										b.[UserID]
								FROM	 AspNetUsers a
                                        LEFT JOIN dbo.[User] u ON (a.Id = u.Id)
                                        LEFT JOIN dbo.Business b ON (u.UserID = b.UserID)
                                WHERE a.Id = @identityID;";

                Business business = new Business();

                con.Open();

                using (SqlCommand cmd = new SqlCommand(sql, con))
                {
                    cmd.Parameters.Add("@identityID", SqlDbType.NVarChar, 128).Value = identityID;

                    using (SqlDataReader reader = cmd.ExecuteReader(CommandBehavior.CloseConnection))
                    {
                        if (reader.Read())
                        {
                            business.BusinessID = Convert.ToInt32(reader["BusinessID"]);
                            business.BusinessName = reader["BusinessName"].ToString();
                            business.ContactFirstName = reader["ContactFirstName"].ToString();
                            business.ContactLastName = reader["ContactLastName"].ToString();
                            business.AddressLIne1 = reader["AddressLIne1"].ToString();
                            business.AddressLine2 = reader["AddressLine2"] == DBNull.Value ? null : reader["AddressLine2"].ToString();
                            business.City = reader["City"].ToString();
                            business.State = reader["State"].ToString();
                            business.Zip = reader["Zip"].ToString();
                            business.Website = reader["Website"] == DBNull.Value ? null : reader["Website"].ToString();
                            business.ContactTelephone = reader["ContactTelephone"] == DBNull.Value ? null : reader["ContactTelephone"].ToString();
                            business.BusinessTelephone = reader["BusinessTelephone"] == DBNull.Value ? null : reader["BusinessTelephone"].ToString();
                            business.UserID = Convert.ToInt32(reader["UserID"]);
                        }
                    }
                }

                return business;
            }
        }
        #endregion

    }
}

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
    public class ArtistBusinessLayer
    {
        #region Add
        /// <summary>
        /// Adds a new record.
        /// </summary>
        public void Add(Artist newArtist)
        {
            String connectionString = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                String sql = @"INSERT INTO [Artist]
								(
									[FirstName],
									[LastName],
									[NickName],
									[Telephone],
									[UserID]
								)
								VALUES
								(
									@FirstName,
									@LastName,
									@NickName,
									@Telephone,
									@UserID
								);";

                sql += "SELECT SCOPE_IDENTITY();";

                con.Open();

                using (SqlCommand cmd = new SqlCommand(sql, con))
                {
                    cmd.Parameters.Add("@FirstName", SqlDbType.NVarChar, 50).Value = newArtist.FirstName == null ? (Object)DBNull.Value : newArtist.FirstName;
                    cmd.Parameters.Add("@LastName", SqlDbType.NVarChar, 50).Value = newArtist.LastName == null ? (Object)DBNull.Value : newArtist.LastName;
                    cmd.Parameters.Add("@NickName", SqlDbType.NVarChar, 50).Value = newArtist.NickName == null ? (Object)DBNull.Value : newArtist.NickName;
                    cmd.Parameters.Add("@Telephone", SqlDbType.NVarChar, 50).Value = newArtist.Telephone == null ? (Object)DBNull.Value : newArtist.Telephone;
                    cmd.Parameters.Add("@UserID", SqlDbType.Int, 4).Value = newArtist.UserID;

                    // Execute the insert statement and get value of the identity column.
                    newArtist.ArtistID = Convert.ToInt32(cmd.ExecuteScalar());
                }

                con.Close();
            }
        }
        #endregion

    }
}

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;


namespace BusinessLayer
{
    public class UserBusinessLayer
    {
        public void Add(User newUser)
        {
            String connectionString = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                String sql = @"INSERT INTO [User]
								(
									[EmailAddress],
									[Active],
									[DateAdded],
                                    [Role],
									[Id]
								)
								VALUES
								(
									@EmailAddress,
									@Active,
									@DateAdded,
                                    @Role,
									@Id
								);";

                sql += "SELECT SCOPE_IDENTITY();";

                con.Open();

                using (SqlCommand cmd = new SqlCommand(sql, con))
                {
                    cmd.Parameters.Add("@EmailAddress", SqlDbType.NVarChar, 256).Value = newUser.EmailAddress;
                    cmd.Parameters.Add("@Active", SqlDbType.Int, 4).Value = newUser.Active;
                    cmd.Parameters.Add("@DateAdded", SqlDbType.DateTime, 8).Value = DateTime.Now;
                    cmd.Parameters.Add("@Role", SqlDbType.NVarChar, 20).Value = newUser.Role;
                    cmd.Parameters.Add("@Id", SqlDbType.NVarChar, 128).Value = newUser.Id;

                    // Execute the insert statement and get value of the identity column.
                    newUser.UserID = Convert.ToInt32(cmd.ExecuteScalar());
                }

                con.Close();
            }
        }

    }
}

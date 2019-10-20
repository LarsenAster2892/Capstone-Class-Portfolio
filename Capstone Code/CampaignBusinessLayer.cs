using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace BusinessLayer
{
    public class CampaignBusinessLayer
    {
        #region Add
        /// <summary>
        /// Adds a new record.
        /// </summary>
        public void Add(Campaign campaign)
        {
            String connectionString = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                String sql = @"INSERT INTO [Campaign]
								(
									[Title],
									[Description],
									[AddDate],
									[StartDate],
									[EndDate],
									[NumberSubmissions],
									[BusinessID],
									[CStatusID]
								)
								VALUES
								(
									@Title,
									@Description,
									@AddDate,
									@StartDate,
									@EndDate,
									@NumberSubmissions,
									@BusinessID,
									@CStatusID
								);";

                sql += "SELECT SCOPE_IDENTITY();";

                con.Open();

                using (SqlCommand cmd = new SqlCommand(sql, con))
                {
                    cmd.Parameters.Add("@Title", SqlDbType.NVarChar, 50).Value = campaign.Title;
                    cmd.Parameters.Add("@Description", SqlDbType.NVarChar, -1).Value = campaign.Description;
                    cmd.Parameters.Add("@AddDate", SqlDbType.DateTime, 8).Value = campaign.AddDate;
                    cmd.Parameters.Add("@StartDate", SqlDbType.DateTime, 8).Value = campaign.StartDate;
                    cmd.Parameters.Add("@EndDate", SqlDbType.DateTime, 8).Value = campaign.EndDate == null ? (Object)DBNull.Value : campaign.EndDate;
                    cmd.Parameters.Add("@NumberSubmissions", SqlDbType.Int, 4).Value = campaign.NumberSubmissions;
                    cmd.Parameters.Add("@BusinessID", SqlDbType.Int, 4).Value = campaign.BusinessID;
                    cmd.Parameters.Add("@CStatusID", SqlDbType.Int, 4).Value = campaign.CStatusID;

                    // Execute the insert statement and get value of the identity column.
                    campaign.CampaignID = Convert.ToInt32(cmd.ExecuteScalar());
                }

                con.Close();
            }
        }
        #endregion

        #region Update
        /// <summary>
        /// Updates an existing record.
        /// </summary>
        public void Update(Campaign campaign)
        {
            String connectionString = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                String sql = @"UPDATE	[Campaign]
								SET		[Title] = @Title,
										[Description] = @Description,
										[AddDate] = @AddDate,
										[StartDate] = @StartDate,
										[EndDate] = @EndDate,
										[NumberSubmissions] = @NumberSubmissions,
										[BusinessID] = @BusinessID,
										[CStatusID] = @CStatusID
								WHERE	[CampaignID] = @CampaignID;";

                con.Open();

                using (SqlCommand cmd = new SqlCommand(sql, con))
                {
                    cmd.Parameters.Add("@CampaignID", SqlDbType.Int, 4).Value = campaign.CampaignID;
                    cmd.Parameters.Add("@Title", SqlDbType.NVarChar, 50).Value = campaign.Title;
                    cmd.Parameters.Add("@Description", SqlDbType.NVarChar, -1).Value = campaign.Description;
                    cmd.Parameters.Add("@AddDate", SqlDbType.DateTime, 8).Value = campaign.AddDate;
                    cmd.Parameters.Add("@StartDate", SqlDbType.DateTime, 8).Value = campaign.StartDate;
                    cmd.Parameters.Add("@EndDate", SqlDbType.DateTime, 8).Value = campaign.EndDate == null ? (Object)DBNull.Value : campaign.EndDate;
                    cmd.Parameters.Add("@NumberSubmissions", SqlDbType.Int, 4).Value = campaign.NumberSubmissions;
                    cmd.Parameters.Add("@BusinessID", SqlDbType.Int, 4).Value = campaign.BusinessID;
                    cmd.Parameters.Add("@CStatusID", SqlDbType.Int, 4).Value = campaign.CStatusID;
                    cmd.ExecuteNonQuery();
                }

                con.Close();
            }
        }
        #endregion

        #region Delete
        /// <summary>
        /// Deletes an existing record.
        /// </summary>
        public static void Delete(int campaignID)
        {
            String connectionString = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                String sql = @"DELETE	FROM [Campaign]
								WHERE	[CampaignID] = @CampaignID;";

                con.Open();

                using (SqlCommand cmd = new SqlCommand(sql, con))
                {
                    cmd.Parameters.Add("@CampaignID", SqlDbType.Int, 4).Value = campaignID;
                    cmd.ExecuteNonQuery();
                }

                con.Close();
            }
        }
        #endregion

        #region Get
        /// <summary>
        /// Gets an existing record.
        /// </summary>
        public static Campaign Get(int campaignID)
        {
            String connectionString = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                String sql = @"SELECT	[CampaignID],
										[Title],
										[Description],
										[AddDate],
										[StartDate],
										[EndDate],
										[NumberSubmissions],
										[BusinessID],
										[CStatusID]
								FROM	[Campaign]
								WHERE	[CampaignID] = @CampaignID;";

                Campaign campaign = new Campaign();

                con.Open();

                using (SqlCommand cmd = new SqlCommand(sql, con))
                {
                    cmd.Parameters.Add("@CampaignID", SqlDbType.Int, 4).Value = campaignID;

                    using (SqlDataReader reader = cmd.ExecuteReader(CommandBehavior.CloseConnection))
                    {
                        if (reader.Read())
                        {
                            campaign.CampaignID = Convert.ToInt32(reader["CampaignID"]);
                            campaign.Title = reader["Title"].ToString();
                            campaign.Description = reader["Description"].ToString();
                            campaign.AddDate = Convert.ToDateTime(reader["AddDate"]);
                            campaign.StartDate = Convert.ToDateTime(reader["StartDate"]);
                            campaign.EndDate = reader["EndDate"] == DBNull.Value ? (DateTime?)null : Convert.ToDateTime(reader["EndDate"]);
                            campaign.NumberSubmissions = Convert.ToInt32(reader["NumberSubmissions"]);
                            campaign.BusinessID = Convert.ToInt32(reader["BusinessID"]);
                            campaign.CStatusID = Convert.ToInt32(reader["CStatusID"]);
                        }
                    }
                }

                return campaign;
            }
        }
        #endregion

        #region GetAll
        /// <summary>
        /// Gets all records.
        /// </summary>
        public static List<Campaign> GetAll(int pageNo, int pageSize, out int totalRecordsCount, string title, string description, DateTime? startDate, DateTime? endDate)
        {
            String connectionString = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                List<Campaign> list = new List<Campaign>();

                con.Open();

                String sql = @"SELECT	COUNT(*)
								FROM	[Campaign]
								WHERE	(@Title IS NULL OR [Title] LIKE @Title)
								OR		(@Description IS NULL OR [Description] LIKE @Description)
								OR		(@StartDate IS NULL OR [StartDate] = @StartDate)
								OR		(@EndDate IS NULL OR [EndDate] = @EndDate);";

                using (SqlCommand cmd = new SqlCommand(sql, con))
                {
                    cmd.Parameters.Add("@Title", SqlDbType.NVarChar, 50).Value = title == null ? (Object)DBNull.Value : "%" + title + "%";
                    cmd.Parameters.Add("@Description", SqlDbType.NVarChar, -1).Value = description == null ? (Object)DBNull.Value : "%" + description + "%";
                    cmd.Parameters.Add("@StartDate", SqlDbType.DateTime, 8).Value = startDate == null ? (Object)DBNull.Value : startDate;
                    cmd.Parameters.Add("@EndDate", SqlDbType.DateTime, 8).Value = endDate == null ? (Object)DBNull.Value : endDate;

                    totalRecordsCount = Convert.ToInt32(cmd.ExecuteScalar());
                }

                int pagesCount = (int)Math.Ceiling((double)totalRecordsCount / pageSize);
                pageNo = pageNo > pagesCount ? pagesCount : pageNo;
                int fromRecord = pageSize * (pageNo - 1) + 1;
                int toRecord = ((pageNo - 1) * pageSize) + pageSize;

                sql = @"SELECT	TBL.[CampaignID],
								TBL.[Title],
								TBL.[Description],
								TBL.[AddDate],
								TBL.[StartDate],
								TBL.[EndDate],
								TBL.[NumberSubmissions],
								TBL.[BusinessID],
								TBL.[CStatusID]
						FROM (
							SELECT	[CampaignID],
									[Title],
									[Description],
									[AddDate],
									[StartDate],
									[EndDate],
									[NumberSubmissions],
									[BusinessID],
									[CStatusID],
									ROW_NUMBER() OVER(ORDER BY [CampaignID]) AS RowNum
							FROM	[Campaign]
							WHERE	(@Title IS NULL OR [Title] LIKE @Title)
							OR		(@Description IS NULL OR [Description] LIKE @Description)
							OR		(@StartDate IS NULL OR [StartDate] = @StartDate)
							OR		(@EndDate IS NULL OR [EndDate] = @EndDate)) AS TBL
						WHERE TBL.RowNum BETWEEN @FromRecord AND @ToRecord
						ORDER BY RowNum;";

                using (SqlCommand cmd = new SqlCommand(sql, con))
                {
                    cmd.Parameters.Add("@Title", SqlDbType.NVarChar, 50).Value = title == null ? (Object)DBNull.Value : "%" + title + "%";
                    cmd.Parameters.Add("@Description", SqlDbType.NVarChar, -1).Value = description == null ? (Object)DBNull.Value : "%" + description + "%";
                    cmd.Parameters.Add("@StartDate", SqlDbType.DateTime, 8).Value = startDate == null ? (Object)DBNull.Value : startDate;
                    cmd.Parameters.Add("@EndDate", SqlDbType.DateTime, 8).Value = endDate == null ? (Object)DBNull.Value : endDate;
                    cmd.Parameters.Add("@FromRecord", SqlDbType.Int, 4).Value = fromRecord;
                    cmd.Parameters.Add("@ToRecord", SqlDbType.Int, 4).Value = toRecord;

                    using (SqlDataReader reader = cmd.ExecuteReader(CommandBehavior.CloseConnection))
                    {
                        while (reader.Read())
                        {
                            Campaign campaign = new Campaign();
                            campaign.CampaignID = Convert.ToInt32(reader["CampaignID"]);
                            campaign.Title = reader["Title"].ToString();
                            campaign.Description = reader["Description"].ToString();
                            campaign.AddDate = Convert.ToDateTime(reader["AddDate"]);
                            campaign.StartDate = Convert.ToDateTime(reader["StartDate"]);
                            campaign.EndDate = reader["EndDate"] == DBNull.Value ? (DateTime?)null : Convert.ToDateTime(reader["EndDate"]);
                            campaign.NumberSubmissions = Convert.ToInt32(reader["NumberSubmissions"]);
                            campaign.BusinessID = Convert.ToInt32(reader["BusinessID"]);
                            campaign.CStatusID = Convert.ToInt32(reader["CStatusID"]);
                            list.Add(campaign);
                        }
                    }
                }

                return list;
            }
        }
        #endregion


        #region GetAll_BID
        /// <summary>
        /// Gets all records.
        /// </summary>
        public static List<Campaign> GetAll_BID(int businessID)
        {
            String connectionString = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                List<Campaign> list = new List<Campaign>();

                con.Open();

                String sql = @"SELECT [CampaignID],
									  [Title],
									  [Description],
									  [AddDate],
									  [StartDate],
									  [EndDate],
									  [NumberSubmissions],
									  [BusinessID],
									  [CStatusID],
							   FROM	  [Campaign]
							  WHERE	  [BusinessID] = @businessID;";

                using (SqlCommand cmd = new SqlCommand(sql, con))
                {
                    using (SqlDataReader reader = cmd.ExecuteReader(CommandBehavior.CloseConnection))
                    {
                        while (reader.Read())
                        {
                            Campaign campaign = new Campaign();
                            campaign.CampaignID = Convert.ToInt32(reader["CampaignID"]);
                            campaign.Title = reader["Title"].ToString();
                            campaign.Description = reader["Description"].ToString();
                            campaign.AddDate = Convert.ToDateTime(reader["AddDate"]);
                            campaign.StartDate = Convert.ToDateTime(reader["StartDate"]);
                            campaign.EndDate = reader["EndDate"] == DBNull.Value ? (DateTime?)null : Convert.ToDateTime(reader["EndDate"]);
                            campaign.NumberSubmissions = Convert.ToInt32(reader["NumberSubmissions"]);
                            campaign.BusinessID = Convert.ToInt32(reader["BusinessID"]);
                            campaign.CStatusID = Convert.ToInt32(reader["CStatusID"]);
                            list.Add(campaign);
                        }
                    }
                }

                return list;
            }

        }
        #endregion


    }
}

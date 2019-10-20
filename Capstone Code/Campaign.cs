using System;
using System.Collections.Generic;
using System.Linq;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace BusinessLayer
{
    public class Campaign
    {
        #region Properties
        public int CampaignID { get; set; }
        public string Title { get; set; }
        public string Description { get; set; }
        public DateTime AddDate { get; set; }
        public DateTime StartDate { get; set; }
        public DateTime? EndDate { get; set; }
        public int NumberSubmissions { get; set; }
        public int BusinessID { get; set; }
        public int CStatusID { get; set; }
        #endregion

    }
}
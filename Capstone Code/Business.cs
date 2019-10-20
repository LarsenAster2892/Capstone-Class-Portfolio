using System;
using System.Collections.Generic;
using System.Linq;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace BusinessLayer
{
    public class Business
    {
        #region Properties
        public int BusinessID { get; set; }
        public string BusinessName { get; set; }
        public string ContactFirstName { get; set; }
        public string ContactLastName { get; set; }
        public string AddressLIne1 { get; set; }
        public string AddressLine2 { get; set; }
        public string City { get; set; }
        public string State { get; set; }
        public string Zip { get; set; }
        public string Website { get; set; }
        public string ContactTelephone { get; set; }
        public string BusinessTelephone { get; set; }
        public int UserID { get; set; }
        #endregion

    }
}

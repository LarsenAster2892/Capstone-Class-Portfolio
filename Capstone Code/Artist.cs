using System;
using System.Collections.Generic;
using System.Linq;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace BusinessLayer
{
    public class Artist
    {
        #region Properties
        public int ArtistID { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string NickName { get; set; }
        public string Telephone { get; set; }
        public int UserID { get; set; }
        #endregion
    }
}

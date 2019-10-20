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
    public class User
    {
        #region Properties
        public int UserID { get; set; }
        public string EmailAddress { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string NickName { get; set; }
        public int Active { get; set; }
        public DateTime DateAdded { get;  }
        public string Role { get; set; }
        public string Id { get; set; }
        #endregion



    }
}

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using SQLite;

namespace PrintStation_M.Helper
{
    public class Logindb
    {
        [PrimaryKey, AutoIncrement]
        public int ID
        { get; set; }
        
        [Unique]
        public int Username { get; set; }

        public string Password { get; set; }

        public string Usertype { get; set; }

    }
}

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using SQLite;

namespace PrintStation_M.Helper
{
    public class Productdb
    {
        [PrimaryKey, AutoIncrement]
        public int ID
        { get; set; }

        public int RegID { get; set; }

        public string ProductName { get; set; }

        public int ProductPrice { get; set; }

        public int ProductQuantity { get; set; }

        public string Status { get; set; }

        public string Time { get; set; }

        public int TotalCost { get; set; }
    }
}

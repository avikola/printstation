using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using SQLite;

namespace PrintStation_M.Helper
{
    class Studentdb
    {
        [PrimaryKey, AutoIncrement]
        public int ID { get; set; }
        public int SRegNo { get; set; }
        public string StudentName { get; set; }
        public string StudentDept { get; set; }
        public string StudentEmail { get; set; }
        public int StudentMobile { get; set; }
        public int CreditsBal { get; set; }
        public int CreditSpent { get; set; }
    }
}

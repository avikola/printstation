using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using SQLite;

namespace PrintStation_M.Helper
{
    class Facultydb
    {
        [PrimaryKey, AutoIncrement]
        public int ID { get; set; }
        public int FRegNo { get; set; }
        public string FacultyName { get; set; }
        public string FacultyDept { get; set; }
        public string FacultyEmail { get; set; }
        public int FacultyMobile { get; set; }
    }
}

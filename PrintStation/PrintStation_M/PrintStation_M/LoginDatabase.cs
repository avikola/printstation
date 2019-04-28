using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using SQLite;
using PrintStation_M.Helper;
using Xamarin.Forms;

namespace PrintStation_M
{
    public class LoginDatabase
    {
        SQLiteConnection dbConn;

        public LoginDatabase()
        {
            dbConn = DependencyService.Get<ILocalFileHelper>().GetConnection();
            dbConn.CreateTable<Logindb>();
        }

        public int InitialiseLogin(Logindb alogin)
        {
            return dbConn.Insert(alogin);
        }

        public bool Credentials(int username, string password)
        {
            int credrows = dbConn.Table<Logindb>().Where(u => u.Username == username).Where(p => p.Password == password).Count();
            if(credrows == 0)
            {
                return false;
            }
            else
            {
                return true;
            }
        }

        public string getUsertype(int regno)
        {
            var usertyper = dbConn.Table<Logindb>().Where(w => w.Username == regno).Select(s => s.Usertype);
            string thetype = usertyper.ElementAt(2);
            return thetype;
        }

        public List<Logindb> GetUsers()
        {
            return dbConn.Query<Logindb>("Select * From [Logindb]");
        }

        public int DeleteUser(Logindb alogin)
        {
            return dbConn.Delete(alogin);
        }
    }
}

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
    public class ProductDatabase
    {
        SQLiteConnection dbConn;

        public ProductDatabase()
        {
            dbConn = DependencyService.Get<ILocalFileHelper>().GetConnection();
            dbConn.CreateTable<Productdb>();
        }
        
        public List<Productdb> GetSelectedProducts(int regno)
        {
            return dbConn.Query<Productdb>("Select * From [Productdb] where RegID = "+ regno + " and Status='In Cart'");
        }

        public int TotalCost(int regno)
        {
            int sum = dbConn.Table<Productdb>().Where(w => w.RegID == regno).Where(s => s.Status == "In Cart").Sum(x => x.TotalCost);
            return sum;
        }

        public int AddProductToCart(Productdb aproduct)
        {
            return dbConn.Insert(aproduct);
        }

        public int DeleteProduct(Productdb aproduct)
        {
            return dbConn.Delete(aproduct);
        }

        public void ConfirmOrders(int regno)
        {
            dbConn.Query<Productdb>("Update [Productdb] set Status='Pending' where RegID=" + regno + "");
        }
        
    }
}

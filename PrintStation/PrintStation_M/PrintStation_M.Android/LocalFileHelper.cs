using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.IO;
using Xamarin.Forms;
using PrintStation_M.Droid;
using SQLite;

using Android.App;
using Android.Content;
using Android.OS;
using Android.Runtime;
using Android.Views;
using Android.Widget;


[assembly: Dependency(typeof(LocalFileHelper))]
namespace PrintStation_M.Droid
{
    public class LocalFileHelper : ILocalFileHelper
    {
        public LocalFileHelper() { }

        public SQLiteConnection GetConnection()
        {
            var sqliteFilename = "Product.db3";
            string documentsPath = System.Environment.GetFolderPath(System.Environment.SpecialFolder.Personal); // Documents folder
            var path = Path.Combine(documentsPath, sqliteFilename);
            var conn = new SQLiteConnection(path);
            return conn;
        }

    }
}
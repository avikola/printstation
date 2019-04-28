using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

using Xamarin.Forms;

namespace PrintStation_M
{
    public partial class App : Application
    {
        static ProductDatabase database;
        static LoginDatabase database1;

        public App()
        {
            InitializeComponent();
            MainPage = new NavigationPage(new MainPage());
        }

        public static ProductDatabase Database
        {
            get
            {
                if(database == null)
                {
                    database = new ProductDatabase();
                }
                return database;
            }
        }

        public static LoginDatabase LDatabase
        {
            get
            {
                if (database1 == null)
                {
                    database1 = new LoginDatabase();
                }
                return database1;
            }
        }

        protected override void OnStart()
        {
            // Handle when your app starts
        }

        protected override void OnSleep()
        {
            // Handle when your app sleeps
        }

        protected override void OnResume()
        {
            // Handle when your app resumes
        }
    }
}

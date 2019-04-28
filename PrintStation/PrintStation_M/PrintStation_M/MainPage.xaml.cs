using PrintStation_M.Helper;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Xamarin.Forms;

namespace PrintStation_M
{
    public partial class MainPage : ContentPage
    {
        public MainPage()
        {
            NavigationPage.SetHasNavigationBar(this, false);
            InitializeComponent();
            PSLogo.Source = ImageSource.FromResource("PrintStation_M.Resources.MiniLogo.png");


            var login = new Logindb()
            {
                Username = 1322029,
                Password = "1329",
                Usertype = "Student"
            };

            App.LDatabase.InitialiseLogin(login);

            var login1 = new Logindb()
            {
                Username = 1322014,
                Password = "1314",
                Usertype = "Student"
            };

            App.LDatabase.InitialiseLogin(login1);

            var login2 = new Logindb()
            {
                Username = 1322005,
                Password = "1305",
                Usertype = "Student"
            };

            App.LDatabase.InitialiseLogin(login2);

            var login3 = new Logindb()
            {
                Username = 1322010,
                Password = "1310",
                Usertype = "Student"
            };

            App.LDatabase.InitialiseLogin(login3);

            var login4 = new Logindb()
            {
                Username = 5050,
                Password = "5050",
                Usertype = "Faculty"
            };

            App.LDatabase.InitialiseLogin(login4);
        }

        private async void Button_Clicked(object sender, EventArgs e)
        {
            try
            {
                if(login1.Text != null && password1.Text !=null)
                {
                    bool credcheck = App.LDatabase.Credentials(Int32.Parse(login1.Text), password1.Text.ToString());
                    if(credcheck)
                    {
                        if (Int32.Parse(login1.Text) != validation)
                        {
                            Application.Current.Properties.Clear();
                            Application.Current.Properties.Add("Username", login1.Text);
                            await Navigation.PushAsync(new StudentTab1());
                        }
                        else
                            await Navigation.PushAsync(new FacultyTab1());
                    }
                    else
                    {
                        await DisplayAlert("Login Failed", "Incorrect Credentials.", "OK");
                    }
                }
                else
                {
                    await DisplayAlert("Field(s) Empty", "Cannot leave field(s) blank.", "OK");
                }
            }
            catch(FormatException)
            {
                await DisplayAlert("Incorrect Format", "Username must be numbers only.", "OK");
            }
            catch(Exception e1)
            {
                await DisplayAlert("Error", ""+e1+"", "OK");
            }
        }

        protected override bool OnBackButtonPressed()
        {
            Navigation.PopToRootAsync();
            return base.OnBackButtonPressed();
        }

        public int validation = 5050;

    }
}

using PrintStation_M.Helper;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using Xamarin.Forms;
using Xamarin.Forms.Xaml;

namespace PrintStation_M
{
    [XamlCompilation(XamlCompilationOptions.Compile)]
    public partial class Student : ContentPage
    {
        public int sum;
        int user = Int32.Parse(Application.Current.Properties["Username"] as string);

        public Student()
        {
            NavigationPage.SetHasNavigationBar(this, false);
            InitializeComponent();
            try
            {
                var vList = App.Database.GetSelectedProducts(user);
                ProductListView.ItemsSource = vList;
                sum = App.Database.TotalCost(user);
                totalcostlabel.Text = "Total Cost: " + sum + "";
            }
            catch(Exception e1)
            {
                DisplayAlert("Fail", ""+e1+"", "OK");
            }
        }

        protected override bool OnBackButtonPressed()
        {
            Navigation.PushAsync(new StudentTab1());
            return true;
        }

        private async void Button_Clicked(object sender, EventArgs e)
        {
            if(sum != 0)
            {
                bool accepted = await DisplayAlert("Confirm Order(s)?", "You will receive a notification when your order is ready for collection.", "Yes", "No");
                if(accepted)
                {
                    App.Database.ConfirmOrders(user);
                    await Navigation.PushAsync(new StudentTab1());
                }   
            }
            else
            {
                await DisplayAlert("Empty Cart", "Your Cart is empty!", "OK");
            }
        }

        private async void ProductListView_ItemSelected(object sender, SelectedItemChangedEventArgs e)
        {
            var vSelProd = (Productdb)e.SelectedItem;
            bool accepted = await DisplayAlert("Delete Product", "Proceed with delete?", "Yes", "No");
            if (accepted)
            {
                App.Database.DeleteProduct(vSelProd);
            }
            await Navigation.PushAsync(new Student());
        }
    }
}
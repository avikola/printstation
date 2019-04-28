using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using Xamarin.Forms;
using Xamarin.Forms.Xaml;
using PrintStation_M.Helper;

namespace PrintStation_M
{
    [XamlCompilation(XamlCompilationOptions.Compile)]
    public partial class Faculty : ContentPage
    {
        public int sum;
        public Faculty()
        {
            NavigationPage.SetHasNavigationBar(this, false);
            InitializeComponent();
            try
            {
                var vList = App.Database.GetSelectedProducts(5050);
                ProductListView.ItemsSource = vList;
                sum = App.Database.TotalCost(5050);
            }
            catch (Exception e1)
            {
                DisplayAlert("Fail", "" + e1 + "", "OK");
            }
        }

        private async void Button_Clicked(object sender, EventArgs e)
        {
            if(sum!=0)
            {
                bool accepted = await DisplayAlert("Confirm Order(s)?", "You will receive a notification when your order is ready for collection.", "Yes", "No");
                if (accepted)
                {
                    App.Database.ConfirmOrders(5050);
                    await Navigation.PushAsync(new FacultyTab1());
                }
            }
            else
            {
                await DisplayAlert("Empty Cart", "Your Cart is empty!", "OK");
            }
        }

        protected override bool OnBackButtonPressed()
        {
            Navigation.PushAsync(new FacultyTab1());
            return true;
        }

        private async void ProductListView_ItemSelected(object sender, SelectedItemChangedEventArgs e)
        {
            var vSelProd = (Productdb)e.SelectedItem;
            bool accepted = await DisplayAlert("Delete Product", "Proceed with delete?", "Yes", "No");
            if (accepted)
            {
                App.Database.DeleteProduct(vSelProd);
            }
            await Navigation.PushAsync(new Faculty());
        }
    }
}
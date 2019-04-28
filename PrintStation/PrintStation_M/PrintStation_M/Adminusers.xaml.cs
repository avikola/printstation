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
    public partial class Adminusers : ContentPage
    {
        public Adminusers()
        {
            InitializeComponent();
            try
            {
                var vList = App.LDatabase.GetUsers();
                ProductListView.ItemsSource = vList;
            }
            catch (Exception e1)
            {
                DisplayAlert("Fail", "" + e1 + "", "OK");
            }
        }

        private async void ProductListView_ItemSelected(object sender, SelectedItemChangedEventArgs e)
        {
            var vSelProd = (Logindb)e.SelectedItem;
            bool accepted = await DisplayAlert("Delete Product", "Proceed with delete?", "Yes", "No");
            if (accepted)
            {
                App.LDatabase.DeleteUser(vSelProd);
            }
            await Navigation.PushAsync(new Adminusers());
        }
    }
}
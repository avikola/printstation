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
    public partial class FacultyTab1 : ContentPage
    {
        public FacultyTab1()
        {
            NavigationPage.SetHasNavigationBar(this, false);
            InitializeComponent();
            pen1.Source = ImageSource.FromResource("PrintStation_M.Resources.pen1.jpeg");
            eraser1.Source = ImageSource.FromResource("PrintStation_M.Resources.eraser1.jpeg");
            notebook.Source = ImageSource.FromResource("PrintStation_M.Resources.notebook.jpg");
            pen2.Source = ImageSource.FromResource("PrintStation_M.Resources.pen2.jpeg");
            pencil.Source = ImageSource.FromResource("PrintStation_M.Resources.pencil.jpg");
            sharpener.Source = ImageSource.FromResource("PrintStation_M.Resources.sharpener.jpeg");
            stapler.Source = ImageSource.FromResource("PrintStation_M.Resources.stapler.jpeg");
            tape1.Source = ImageSource.FromResource("PrintStation_M.Resources.tape1.jpg");
            scissors.Source = ImageSource.FromResource("PrintStation_M.Resources.scissors.jpeg");
            postits.Source = ImageSource.FromResource("PrintStation_M.Resources.postits.jpeg");
            paperclips.Source = ImageSource.FromResource("PrintStation_M.Resources.paperclips.jpeg");
            calculator.Source = ImageSource.FromResource("PrintStation_M.Resources.calculator.jpeg");
        }

        private async void SwitchtoCart(object sender, EventArgs e)
        {
            await Navigation.PushAsync(new Faculty());
        }

        protected override bool OnBackButtonPressed()
        {
            Navigation.PushAsync(new MainPage());
            return true;
        }

        private void Blackpenadd(object sender, EventArgs e)
        {
            try
            {
                /* var login1 = new Logindb()
                 {
                     Username = 5050,
                     Password = "5050",
                     Usertype = "Student"
                 };
                 App.LDatabase.InitialiseLogin(login1);*/

                int quantity = (int)bpstepper.Value;
                int price = 10;

                var blackpen = new Productdb()
                {
                    RegID = 5050,
                    ProductName = "Black Pen",
                    ProductPrice = price,
                    ProductQuantity = quantity,
                    Status = "In Cart",
                    Time = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss"),
                    TotalCost = price * quantity
                };

                App.Database.AddProductToCart(blackpen);

                DisplayAlert("Success", "" + quantity + " black pen(s) have been added to cart.", "OK");

                bpstepper.Value = 1;
            }
            catch (Exception e1)
            {
                DisplayAlert("Success", "" + e1 + "", "OK");
            }
        }

        private void Eraseradd(object sender, EventArgs e)
        {
            try
            {
                int quantity = (int)erstepper.Value;
                int price = 10;

                var eraser = new Productdb()
                {
                    RegID = 5050,
                    ProductName = "Eraser",
                    ProductPrice = price,
                    ProductQuantity = quantity,
                    Status = "In Cart",
                    Time = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss"),
                    TotalCost = price * quantity
                };

                App.Database.AddProductToCart(eraser);

                DisplayAlert("Success", "" + quantity + " eraser(s) have been added to cart.", "OK");

                erstepper.Value = 1;
            }
            catch (Exception e1)
            {
                DisplayAlert("Success", "" + e1 + "", "OK");
            }
        }

        private void Notebookadd(object sender, EventArgs e)
        {
            try
            {
                int quantity = (int)nbstepper.Value;
                int price = 100;

                var notebook = new Productdb()
                {
                    RegID = 5050,
                    ProductName = "Notebook",
                    ProductPrice = price,
                    ProductQuantity = quantity,
                    Status = "In Cart",
                    Time = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss"),
                    TotalCost = price * quantity
                };

                App.Database.AddProductToCart(notebook);

                DisplayAlert("Success", "" + quantity + " notebook(s) have been added to cart.", "OK");

                nbstepper.Value = 1;
            }
            catch (Exception e1)
            {
                DisplayAlert("Success", "" + e1 + "", "OK");
            }
        }

        private void Bluepenadd(object sender, EventArgs e)
        {
            try
            {
                int quantity = (int)blpstepper.Value;
                int price = 10;

                var bluepen = new Productdb()
                {
                    RegID = 5050,
                    ProductName = "Blue Pen",
                    ProductPrice = price,
                    ProductQuantity = quantity,
                    Status = "In Cart",
                    Time = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss"),
                    TotalCost = price * quantity
                };

                App.Database.AddProductToCart(bluepen);

                DisplayAlert("Success", "" + quantity + " blue pen(s) have been added to cart.", "OK");

                blpstepper.Value = 1;
            }
            catch (Exception e1)
            {
                DisplayAlert("Success", "" + e1 + "", "OK");
            }

        }

        private void Penciladd(object sender, EventArgs e)
        {
            try
            {
                int quantity = (int)pcstepper.Value;
                int price = 5;

                var pencil = new Productdb()
                {
                    RegID = 5050,
                    ProductName = "Pencil",
                    ProductPrice = price,
                    ProductQuantity = quantity,
                    Status = "In Cart",
                    Time = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss"),
                    TotalCost = price * quantity
                };

                App.Database.AddProductToCart(pencil);

                DisplayAlert("Success", "" + quantity + " pencil(s) have been added to cart.", "OK");

                pcstepper.Value = 1;
            }
            catch (Exception e1)
            {
                DisplayAlert("Success", "" + e1 + "", "OK");
            }
        }

        private void Sharpeneradd(object sender, EventArgs e)
        {
            try
            {
                int quantity = (int)spstepper.Value;
                int price = 30;

                var sharpener = new Productdb()
                {
                    RegID = 5050,
                    ProductName = "Sharpener",
                    ProductPrice = price,
                    ProductQuantity = quantity,
                    Status = "In Cart",
                    Time = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss"),
                    TotalCost = price * quantity
                };

                App.Database.AddProductToCart(sharpener);

                DisplayAlert("Success", "" + quantity + " sharpener(s) have been added to cart.", "OK");

                spstepper.Value = 1;
            }
            catch (Exception e1)
            {
                DisplayAlert("Success", "" + e1 + "", "OK");
            }
        }

        private void Stapleradd(object sender, EventArgs e)
        {
            try
            {
                int quantity = (int)srstepper.Value;
                int price = 90;

                var stapler = new Productdb()
                {
                    RegID = 5050,
                    ProductName = "Stapler",
                    ProductPrice = price,
                    ProductQuantity = quantity,
                    Status = "In Cart",
                    Time = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss"),
                    TotalCost = price * quantity
                };

                App.Database.AddProductToCart(stapler);

                DisplayAlert("Success", "" + quantity + " stapler(s) have been added to cart.", "OK");

                srstepper.Value = 1;
            }
            catch (Exception e1)
            {
                DisplayAlert("Success", "" + e1 + "", "OK");
            }
        }

        private void Tapeadd(object sender, EventArgs e)
        {
            try
            {
                int quantity = (int)tpstepper.Value;
                int price = 50;

                var tape = new Productdb()
                {
                    RegID = 5050,
                    ProductName = "Tape",
                    ProductPrice = price,
                    ProductQuantity = quantity,
                    Status = "In Cart",
                    Time = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss"),
                    TotalCost = price * quantity
                };

                App.Database.AddProductToCart(tape);

                DisplayAlert("Success", "" + quantity + " roll(s) of tape have been added to cart.", "OK");

                tpstepper.Value = 1;
            }
            catch (Exception e1)
            {
                DisplayAlert("Success", "" + e1 + "", "OK");
            }
        }

        private void Scissorsadd(object sender, EventArgs e)
        {
            try
            {
                int quantity = (int)ssstepper.Value;
                int price = 40;

                var scissors = new Productdb()
                {
                    RegID = 5050,
                    ProductName = "Scissors",
                    ProductPrice = price,
                    ProductQuantity = quantity,
                    Status = "In Cart",
                    Time = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss"),
                    TotalCost = price * quantity
                };

                App.Database.AddProductToCart(scissors);

                DisplayAlert("Success", "" + quantity + " pairs(s) of scissors have been added to cart.", "OK");

                ssstepper.Value = 1;
            }
            catch (Exception e1)
            {
                DisplayAlert("Success", "" + e1 + "", "OK");
            }
        }

        private void Postitsadd(object sender, EventArgs e)
        {
            try
            {
                int quantity = (int)ptstepper.Value;
                int price = 50;

                var postits = new Productdb()
                {
                    RegID = 5050,
                    ProductName = "Post-Its",
                    ProductPrice = price,
                    ProductQuantity = quantity,
                    Status = "In Cart",
                    Time = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss"),
                    TotalCost = price * quantity
                };

                App.Database.AddProductToCart(postits);

                DisplayAlert("Success", "" + quantity + " stacks(s) of post-its have been added to cart.", "OK");

                ptstepper.Value = 1;
            }
            catch (Exception e1)
            {
                DisplayAlert("Success", "" + e1 + "", "OK");
            }
        }

        private void Calcadd(object sender, EventArgs e)
        {
            try
            {
                int quantity = (int)ccstepper.Value;
                int price = 150;

                var calculator = new Productdb()
                {
                    RegID = 5050,
                    ProductName = "Calculator",
                    ProductPrice = price,
                    ProductQuantity = quantity,
                    Status = "In Cart",
                    Time = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss"),
                    TotalCost = price * quantity
                };

                App.Database.AddProductToCart(calculator);

                DisplayAlert("Success", "" + quantity + " calculator(s) have been added to cart.", "OK");

                ccstepper.Value = 1;
            }
            catch (Exception e1)
            {
                DisplayAlert("Success", "" + e1 + "", "OK");
            }
        }

        private void Paperclipadd(object sender, EventArgs e)
        {
            try
            {
                int quantity = (int)ppstepper.Value;
                int price = 5;

                var paperclip = new Productdb()
                {
                    RegID = 5050,
                    ProductName = "Paperclip",
                    ProductPrice = price,
                    ProductQuantity = quantity,
                    Status = "In Cart",
                    Time = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss"),
                    TotalCost = price * quantity
                };

                App.Database.AddProductToCart(paperclip);

                DisplayAlert("Success", "" + quantity + " paperclip(s) have been added to cart.", "OK");

                ppstepper.Value = 1;
            }
            catch (Exception e1)
            {
                DisplayAlert("Success", "" + e1 + "", "OK");
            }
        }

    }
}
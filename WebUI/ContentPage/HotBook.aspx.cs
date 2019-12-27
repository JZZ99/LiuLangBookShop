using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using LiuLangBookShop.InterService;
using LiuLangBookShop.Entity;
using System.Text;
namespace LiuLangBookShop.WebUI.ContentPage
{
    public partial class HotBook : System.Web.UI.Page
    {
        public string BestSaleBook { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {

            BookDao bookDao = new BookDao();
            List<BookInfo> list = bookDao.GetBestSale();
            if (list != null)
            {
                StringBuilder stringBuilder = new StringBuilder();
                foreach (BookInfo book in list)
                {
                    stringBuilder.AppendFormat("<div class='book'><a href = './BookDetail.aspx?id={0}' ><img src = '{1}' /><h4 class='title' alt='{2}'>{2}</h4><small class='text-info' alt='{3}'>{3} </small><p class='text-danger'>￥{4}</p></a></div>", book.Id, book.Image, book.Name, book.Author, book.Price);
                }
                BestSaleBook = stringBuilder.ToString();
            }

        }
    
    }
}
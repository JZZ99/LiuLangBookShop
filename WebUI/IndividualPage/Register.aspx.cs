using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using LiuLangBookShop.InterService;
using LiuLangBookShop.Entity;
namespace LiuLangBookShop.WebUI.IndividualPage
{
    public partial class Register : System.Web.UI.Page
    {
        private RegisterDao accountRegister;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            accountRegister = new RegisterDao();
            // 如果用户已经存在
            if (accountRegister.IsAccountExist(TextUsername.Text.Trim()))
            {
                ErrorInfo.Text = "该用户名已经被使用，请更换一个！";
                return;
            }
            // 模型赋值
            Account account = new Account();
            account.Username = TextUsername.Text.Trim();
            account.Password = TextPassword.Text.Trim();
            account.Mail = TextEmail.Text.Trim();
            account.Question = TextQuestion.Text.Trim();
            account.Answer = TextAnswer.Text.Trim();
            // 注册成功
            if (accountRegister.InsertAccount(account))
            {
                Session["account"] = account;
                ErrorInfo.Style.Add("color", "green");
                ErrorInfo.Text = "注册成功，3秒后自动跳转...";
                Response.Write("<meta   http-equiv='refresh'   content='3;URL=../ContentPage/Main.aspx'>");
            }
            // 注册失败
            else
            {
                ErrorInfo.Text = "注册失败，请稍后重试...";
            }
        }
    }
}
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
    public partial class Login : System.Web.UI.Page
    {
        // 数据库操作类
        private AccountDao _accountDao;
        protected void Page_Load(object sender, EventArgs e)
        {
            InitPage();
        }

        /// <summary>
        /// 初始化
        /// </summary>
        private void InitPage()
        {
            //若登录记录存在，则直接指向主页面
            if (Request.Cookies["accountId"] != null)
            {
                AccountDao accountDao = new AccountDao();
                Session["account"] = accountDao.GetAccountById(Convert.ToInt32(Request.Cookies["accountId"].Value));
                Response.Redirect("../ContentPage/Main.aspx");
                return;
            }
        }

        /// <summary>
        /// 登录按钮点击事件
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            _accountDao = new AccountDao();
            // 如果用户已经存在
            if (!_accountDao.IsAccountExist(TextUsername.Text.Trim()))
            {
                ErrorInfo.Text = "您所输入的用户不存在！";
                return;
            }
            // 验证登录
            Account account = new Account();
            account.Username = TextUsername.Text.Trim();
            account.Password = TextPassword.Text.Trim();
            account = _accountDao.AccountLogin(account);
            // 登录失败
            if (account == null)
            {
                ErrorInfo.Text = "您输入的密码不正确！";
            }
            // 登录成功
            else
            {
                if (CheckBoxRemind.Checked)
                {
                    HttpCookie cookie = new HttpCookie("accountId");
                    cookie.Expires = DateTime.Now.AddDays(7);
                    cookie.Value = account.Id + "";
                    Response.Cookies.Add(cookie);
                }

                Session["account"] = account;
                ErrorInfo.Style.Add("color", "green");
                ErrorInfo.Text = "登录成功，即将进入首页...";
                Response.Write("<meta   http-equiv='refresh'   content='3;URL=../ContentPage/Main.aspx'>");
            }
        }
    }
}
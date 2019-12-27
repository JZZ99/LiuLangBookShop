using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LiuLangBookShop.Entity
{
    public class Account
    {
        public int Id { get; set; }

        public string Password { get; set; }

        public string Question { get; set; }

        public string Answer { get; set; }

        public string Mail { get; set; }

        public string Username { get; set; }

        public DateTime RegistTime { get; set; }
    }
}

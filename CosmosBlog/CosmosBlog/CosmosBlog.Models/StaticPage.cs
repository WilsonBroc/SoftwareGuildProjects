using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.Mvc;

namespace CosmosBlog.Models
{
    public class StaticPage
    {
        public int PageID { get; set; }
        public string PageTitle { get; set; }

        [AllowHtml]
        public string PageContent { get; set; }
        public bool Deleteable { get; set; }
    }
}

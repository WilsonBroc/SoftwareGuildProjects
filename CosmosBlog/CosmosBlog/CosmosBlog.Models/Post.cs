using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web;
using System.Web.Mvc;

namespace CosmosBlog.Models
{
    public class Post
    {
        public int PostID { get; set; }
        public string Title { get; set; }

        [AllowHtml]
        public string PostContent { get; set; }
        public string Tags { get; set; }
        public int UserID { get; set; }
        public string UserName { get; set; }
        public int CategoryID { get; set; }
        public int StatusID { get; set; }
        public string Status { get; set; }
        public DateTime DateCreated { get; set; }
        public DateTime? ExpirationDate { get; set; }
        public string Critique { get; set; }
        public string PostImage { get; set; }
        public string Description { get; set; }
        public string Comments { get; set; }

        public List<Tag> PostTags { get; set; }
        public List<Comment> PostComments { get; set; }
    } 
}

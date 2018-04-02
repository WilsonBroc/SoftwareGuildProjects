using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CosmosBlog.Models
{
    public class Comment
    {
        public int CommentID { get; set; }
        public string CommentContent { get; set; }
        public string CommenterName { get; set; }
        public int PostID { get; set; }
    }
}

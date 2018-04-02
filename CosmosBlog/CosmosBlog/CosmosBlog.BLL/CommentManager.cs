using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using CosmosBlog.Data.Repositories;

namespace CosmosBlog.BLL
{
    public static class CommentManager
    {
        public static string GetComment(int id)
        {
            CommentRepository repo = new CommentRepository();
            return repo.GetComment(id);
        }
    }
}

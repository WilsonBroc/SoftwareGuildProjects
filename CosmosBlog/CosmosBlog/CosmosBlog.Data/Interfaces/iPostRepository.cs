using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using CosmosBlog.Models;

namespace CosmosBlog.Data.Interfaces
{
    public interface iPostRepository
    {
        List<Post> GetAllPosts();
        Post GetOnePost(int id);
        void AddNewPost(Post newPost);
        void DeletePost(Post oldPost);
        void EditPost(Post post);
    }
}

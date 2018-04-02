using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using CosmosBlog.Data.Interfaces;
using CosmosBlog.Data.Repositories;
using CosmosBlog.Models;

namespace CosmosBlog.BLL
{
    public class PostManager
    {
        public PostRepository _postRepo = new PostRepository();

        public List<Post> GetAllPosts()
        {
            return _postRepo.GetAllPosts();
        }

        public Post GetPost(int id)
        {
            return _postRepo.GetOnePost(id);
        }

        public void AddNewPost(Post newPost)

        {
            _postRepo.AddNewPost(newPost);
        }

        public void DeletePost(Post post)
        {
            _postRepo.DeletePost(post);
        }

        public void EditPost(Post post)
        {
            _postRepo.EditPost(post);
        }


        public void ApprovePost(Post post)
        {
            _postRepo.UpdatePostStatus(post);
        }

        public void DisapprovePost(Post post)
        {
            _postRepo.UpdatePostStatus(post);
        }

        public void NeedsRevisionsPost(Post post)
        {
            _postRepo.UpdatePostStatus(post);
        }

        public void SaveComments(Post post, Post p)
        {
            _postRepo.SaveComments(post, p);
        }

        public void SubmitForApprovalPost(Post post)
        {
            _postRepo.UpdatePostStatus(post);
        }
    }
}
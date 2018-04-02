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

    public class CategoryManager
    {
        CategoryRepository _categoryRepo = new CategoryRepository();

        public List<Category> GetAllCategories()
        {
            return _categoryRepo.GetAllCategories();
        }

        public Category GetOneCategory(int id)
        {
            return _categoryRepo.GetOneCategory(id);
        }

        public int NumberOfPostsPerCategory(Category category)
        {
            return _categoryRepo.GetNumberOfPostsByCategory(category);
        }

        public Category GetOneCategory(string categoryName)
        {
            return _categoryRepo.GetOneCategory(categoryName);
        }

        public void AddNewCategory(Category category)
        {
            _categoryRepo.AddNewCategory(category);
        }

        public void EditCategory(Category category)
        {
            _categoryRepo.EditCategory(category);
        }

        public void DeleteCategory(Category category)
        { 
            PostRepository _postRepo = new PostRepository();
            var allPosts = _postRepo.GetAllPosts();
            var newCategoryForPost = _categoryRepo.GetOneCategory("General");
            

            foreach (var post in allPosts)
            {
                if (post.CategoryID == category.CategoryID)
                {
                    post.CategoryID = newCategoryForPost.CategoryID;
                    _postRepo.EditPost(post);
                }
            }
            _categoryRepo.DeleteCategory(category);
        }
    }
}



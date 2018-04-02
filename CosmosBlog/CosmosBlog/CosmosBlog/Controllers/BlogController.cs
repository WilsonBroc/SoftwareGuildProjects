using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.DynamicData;
using System.Web.Mvc;
using CosmosBlog.BLL;
using CosmosBlog.Models;

namespace CosmosBlog.Controllers
{
    public class BlogController : Controller
    {
        private PostManager _postManager = new PostManager();
        private TagManager _tagManager = new TagManager();
        private CategoryManager _categoryManager = new CategoryManager();

        public JsonResult ListAllPosts()
        {
            PostManager manager = new PostManager();
            var result = manager.GetAllPosts().Where(a=>a.StatusID == 2).OrderByDescending(a => a.PostID).ToList();
            return Json(result, JsonRequestBehavior.AllowGet);
        }

        public JsonResult ListAllApprovedPosts()
        {
            PostManager manager = new PostManager();
            var result = manager.GetAllPosts().Where(a=>a.StatusID == 2).OrderByDescending(a => a.PostID).ToList();
            return Json(result, JsonRequestBehavior.AllowGet);
        }


        public JsonResult ListNewestFourPosts()
        {
            PostManager manager = new PostManager();
            var result = manager.GetAllPosts().Where(a => a.StatusID == 2).OrderByDescending(a => a.PostID).Take(4).ToList();
            return Json(result, JsonRequestBehavior.AllowGet);
        }

        public ActionResult ViewIndividualPost(int? id)
        {
            PostManager manager = new PostManager();
            try
            {
                var post = manager.GetAllPosts().FirstOrDefault(a => a.PostID == id);

                if (post == null)
                {
                    return View("Error404");
                }

                if (post.StatusID != 2)
                {
                    return View("Error404");
                }
                return View(post);
            }
            catch
            {
                return View("Error404");
            }
        }

        public ActionResult ViewAllPosts()
        {           
            var viewModel = new PostVM();
            //viewModel.SetCategoryItems(_categoryManager.GetAllCategories());
            viewModel.SetTagItems(_tagManager.GetAllTags());
            viewModel.Categories = _categoryManager.GetAllCategories();
            viewModel.Posts = _postManager.GetAllPosts();

            foreach (var c in viewModel.Categories)
            {
                c.NumberOfPosts = viewModel.Posts.Where(a => a.CategoryID == c.CategoryID).Select(a=>a).Where(a=>a.StatusID == 2).Count();
            }
                 
            //viewModel.NumberOfPosts = _postManager.NumberOfPostsPerCategory(viewModel.Post.CategoryID);
            return View(viewModel);
        }

        //public ActionResult ListCategories()
        //{
        //    var categories = _categoryManager.GetAllCategories();
        //    var posts = _postManager.GetAllPosts();
        //    foreach (var c in categories)
        //    {
        //        c.NumberOfPosts = _categoryManager.NumberOfPostsPerCategory(c);
        //    }

        //    return View("_ViewCategories");
        //}

        public ActionResult GetPostsWithTag(int id)
        {
            PostManager manager = new PostManager();
            var allPosts = manager.GetAllPosts();
            var taggedPosts = new List<Post>();
            foreach (var post in allPosts)
            {
                foreach (var tag in post.PostTags)
                {
                    if (tag.TagID == id)
                    {
                        taggedPosts.Add(post);
                    }
                }
            }
            return View(taggedPosts);

        }

        public ActionResult GetPostsWithCategory(int id)
        {
            
            PostManager manager = new PostManager();
            var allPosts = manager.GetAllPosts();
            var catPosts = new List<Post>();
            foreach (var post in allPosts)
            {

                if (post.CategoryID == id)
                {
                    catPosts.Add(post);
                }
            }

            return View(catPosts);
        }



    }
}


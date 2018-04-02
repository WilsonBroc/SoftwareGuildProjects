using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;
using CosmosBlog.BLL;
using CosmosBlog.Models;

namespace CosmosBlog.Controllers
{
    public class AdminController : Controller
    {

        public CategoryManager _categoryManager = new CategoryManager();
        public PostManager _postManager =  new PostManager();

        TagManager _tagManager = new TagManager();
        StaticPageManager _staticPageManager = new StaticPageManager();
        //PostManager postManager = new PostManager();
        //CategoryManager categoryManager = new CategoryManager();

        [Authorize(Roles = "Manager, Admin")]
        public ActionResult AddNewPost()
        {
            return View(new Post());
        }

        [Authorize(Roles = "Admin, Manager")]
        [HttpPost]
        public ActionResult AddNewPost(Post newPost)
        {
            _postManager.AddNewPost(newPost);
            return View("AddPostSuccess", newPost);
        }

        [Authorize(Roles = "Admin, Manager")]
        [HttpGet]
        public ActionResult EditPosts()
        {
            var posts = _postManager.GetAllPosts();
            return View(posts);
        }

        [Authorize(Roles = "Admin, Manager")]
        [HttpGet]
        public ActionResult DeletePost(int id)
        {
            var posts = _postManager.GetPost(id);
            return View(posts);
        }

        [Authorize(Roles = "Admin, Manager")]
        [HttpPost]
        public ActionResult DeletePost(Post post)
        {
            _postManager.DeletePost(post);
            return RedirectToAction("EditPosts");
        }

        [HttpGet]
        public ActionResult EditPost(int id)
        {
            var post = _postManager.GetPost(id);
            return View(post);
        }

        [HttpPost]
        public ActionResult EditPost(Post post)
        {
            _postManager.EditPost(post);
            return View("EditPostSuccess", post);
        }

        [Authorize(Roles = "Admin, Manager")]
        public ActionResult AddStaticPage()
        {
            return View(new StaticPage());
        }

        [Authorize(Roles = "Admin, Manager")]
        [HttpPost]
        public ActionResult AddStaticPage(StaticPage newPage)
        {
            _staticPageManager.AddNewStaticPage(newPage);
            return View("AddStaticPageSuccess", newPage);
        }

        [Authorize(Roles = "Admin, Manager")]
        public ActionResult EditStaticPage(int id)
        {
            try
            {
                var page = _staticPageManager.GetAllStaticPages().FirstOrDefault(p => p.PageID == id);
                if (page == null)
                {
                    return View("Error404");
                }
                return View(page);
            }
            catch (Exception)
            {
                return View("Error404");
            }
        }

        [Authorize(Roles = "Admin, Manager")]
        [HttpPost]
        public ActionResult EditStaticPage(StaticPage sp)
        {
            var pageToEdit = _staticPageManager.GetOneStaticPage(sp.PageID);
            if (pageToEdit != null)
            {
                _staticPageManager.EditStaticPage(sp);
                return View("EditStaticPageSuccess", sp);
            }
            return View("Error404");
        }

        [Authorize(Roles = "Admin, Manager")]
        public ActionResult DeleteStaticPage(int id)
        {
            try
            {
                var page = _staticPageManager.GetAllStaticPages().FirstOrDefault(p => p.PageID == id);
                if (page != null)
                {
                    if ((page.PageID == 1) || (page.PageID == 2))
                    {
                        page.Deleteable = false;
                    }
                    else
                    {
                        page.Deleteable = true;
                    }

                    if (page.Deleteable == false)
                    {
                        return View("Error404");
                    }
                    return View(page);
                }
                return View("Error404");
            }
            catch
            {
                return View("Error404");
            }
        }

        [Authorize(Roles = "Admin, Manager")]
        [HttpPost]
        public ActionResult DeleteStaticPage(StaticPage page)
        {
            var pageToDelete = _staticPageManager.GetOneStaticPage(page.PageID);
            if (pageToDelete != null)
            {
                _staticPageManager.DeleteStaticPage(page);
                return View("DeletePageSuccess", page);
            }
            return View("Error404");           
        }

        [Authorize(Roles = "Admin, Manager")]
        public ActionResult ManageCategories()
        {
            var model = _categoryManager.GetAllCategories();
            foreach (var category in model)
            {
                category.NumberOfPosts = _categoryManager.NumberOfPostsPerCategory(category);
            }
            return View(model.ToList());
        }

        [Authorize(Roles = "Admin, Manager")]
        [HttpGet]
        public ActionResult AddCategory()
        {
            return View(new Category());
        }

        [Authorize(Roles = "Admin, Manager")]
        [HttpPost]
        public ActionResult AddCategory(Category newCategory)
        {
            _categoryManager.AddNewCategory(newCategory);
            return RedirectToAction("ManageCategories");
        }

        [Authorize(Roles = "Admin, Manager")]
        [HttpGet]
        public ActionResult EditCategory(int? id)
        {
            try
            {
                {
                    var category = _categoryManager.GetAllCategories().FirstOrDefault(c => c.CategoryID == id);
                    if (category == null)
                    {
                        return View("Error");
                    }
                    return View(category);
                }
            }
            catch (Exception)
            {
                return View("Error");
            }
        }

        [Authorize(Roles = "Admin, Manager")]
        [HttpPost]
        public ActionResult EditCategory(Category category)
        {

            var categoryToEdit = _categoryManager.GetOneCategory(category.CategoryID);
            if (categoryToEdit == null || categoryToEdit.CategoryName == "General")
            {
                return View("NonEditableCategory");
            }
            _categoryManager.EditCategory(category);
            return View("ManageCategories");
        }

        [Authorize(Roles = "Admin, Manager")]
        [HttpGet]
        public ActionResult DeleteCategory(int? id)
        {
            try
            {
                {
                    var category = _categoryManager.GetAllCategories().FirstOrDefault(c => c.CategoryID == id);
                    if (category == null)
                    {
                        return View("Error");
                    }
                        return View(category);
                }
            }
            catch (Exception)
            {
                return View("Error");
            }

        }

        [Authorize(Roles = "Admin, Manager")]
        [HttpPost]
        public ActionResult DeleteCategory(Category category)
        {
            var categoryToDelete = _categoryManager.GetOneCategory(category.CategoryID);
                if (categoryToDelete == null || categoryToDelete.CategoryName == "General")
                {
                    return View("NonEditableCategory");
                }            
                _categoryManager.DeleteCategory(category);
                return RedirectToAction("ManageCategories");

        }

        [Authorize(Roles = "Admin, Manager")]
        [HttpGet]
        public ActionResult ManageTags()
        {
           var model = _tagManager.GetAllTags();
           return View(model.ToList());
        }

        [Authorize(Roles = "Admin, Manager")]
        [HttpGet]
        public ActionResult AddTag()
        {
            return View(new Tag());
        }

        [Authorize(Roles = "Admin, Manager")]
        [HttpPost]
        public ActionResult AddTag(Tag tag)
        {
            _tagManager.AddNewTags(tag.TagName);
            return RedirectToAction("ManageTags");
        }

        [Authorize(Roles = "Admin, Manager")]
        [HttpGet]
        public ActionResult EditTag(int id)
        {
            var tag = _tagManager.GetOneTag(id);
            return View(tag);
        }

        [Authorize(Roles = "Admin, Manager")]
        [HttpPost]
        public ActionResult EditTag(Tag tag)
        {
            _tagManager.EditTag(tag);
            return RedirectToAction("ManageTags");
        }

        [Authorize(Roles = "Admin, Manager")]
        [HttpGet]
        public ActionResult DeleteTag(int id)
        {
            var tag = _tagManager.GetOneTag(id);
            return View(tag);
        }

        [Authorize(Roles = "Admin, Manager")]
        [HttpPost]
        public ActionResult DeleteTag(Tag tag)
        {
            _tagManager.DeleteTag(tag);
            return RedirectToAction("ManageTags");
        }

        [Authorize(Roles = "Admin, Manager")]
        public ActionResult AdminPageByStatus(int id)
        {
            PostManager manager = new PostManager();
            var posts = manager.GetAllPosts().Where(a => a.StatusID == id);

            return View(posts);
        }

        public ActionResult ViewPostAsAdmin(int id)
        {
            PostManager manager = new PostManager();
            var post = manager.GetAllPosts().FirstOrDefault(a => a.PostID == id);
            post.Comments = CommentManager.GetComment(id);
            return View(post);
        }

        [HttpPost]
        public ActionResult ViewPostAsAdmin(Post p) // SAVE COMMENTS
        {
            var post = _postManager.GetAllPosts().FirstOrDefault(a => a.PostID == p.PostID);
            _postManager.SaveComments(post, p);
            return View(post);
        }
        
        public ActionResult ApprovePost(int id)
        {
            PostManager manager = new PostManager();
            var post = manager.GetAllPosts().FirstOrDefault(a => a.PostID == id);
            post.StatusID = 2;

            manager.ApprovePost(post);

            return View("PostStatusUpdateSuccess", post);
        }

        
        public ActionResult DisapprovePost(int id)
        {
            PostManager manager = new PostManager();
            var post = manager.GetAllPosts().FirstOrDefault(a => a.PostID == id);
            post.StatusID = 3;

            manager.DisapprovePost(post);

            return View("PostStatusUpdateSuccess", post);
        }

       
        public ActionResult NeedRevisionsPost(int id)
        {
            PostManager manager = new PostManager();
            var post = manager.GetAllPosts().FirstOrDefault(a => a.PostID == id);
            post.StatusID = 5;

            manager.NeedsRevisionsPost(post);

            return View("PostStatusUpdateSuccess", post);
        }

        public ActionResult SubmitForApprovalPost(int id)
        {
            PostManager manager = new PostManager();
            var post = manager.GetAllPosts().FirstOrDefault(a => a.PostID == id);
            post.StatusID = 1;

            manager.SubmitForApprovalPost(post);

            return View("PostStatusUpdateSuccess", post);
        }
    }
}
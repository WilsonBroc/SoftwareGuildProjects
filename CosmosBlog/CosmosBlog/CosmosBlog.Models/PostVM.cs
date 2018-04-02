using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.Mvc;

namespace CosmosBlog.Models
{
    public class PostVM
    {
        public Post Post { get; set; }
        public List<Post>Posts { get; set; }
        public List<Category> Categories { get; set; }
        public List<SelectListItem> TagsList { get; set; }
        public List<SelectListItem> CategoryList { get; set; }
        public int NumberOfPosts { get; set; }
       
        //public List<int> SelectedCourseIds { get; set; }

        public PostVM()
        {
            TagsList = new List<SelectListItem>();
            CategoryList = new List<SelectListItem>();
            Post = new Post();
            Categories = new List<Category>();
            Posts = new List<Post>();
        }

        public void SetCategoryItems(IEnumerable<Category> categories)
        {
            foreach (var category in categories)
            {
                CategoryList.Add(new SelectListItem()
                {
                    Value = category.CategoryID.ToString(),
                    Text = category.CategoryName
                    
                });
            }
        }

        public void SetTagItems(IEnumerable<Tag> tags)
        {
            foreach (var tag in tags)
            {
                TagsList.Add(new SelectListItem()
                {
                    Value = tag.TagID.ToString(),
                    Text = tag.TagName
                });
            }
        }       
    }
}

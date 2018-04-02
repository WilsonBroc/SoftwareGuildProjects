using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using CosmosBlog.BLL;
using CosmosBlog.Models;

namespace CosmosBlog.Controllers
{
    public class CategoryApiController : ApiController
    {
        public HttpResponseMessage Post(Category newCategory)
        {
            var manager = new CategoryManager();
            manager.AddNewCategory(newCategory);
            var response = Request.CreateResponse(HttpStatusCode.Created);
            string uri = Url.Link("DefaultApi", new { id = newCategory.CategoryID });
            response.Headers.Location = new Uri(uri);

            return response;
        }
    }
}

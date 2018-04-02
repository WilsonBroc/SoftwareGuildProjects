using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.WebSockets;
using CosmosBlog.BLL;

namespace CosmosBlog.Controllers
{
    public class StaticPageController : Controller
    {
        // GET: StaticPage
        public JsonResult GetAllStaticPages()
        {
            StaticPageManager manager = new StaticPageManager();
            var results = manager.GetAllStaticPages();
            return Json(results, JsonRequestBehavior.AllowGet);
        }

        public JsonResult GetMoreMenu()
        {
            StaticPageManager manager = new StaticPageManager();
            var results = manager.GetAllStaticPages().Where(a => a.PageID > 2);
            return Json(results, JsonRequestBehavior.AllowGet);
        }


        public ActionResult ViewSingleStaticPage(int id)
        {
            StaticPageManager manager = new StaticPageManager();
            try
            {
                var page = manager.GetAllStaticPages().FirstOrDefault(a => a.PageID == id);
                if (page == null)
                {
                    return View("Error404");
                }
                return View(page);
            }
            catch
            {
                return View("Error404");
            }
        }
    }
}
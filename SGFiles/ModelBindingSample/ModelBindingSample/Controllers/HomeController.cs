using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ModelBindingSample.Models;

namespace ModelBindingSample.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            return View();
        }

        [HttpGet]
        public ActionResult AddPersonForm()
        {
            return View(new Person());
        }

        [HttpPost]
        public ActionResult AddPersonFormResult()
        {
            var model = new Person();
            model.PersonId = int.Parse(Request.Form["PersonId"]);
            model.FirstName = Request.Form["FirstName"];
            model.LastName = Request.Form["LastName"];

            return View("AddPerson", model);
        }

        [HttpGet]
        public ActionResult AddPersonForm2()
        {
            return View(new Person());
        }

        [HttpPost]
        public ActionResult AddPersonForm2(Person person)
        {
            return View("AddPerson", person);
        }

        [HttpGet]
        public ActionResult BindComplexClassTypes()
        {
            return View(new Person() {Address = new Address()});
        }

        [HttpPost]
        public ActionResult BindComplexClassTypes(Person person)
        {
            return View("ComplexResult", person);
        }


        [HttpGet]
        public ActionResult BindMultipleObjects()
        {
            return View();
        }

        [HttpPost]
        public ActionResult BindMultipleObjects(List<Address> addresses)
        {
            return View("MultipleObjects", addresses);
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }
    }
}
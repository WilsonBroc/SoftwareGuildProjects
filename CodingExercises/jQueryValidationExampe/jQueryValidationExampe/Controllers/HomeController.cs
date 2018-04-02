using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using jQueryValidationExampe.Models;

namespace jQueryValidationExampe.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            return View();
        }


        public ActionResult RegistrationForm()
        {
            return View(new RsvpResponse());
        }

        [HttpPost]
        public ActionResult RegistrationForm(RsvpResponse model)
        {
            if (ModelState.IsValid)
            {
                return View("Thanks", model);
            }
            return View(model);
        }
    }
}
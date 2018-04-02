using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ModelValidationSample.Models;

namespace ModelValidationSample.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult MakeBooking()
        {
            return View(new Appointment() {Date = DateTime.Now});
        }

        [HttpPost]
        public ActionResult MakeBooking(Appointment appt)
        {
          
            //if (string.IsNullOrWhiteSpace(appt.ClientName))
            //{
            //    ModelState.AddModelError("ClientName", "Please enter your name");
            //}
            //if (ModelState.IsValidField("Date") && DateTime.Now > appt.Date)
            //{
            //    ModelState.AddModelError("Date", "Please enter a date in the future.");
            //}
            //if (!appt.TermsAccepted)
            //{
            //    ModelState.AddModelError("TermsAccepted", "You must accept the terms of service");
            //}
            //if (ModelState.IsValidField("ClientName") && ModelState.IsValidField("Date"))
            //{
            //    if (appt.ClientName == "Garfield" && appt.Date.DayOfWeek == DayOfWeek.Monday)
            //    {
            //        ModelState.AddModelError("", "Garfield cannot book appointments on Mondays.");
            //    }
            //}

            if (ModelState.IsValid)
            {
                // Save to a database or do something 
                return View("Completed", appt);
            }

            return View(appt);
        }
    }
}
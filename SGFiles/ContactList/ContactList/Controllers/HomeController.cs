using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ContactList.Data;
using ContactList.Models;

namespace ContactList.Controllers
{
    public class HomeController : Controller
    {
        // GET: Home
        public ActionResult Index()
        {
            var repo = new FakeContactRepository();
            var model = repo.GetAll();
            return View(model);
        }

        [HttpGet]
        public ActionResult Edit(int id)
        {
            var repo = new FakeContactRepository();
            var contact = repo.GetById(id);
            return View(contact);
        }

        [HttpGet]
        public ActionResult Add()
        {
            return View();
        }

        [HttpPost]
        public ActionResult AddContact(Contact contact)
        {
            var repo = new FakeContactRepository();
            repo.Add(contact);

            return RedirectToAction("Index");
        }

        //[HttpPost]
        //public ActionResult AddContact()
        //{
        //    var contact = new Contact();
        //    contact.Name = Request.Form["Name"];
        //    contact.PhoneNumber = Request.Form["Phone"];
             
        //    var repo = new FakeContactRepository();
        //    repo.Add(contact);

        //    return RedirectToAction("Index");
        //}
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ViewOrganizationSample.Models;

namespace ViewOrganizationSample.Controllers
{
    public class HomeController : Controller
    {
        // GET: Home
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult About()
        {
            return View();
        }

        public ActionResult Roster()
        {
            var players = new List<Player>()
            {
                new Player() {Number = 23, Position = "Small Forward", Name = "LeBron James"},
                new Player() {Number = 0, Position = "Center", Name="Kevin Love"},
                new Player() {Number = 2, Position = "Point Guard", Name ="Kyrie Irving"}
            };

            return View(players);
        }
    }
}
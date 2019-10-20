using TestWebApplication.CustomFilters;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace TestWebApplication.Controllers
{
    public class AmateurArtistController : Controller
    {
        // GET: AmateurArtist
        [AuthLog(Roles = "Amateur Artist")]
        public ActionResult Index()
        {
            return View();
        }
    }
}
using TestWebApplication.CustomFilters;
using System.Configuration;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace TestWebApplication.Controllers
{
    [Authorize(Roles = "Admin")]
    public class AdminController : Controller
    {
        // GET: Admin
        [AuthLog(Roles = "Admin")]
        public ActionResult Index()
        {
            return View();
        }
    }
}
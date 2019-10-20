using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;
using BusinessLayer;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using TestWebApplication.Models;

namespace TestWebApplication.Controllers
{
    public class HomeController : Controller
    {
        private UserStore<ApplicationUser> userStore;
        private UserManager<ApplicationUser> userManager;
        private RoleStore<IdentityRole> roleStore;
        private RoleManager<IdentityRole> roleManager;

        public HomeController()
        {
            ApplicationDbContext userscontext = new ApplicationDbContext();
            userStore = new UserStore<ApplicationUser>(userscontext);
            userManager = new UserManager<ApplicationUser>(userStore);

            roleStore = new RoleStore<IdentityRole>(userscontext);
            roleManager = new RoleManager<IdentityRole>(roleStore);
        }
        public ActionResult Index()
        {
            if((User.Identity.Name != null) && (User.Identity.Name.Length > 0))
            { 
                if (userManager.IsInRole(User.Identity.GetUserId(), "Admin"))
                {
                    return RedirectToAction("index","Admin");
                }
                else

                if (userManager.IsInRole(User.Identity.GetUserId(), "Amateur Artist"))
                {
                    return RedirectToAction("index", "AmateurArtist");
                }

                if (userManager.IsInRole(User.Identity.GetUserId(), "Business Owner"))
                {
                    Business newBusiness;
                    BusinessBusinessLayer bbl = new BusinessBusinessLayer();
                    newBusiness = bbl.GetBusinessRecord(User.Identity.GetUserId());
                    TempData["currBusiness"] = newBusiness;
                    return RedirectToAction("index", "BusinessOwner");
                }
            }
            return View(); // Default view
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
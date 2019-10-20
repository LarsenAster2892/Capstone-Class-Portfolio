using TestWebApplication.CustomFilters;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using BusinessLayer;

namespace TestWebApplication.Controllers
{
    public class BusinessOwnerController : Controller
    {
        // GET: BusinessOwner
        [AuthLog(Roles = "Business Owner")]
        public ActionResult Index()
        {
            //CampaignBusinessLayer campaignBusinessLayer = new CampaignBusinessLayer();
            //List<Campaign> campaigns = campaignBusinessLayer.GetAll_BID().Tolist();
            Business newBusiness = TempData["currBusiness"] as Business;
            //BusinessBusinessLayer bbl = new BusinessBusinessLayer();
            //newBusiness = bbl.GetBusinessRecord(User.Identity.GetUserId());
            //TempData["currBusiness"] = newBusiness;

            return View(newBusiness);
        }
    }
}
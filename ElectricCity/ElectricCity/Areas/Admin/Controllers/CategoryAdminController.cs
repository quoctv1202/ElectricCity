using ElectricCity.Dao;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ElectricCity.Areas.Admin.Controllers
{
    public class CategoryAdminController : Controller
    {
        // GET: Admin/CategoryAdmin
        public ActionResult Index()
        {
            return View();
        }
        [ChildActionOnly]
        public ActionResult CategoryLoad()
        {
            var model = new CategoryDao().GetAllCategory();
            return PartialView(model);
        }
    }
}
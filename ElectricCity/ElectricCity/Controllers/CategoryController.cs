using ElectricCity.Dao;
using ElectricCity.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ElectricCity.Controllers
{
    public class CategoryController : Controller
    {
        // GET: Category
        public ActionResult Index()
        {
            CategoryDao catDao = new CategoryDao();
            List<ProductCategory> lst = catDao.GetAllCategory();
            return View(lst);
        }

        [ChildActionOnly]
        public ActionResult CategoryLoad()
        {
            var model = new CategoryDao().GetAllCategory();
            return PartialView(model);
        }
    }
}
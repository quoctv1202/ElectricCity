using ElectricCity.Common;
using ElectricCity.Dao;
using ElectricCity.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using PagedList;
namespace ElectricCity.Areas.Admin.Controllers
{
    public class UserController : BaseController
    {
        // GET: Admin/User
        public ActionResult Index()
        {
            return View("GetAllUserPaging");
        }
        public ActionResult GetAllUser()
        {
            UserDao usDao = new UserDao();
            List<User> lst= usDao.GetAllUser();
            return View(lst);
        }
        public ActionResult GetAllUserPaging(int page=1, int pagesize=5)
        {
            UserDao usDao = new UserDao();
            IPagedList lst = usDao.GetAllUserPaging(page, pagesize);
            return View(lst);
        }
    }
}
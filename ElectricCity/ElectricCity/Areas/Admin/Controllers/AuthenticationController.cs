using ElectricCity.Areas.Admin.Models;
using ElectricCity.Common;
using ElectricCity.Dao;
using ElectricCity.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ElectricCity.Areas.Admin.Controllers
{
    public class AuthenticationController : Controller
    {
        // GET: Admin/Authentication
        public ActionResult Index()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Login(LoginModel model)
        {
            if (ModelState.IsValid) //Nếu đã vượt qua mức valid Form không rỗng
            {
                var usDao = new UserDao();
                var result = usDao.Login(model.UserName, Encryptor.MD5Hash(model.Password));
                if (result == Result.LoginResult.DangNhapThanhCong)
                {
                    var user = usDao.GetUser(model.UserName);
                    var userSession = new UserLogin();
                    userSession.UserName = user.UserName;
                    userSession.UserID = user.ID;
                    Session.Add(CommonConstants.USER_SESSION, userSession);
                    return RedirectToAction("Index", "Home");
                }
                else if (result == Result.LoginResult.MatKhauSai)
                {
                    ModelState.AddModelError("", "Mật khẩu sai!!!");
                }
                else if (result == Result.LoginResult.TaiKhoanBiKhoa)
                {
                    ModelState.AddModelError("", "Tài khoản hiện giờ đang bị khóa! :(");
                }
                else if (result == Result.LoginResult.TaiKhoanKhongTonTai)
                {
                    ModelState.AddModelError("", "Tài khoản không tồn tại!");
                }else if (result == Result.LoginResult.KhongCoQuyen)
                {
                    ModelState.AddModelError("", "Tài khoản Khong co quyen vao Admin! :(");
                }
            }
            return View("Index");
        }
        [HttpGet]
        public ActionResult Create()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Create(User user)
        {
            if (ModelState.IsValid)
            {
                var usDao = new UserDao();
                user.Password = Encryptor.MD5Hash(user.Password);
                Result.InsertResult res = usDao.InsertUser(user);
                if (res == Result.InsertResult.ThemThanhCong)
                {
                    return RedirectToAction("Index", "User");
                }
                if (res == Result.InsertResult.TaiKhoanTonTai)
                {
                    ModelState.AddModelError("", "Username đã tồn tại!");
                }
            }
            return View("Create");
        }
    }
}
using ElectricCity.Common;
using ElectricCity.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using PagedList;

namespace ElectricCity.Dao
{
    public class UserDao
    {
        ElectricCityOnlineDBContext db = null;
        public UserDao()
        {
            db = new ElectricCityOnlineDBContext();
        }
        public Result.InsertResult InsertUser(User u)
        {
            var res = db.Users.SingleOrDefault(x => x.UserName == u.UserName);
            if (res == null)
            {
                u.Status = true;
                u.Permission = 3;
                db.Users.Add(u);
                db.SaveChanges();
                return Result.InsertResult.ThemThanhCong;
            }
            else {
                return Result.InsertResult.TaiKhoanTonTai;
            }
        }
        public Result.LoginResult Login(string userName, string password)
        {
            var result = db.Users.SingleOrDefault(x => x.UserName == userName );
            int count = db.Users.Where(x => x.UserName == userName && x.Permission == 3).Count();
            if (result == null)
            {
                return Result.LoginResult.TaiKhoanKhongTonTai;
            }
            else
            {
                if (result.Status==false)
                {
                    return Result.LoginResult.TaiKhoanBiKhoa;
                }
                else
                {
                    if (result.Password == password)
                    {
                        if (count >0)
                        {
                            return Result.LoginResult.KhongCoQuyen;
                        }
                        else
                        {
                            return Result.LoginResult.DangNhapThanhCong;
                        }
                        
                    }
                    else
                    {
                        return Result.LoginResult.MatKhauSai;
                    }
                }
                
            }
        }
        public User GetUser(string username)
        {
            return db.Users.SingleOrDefault(x => x.UserName == username);
        }
        public List<User> GetAllUser()
        {
            List<User> lstUser = db.Users.ToList();
            return lstUser;
        }
        public IPagedList GetAllUserPaging(int? pageTemp, int pageSize )
        {
            int pageNumber = pageTemp ?? 1;
            IPagedList lst = db.Users.ToList().OrderBy(a => a.UserName).ToPagedList(pageNumber, pageSize);
            return lst;
        }
    }
}
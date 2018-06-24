using ElectricCity.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ElectricCity.Dao
{
    public class ProductDao
    {
        ElectricCityOnlineDBContext db = null;
        public ProductDao()
        {
            db = new ElectricCityOnlineDBContext();
        }
        public int InsertUser(Product p)
        {
            var res = db.Products.SingleOrDefault(x => x.Name == p.Name);
            if (res == null)
            {
               
                db.Products.Add(p);
                db.SaveChanges();
                return 1;
            }
            else
            {
                return -1;
            }
        }
    }
}
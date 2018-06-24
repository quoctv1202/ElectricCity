using ElectricCity.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ElectricCity.Dao
{
    public class CategoryDao
    {
        ElectricCityOnlineDBContext db = null;
        public CategoryDao()
        {
            db = new ElectricCityOnlineDBContext();
        }
        public List<ProductCategory> GetAllCategory()
        {
            List<ProductCategory> lst = db.ProductCategories.Where(x=>x.Status==true).ToList();
            return lst;
        }
    }
}
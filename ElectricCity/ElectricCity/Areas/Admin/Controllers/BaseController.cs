using ElectricCity.Common;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;

namespace ElectricCity.Areas.Admin.Controllers
{
    public class BaseController : Controller
    {
        protected override void OnActionExecuted(ActionExecutedContext filterContext)
        {
            var curSession = Session[CommonConstants.USER_SESSION];
            if (curSession == null)
            {
                filterContext.Result = new RedirectToRouteResult(new RouteValueDictionary(new { controller = "Authentication", action = "Index", Area = "Admin" }));
            }
            base.OnActionExecuted(filterContext);
        }
    }
}
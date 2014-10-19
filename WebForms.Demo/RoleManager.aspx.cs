using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using Microsoft.AspNet.Identity.Owin;

namespace WebForms.Demo
{
    public partial class RoleManager : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        [WebMethod]
        public static IEnumerable<string> GetRoles()
        {
            var rm = HttpContext.Current.GetOwinContext().GetUserManager<ApplicationRoleManager>();
            return rm.Roles.Select(r => r.Name);
        }

        [WebMethod]
        public static void AddRole(string name)
        {
            var rm = HttpContext.Current.GetOwinContext().GetUserManager<ApplicationRoleManager>();
            rm.Create(new IdentityRole(name));
        }

        [WebMethod]
        public static void AddMeToRole(string name)
        {
            var um = HttpContext.Current.GetOwinContext().GetUserManager<ApplicationUserManager>();
            um.AddToRole(HttpContext.Current.User.Identity.GetUserId(), name);
        }
    }
}
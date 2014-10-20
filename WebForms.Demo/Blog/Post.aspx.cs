using System;
using System.Collections.Generic;

namespace WebForms.Demo.Blog
{
    public partial class Post : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            PrepareCategories();
        }

        private void PrepareCategories()
        {
            //Check the cache for categories. If they're not there, simulate a DB request to a server running on a 80486 CPU
            var categories = Cache["Blog.Categories"] as IEnumerable<string>;
            if (categories == null)
            {
                categories = LoadCategories();
                Cache["Blog.Categories"] = categories;
            }

            postCategories.DataSource = categories;
            postCategories.DataBind();
        }

        private IEnumerable<string> LoadCategories()
        {
            System.Threading.Thread.Sleep(4000); //simulate a slow DB call
            return new string[] {
                "General",
                "C#",
                "ASP.NET",
                "WPF"
            };
        }

        protected void ClearCache(object sender, EventArgs e)
        {
            Cache.Remove("Blog.Categories");
        }
    }
}
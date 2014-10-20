using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using System.Web.UI;

namespace WebForms.Demo.Blog
{
    public partial class PostAsync : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            RegisterAsyncTask(new PageAsyncTask(PrepareCategories));
        }

        private async Task PrepareCategories()
        {
            //Check the cache for categories. If they're not there, simulate a DB request to a server running on a 80486 CPU
            var categories = Cache["Blog.Categories.Async"] as IEnumerable<string>;
            if (categories == null)
            {
                categories = await LoadCategories();
                Cache["Blog.Categories.Async"] = categories;
            }

            postCategories.DataSource = categories;
            postCategories.DataBind();
        }

        private async Task<IEnumerable<string>> LoadCategories()
        {
            await Task.Delay(4000); //simulate a slow DB call
            return new string[] {
                "General",
                "C#",
                "ASP.NET",
                "WPF"
            };
        }

        protected void ClearCache(object sender, EventArgs e)
        {
            Cache.Remove("Blog.Categories.Async");
        }
    }
}
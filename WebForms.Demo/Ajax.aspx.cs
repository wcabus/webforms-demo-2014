using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebForms.Demo
{
    public partial class Ajax : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lblTime.Text = DateTime.Now.ToLongTimeString();
        }

        [WebMethod]
        public static string GetTime()
        {
            return DateTime.Now.ToLongTimeString();
        }
    }
}
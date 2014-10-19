using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebForms.Demo
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lblTime.Text = DateTime.Now.ToLongTimeString();
        }

        protected void OnUpdateActualTime(object sender, EventArgs e)
        {
            lblActualTime.Text = DateTime.Now.ToLongTimeString();
        }
    }
}
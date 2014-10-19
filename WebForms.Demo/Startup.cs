using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(WebForms.Demo.Startup))]
namespace WebForms.Demo
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}

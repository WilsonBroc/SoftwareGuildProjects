using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(CosmosBlog.Startup))]
namespace CosmosBlog
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}

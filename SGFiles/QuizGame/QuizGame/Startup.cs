using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(QuizGame.Startup))]
namespace QuizGame
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}

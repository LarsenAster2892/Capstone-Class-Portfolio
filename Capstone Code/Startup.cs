using System.Configuration;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using Microsoft.Owin;
using Owin;
using TestWebApplication.Models;
using System.Security.Claims;

[assembly: OwinStartupAttribute(typeof(TestWebApplication.Startup))]

namespace TestWebApplication
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
            createRolesandUsers();
        }

        // In this method we will create default User roles and Admin user for login   
        private void createRolesandUsers()
        {
            ApplicationDbContext context = new ApplicationDbContext();

            var roleManager = new RoleManager<IdentityRole>(new RoleStore<IdentityRole>(context));
            var UserManager = new UserManager<ApplicationUser>(new UserStore<ApplicationUser>(context));


            // In Startup iam creating first Admin Role and creating a default Admin User    
            if (!roleManager.RoleExists(ConfigurationManager.AppSettings["AdminRole"]))
            {

                // first we create Admin rool   
                var role = new Microsoft.AspNet.Identity.EntityFramework.IdentityRole();
                role.Name = ConfigurationManager.AppSettings["AdminRole"];
                roleManager.Create(role);

                //Here we create a Admin super user who will maintain the website                  

                var user = new ApplicationUser();
                user.UserName = ConfigurationManager.AppSettings["AdminDefaultUser"];
                user.Email = ConfigurationManager.AppSettings["AdminDefaultUserEmail"];

                string userPWD = ConfigurationManager.AppSettings["AdminDefaultUserPWD"];

                //var result = await UserManager.CreateAsync(user);

                var chkUser = UserManager.Create(user, userPWD);
                //var chkUser = UserManager.Create(user);

                //Add default User to Role Admin   
                if (chkUser.Succeeded)
                {
                    //var result = UserManager.AddLoginAsync(user.Id, info.Login);

                    var result1 = UserManager.AddToRole(user.Id, "Admin");

                }
            }

            // creating Creating Amateur Artist role    
            if (!roleManager.RoleExists(ConfigurationManager.AppSettings["AmateurArtistRole"]))
            {
                var role = new Microsoft.AspNet.Identity.EntityFramework.IdentityRole();
                role.Name = ConfigurationManager.AppSettings["AmateurArtistRole"];
                roleManager.Create(role);

            }

            // creating Creating Business role    
            if (!roleManager.RoleExists(ConfigurationManager.AppSettings["BusinessOwnerRole"]))
            {
                var role = new Microsoft.AspNet.Identity.EntityFramework.IdentityRole();
                role.Name = ConfigurationManager.AppSettings["BusinessOwnerRole"];
                roleManager.Create(role);

            }
        }


    }
}


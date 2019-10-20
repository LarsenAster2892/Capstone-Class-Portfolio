using System;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using Microsoft.Owin;
using Microsoft.Owin.Security.Cookies;
using Microsoft.Owin.Security.Google;
using Owin;
using System.Security.Claims;
using System.Threading.Tasks;
using System.Web.Configuration;
using Microsoft.Owin.Security;
using TestWebApplication.Models;
//using System.Web.Mvc;
//using System.Web;
//using Google.Apis.Auth.OAuth2;
//using Google.Apis.Auth.OAuth2.Flows;
//using Google.Apis.Auth.OAuth2.Mvc;
//using Google.Apis.Util.Store;
//using Google.Apis.YouTube.v3;
//using System.Collections.Generic;
//using System.Configuration;
//using System.IO;
//using System.Linq;
//using System.Net.Mime;
//using System.Security.AccessControl;



namespace TestWebApplication
{
    public partial class Startup
    {
        // For more information on configuring authentication, please visit https://go.microsoft.com/fwlink/?LinkId=301864
        public void ConfigureAuth(IAppBuilder app)
        {
            // Configure the db context, user manager and signin manager to use a single instance per request
            app.CreatePerOwinContext(ApplicationDbContext.Create);
            app.CreatePerOwinContext<ApplicationUserManager>(ApplicationUserManager.Create);
            app.CreatePerOwinContext<ApplicationSignInManager>(ApplicationSignInManager.Create);

            // Enable the application to use a cookie to store information for the signed in user
            // and to use a cookie to temporarily store information about a user logging in with a third party login provider
            // Configure the sign in cookie
            app.UseCookieAuthentication(new CookieAuthenticationOptions
            {
                AuthenticationType = DefaultAuthenticationTypes.ApplicationCookie,
                LoginPath = new PathString("/Account/Login"),
                Provider = new CookieAuthenticationProvider
                {
                    // Enables the application to validate the security stamp when the user logs in.
                    // This is a security feature which is used when you change a password or add an external login to your account.  
                    OnValidateIdentity =
                        SecurityStampValidator.OnValidateIdentity<ApplicationUserManager, ApplicationUser>(
                            validateInterval: TimeSpan.FromMinutes(30),
                            regenerateIdentity: (manager, user) => user.GenerateUserIdentityAsync(manager))
                }
            });
            app.UseExternalSignInCookie(DefaultAuthenticationTypes.ExternalCookie);

            // Enables the application to temporarily store user information when they are verifying the second factor in the two-factor authentication process.
            app.UseTwoFactorSignInCookie(DefaultAuthenticationTypes.TwoFactorCookie, TimeSpan.FromMinutes(5));

            // Enables the application to remember the second login verification factor such as phone or email.
            // Once you check this option, your second step of verification during the login process will be remembered on the device where you logged in from.
            // This is similar to the RememberMe option when you log in.
            app.UseTwoFactorRememberBrowserCookie(DefaultAuthenticationTypes.TwoFactorRememberBrowserCookie);

            // Uncomment the following lines to enable logging in with third party login providers
            //app.UseMicrosoftAccountAuthentication(
            //    clientId: "",
            //    clientSecret: "");


            //app.UseGoogleAuthentication(new GoogleOAuth2AuthenticationOptions()
            //{
            //    ClientId = "843391687859-mshcmje0sj8k22m7i9f1j0tvl0lk01sa.apps.googleusercontent.com",
            //    ClientSecret = "I8VCHPkLpE_0_Tws39bLk2QQ"

            //});

            var googleOauthOptions = new GoogleOAuth2AuthenticationOptions
            {
                ClientId = "843391687859-mshcmje0sj8k22m7i9f1j0tvl0lk01sa.apps.googleusercontent.com",
                ClientSecret = "I8VCHPkLpE_0_Tws39bLk2QQ",
                SignInAsAuthenticationType = app.GetDefaultSignInAsAuthenticationType(), //26.08
                Provider = new GoogleOAuth2AuthenticationProvider
                {
                    OnAuthenticated = context =>
                    {
                        var accessToken = context.AccessToken;

                        //var serializedUser = context.User;
                        //var name = context.Name;
                        //var gender = serializedUser.Value<string>("gender");

                        //context.Identity.AddClaim(new Claim("urn:tokens:google:email", context.Email));
                        //context.Identity.AddClaim(new Claim("urn:tokens:google:url", context.GivenName));

                        context.Identity.AddClaim(new Claim("urn:google:name", context.Identity.FindFirstValue(ClaimTypes.Name)));
                        context.Identity.AddClaim(new Claim("urn:google:email", context.Identity.FindFirstValue(ClaimTypes.Email)));

                        //This following line is need to retrieve the profile image
                        context.Identity.AddClaim(new System.Security.Claims.Claim("urn:google:accesstoken", context.AccessToken, ClaimValueTypes.String, "Google"));
                        //context.Identity.AddClaim(new Claim("picture", context.User.GetValue("picture").ToString()));
                        //context.Identity.AddClaim(new Claim("profile", context.User.GetValue("profile").ToString()));
                        //var profileUrl = context.User["image"]["url"].ToString();
                        //context.Identity.AddClaim(new Claim(ClaimTypes.Uri, profileUrl));


                        //context.Identity.AddClaim(new Claim("urn:tokens:google:access_token", context.AccessToken));
                        //foreach (var keyVal in context.User)
                        //{
                        //    var claimType = string.Format("urn:google:{0}", keyVal.Key);
                        //    var claimVal = keyVal.Value.ToString();
                        //    if (!context.Identity.HasClaim(claimType, claimVal))
                        //    {
                        //        context.Identity.AddClaim(new Claim(claimType, claimVal,
                        //            XmlSchemaString, "Google"));
                        //    }
                        //}

                        return Task.FromResult(0);
                    }
                }

            };
            googleOauthOptions.Scope.Add("openid");
            googleOauthOptions.Scope.Add("profile");
            googleOauthOptions.Scope.Add("email");
            googleOauthOptions.Scope.Add("https://www.googleapis.com/auth/drive.readonly");
            app.UseGoogleAuthentication(googleOauthOptions);

        }
    }
}
﻿using Google.Apis.Auth.OAuth2;
using Google.Apis.Auth.OAuth2.Mvc;
using Google.Apis.Discovery.v1;
using Google.Apis.Discovery.v1.Data;
using Google.Apis.Drive.v2;
using Google.Apis.Mirror.v1;
using Google.Apis.Mirror.v1.Data;
using Google.Apis.Oauth2.v2;
using Google.Apis.Plus.v1;
using Google.Apis.Services;
using Google.Apis.YouTube.v3;
//using GoogleAPIs.Components;
using GoogleAPIs.ViewModels;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Threading;
using System.Threading.Tasks;
using System.Web;
using System.Web.Mvc;
using Microsoft.AspNetCore.Authentication;
using File = Google.Apis.Drive.v2.Data.File;

namespace GoogleAPIs.Controllers
{
    public class ExamplesController : BaseExamplesController
    {
        public async Task<ActionResult> DiscoveryService()
        {
            // Create the service.
            var service = new DiscoveryService(new BaseClientService.Initializer
            {
                ApplicationName = this.ApplicationName,                
                ApiKey = this.ApiKey,
            });

            // Run the request.            
            var result = await service.Apis.List().ExecuteAsync();            
            return View(result);
        }

        public async Task<ActionResult> YouTubeViewUploads(CancellationToken cancellationToken)
        {
            UserCredential credential;
            string cs = System.Web.HttpContext.Current.Server.MapPath("~/client_secrets_testWebApplication.json");

            using (var stream = new FileStream(cs, FileMode.Open, FileAccess.Read))
            {
                credential = await GoogleWebAuthorizationBroker.AuthorizeAsync(
                    GoogleClientSecrets.Load(stream).Secrets,
                    // This OAuth 2.0 access scope allows an application to upload files to the
                    // authenticated user's YouTube channel, but doesn't allow other types of access.
                    new[] { YouTubeService.Scope.Youtube,
                        YouTubeService.Scope.YoutubeUpload },
                    User.Identity.Name,
                    CancellationToken.None
                );
            }

            //check scope with this URL
            //https://www.googleapis.com/oauth2/v1/tokeninfo?access_token={ACCESS-TOKEN}
            // This bit checks if the token is out of date, 
            // and refreshes the access token using the refresh token.
            //if (credential.Token.IsExpired(SystemClock.Default))
            //{
            //    if (!await credential.RefreshTokenAsync(CancellationToken.None))
            //    {
            //        Console.WriteLine("No valid refresh token.");
            //    }
            //}



            //var result = await new AuthorizationCodeMvcApp(this, new AppFlowMetadata()).AuthorizeAsync(cancellationToken);

            //if (result.Credential != null)
            {
                var youTubeChannels = new List<YouTubeChannel>();

                var service = new YouTubeService(new BaseClientService.Initializer 
                { 
                    HttpClientInitializer =credential,
                    ApplicationName = this.ApplicationName
                });

                // Grab users owned channels
                var channelListRequest = service.Channels.List("snippet,contentDetails");
                channelListRequest.Mine = true;

                var channelListResponse = await channelListRequest.ExecuteAsync();
                
                foreach(var channel in channelListResponse.Items)
                {
                    var youTubeChannel = new YouTubeChannel(channel);

                    // Grab the ID of the Upload List from the channel
                    var uploadListId = channel.ContentDetails.RelatedPlaylists.Uploads;

                    // Fetch the videos belonging to the Upload List - We'll have to use paging here
                    var nextPageToken = string.Empty;
                    while(nextPageToken != null)
                    {
                        var playlistItemsListRequest = service.PlaylistItems.List("snippet");
                        playlistItemsListRequest.PlaylistId = uploadListId;
                        playlistItemsListRequest.MaxResults = 50;
                        playlistItemsListRequest.PageToken = nextPageToken;

                        var playlistItemsResponse = await playlistItemsListRequest.ExecuteAsync();

                        foreach(var playlistItem in playlistItemsResponse.Items)
                        {
                            youTubeChannel.Videos.Add(new YouTubeVideo(playlistItem));
                        }

                        nextPageToken = playlistItemsResponse.NextPageToken;
                    }

                    youTubeChannels.Add(youTubeChannel);
                }

                return View(youTubeChannels);
            }
        //    else
        //    {
        //        return new RedirectResult(result.RedirectUri);
        //    }
        }
        public ActionResult Select(string videoSelected)
        {
            Video tempVideo = new Video();
            tempVideo.YouTubeImport(videoSelected);
  
            return View(tempVideo);
        }

        //public async Task<ActionResult> MirrorTimeline(CancellationToken cancellationToken)
        //{
        //    var result = await new AuthorizationCodeMvcApp(this, new AppFlowMetadata()).AuthorizeAsync(cancellationToken);

        //    if (result.Credential != null)
        //    {
        //        Session["UserCredentials"] = result.Credential;

        //        var mirrorTimeLine = new MirrorTimeline()
        //        {
        //          Location = await this.GetMirrorLocationAsync(result.Credential)
        //        };

        //        return View(mirrorTimeLine);
        //    }
        //    else
        //    {
        //        return new RedirectResult(result.RedirectUri);
        //    }
        //}

        [HttpPost]
        public async Task<ActionResult> MirrorTimeline(MirrorTimeline mirrorTimeline)
        {
            var userCredentials = (Google.Apis.Auth.OAuth2.UserCredential)Session["UserCredentials"];
            
            if(userCredentials != null)
            {
                if (ModelState.IsValid)
                {
                    var mirrorService = new MirrorService(new BaseClientService.Initializer 
                    { 
                        HttpClientInitializer = userCredentials,
                        ApplicationName = this.ApplicationName
                    });

                    var timelineItem = new TimelineItem();
                    
                    timelineItem.Html = string.Format(@"<article class='author'>
                          <img src='http://www.w3walls.com/wp-content/uploads/2013/02/blue-lines-abstract-wallpaper.jpg' width='100%' height='100%'>
                          <div class='overlay-full'/>
                          <header>
                            <img src='http://i.imgur.com/g98DNpD.jpg'/>
                            <h1>@jamesduvall</h1>
                            <h2>Oakdale, California</h2>
                          </header>
                          <section>
                            <p class='text-auto-size'>{0}</p>
                          </section>
                        </article>
                        ", mirrorTimeline.Message);

                    var insertTask = mirrorService.Timeline.Insert(timelineItem).ExecuteAsync();
                    
                    mirrorTimeline = new ViewModels.MirrorTimeline()
                    {
                        Message = string.Empty,
                        Location = await this.GetMirrorLocationAsync(userCredentials)
                    };

                    await insertTask;
                }
            }

            return View(mirrorTimeline);
        }

        //public async Task<ActionResult> JustDrive(CancellationToken cancellationToken)
        //{
        //    var result = await new AuthorizationCodeMvcApp(this, new AppFlowMetadata()).AuthorizeAsync(cancellationToken);

        //    if (result.Credential != null)
        //    {
        //        Session["UserCredentials"] = result.Credential;

        //        var driveService = new DriveService(new BaseClientService.Initializer 
        //        { 
        //            HttpClientInitializer = result.Credential,
        //            ApplicationName = this.ApplicationName
        //        });

        //        About about = driveService.About.Get().Execute();

        //        var rootFolderId = about.RootFolderId;

        //        var request = driveService.Files.List();

        //        var files = new List<File>();

        //        do
        //        {
        //            try
        //            {
        //                var response = request.Execute();

        //                files.AddRange(response.Items.Where(f => f.Parents.Any(p => p.Id == rootFolderId)).ToList());

        //                request.PageToken = response.NextPageToken;
        //            }
        //            catch (Exception e)
        //            {
        //                Console.WriteLine("An error occurred: " + e.Message);
        //                request.PageToken = null;
        //            }
        //        } while (!String.IsNullOrEmpty(request.PageToken));

        //        return View(files);
        //    }
        //    else
        //    {
        //        return new RedirectResult(result.RedirectUri);
        //    }
        //}

        [HttpPost]
        public async Task<ActionResult> UploadFile(HttpPostedFileBase uploadedFile)
        {
            var userCredentials = (Google.Apis.Auth.OAuth2.UserCredential)Session["UserCredentials"];

            if (userCredentials != null)
            {
                var driveService = new DriveService(new BaseClientService.Initializer
                {
                    HttpClientInitializer = userCredentials,
                    ApplicationName = this.ApplicationName
                });

                File file = new File();
                file.Title = uploadedFile.FileName;
                file.MimeType = uploadedFile.ContentType;

                var request = driveService.Files.Insert(file, uploadedFile.InputStream, uploadedFile.ContentType);
                await request.UploadAsync();                
            }

            return RedirectToAction("JustDrive");
        }

        public ActionResult PlusMinus()
        {
            return View();
        }

        [HttpPost]
        public async Task<ActionResult> PlusMinus(string searchString)
        {
            var service = new PlusService(new BaseClientService.Initializer
            {
                ApplicationName = this.ApplicationName,
                ApiKey = this.ApiKey,
            });

            var request = service.Activities.Search(searchString).ExecuteAsync();

            var activityFeed = await request;
            
            return View(activityFeed);
        }
       
        private async Task<Location> GetMirrorLocationAsync(UserCredential userCredentials)
        {
            if(userCredentials == null)
            {
                return null;
            }

            var mirrorService = new MirrorService(new BaseClientService.Initializer
            {
                HttpClientInitializer = userCredentials,
                ApplicationName = this.ApplicationName
            });

            return await mirrorService.Locations.Get("latest").ExecuteAsync();
        }
    }
}
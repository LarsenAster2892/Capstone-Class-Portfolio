using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;
using System.Net;
using System.Web.Helpers;
using System.Web.Script.Serialization;
namespace GoogleAPIs.ViewModels
{
    public class Video
    {
        public const string ytKey = "AIzaSyCCY3BlinG3WvC1wmzHdcwnhMTzh3qdsUM";

        public int Width { get; set; }
        public int Height { get; set; }
        public int Duration { get; set; }
        public string Title { get; set; }
        [Display(Name="ThumbNail")]
        public string ThumbUrl { get; set; }
        public string BigThumbUrl { get; set; }
        public string Description { get; set; }
        public string VideoDuration { get; set; }
        public string Url { get; set; }
        [Display(Name = "Date Uploaded")]
        public DateTime UploadDate { get; set; }

        public Video()
        {
        }

        public bool YouTubeImport(string VideoID)
        {
            try
            {
                WebClient myDownloader = new WebClient();
                myDownloader.Encoding = System.Text.Encoding.UTF8;

                //string jsonResponse = myDownloader.DownloadString("https://www.googleapis.com/youtube/v3/videos?id=" + VideoID + "&key=" + ytKey + "&part=snippet");
                string jsonResponse = myDownloader.DownloadString("https://www.googleapis.com/youtube/v3/videos?part=snippet&id=" + VideoID + "&key=" + ytKey );

                JavaScriptSerializer jss = new JavaScriptSerializer();
                var dynamicObject = Json.Decode(jsonResponse);
                var item = dynamicObject.items[0].snippet;

                Title = item.title;
                ThumbUrl = item.thumbnails.@default.url;
                BigThumbUrl = item.thumbnails.high.url;
                Description = item.description;
                UploadDate = Convert.ToDateTime(item.publishedAt);

                jsonResponse = myDownloader.DownloadString("https://www.googleapis.com/youtube/v3/videos?id=" + VideoID + "&key=" + ytKey + "&part=contentDetails");
                dynamicObject = Json.Decode(jsonResponse);
                string tmp = dynamicObject.items[0].contentDetails.duration;
                Duration = Convert.ToInt32(System.Xml.XmlConvert.ToTimeSpan(tmp).TotalSeconds);

                Url = "http://www.youtube.com/watch?v=" + VideoID;

                return true;
            }
            catch (Exception ex)
            {
                return false;
            }
        }

        public bool VimeoImport(string VideoID)
        {
            try
            {
                WebClient myDownloader = new WebClient();
                myDownloader.Encoding = System.Text.Encoding.UTF8;

                string jsonResponse = myDownloader.DownloadString("http://vimeo.com/api/v2/video/" + VideoID + ".json");
                JavaScriptSerializer jss = new JavaScriptSerializer();
                var dynamicObject = Json.Decode(jsonResponse);
                var item = dynamicObject[0];

                Title = item.title;
                Description = item.description;
                Url = item.url;
                ThumbUrl = item.thumbnail_small;
                BigThumbUrl = item.thumbnail_large;
                UploadDate = Convert.ToDateTime(item.upload_date);
                Width = Convert.ToInt32(item.width);
                Height = Convert.ToInt32(item.height);
                Duration = Convert.ToInt32(item.duration);

                return true;
            }
            catch (Exception ex)
            {
                return false;
            }
        }
    }
}


 

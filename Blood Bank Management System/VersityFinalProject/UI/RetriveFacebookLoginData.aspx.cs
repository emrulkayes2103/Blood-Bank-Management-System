using AppSupport.Project.BLL;
using AppSupport.Tech;
using System;
using System.Configuration;
using System.IO;
using System.Net;
using System.Web.Script.Serialization;

namespace VersityFinalProject.UI
{
    public partial class RetriveFacebookLoginData : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string code = Request.QueryString["code"];
            if (string.IsNullOrEmpty(code))
            {
                Response.Redirect("~/login.aspx");
            }
            else
            {
                GetFacebookUserDetails(code);
                Response.Redirect("~/UI/index.aspx", false);
            }
        }

        protected void GetFacebookUserDetails(string Code)
        {
            Uri targetUri = new Uri("https://graph.facebook.com/oauth/access_token?client_id=" + ConfigurationManager.AppSettings["FacebookAppId"] + "&client_secret=" + ConfigurationManager.AppSettings["FacebookAppSecret"] + "&redirect_uri=http://" + Request.ServerVariables["SERVER_NAME"] + ":" + Request.ServerVariables["SERVER_PORT"] + "/UI/RetriveFacebookLoginData.aspx&code=" + Code);
            HttpWebRequest at = (HttpWebRequest)HttpWebRequest.Create(targetUri);

            System.IO.StreamReader str = new System.IO.StreamReader(at.GetResponse().GetResponseStream());
            string token = str.ReadToEnd().ToString().Replace("access_token=", "");

            // Split the access token and expiration from the single string
            string[] combined = token.Split('&');
            string accessToken = combined[0];

            Session["accessToken"] = accessToken;

            // Exchange the code for an extended access token
            Uri eatTargetUri = new Uri("https://graph.facebook.com/oauth/access_token?grant_type=fb_exchange_token&client_id=" + ConfigurationManager.AppSettings["FacebookAppId"] + "&client_secret=" + ConfigurationManager.AppSettings["FacebookAppSecret"] + "&fb_exchange_token=" + accessToken);
            HttpWebRequest eat = (HttpWebRequest)HttpWebRequest.Create(eatTargetUri);

            StreamReader eatStr = new StreamReader(eat.GetResponse().GetResponseStream());
            string eatToken = eatStr.ReadToEnd().ToString().Replace("access_token=", "");

            // Split the access token and expiration from the single string
            string[] eatWords = eatToken.Split('&');
            string extendedAccessToken = eatWords[0];

            // Request the Facebook user information
            Uri targetUserUri = new Uri("https://graph.facebook.com/me?fields=first_name,last_name,gender,locale,link,picture&access_token=" + accessToken);
            HttpWebRequest user = (HttpWebRequest)HttpWebRequest.Create(targetUserUri);

            // Read the returned JSON object response
            StreamReader userInfo = new StreamReader(user.GetResponse().GetResponseStream());
            string jsonResponse = string.Empty;
            jsonResponse = userInfo.ReadToEnd();

            // Deserialize and convert the JSON object to the Facebook.User object type
            JavaScriptSerializer sr = new JavaScriptSerializer();
            string jsondata = jsonResponse;
            FacebookUserData converted = sr.Deserialize<FacebookUserData>(jsondata);

            string username = string.Concat(converted.first_name, " ", converted.last_name);
            string userId = converted.id;
            string proImage = converted.picture.data.url;
            string Gender = converted.gender;

            AppSupportSessionManager.Add("UserName", username);
            AppSupportSessionManager.Add("UserEmail", "");
            AppSupportSessionManager.Add("UserId", userId);
            AppSupportSessionManager.Add("UserRole", "Facebook User");
            AppSupportSessionManager.Add("ProfileImageName", proImage);
            AppSupportSessionManager.Add("FacebookUserGender", Gender);
        }
    }
}
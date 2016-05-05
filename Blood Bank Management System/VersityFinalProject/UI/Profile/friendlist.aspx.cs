using AppSupport.Project.BLL;
using AppSupport.Tech;
using Facebook;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;

namespace VersityFinalProject.UI.Profile
{
    public partial class friendlist : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string accssToken = AppSupportSessionManager.Get("accsToken").ToString();
                if (string.IsNullOrEmpty(accssToken))
                {
                    Response.Redirect("~/login.aspx");
                }
                else
                {
                    var friendList = GetFriendList(accssToken);
                    frndListGrid.DataSource = friendList;
                    frndListGrid.DataBind();
                }
            }
        }

        protected List<facebookFriendListData> GetFriendList(string accsToken)
        {
            FacebookFriendsModel friends = new FacebookFriendsModel();

            var client = new FacebookClient(accsToken);
            dynamic fbresult = client.Get("me/friends");
            var data = fbresult["data"].ToString();

            return friends.friendsListing = JsonConvert.DeserializeObject<List<facebookFriendListData>>(data);
        }
    }
}
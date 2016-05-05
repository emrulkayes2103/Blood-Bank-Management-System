using System.Collections.Generic;

namespace AppSupport.Project.BLL
{
    public class FacebookUserData
    {
        public string id { get; set; }
        public string first_name { get; set; }
        public string last_name { get; set; }
        public string username { get; set; }
        public string gender { get; set; }
        public Picture picture { get; set; }
    }

    public class Picture
    {
        public PicureData data { get; set; }
    }

    public class PicureData
    {
        public string url { get; set; }
        public bool is_silhouette { get; set; }
    }

    public class FacebookFriendsModel
    {
        public List<facebookFriendListData> friendsListing { get; set; }
    }

    public class facebookFriendListData
    {
        public string id { get; set; }
        public string name { get; set; }
        //public string picture { get; set; }
        //public string proPicUrl { get; set; }
    }
}
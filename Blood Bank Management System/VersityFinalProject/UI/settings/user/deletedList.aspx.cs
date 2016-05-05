using AppSupport.Tech;
using System;

namespace VersityFinalProject.settings.user
{
    public partial class deletedList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (AppSupportSessionManager.Get("UserRole").ToString() == "Super Admin" || AppSupportSessionManager.Get("UserRole").ToString() == "Developer")
            {
            }
            else
            {
                Response.Redirect("~/UI/index.aspx", true);
            }
        }
    }
}
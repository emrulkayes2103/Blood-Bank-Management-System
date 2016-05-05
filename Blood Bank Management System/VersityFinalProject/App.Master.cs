using AppSupport.Tech;
using System;

namespace VersityFinalProject
{
    public partial class App : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                string loginfo = AppSupportSessionManager.Get("LogInfo").ToString();
                string UserName = AppSupportSessionManager.Get("UserName").ToString();
                string Email = AppSupportSessionManager.Get("UserEmail").ToString();
                string UserRole = AppSupportSessionManager.Get("UserRole").ToString();
                string imageName = AppSupportSessionManager.Get("ProfileImageName").ToString();
                if (!string.IsNullOrEmpty(loginfo) && loginfo == "Email")
                {
                    if (string.IsNullOrEmpty(UserName) || string.IsNullOrEmpty(Email) || string.IsNullOrEmpty(UserRole))
                    {
                        Response.Redirect("~/login.aspx");
                    }
                    else
                    {
                        userName.Text = UserName;
                        proFileImage.ImageUrl = "~/profileImage/" + imageName;
                        if (AppSupportSessionManager.Get("UserRole").ToString() == "Super Admin" || AppSupportSessionManager.Get("UserRole").ToString() == "Developer")
                        {
                            //user.Visible = true;
                            //userGroup.Visible = true;
                        }
                    }
                }
                else if (!string.IsNullOrEmpty(loginfo) && loginfo == "Facebook User")
                {
                    if (string.IsNullOrEmpty(UserName) || string.IsNullOrEmpty(UserRole))
                    {
                        Response.Redirect("~/login.aspx");
                    }
                    else
                    {
                        userName.Text = UserName;
                        proFileImage.ImageUrl = imageName;
                        //user.Visible = false;
                        //userGroup.Visible = false;
                    }
                }
                else
                {
                    Response.Redirect("~/login.aspx");
                }
            }
            catch (Exception ex)
            {
                Response.Write(ex);
            }
        }
    }
}
using AppSupport.Tech;
using System;

namespace VersityFinalProject
{
    public partial class logout : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            AppSupportSessionManager.RemoveAll();
            Response.Redirect("~/login.aspx");
        }
    }
}
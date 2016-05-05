using System;

namespace VersityFinalProject.settings.appMenu
{
    public partial class createMenuGroup : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            msgBox.Visible = false;
            if (!IsPostBack)
            {
                Response.Redirect("~/UI/index.aspx");
            }
        }

        protected void createMenugroupBtn_Click(object sender, EventArgs e)
        {
        }
    }
}
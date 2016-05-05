using AppSupport.Project.BLL;
using AppSupport.Tech;
using System;

namespace VersityFinalProject.settings.usergroup
{
    public partial class create : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            msgBox.Visible = false;
            string role = AppSupportSessionManager.Get("UserRole").ToString();
            if (!IsPostBack)
            {
                if (role.Trim() == "Super Admin" || role.Trim() == "Developer")
                {
                }
                else
                {
                    Response.Redirect("~/UI/index.aspx", true);
                }
            }
        }

        protected void createUserGroup_Click(object sender, EventArgs e)
        {
            bool status = false;
            userGroupBLL userGroupBll = new userGroupBLL();
            try
            {
                userGroupBll.UserGroupName = userGroupNameTxtBx.Text.Trim();
                userGroupBll.Description = descriptionTxtBx.Text.Trim();

                status = userGroupBll.createUserGroup();
                if (status)
                {
                    msgBox.Visible = true;
                    msgBoxTitle.Text = "Success !!!";
                    msgBoxDetails.Text = "User Group Created Successfully";
                    msgBox.Attributes.Add("Class", "alert alert-success alert-block fade in");
                    initializeTxtBx();
                }
                else
                {
                    msgBox.Visible = true;
                    msgBoxTitle.Text = "Warning !!!";
                    msgBoxDetails.Text = "User Group Can Not Created";
                    msgBox.Attributes.Add("Class", "alert alert-danger alert-block fade in");
                }
            }
            catch (Exception ex)
            {
                msgBox.Visible = true;
                msgBoxTitle.Text = "Warning !!!";
                msgBoxDetails.Text = ex.Message.ToString();
                msgBox.Attributes.Add("Class", "alert alert-danger alert-block fade in");
            }
        }

        protected void initializeTxtBx()
        {
            userGroupNameTxtBx.Text = "";
            descriptionTxtBx.Text = "";
        }
    }
}
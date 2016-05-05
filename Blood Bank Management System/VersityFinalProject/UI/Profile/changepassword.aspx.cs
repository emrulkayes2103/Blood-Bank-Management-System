using AppSupport.Project.BLL;
using AppSupport.Tech;
using System;

namespace VersityFinalProject.UI.Profile
{
    public partial class changepassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            msgBox.Visible = false;
            if (!IsPostBack)
            {
                if (AppSupportSessionManager.Get("LogInfo").ToString() == "Email" && !string.IsNullOrEmpty(AppSupportSessionManager.Get("LogInfo").ToString()))
                {
                    currentPassTxtBX.Attributes.Add("autocomplete", "off");
                }
                else
                {
                    Response.Redirect("~/UI/Profile/profile.aspx", true);
                }
            }
        }

        protected void UpdatePassBtn_Click(object sender, EventArgs e)
        {
            ChangeUserPassBLL changeUserPassBll = new ChangeUserPassBLL();
            bool status = false;
            try
            {
                string id = AppSupportSessionManager.Get("UserId").ToString();
                string Email = AppSupportSessionManager.Get("UserEmail").ToString();

                changeUserPassBll.newPass = newPassTxtBX.Text;

                if (string.IsNullOrEmpty(id) || string.IsNullOrEmpty(Email))
                {
                    msgBox.Visible = true;
                    msgBoxTitle.Text = "Error !!!!";
                    msgBoxDetails.Text = "Log In again";
                    msgBox.Attributes.Add("Class", "alert alert-danger alert-block fade in");
                }
                else
                {
                    if (newPassTxtBX.Text != retypeNewPass.Text)
                    {
                        msgBox.Visible = true;
                        msgBoxTitle.Text = "Warning !!!!";
                        msgBoxDetails.Text = "New Password and Re-Type Password Do not Match";
                        msgBox.Attributes.Add("Class", "alert alert-danger alert-block fade in");
                    }
                    else
                    {
                        if (chkPreViousPass(currentPassTxtBX.Text))
                        {
                            status = changeUserPassBll.ChangeUserPass(id, Email);
                            if (status)
                            {
                                msgBox.Visible = true;
                                msgBoxTitle.Text = "Success";
                                msgBoxDetails.Text = "Password changed successfully";
                                msgBox.Attributes.Add("Class", "alert alert-success alert-block fade in");
                            }
                            else
                            {
                                msgBox.Visible = true;
                                msgBoxTitle.Text = "Warning !!!!";
                                msgBoxDetails.Text = "Something Goes Wrong";
                                msgBox.Attributes.Add("Class", "alert alert-danger alert-block fade in");
                            }
                        }
                        else
                        {
                            msgBox.Visible = true;
                            msgBoxTitle.Text = "Warning !!!!";
                            msgBoxDetails.Text = "Your Current Password is not Correct";
                            msgBox.Attributes.Add("Class", "alert alert-danger alert-block fade in");
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                msgBox.Visible = true;
                msgBoxTitle.Text = "Error !!!!";
                msgBoxDetails.Text = ex.Message.ToString();
                msgBox.Attributes.Add("Class", "alert alert-danger alert-block fade in");
            }
        }

        protected bool chkPreViousPass(string PrePass)
        {
            bool st = false;
            ChangeUserPassBLL changePassBll = new ChangeUserPassBLL();
            try
            {
                string id = AppSupportSessionManager.Get("UserId").ToString();
                string Email = AppSupportSessionManager.Get("UserEmail").ToString();

                st = changePassBll.checkPreviousPass(PrePass, id, Email);
            }
            catch (Exception ex)
            {
                msgBox.Visible = true;
                msgBoxTitle.Text = "Error !!!!";
                msgBoxDetails.Text = ex.Message.ToString();
                msgBox.Attributes.Add("Class", "alert alert-danger alert-block fade in");
            }
            return st;
        }
    }
}
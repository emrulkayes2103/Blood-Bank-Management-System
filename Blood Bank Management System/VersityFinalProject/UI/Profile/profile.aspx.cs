using AppSupport.Project.BLL;
using AppSupport.Tech;
using System;
using System.Data;

namespace VersityFinalProject.UI.Profile
{
    public partial class profile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            msgBox.Visible = false;
            try
            {
                string userId = AppSupportSessionManager.Get("UserId").ToString();
                nameLabel.Text = AppSupportSessionManager.Get("UserName").ToString();
                emailLabel.Text = AppSupportSessionManager.Get("UserEmail").ToString();
                string loginfo = AppSupportSessionManager.Get("LogInfo").ToString();
                if (loginfo == "Facebook User")
                {
                    getFacebookUserProfileDetails(userId);
                    changePass.Visible = false;
                }
                else if (loginfo == "Email")
                {
                    getuserDetailbyID(userId);
                }
                else
                {
                    Response.Redirect("~/login.aspx");
                }
            }
            catch (Exception ex)
            {
                msgBox.Visible = true;
                msgBoxTitle.Text = "Error !!!";
                msgBoxDetails.Text = ex.Message.ToString();
                msgBox.Attributes.Add("Class", "alert alert-danger alert-block fade in");
            }
        }

        private void getFacebookUserProfileDetails(string Serial)
        {
            try
            {
                userBLL userviewBll = new userBLL();
                DataTable dt = new DataTable();

                dt = userviewBll.getFacebookUserDetailsbyID(Serial);
                if (dt.Rows.Count > 0)
                {
                    profileImage.ImageUrl = AppSupportSessionManager.Get("ProfileImageName").ToString();
                    GenderLabel.Text = dt.Rows[0]["Gender"].ToString().ToUpper();
                    ContactNumberLabel.Text = dt.Rows[0]["ContactNumber"].ToString();
                    FataherNameLabel.Text = "N/A";
                    MothernameLabel.Text = "N/A";
                    NationalityLabel.Text = "N/A";
                    nationalIDLabel.Text = "N/A";
                    permanentAddlabel.Text = dt.Rows[0]["permanentAdd"].ToString();
                    presentAddLabel.Text = dt.Rows[0]["presentAdd"].ToString();
                    userRoleLabel.Text = dt.Rows[0]["userRole"].ToString();
                    isActive.Text = "Yes";
                    BloodGroupLabel.Text = dt.Rows[0]["BloodGroup"].ToString();
                    DOBLabel.Text = dt.Rows[0]["DOB"].ToString();
                }
                else
                {
                    msgBox.Visible = true;
                    msgBoxTitle.Text = "Data !!!";
                    msgBoxDetails.Text = "No data Found";
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

        private void getuserDetailbyID(string Serial)
        {
            try
            {
                userBLL userviewBll = new userBLL();
                DataTable dt = new DataTable();

                dt = userviewBll.getUserDetailsbyID(Serial);
                if (dt.Rows.Count > 0)
                {
                    profileImage.ImageUrl = "~/profileImage/" + dt.Rows[0]["profilePicName"].ToString();

                    GenderLabel.Text = dt.Rows[0]["Gender"].ToString();
                    ContactNumberLabel.Text = "+880" + dt.Rows[0]["ContactNumber"].ToString();
                    FataherNameLabel.Text = dt.Rows[0]["FathersName"].ToString();
                    MothernameLabel.Text = dt.Rows[0]["mothersName"].ToString();
                    NationalityLabel.Text = dt.Rows[0]["Nationality"].ToString();
                    nationalIDLabel.Text = dt.Rows[0]["nationalID"].ToString();
                    permanentAddlabel.Text = dt.Rows[0]["permanentAdd"].ToString();
                    presentAddLabel.Text = dt.Rows[0]["presentAdd"].ToString();
                    userRoleLabel.Text = dt.Rows[0]["userRole"].ToString();
                    BloodGroupLabel.Text = dt.Rows[0]["BloodGroup"].ToString();
                    isActive.Text = dt.Rows[0]["isActive"].ToString();
                    DOBLabel.Text = dt.Rows[0]["DOB"].ToString();
                }
                else
                {
                    msgBox.Visible = true;
                    msgBoxTitle.Text = "Data !!!";
                    msgBoxDetails.Text = "No data Found";
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
    }
}
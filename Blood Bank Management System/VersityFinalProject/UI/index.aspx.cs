using AppSupport.Project.BLL;
using AppSupport.Tech;
using System;
using System.Globalization;
using System.Web.UI;

namespace VersityFinalProject.UI
{
    public partial class index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            msgBox.Visible = false;
            if (!IsPostBack)
            {
                string userRole = (string)AppSupportSessionManager.Get("UserRole");
                if (userRole == "Facebook User")
                {
                    string faceBookId = (string)AppSupportSessionManager.Get("UserId");
                    if (!FacebookUserCheking(faceBookId))
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "FacebookUserModalInfo", "loadModal();", true);
                    }
                    else
                    {
                        FacebookUserModal.Visible = false;
                    }
                }
                else
                {
                    FacebookUserModal.Visible = false;
                }
            }
        }

        protected bool FacebookUserCheking(string facebookId)
        {
            bool status = false;
            try
            {
                userBLL userBll = new userBLL();
                status = userBll.FacebookUserExistingChekin(facebookId);
            }
            catch (Exception ex)
            {
                msgBox.Visible = true;
                msgBoxTitle.Text = "Warning !!!";
                msgBoxDetails.Text = ex.Message.ToString();
                msgBox.Attributes.Add("Class", "alert alert-danger alert-block fade in");
            }
            return status;
        }

        protected void FaceBookUserDataSaveBtn_Click(object sender, EventArgs e)
        {
            try
            {
                bool st = false;
                userBLL userBll = new userBLL();
                userBll.Name = (string)AppSupportSessionManager.Get("UserName");
                userBll.facebookIdForFacebookUser = (string)AppSupportSessionManager.Get("UserId");
                userBll.DOB = DateTime.ParseExact(dobTextBox.Text.Trim(), "dd/MM/yyyy", CultureInfo.InvariantCulture);
                userBll.Gender = (string)AppSupportSessionManager.Get("FacebookUserGender");
                userBll.ContactNumber = string.Concat("+880", contactNumberTxtBx.Text);
                userBll.nationality = "";
                userBll.bloodGroup = bllodGroupDrpDwn.SelectedValue;
                userBll.presentAdd = presentAddressTxtBx.Text;
                userBll.perManentAdd = presentAddressTxtBx.Text;
                userBll.preferedArea = txtPreferedLocation.Text;
                userBll.NationalID = "";
                userBll.profileImage = (string)AppSupportSessionManager.Get("ProfileImageName");
                userBll.FathersName = "";
                userBll.motherName = "";
                userBll.userRole = "Facebook User";

                st = userBll.SaveFacebookUserData();
                if (st)
                {
                    msgBox.Visible = true;
                    msgBoxTitle.Text = "Success";
                    msgBoxDetails.Text = "Your Data Saved Successfully";
                    msgBox.Attributes.Add("Class", "alert alert-success alert-block fade in");
                    initializeTxtBx();
                    FacebookUserModal.Visible = false;
                }
                else
                {
                    FacebookUserModal.Visible = true;
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

        private void initializeTxtBx()
        {
            try
            {
                dobTextBox.Text = "";
                bllodGroupDrpDwn.SelectedIndex = 0;
                nationalityTxtBX.Text = "";
                contactNumberTxtBx.Text = "";
                presentAddressTxtBx.Text = "";
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
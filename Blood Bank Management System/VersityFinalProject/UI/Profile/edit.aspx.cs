using AppSupport.Project.BLL;
using AppSupport.Tech;
using System;
using System.Data;
using System.Globalization;
using System.IO;
using System.Web.UI.WebControls;

namespace VersityFinalProject.UI.Profile
{
    public partial class edit : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            msgBox.Visible = false;
            if (!IsPostBack)
            {
                string logInfo = AppSupportSessionManager.Get("LogInfo").ToString();
                string Serial = AppSupportSessionManager.Get("UserId").ToString();
                if (logInfo == "Email")
                {
                    PanelForFacebookuser.Visible = false;
                    getuserForUpdatebySerial(Serial);
                }
                else if (logInfo == "Facebook User")
                {
                    HiddenFieldForFacebookUserId.Value = Serial;
                    panelForEmailUser.Visible = false;
                    getfaceBookUserDetailsForUpdate(Serial);
                }
                else
                {
                    Response.Redirect("~/login.aspx", true);
                }
            }
        }

        private void getfaceBookUserDetailsForUpdate(string serial)
        {
            try
            {
                DataTable dt = new DataTable();
                userBLL userBll = new userBLL();

                dt = userBll.getFacebookUserDetailsbyID(serial);
                if (dt.Rows.Count > 0)
                {
                    dateTextBxForFBUser.Text = dt.Rows[0]["DOB"].ToString();
                    NationalityTxtBxForFbUser.Text = dt.Rows[0]["Nationality"].ToString();
                    ContactNumberTxtBxForFbUser.Text = dt.Rows[0]["ContactNumber"].ToString();
                    PresentAddressForDbUser.Text = dt.Rows[0]["presentAdd"].ToString();
                    BloodGroupForFaceBookUser.SelectedValue = dt.Rows[0]["BloodGroup"].ToString();
                }
                else
                {
                    msgBox.Visible = true;
                    msgBoxTitle.Text = "Error !!!";
                    msgBoxDetails.Text = "No data Found";
                    msgBox.Attributes.Add("Class", "alert alert-danger alert-block fade in");
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

        private void getuserForUpdatebySerial(string serial)
        {
            DataTable dt = new DataTable();
            userBLL updateUserListBll = new userBLL();
            try
            {
                dt = updateUserListBll.getUserByID(serial);
                if (dt.Rows.Count > 0)
                {
                    NameTextBx.Text = dt.Rows[0]["Name"].ToString();
                    emailtextBX.Text = dt.Rows[0]["Email"].ToString();

                    dobTextBox.Text = dt.Rows[0]["DOB"].ToString();
                    genderDrpDwn.SelectedValue = dt.Rows[0]["Gender"].ToString();
                    contactNumberTxtBx.Text = dt.Rows[0]["ContactNumber"].ToString();
                    nationalityTxtBX.Text = dt.Rows[0]["Nationality"].ToString();
                    bllodGroupDrpDwn.SelectedValue = dt.Rows[0]["BloodGroup"].ToString();
                    permanentAddressTxtBx.Text = dt.Rows[0]["permanentAdd"].ToString();
                    presentAddressTxtBx.Text = dt.Rows[0]["presentAdd"].ToString();
                    nationalIdtxtBx.Text = dt.Rows[0]["nationalID"].ToString();
                    fNameTxtBox.Text = dt.Rows[0]["FathersName"].ToString();
                    mNameTextBX.Text = dt.Rows[0]["mothersName"].ToString();
                }
                else
                {
                    msgBox.Visible = true;
                    msgBoxTitle.Text = "Error !!!";
                    msgBoxDetails.Text = "No data Found";
                    msgBox.Attributes.Add("Class", "alert alert-danger alert-block fade in");
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

        protected void updateBtn_Click(object sender, EventArgs e)
        {
            try
            {
                bool st = false;

                try
                {
                    string serial = AppSupportSessionManager.Get("UserId").ToString();
                    EditProfileBLL EditProfileBll = new EditProfileBLL();
                    EditProfileBll.Name = NameTextBx.Text.Trim();

                    EditProfileBll.DOB = DateTime.ParseExact(dobTextBox.Text.Trim(), "dd/MM/yyyy", CultureInfo.InvariantCulture);
                    EditProfileBll.ContactNumber = contactNumberTxtBx.Text;
                    EditProfileBll.Gender = genderDrpDwn.SelectedValue.ToString();
                    EditProfileBll.bloodGroup = bllodGroupDrpDwn.SelectedValue.ToString();
                    EditProfileBll.nationality = nationalityTxtBX.Text.Trim();
                    EditProfileBll.NationalID = nationalIdtxtBx.Text.Trim();
                    EditProfileBll.perManentAdd = permanentAddressTxtBx.Text.Trim();
                    EditProfileBll.presentAdd = presentAddressTxtBx.Text.Trim();
                    EditProfileBll.FathersName = fNameTxtBox.Text.Trim();
                    EditProfileBll.motherName = mNameTextBX.Text.Trim();
                    //createUserBll.password = passwordTxtBx.Text.Trim();

                    EditProfileBll.profileImage = SaveImage(emailtextBX.Text);

                    st = EditProfileBll.UpdateUser(serial);
                    if (st)
                    {
                        msgBox.Visible = true;
                        msgBoxTitle.Text = "Success";
                        msgBoxDetails.Text = "User Updated Successfully";
                        msgBox.Attributes.Add("Class", "alert alert-success alert-block fade in");

                        Response.Redirect("~/UI/Profile/profile.aspx", true);
                    }
                    else
                    {
                        msgBox.Visible = true;
                        msgBoxTitle.Text = "Error !!!";
                        msgBoxDetails.Text = "User Can not Updated";
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
            catch (Exception ex)
            {
                msgBox.Visible = true;
                msgBoxTitle.Text = "Error !!!";
                msgBoxDetails.Text = ex.Message.ToString();
                msgBox.Attributes.Add("Class", "alert alert-danger alert-block fade in");
            }
        }

        protected string SaveImage(string Email)
        {
            string fileName = "";
            try
            {
                FileUpload filePP;
                filePP = profilePicture;
                string ext = Path.GetExtension(filePP.FileName);
                if (filePP.HasFile)
                {
                    if (ext.ToLower() == ".jpg" || ext.ToLower() == ".png" || ext.ToLower() == "jpeg" || ext.ToLower() == ".gif")
                    {
                        fileName = Email + ext;
                        string directory = Server.MapPath("~/profileImage/");
                        if (!Directory.Exists(directory))
                        {
                            Directory.CreateDirectory(directory);
                            filePP.PostedFile.SaveAs(directory + fileName);
                        }
                        else
                        {
                            filePP.PostedFile.SaveAs(directory + fileName);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                msgBox.Visible = true;
                msgBoxTitle.Text = "Warning !!!";
                msgBoxDetails.Text = ex.InnerException.ToString();
                msgBox.Attributes.Add("Class", "alert alert-danger alert-block fade in");
            }
            return fileName;
        }

        protected void UpdateBtnForFbUser_Click(object sender, EventArgs e)
        {
            try
            {
                bool st = false;
                userBLL userBll = new userBLL();
                if (string.IsNullOrEmpty(dateTextBxForFBUser.Text.Trim()))
                {
                    msgBox.Visible = true;
                    msgBoxTitle.Text = "Warning !!!";
                    msgBoxDetails.Text = "Enter Your Date of Birth";
                    msgBox.Attributes.Add("Class", "alert alert-danger alert-block fade in");
                }
                else if (string.IsNullOrEmpty(NationalityTxtBxForFbUser.Text))
                {
                    msgBox.Visible = true;
                    msgBoxTitle.Text = "Warning !!!";
                    msgBoxDetails.Text = "Enter Your Nationality";
                    msgBox.Attributes.Add("Class", "alert alert-danger alert-block fade in");
                }
                else if (string.IsNullOrEmpty(ContactNumberTxtBxForFbUser.Text))
                {
                    msgBox.Visible = true;
                    msgBoxTitle.Text = "Warning !!!";
                    msgBoxDetails.Text = "Enter Your Contact Number";
                    msgBox.Attributes.Add("Class", "alert alert-danger alert-block fade in");
                }
                else if (string.IsNullOrEmpty(PresentAddressForDbUser.Text))
                {
                    msgBox.Visible = true;
                    msgBoxTitle.Text = "Warning !!!";
                    msgBoxDetails.Text = "Enter Your Present Address";
                    msgBox.Attributes.Add("Class", "alert alert-danger alert-block fade in");
                }
                else if (BloodGroupForFaceBookUser.SelectedIndex == 0)
                {
                    msgBox.Visible = true;
                    msgBoxTitle.Text = "Warning !!!";
                    msgBoxDetails.Text = "Enter Your Blood Group";
                    msgBox.Attributes.Add("Class", "alert alert-danger alert-block fade in");
                }
                else
                {
                    userBll.DOB = DateTime.ParseExact(dateTextBxForFBUser.Text.Trim(), "dd/MM/yyyy", CultureInfo.InvariantCulture);
                    userBll.nationality = NationalityTxtBxForFbUser.Text.Trim();
                    userBll.ContactNumber = ContactNumberTxtBxForFbUser.Text.Trim();
                    userBll.presentAdd = PresentAddressForDbUser.Text.Trim();
                    userBll.bloodGroup = BloodGroupForFaceBookUser.SelectedValue.ToString();

                    st = userBll.UpdateFaceBookUserBySerial(HiddenFieldForFacebookUserId.Value);

                    if (st)
                    {
                        Response.Redirect("~/UI/Profile/profile.aspx", true);
                    }
                    else
                    {
                        msgBox.Visible = true;
                        msgBoxTitle.Text = "Warning !!!";
                        msgBoxDetails.Text = "User Can not be Updated";
                        msgBox.Attributes.Add("Class", "alert alert-danger alert-block fade in");
                    }
                }
            }
            catch (Exception ex)
            {
                msgBox.Visible = true;
                msgBoxTitle.Text = "Warning !!!";
                msgBoxDetails.Text = ex.InnerException.ToString();
                msgBox.Attributes.Add("Class", "alert alert-danger alert-block fade in");
            }
        }
    }
}
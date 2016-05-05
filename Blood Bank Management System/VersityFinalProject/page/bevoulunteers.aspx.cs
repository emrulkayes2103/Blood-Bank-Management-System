using AppSupport.Project.BLL;
using System;
using System.Data;
using System.IO;
using System.Net;
using System.Net.Mail;
using System.Text;
using System.Web;
using System.Web.UI.WebControls;

namespace VersityFinalProject.page
{
    public partial class bevoulunteers : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                msgBox.Visible = false;
            }
            catch (Exception ex)
            {
                msgBox.Visible = true;
                msgBoxTitle.Text = "Error !!!";
                msgBoxDetails.Text = ex.ToString();
                msgBox.Attributes.Add("class", "alert alert-danger alert-block fade in");
            }
        }

        protected void btnRegisterNow_OnClick(object sender, EventArgs e)
        {
            string uniqueId = Guid.NewGuid().ToString();
            try
            {
                if (string.IsNullOrEmpty(firstNameTxtBx.Text))
                {
                    msgBox.Visible = true;
                    msgBoxTitle.Text = "Error !!!";
                    msgBoxDetails.Text = "Enter Your First Name";
                    msgBox.Attributes.Add("class", "alert alert-danger alert-block fade in");
                    return;
                }
                else if (string.IsNullOrEmpty(lastNameTxtBx.Text))
                {
                    msgBox.Visible = true;
                    msgBoxTitle.Text = "Error !!!";
                    msgBoxDetails.Text = "Enter Your Last Name";
                    msgBox.Attributes.Add("class", "alert alert-danger alert-block fade in");
                    return;
                }
                else if (string.IsNullOrEmpty(emailTxtBx.Text))
                {
                    msgBox.Visible = true;
                    msgBoxTitle.Text = "Error !!!";
                    msgBoxDetails.Text = "Enter Your Email address Correctly";
                    msgBox.Attributes.Add("class", "alert alert-danger alert-block fade in");
                    return;
                }
                else if (string.IsNullOrEmpty(dobTxtBx.Text))
                {
                    msgBox.Visible = true;
                    msgBoxTitle.Text = "Error !!!";
                    msgBoxDetails.Text = "Enter Your date of birth";
                    msgBox.Attributes.Add("class", "alert alert-danger alert-block fade in");
                    return;
                }
                else if (bllodGroupDrpDwn.SelectedIndex == 0)
                {
                    msgBox.Visible = true;
                    msgBoxTitle.Text = "Error !!!";
                    msgBoxDetails.Text = "Enter Blood Group";
                    msgBox.Attributes.Add("class", "alert alert-danger alert-block fade in");
                    return;
                }
                else if (string.IsNullOrEmpty(nationalityTxtBx.Text))
                {
                    msgBox.Visible = true;
                    msgBoxTitle.Text = "Error !!!";
                    msgBoxDetails.Text = "Enter Your Nationality";
                    msgBox.Attributes.Add("class", "alert alert-danger alert-block fade in");
                    return;
                }
                else if (string.IsNullOrEmpty(presentAddressTxtBx.Text))
                {
                    msgBox.Visible = true;
                    msgBoxTitle.Text = "Error !!!";
                    msgBoxDetails.Text = "Enter Present Address";
                    msgBox.Attributes.Add("class", "alert alert-danger alert-block fade in");
                    return;
                }
                else if (string.IsNullOrEmpty(preferedAreasTxtBx.Text))
                {
                    msgBox.Visible = true;
                    msgBoxTitle.Text = "Error !!!";
                    msgBoxDetails.Text = "Enter Prefered Area";
                    msgBox.Attributes.Add("class", "alert alert-danger alert-block fade in");
                    return;
                }
                else if (string.IsNullOrEmpty(passwordTxtBx.Text))
                {
                    msgBox.Visible = true;
                    msgBoxTitle.Text = "Error !!!";
                    msgBoxDetails.Text = "Enter Password";
                    msgBox.Attributes.Add("class", "alert alert-danger alert-block fade in");
                    return;
                }
                else if (string.IsNullOrEmpty(reTypePass.Text))
                {
                    msgBox.Visible = true;
                    msgBoxTitle.Text = "Error !!!";
                    msgBoxDetails.Text = "Enter Re-Type Password";
                    msgBox.Attributes.Add("class", "alert alert-danger alert-block fade in");
                    return;
                }
                else if (passwordTxtBx.Text != reTypePass.Text)
                {
                    msgBox.Visible = true;
                    msgBoxTitle.Text = "Error !!!";
                    msgBoxDetails.Text = "Password and Re-Type Password does not match";
                    msgBox.Attributes.Add("class", "alert alert-danger alert-block fade in");
                    return;
                }
                else if (string.IsNullOrEmpty(ContactNumberTxtBx.Text))
                {
                    msgBox.Visible = true;
                    msgBoxTitle.Text = "Error !!!";
                    msgBoxDetails.Text = "Enter your contact Number";
                    msgBox.Attributes.Add("class", "alert alert-danger alert-block fade in");
                    return;
                }
                else
                {
                    if (checkDuplicateEmail(emailTxtBx.Text))
                    {
                        msgBox.Visible = true;
                        msgBoxTitle.Text = "Error !!!";
                        msgBoxDetails.Text = "You are already a memeber";
                        msgBox.Attributes.Add("class", "alert alert-danger alert-block fade in");
                    }
                    else
                    {
                        bool st = false;
                        userBLL userBll = new userBLL();

                        userBll.Name = firstNameTxtBx.Text + " " + lastNameTxtBx.Text;
                        userBll.Email = emailTxtBx.Text;
                        userBll.DOB = Convert.ToDateTime(dobTxtBx.Text);
                        userBll.Gender = genderDrpDwnList.SelectedValue.ToString();
                        userBll.bloodGroup = bllodGroupDrpDwn.SelectedValue.ToString();
                        userBll.nationality = nationalityTxtBx.Text;
                        userBll.presentAdd = presentAddressTxtBx.Text;
                        userBll.ContactNumber = ContactNumberTxtBx.Text;
                        userBll.preferedDivision = preferedLocationDrpDwnList.SelectedValue.ToString();
                        userBll.preferedArea = preferedAreasTxtBx.Text;
                        userBll.password = passwordTxtBx.Text;
                        userBll.userRole = "User";
                        userBll.profileImage = SaveImage(emailTxtBx.Text.Trim());
                        userBll.activationCode = uniqueId;

                        st = userBll.registerUser();
                        if (st)
                        {
                            sendEmailForConfirm(userBll.activationCode, userBll.Email, userBll.Name);
                            msgBox.Visible = true;
                            msgBoxTitle.Text = "Success";
                            msgBoxDetails.Text = "Please Check your email for confirmation.";
                            msgBox.Attributes.Add("class", "alert alert-success alert-block fade in");
                            refreshAll();
                        }
                        else
                        {
                            msgBox.Visible = true;
                            msgBoxTitle.Text = "Error !!!";
                            msgBoxDetails.Text = "Id Can not be created";
                            msgBox.Attributes.Add("class", "alert alert-danger alert-block fade in");
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                msgBox.Visible = true;
                msgBoxTitle.Text = "Error !!!";
                msgBoxDetails.Text = ex.ToString();
                msgBox.Attributes.Add("class", "alert alert-danger alert-block fade in");
            }
        }

        protected void sendEmailForConfirm(string activationCode, string Email, string name)
        {
            try
            {
                string hostName = HttpContext.Current.Request.Url.Host.ToString();
                string port = HttpContext.Current.Request.Url.Port.ToString();

                string mainHost = string.Concat(hostName, ":", port);

                string link = "http://" + mainHost + "/page/externaluseractivation.aspx?ActivationCode=" + activationCode;

                StringBuilder sb = new StringBuilder();
                sb.Append("Hello , " + name + " <br /><br />");
                sb.Append("Thank you for registraring in our web system . This may be usefull for you and your relaltive too. <br/><br/><br/>");
                sb.Append("Please click the following link to activate your account <br /> <br />");
                sb.Append("<a href='" + link + "'>Click here to activate your account</a> <br/><br/>");
                sb.Append("Thanks <br/><br/>");
                sb.Append("Blood Book Developer group");

                using (MailMessage mailMessage = new MailMessage("versityfinalproject@gmail.com", Email))
                {
                    mailMessage.Subject = "Blood Book Account Activation";
                    mailMessage.Body = sb.ToString();
                    mailMessage.IsBodyHtml = true;
                    SmtpClient smtp = new SmtpClient("smtp.gmail.com", 587);
                    smtp.EnableSsl = true;
                    NetworkCredential NetworkCred = new NetworkCredential("versityfinalproject@gmail.com", "password");
                    smtp.UseDefaultCredentials = true;
                    smtp.Credentials = NetworkCred;
                    smtp.Send(mailMessage);
                }
            }
            catch (Exception ex)
            {
                msgBox.Visible = true;
                msgBoxTitle.Text = "Error !!!";
                msgBoxDetails.Text = ex.ToString();
                msgBox.Attributes.Add("class", "alert alert-danger alert-block fade in");
            }
        }

        protected void refreshAll()
        {
            firstNameTxtBx.Text = "";
            lastNameTxtBx.Text = "";
            emailTxtBx.Text = "";
            dobTxtBx.Text = "";
            genderDrpDwnList.SelectedIndex = 0;
            bllodGroupDrpDwn.SelectedIndex = 0;
            nationalityTxtBx.Text = "";
            preferedAreasTxtBx.Text = "";
            ContactNumberTxtBx.Text = "";
            preferedLocationDrpDwnList.SelectedIndex = 0;
            preferedAreasTxtBx.Text = "";
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

        protected bool checkDuplicateEmail(string Email)
        {
            bool st = false;
            DataTable dt = new DataTable();
            userBLL checkUserBll = new userBLL();
            try
            {
                dt = checkUserBll.CheckDuplicateEmail(Email);
                if (dt.Rows.Count > 0)
                {
                    st = true;
                }
            }
            catch (Exception ex)
            {
                msgBox.Visible = true;
                msgBoxTitle.Text = "Warning !!!";
                msgBoxDetails.Text = ex.InnerException.ToString();
                msgBox.Attributes.Add("Class", "alert alert-danger alert-block fade in");
            }
            return st;
        }
    }
}
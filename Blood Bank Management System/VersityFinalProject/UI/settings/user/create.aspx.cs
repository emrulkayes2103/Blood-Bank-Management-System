using AppSupport.Project.BLL;
using AppSupport.Tech;
using System;
using System.Data;
using System.Globalization;
using System.IO;
using System.Web.UI.WebControls;

namespace VersityFinalProject.settings.user
{
    public partial class create : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            msgBox.Visible = false;
            if (!IsPostBack)
            {
                if (AppSupportSessionManager.Get("UserRole").ToString() == "Super Admin" || AppSupportSessionManager.Get("UserRole").ToString() == "Developer")
                {
                    LoadUserGroup();
                }
                else
                {
                    Response.Redirect("~/UI/index.aspx", true);
                }
            }
        }

        protected void LoadUserGroup()
        {
            DataTable dt = new DataTable();
            userBLL userBll = new userBLL();
            try
            {
                dt = userBll.loadUserGroup();
                if (dt.Rows.Count > 0)
                {
                    userRoleDrpDown.DataSource = dt;

                    userRoleDrpDown.DataTextField = "UserGroupName";
                    userRoleDrpDown.DataValueField = "UserGroupId";
                    userRoleDrpDown.DataBind();
                    userRoleDrpDown.Items.Insert(0, "--Select User Group--");
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

        protected void btnSave_Click(object sender, EventArgs e)
        {
            bool st = false;

            try
            {
                userBLL createUserBll = new userBLL();
                createUserBll.Name = NameTextBx.Text.Trim();
                createUserBll.Email = emailtextBX.Text.Trim();
                createUserBll.DOB = DateTime.ParseExact(dobTextBox.Text.Trim(), "dd/MM/yyyy", CultureInfo.InvariantCulture);
                createUserBll.ContactNumber = contactNumberTxtBx.Text;
                createUserBll.Gender = genderDrpDwn.SelectedValue.ToString();
                createUserBll.bloodGroup = bllodGroupDrpDwn.SelectedValue.ToString();
                createUserBll.nationality = nationalityTxtBX.Text.Trim();
                createUserBll.NationalID = nationalIdtxtBx.Text.Trim();
                createUserBll.perManentAdd = permanentAddressTxtBx.Text.Trim();
                createUserBll.presentAdd = presentAddressTxtBx.Text.Trim();
                createUserBll.FathersName = fNameTxtBox.Text.Trim();
                createUserBll.motherName = mNameTextBX.Text.Trim();
                createUserBll.password = passwordTxtBx.Text.Trim();
                createUserBll.userRole = userRoleDrpDown.SelectedValue.ToString();

                if (profilePicture.HasFile)
                {
                    if (checkDuplicateEmail(emailtextBX.Text.Trim()))
                    {
                        msgBox.Visible = true;
                        msgBoxTitle.Text = "Error !!!";
                        msgBoxDetails.Text = "Duplicate Email Address";
                        msgBox.Attributes.Add("Class", "alert alert-danger alert-block fade in");
                    }
                    else
                    {
                        createUserBll.profileImage = SaveImage(emailtextBX.Text);

                        st = createUserBll.SaveUser();
                        if (st)
                        {
                            msgBox.Visible = true;
                            msgBoxTitle.Text = "Success";
                            msgBoxDetails.Text = "User Created Successfully";
                            msgBox.Attributes.Add("Class", "alert alert-success alert-block fade in");
                            initializeTxtBx();
                        }
                        else
                        {
                            msgBox.Visible = true;
                            msgBoxTitle.Text = "Error !!!";
                            msgBoxDetails.Text = "User Can not Created";
                            msgBox.Attributes.Add("Class", "alert alert-danger alert-block fade in");
                        }
                    }
                }
                else
                {
                    msgBox.Visible = true;
                    msgBoxTitle.Text = "Error !!!";
                    msgBoxDetails.Text = "Add Your Profile Picture";
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
            NameTextBx.Text = "";
            fNameTxtBox.Text = "";
            mNameTextBX.Text = "";
            dobTextBox.Text = "";
            emailtextBX.Text = "";
            genderDrpDwn.ClearSelection();
            bllodGroupDrpDwn.ClearSelection();
            presentAddressTxtBx.Text = "";
            permanentAddressTxtBx.Text = "";
            contactNumberTxtBx.Text = "";
            nationalIdtxtBx.Text = "";
            nationalityTxtBX.Text = "";
            userRoleDrpDown.ClearSelection();
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
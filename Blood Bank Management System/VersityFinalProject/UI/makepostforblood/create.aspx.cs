using AppSupport.Project.BLL;
using AppSupport.Tech;
using System;
using System.Globalization;

namespace VersityFinalProject.UI.makepostforblood
{
    public partial class create : System.Web.UI.Page
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
                msgBoxTitle.Text = "Warning !!!";
                msgBoxDetails.Text = ex.Message.ToString();
                msgBox.Attributes.Add("Class", "alert alert-danger alert-block fade in");
            }
        }

        protected void PostBtn_Click(object sender, EventArgs e)
        {
            try
            {
                bool st = false;

                MakePostForBloodBLL makePostForBlood = new MakePostForBloodBLL();

                if (bllodGroupDrpDwn.SelectedIndex == 0)
                {
                    msgBox.Visible = true;
                    msgBoxTitle.Text = "Alert";
                    msgBoxDetails.Text = "Please Enter Blood Group";
                    msgBox.Attributes.Add("Class", "alert alert-danger alert-block fade in");
                    return;
                }
                else if (string.IsNullOrEmpty(lastDateTxtBx.Text))
                {
                    msgBox.Visible = true;
                    msgBoxTitle.Text = "Alert";
                    msgBoxDetails.Text = "Please Enter Last date";
                    msgBox.Attributes.Add("Class", "alert alert-danger alert-block fade in");
                    return;
                }
                else if (string.IsNullOrEmpty(descriptionTxtBx.Text))
                {
                    msgBox.Visible = true;
                    msgBoxTitle.Text = "Alert";
                    msgBoxDetails.Text = "Please Enter Description";
                    msgBox.Attributes.Add("Class", "alert alert-danger alert-block fade in");
                    return;
                }
                else if (string.IsNullOrEmpty(contactNumberTxtBx.Text))
                {
                    msgBox.Visible = true;
                    msgBoxTitle.Text = "Alert";
                    msgBoxDetails.Text = "Please Enter Contact Number";
                    msgBox.Attributes.Add("Class", "alert alert-danger alert-block fade in");
                    return;
                }
                else if (string.IsNullOrEmpty(areaTxtBx.Text))
                {
                    msgBox.Visible = true;
                    msgBoxTitle.Text = "Alert";
                    msgBoxDetails.Text = "Please Enter Area for loacating you";
                    msgBox.Attributes.Add("Class", "alert alert-danger alert-block fade in");
                    return;
                }
                else
                {
                    makePostForBlood.bloodGroup = bllodGroupDrpDwn.SelectedValue.ToString();
                    makePostForBlood.lastDate = DateTime.ParseExact(lastDateTxtBx.Text, "dd/MM/yyyy", CultureInfo.InvariantCulture);
                    makePostForBlood.description = descriptionTxtBx.Text;
                    makePostForBlood.interNalUserId = AppSupportSessionManager.Get("UserId").ToString();
                    makePostForBlood.Name = AppSupportSessionManager.Get("UserName").ToString();
                    makePostForBlood.contactNumber = contactNumberTxtBx.Text;
                    makePostForBlood.Location = areaTxtBx.Text;

                    st = makePostForBlood.savePostForBlood();
                    if (st)
                    {
                        msgBox.Visible = true;
                        msgBoxTitle.Text = "Success";
                        msgBoxDetails.Text = "Your Post is successfully created";
                        msgBox.Attributes.Add("Class", "alert alert-success alert-block fade in");
                        initialize();
                    }
                    else
                    {
                        msgBox.Visible = true;
                        msgBoxTitle.Text = "Error";
                        msgBoxDetails.Text = "Your Post can not becreated";
                        msgBox.Attributes.Add("Class", "alert alert-danger alert-block fade in");
                    }
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

        protected void initialize()
        {
            bllodGroupDrpDwn.SelectedIndex = 0;
            contactNumberTxtBx.Text = "";
            lastDateTxtBx.Text = "";
            descriptionTxtBx.Text = "";
            areaTxtBx.Text = "";
        }
    }
}
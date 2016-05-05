using AppSupport.Project.BLL;
using AppSupport.Tech;
using System;
using System.Data;
using System.Globalization;

namespace VersityFinalProject.UI.makepostforblood
{
    public partial class edit : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!IsPostBack)
                {
                    string postSerial = (string)AppSupportSessionManager.Get("PostSerialNumberForEdit");
                    HiddenFieldForPostSerial.Value = postSerial;
                    AppSupportSessionManager.Remove("PostSerialNumberForEdit");
                    if (string.IsNullOrEmpty(postSerial))
                    {
                        Response.Redirect("/UI/makepostforblood/list.aspx", true);
                    }
                    else
                    {
                        getpostDetailByPostSerial(postSerial);
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

        private void getpostDetailByPostSerial(string postSerial)
        {
            try
            {
                DataTable dt = new DataTable();
                MakePostForBloodBLL makePOstForBlood = new MakePostForBloodBLL();

                dt = makePOstForBlood.getPostDetailsByPostSerial(postSerial);
                if (dt.Rows.Count > 0)
                {
                    bllodGroupDrpDwn.SelectedValue = dt.Rows[0]["BloodGroup"].ToString();
                    contactNumberTxtBx.Text = dt.Rows[0]["ContactNumber"].ToString();
                    areaTxtBx.Text = dt.Rows[0]["Location"].ToString();
                    lastDateTxtBx.Text = dt.Rows[0]["lastDate"].ToString();
                    descriptionTxtBx.Text = dt.Rows[0]["Description"].ToString();
                }
                else
                {
                    msgBox.Visible = true;
                    msgBoxTitle.Text = "Warning !!!";
                    msgBoxDetails.Text = "Data not found";
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

        protected void PostUpdateBtn_Click(object sender, EventArgs e)
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
                    makePostForBlood.contactNumber = contactNumberTxtBx.Text;
                    makePostForBlood.Location = areaTxtBx.Text;

                    st = makePostForBlood.UpdatePostForBloodByPostId(HiddenFieldForPostSerial.Value);
                    if (st)
                    {
                        msgBox.Visible = true;
                        msgBoxTitle.Text = "Success";
                        msgBoxDetails.Text = "Your Post is updated successfully";
                        msgBox.Attributes.Add("Class", "alert alert-success alert-block fade in");

                        Response.Redirect("/UI/makepostforblood/list.aspx", true);
                    }
                    else
                    {
                        msgBox.Visible = true;
                        msgBoxTitle.Text = "Error";
                        msgBoxDetails.Text = "Your Post can not be updated";
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
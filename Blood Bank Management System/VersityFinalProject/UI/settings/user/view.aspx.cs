using AppSupport.Project.BLL;
using AppSupport.Tech;
using System;
using System.Data;

namespace VersityFinalProject.settings.user
{
    public partial class view : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (AppSupportSessionManager.Get("UserRole").ToString() == "Super Admin" || AppSupportSessionManager.Get("UserRole").ToString() == "Developer")
            {
                msgBox.Visible = false;
                if (!IsPostBack)
                {
                    string Serial = AppSupportSessionManager.Get("UserSerialNumberForView").ToString();
                    if (string.IsNullOrEmpty(Serial))
                    {
                        msgBox.Visible = true;
                        msgBoxTitle.Text = "Data !!!";
                        msgBoxDetails.Text = "Exception !!!! No data Found";
                        msgBox.Attributes.Add("Class", "alert alert-danger alert-block fade in");
                    }
                    else
                    {
                        getuserDetailbyID(Serial);
                    }
                }
            }
            else
            {
                Response.Redirect("~/UI/index.aspx", true);
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
                    nameLabel.Text = dt.Rows[0]["Name"].ToString();
                    EmailLabel.Text = dt.Rows[0]["Email"].ToString();

                    GenderLabel.Text = dt.Rows[0]["Gender"].ToString();
                    ContactNumberLabel.Text = "+880" + dt.Rows[0]["ContactNumber"].ToString();
                    FataherNameLabel.Text = dt.Rows[0]["FathersName"].ToString();
                    MothernameLabel.Text = dt.Rows[0]["mothersName"].ToString();
                    NationalityLabel.Text = dt.Rows[0]["Nationality"].ToString();
                    nationalIDLabel.Text = dt.Rows[0]["nationalID"].ToString();
                    permanentAddlabel.Text = dt.Rows[0]["permanentAdd"].ToString();
                    presentAddLabel.Text = dt.Rows[0]["presentAdd"].ToString();
                    userRoleLabel.Text = dt.Rows[0]["userRole"].ToString();
                    isActive.Text = dt.Rows[0]["isActive"].ToString();
                    BloodGroupLabel.Text = dt.Rows[0]["BloodGroup"].ToString();
                    DOBLabel.Text = dt.Rows[0]["DOB"].ToString();
                    if (isActive.Text == "Yes")
                    {
                        isActive.ForeColor = System.Drawing.Color.Green;
                    }
                    else
                    {
                        isActive.ForeColor = System.Drawing.Color.Red;
                    }
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
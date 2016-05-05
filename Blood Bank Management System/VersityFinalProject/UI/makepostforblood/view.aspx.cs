using AppSupport.Project.BLL;
using AppSupport.Tech;
using System;
using System.Data;

namespace VersityFinalProject.UI.makepostforblood
{
    public partial class view : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                msgBox.Visible = false;
                string postId = (string)AppSupportSessionManager.Get("PostSerialNumberForEdit");
                if (!IsPostBack)
                {
                    if (string.IsNullOrEmpty(postId))
                    {
                        Response.Redirect("~/UI/makepostforblood/list.aspx");
                    }
                    else
                    {
                        getPostDetailsByPostId(postId);
                    }
                }
            }
            catch (Exception ex)
            {
                msgBox.Visible = true;
                msgBoxTitle.Text = "Error";
                msgBoxDetails.Text = ex.ToString();
                msgBox.Attributes.Add("Class", "alert alert-danger alert-block fade in");
            }
        }

        private void getPostDetailsByPostId(string postId)
        {
            try
            {
                DataTable dt = new DataTable();
                MakePostForBloodBLL makePostForBlood = new MakePostForBloodBLL();

                dt = makePostForBlood.getPostDetailsByPostSerial(postId);
                if (dt.Rows.Count > 0)
                {
                    bloodGroupLbl.Text = dt.Rows[0]["BloodGroup"].ToString();
                    nameLbl.Text = dt.Rows[0]["Name"].ToString();
                    locationLbl.Text = dt.Rows[0]["Location"].ToString();
                    contactNumberLbl.Text = dt.Rows[0]["ContactNumber"].ToString();
                    descriptionLbl.Text = dt.Rows[0]["Description"].ToString();
                    createdDateLbl.Text = dt.Rows[0]["createdDate"].ToString();
                    lastDateLbl.Text = dt.Rows[0]["lastDate"].ToString();
                    string userId = dt.Rows[0]["InternalUserId"].ToString();

                    string url = getImageUrlByUserId(userId);
                    profileImage.ImageUrl = url;
                }
                else
                {
                    msgBox.Visible = true;
                    msgBoxTitle.Text = "Data Error !!!";
                    msgBoxDetails.Text = "Nothing found";
                    msgBox.Attributes.Add("Class", "alert alert-danger alert-block fade in");
                }
            }
            catch (Exception ex)
            {
                msgBox.Visible = true;
                msgBoxTitle.Text = "Error";
                msgBoxDetails.Text = ex.ToString();
                msgBox.Attributes.Add("Class", "alert alert-danger alert-block fade in");
            }
        }

        private string getImageUrlByUserId(string userId)
        {
            string url = "";
            try
            {
                DataTable dt = new DataTable();
                MakePostForBloodBLL makePostForBlood = new MakePostForBloodBLL();

                dt = makePostForBlood.getImageUrlByUserId(userId);
                if (dt.Rows.Count > 0)
                {
                    string userGroup = dt.Rows[0]["userRole"].ToString();
                    if (userGroup == "Facebook User")
                    {
                        url = dt.Rows[0]["profilePicName"].ToString();
                    }
                    else
                    {
                        url = "~/profileImage/" + dt.Rows[0]["profilePicName"].ToString();
                    }
                }
            }
            catch (Exception ex)
            {
                msgBox.Visible = true;
                msgBoxTitle.Text = "Error";
                msgBoxDetails.Text = ex.ToString();
                msgBox.Attributes.Add("Class", "alert alert-danger alert-block fade in");
            }
            return url;
        }
    }
}
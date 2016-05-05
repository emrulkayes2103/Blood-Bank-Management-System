using AppSupport.Project.BLL;
using System;
using System.Data;

namespace VersityFinalProject.UI.request
{
    public partial class requestofblood : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            msgBox.Visible = false;
            try
            {
                getAllRequestOfBlood();
            }
            catch (Exception ex)
            {
                msgBox.Visible = true;
                msgBoxTitle.Text = "Error";
                msgBoxDetails.Text = ex.ToString();
                msgBox.Attributes.Add("Class", "alert alert-danger alert-block fade in");
            }
        }

        private void getAllRequestOfBlood()
        {
            try
            {
                DataTable dt = new DataTable();
                BloodRequestBLL bloodRequest = new BloodRequestBLL();
                dt = bloodRequest.getAllBloodRequest();
                if (dt.Rows.Count > 0)
                {
                    BloodRequestRepeter.DataSource = dt;
                    BloodRequestRepeter.DataBind();
                }
                else
                {
                    msgBox.Visible = true;
                    msgBoxTitle.Text = "Data Error";
                    msgBoxDetails.Text = "No blood request found";
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
    }
}
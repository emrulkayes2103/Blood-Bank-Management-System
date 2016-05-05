using AppSupport.Project.BLL;
using AppSupport.Tech;
using System;
using System.Data;

namespace VersityFinalProject.UI.makedonation
{
    public partial class edit : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            msgBox.Visible = false;
            if (!IsPostBack)
            {
                string Id = (string)AppSupportSessionManager.Get("DonationId");
                if (string.IsNullOrEmpty(Id))
                {
                    Response.Redirect("/UI/makedonation/list.aspx");
                }
                else
                {
                    loadDonationHistoryData(Id);
                }
            }
        }

        protected void loadDonationHistoryData(string DonationId)
        {
            try
            {
                MakeDonationBLL makeDonationBll = new MakeDonationBLL();
                DataTable dt = new DataTable();
                dt = makeDonationBll.LoadDonationById(DonationId);
                if (dt.Rows.Count > 0)
                {
                    donationId.Value = dt.Rows[0]["Id"].ToString();
                    locationTxtBx.Text = dt.Rows[0]["Location"].ToString();
                    bloodGrpDrpDnList.SelectedValue = dt.Rows[0]["BloodGrp"].ToString();
                    ageTxtBx.Text = dt.Rows[0]["Age"].ToString();
                    StatusOfDonation.SelectedValue = dt.Rows[0]["Status"].ToString();
                    genderDrpDwn.SelectedValue = dt.Rows[0]["Gender"].ToString();
                }
            }
            catch (Exception ex)
            {
                msgBox.Visible = true;
                msgBoxTitle.Text = "Error ";
                msgBoxDetails.Text = ex.ToString();
            }
        }

        protected void btnMakeDonation_OnClick(object sender, EventArgs e)
        {
            try
            {
                MakeDonationBLL makeDonationBll = new MakeDonationBLL();
                bool st = false;

                makeDonationBll.Location = locationTxtBx.Text;
                makeDonationBll.bloodGrp = bloodGrpDrpDnList.SelectedValue;
                makeDonationBll.Age = Convert.ToInt32(ageTxtBx.Text);
                makeDonationBll.Status = StatusOfDonation.Text;
                makeDonationBll.gender = genderDrpDwn.SelectedValue;

                if (chkPreviousDonationDuration(makeDonationBll.donationDate))
                {
                    st = makeDonationBll.UpdateMakeDonation(makeDonationBll, donationId.Value);
                    if (st)
                    {
                        msgBox.Visible = true;
                        msgBoxTitle.Text = "Success";
                        msgBoxDetails.Text = "Donation History Updated Successfully";
                        msgBox.Attributes.Add("Class", "alert alert-success alert-block fade in");

                        Response.Redirect("~/UI/makedonation/list.aspx");
                    }
                }
                else
                {
                    msgBox.Visible = true;
                    msgBoxTitle.Text = "Error !!!";
                    msgBoxDetails.Text = "You can not make this donation";
                    msgBox.Attributes.Add("Class", "alert alert-danger alert-block fade in");
                }
            }
            catch (Exception ex)
            {
                msgBox.Visible = true;
                msgBoxTitle.Text = "Error !!!";
                msgBoxDetails.Text = ex.ToString();
                msgBox.Attributes.Add("Class", "alert alert-danger alert-block fade in");
            }
        }

        protected bool chkPreviousDonationDuration(DateTime? donationDate)
        {
            bool st = false;
            MakeDonationBLL makeDonationBll = new MakeDonationBLL();

            string userId = AppSupportSessionManager.Get("UserId");

            st = makeDonationBll.checkPreviuosDuration(userId, donationDate);
            return st;
        }
    }
}
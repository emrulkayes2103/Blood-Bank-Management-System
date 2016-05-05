using AppSupport.Project.BLL;
using AppSupport.Tech;
using System;

namespace VersityFinalProject.UI.makedonation
{
    public partial class create : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            msgBox.Visible = false;
            if (!IsPostBack)
            {
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
                makeDonationBll.donationDate = Convert.ToDateTime(donationDatetxtBx.Text);

                if (chkPreviousDonationDuration(makeDonationBll.donationDate))
                {
                    st = makeDonationBll.MakeDonation(makeDonationBll);
                    if (st)
                    {
                        msgBox.Visible = true;
                        msgBoxTitle.Text = "Success";
                        msgBoxDetails.Text = "Donation History Created Successfully";
                        msgBox.Attributes.Add("Class", "alert alert-success alert-block fade in");
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
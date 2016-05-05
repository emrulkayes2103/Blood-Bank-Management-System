using AppSupport.Project.BLL;
using AppSupport.Tech;
using System;
using System.Data;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace VersityFinalProject.UI.scarchdonner
{
    public partial class searchdonor : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                msgBox.Visible = false;
                if (!IsPostBack)
                {
                    string userType = AppSupportSessionManager.Get("LogInfo");

                    DataTable dt = new DataTable();
                    dt = GetDonorList(userType);
                    if (dt.Rows.Count > 0)
                    {
                        DonorRepeter.DataSource = GetDonorList(userType);
                        DonorRepeter.DataBind();
                    }
                    else
                    {
                        msgBox.Visible = true;
                        msgBoxTitle.Text = "Errror";
                        msgBoxDetails.Text = "No Donor Results Found";
                        msgBox.Attributes.Add("Class", "alert alert-danger alert-block fade in");
                    }
                }
            }
            catch (Exception ex)
            {
                msgBox.Visible = true;
                msgBoxTitle.Text = "Errror";
                msgBoxDetails.Text = ex.ToString();
                msgBox.Attributes.Add("Class", "alert alert-danger alert-block fade in");
            }
        }

        protected DataTable GetDonorList(string userType)
        {
            DataTable dt = new DataTable();
            try
            {
                DonorBLL donorBll = new DonorBLL();

                dt = donorBll.getDonorList(userType);
            }
            catch (Exception ex)
            {
                msgBox.Visible = true;
                msgBoxTitle.Text = "Errror";
                msgBoxDetails.Text = ex.ToString();
                msgBox.Attributes.Add("Class", "alert alert-danger alert-block fade in");
            }
            return dt;
        }

        protected void DonorRepeter_OnItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item
                || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                RepeaterItem itm = e.Item;
                HtmlGenericControl divControl = (HtmlGenericControl)itm.FindControl("fbLogo");

                Label userSts = (Label)itm.FindControl("lblEmail");

                if (userSts.Text == "FB User")
                {
                    divControl.Visible = true;
                }
                else
                {
                    divControl.Visible = false;
                }
            }

            //if (lblStatus != null)
            //{
            //    if (lblStatus.Text == "Available")
            //    {
            //        lblStatus.ForeColor = Color.Green;
            //    }
            //    else
            //    {
            //        lblStatus.ForeColor = Color.Red;
            //    }
            //}
        }

        protected void SearchBtn_OnClick(object sender, EventArgs e)
        {
            DataTable dt = new DataTable();
            DonorBLL donorBll = new DonorBLL();
            donorBll.bloodGroup = bllodGroupDrpDwn.SelectedValue.ToString();
            donorBll.Division = preferedLocationDrpDwnList.SelectedValue.ToString();
            donorBll.location = locationTxtBx.Text;
            string userType = AppSupportSessionManager.Get("LogInfo");
            if (userType == "Facebook User")
            {
                dt = donorBll.getDonorLIstForFBByFiltering(donorBll);
            }
            else
            {
                dt = donorBll.GetDonorListByFilterd(donorBll);
            }
            if (dt.Rows.Count > 0)
            {
                DonorRepeter.DataSource = dt;
                DonorRepeter.DataBind();
            }
        }
    }
}
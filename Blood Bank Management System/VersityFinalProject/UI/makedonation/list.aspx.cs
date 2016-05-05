using AppSupport.Project.BLL;
using AppSupport.Tech;
using System;
using System.Data;
using System.Web.UI.WebControls;

namespace VersityFinalProject.UI.makedonation
{
    public partial class list : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            msgBox.Visible = false;
            if (!IsPostBack)
            {
                string UserId = AppSupportSessionManager.Get("UserId").ToString();
                if (string.IsNullOrEmpty(UserId))
                {
                    Response.Redirect("/login.aspx");
                }
                else
                {
                    getDonationList(UserId);
                }
                if (DonationHistoryGridView.Rows.Count > 0)
                {
                    DonationHistoryGridView.UseAccessibleHeader = true;
                    DonationHistoryGridView.HeaderRow.TableSection = TableRowSection.TableHeader;
                }
            }
        }

        protected void getDonationList(string Userid)
        {
            try
            {
                DataTable dt = new DataTable();
                dt = MakeDonationBLL.GetDonationHistoryById(Userid);

                if (dt.Rows.Count > 0)
                {
                    DonationHistoryGridView.DataSource = dt;
                    DonationHistoryGridView.DataBind();
                }
                else
                {
                    msgBox.Visible = true;
                    msgBoxTitle.Text = "Error !!";
                    msgBoxDetails.Text = "No Record Found";
                    msgBox.Attributes.Add("Class", "alert alert-danger alert-block fade in");
                }

                if (DonationHistoryGridView.Rows.Count > 0)
                {
                    DonationHistoryGridView.UseAccessibleHeader = true;
                    DonationHistoryGridView.HeaderRow.TableSection = TableRowSection.TableHeader;
                }
            }
            catch (Exception ex)
            {
                msgBox.Visible = true;
                msgBoxTitle.Text = "Error !!";
                msgBoxDetails.Text = ex.ToString();
                msgBox.Attributes.Add("Class", "alert alert-danger alert-block fade in");
            }
        }

        protected void EditBtn_OnClick(object sender, EventArgs e)
        {
            try
            {
                LinkButton btn = (LinkButton)sender;
                GridViewRow row = (GridViewRow)btn.NamingContainer;

                Label id = (Label)DonationHistoryGridView.Rows[row.RowIndex].FindControl("LblId");
                AppSupportSessionManager.Add("DonationId", id.Text);
                Response.Redirect("/UI/makedonation/edit.aspx");
            }
            catch (Exception ex)
            {
                msgBox.Visible = true;
                msgBoxTitle.Text = "Error !!";
                msgBoxDetails.Text = ex.ToString();
                msgBox.Attributes.Add("Class", "alert alert-danger alert-block fade in");
            }
        }

        protected void DltBtn_OnClick(object sender, EventArgs e)
        {
            try
            {
                string UserId = AppSupportSessionManager.Get("UserId").ToString();
                MakeDonationBLL makeDonationBll = new MakeDonationBLL();
                LinkButton btn = (LinkButton)sender;
                GridViewRow row = (GridViewRow)btn.NamingContainer;

                Label id = (Label)DonationHistoryGridView.Rows[row.RowIndex].FindControl("LblId");

                bool st = false;
                st = makeDonationBll.DeleteDonationHistory(id.Text);
                if (st)
                {
                    msgBox.Visible = true;
                    msgBoxTitle.Text = "Success";
                    msgBoxDetails.Text = "Donation History Deleted Successfully";
                    msgBox.Attributes.Add("Class", "alert alert-success alert-block fade in");

                    getDonationList(UserId);
                }
            }
            catch (Exception ex)
            {
                msgBox.Visible = true;
                msgBoxTitle.Text = "Error !!";
                msgBoxDetails.Text = ex.ToString();
                msgBox.Attributes.Add("Class", "alert alert-danger alert-block fade in");
            }
        }
    }
}
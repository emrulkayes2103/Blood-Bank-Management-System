using AppSupport.Project.BLL;
using AppSupport.Tech;
using System;
using System.Data;
using System.Web.UI.WebControls;

namespace VersityFinalProject.UI.makepostforblood
{
    public partial class list : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string userid = (string)AppSupportSessionManager.Get("UserId");
            try
            {
                msgBox.Visible = false;
                if (!IsPostBack)
                {
                    if (string.IsNullOrEmpty(userid))
                    {
                        Response.Redirect("/login.aspx", true);
                    }
                    else
                    {
                        getPostListOfMySelf(userid);

                        if (postListGridView.Rows.Count > 0)
                        {
                            postListGridView.UseAccessibleHeader = true;
                            postListGridView.HeaderRow.TableSection = TableRowSection.TableHeader;
                        }
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

        protected void getPostListOfMySelf(string userId)
        {
            try
            {
                DataTable dt = new DataTable();
                MakePostForBloodBLL makePostForBlood = new MakePostForBloodBLL();

                dt = makePostForBlood.getPostOfMySelfById(userId);
                if (dt.Rows.Count > 0)
                {
                    postListGridView.DataSource = dt;
                    postListGridView.DataBind();
                }
                else
                {
                    msgBox.Visible = true;
                    msgBoxTitle.Text = "Warning !!!";
                    msgBoxDetails.Text = "No Data Found";
                    msgBox.Attributes.Add("Class", "alert alert-danger alert-block fade in");
                }

                if (postListGridView.Rows.Count > 0)
                {
                    postListGridView.UseAccessibleHeader = true;
                    postListGridView.HeaderRow.TableSection = TableRowSection.TableHeader;
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

        protected void EditBtn_Click(object sender, EventArgs e)
        {
            try
            {
                LinkButton btn = (LinkButton)sender;
                GridViewRow row = (GridViewRow)btn.NamingContainer;

                Label lblPostSerial = (Label)postListGridView.Rows[row.RowIndex].FindControl("postSerialLbl");

                AppSupportSessionManager.Add("PostSerialNumberForEdit", lblPostSerial.Text);
                Response.Redirect("~/UI/makepostforblood/edit.aspx", true);
            }
            catch (Exception ex)
            {
                msgBox.Visible = true;
                msgBoxTitle.Text = "Warning !!!";
                msgBoxDetails.Text = ex.Message.ToString();
                msgBox.Attributes.Add("Class", "alert alert-danger alert-block fade in");
            }
        }

        protected void DelteBtn_Click(object sender, EventArgs e)
        {
            try
            {
                LinkButton btn = (LinkButton)sender;
                GridViewRow row = (GridViewRow)btn.NamingContainer;

                Label lblPostSerial = (Label)postListGridView.Rows[row.RowIndex].FindControl("postSerialLbl");

                MakePostForBloodBLL makeDonationForBlood = new MakePostForBloodBLL();
                bool st = false;
                st = makeDonationForBlood.deletePostById(lblPostSerial.Text);
                if (st)
                {
                    msgBox.Visible = true;
                    msgBoxTitle.Text = "Success";
                    msgBoxDetails.Text = "Post Successfully deleted";
                    msgBox.Attributes.Add("Class", "alert alert-success alert-block fade in");
                }
                else
                {
                    msgBox.Visible = true;
                    msgBoxTitle.Text = "Warning !!!";
                    msgBoxDetails.Text = "Post Can not be deleted";
                    msgBox.Attributes.Add("Class", "alert alert-danger alert-block fade in");
                }
                string userid = (string)AppSupportSessionManager.Get("UserId");
                getPostListOfMySelf(userid);
            }
            catch (Exception ex)
            {
                msgBox.Visible = true;
                msgBoxTitle.Text = "Warning !!!";
                msgBoxDetails.Text = ex.Message.ToString();
                msgBox.Attributes.Add("Class", "alert alert-danger alert-block fade in");
            }
        }

        protected void ViewBtn_Click(object sender, EventArgs e)
        {
            try
            {
                LinkButton btn = (LinkButton)sender;
                GridViewRow row = (GridViewRow)btn.NamingContainer;

                Label lblPostSerial = (Label)postListGridView.Rows[row.RowIndex].FindControl("postSerialLbl");

                AppSupportSessionManager.Add("PostSerialNumberForEdit", lblPostSerial.Text);
                Response.Redirect("~/UI/makepostforblood/view.aspx", true);
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
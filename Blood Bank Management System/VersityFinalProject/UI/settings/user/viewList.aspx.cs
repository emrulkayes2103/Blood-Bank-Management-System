using AppSupport.Project.BLL;
using AppSupport.Tech;
using System;
using System.Data;
using System.Web.UI.WebControls;

namespace VersityFinalProject.settings.user
{
    public partial class viewList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            msgBox.Visible = false;
            if (!IsPostBack)
            {
                if (AppSupportSessionManager.Get("UserRole").ToString() == "Super Admin" || AppSupportSessionManager.Get("UserRole").ToString() == "Developer")
                {
                    getALlUserList();
                }
                else
                {
                    Response.Redirect("~/UI/index.aspx", true);
                }
            }
            if (userListGridView.Rows.Count > 0)
            {
                userListGridView.UseAccessibleHeader = true;
                userListGridView.HeaderRow.TableSection = TableRowSection.TableHeader;
            }
        }

        private void getALlUserList()
        {
            DataTable dt = new DataTable();
            userBLL userListBll = new userBLL();
            try
            {
                dt = userListBll.getALLUserListbyType();
                if (dt.Rows.Count > 0)
                {
                    userListGridView.DataSource = dt;
                    userListGridView.DataBind();
                }
                else
                {
                    msgBox.Visible = true;
                    msgBoxTitle.Text = "Warning !!!";
                    msgBoxDetails.Text = "No Data Found";
                    msgBox.Attributes.Add("Class", "alert alert-danger alert-block fade in");
                }
            }
            catch (Exception ex)
            {
                msgBox.Visible = true;
                msgBoxTitle.Text = "Error !!!";
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

                Label id = (Label)userListGridView.Rows[row.RowIndex].FindControl("serialLabel");
                AppSupportSessionManager.Add("UserSerialNumberForView", id.Text);
                Response.Redirect("~/UI/settings/user/view.aspx", true);
            }
            catch (Exception ex)
            {
                msgBox.Visible = true;
                msgBoxTitle.Text = "Error !!!";
                msgBoxDetails.Text = ex.Message.ToString();
                msgBox.Attributes.Add("Class", "alert alert-danger alert-block fade in");
            }
        }
    }
}
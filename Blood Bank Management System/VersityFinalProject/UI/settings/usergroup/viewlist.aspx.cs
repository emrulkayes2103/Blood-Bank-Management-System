using AppSupport.Project.BLL;
using AppSupport.Tech;
using System;
using System.Data;
using System.Web.UI.WebControls;

namespace VersityFinalProject.settings.usergroup
{
    public partial class viewlist : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            msgBox.Visible = false;
            if (!IsPostBack)
            {
                if (AppSupportSessionManager.Get("UserRole").ToString() == "Super Admin" || AppSupportSessionManager.Get("UserRole").ToString() == "Developer")
                {
                    getuserGroupList();
                }
                else
                {
                    Response.Redirect("~/UI/index.aspx", true);
                }
            }
            if (userGroupListGridView.Rows.Count > 0)
            {
                userGroupListGridView.UseAccessibleHeader = true;
                userGroupListGridView.HeaderRow.TableSection = TableRowSection.TableHeader;
            }
        }

        protected void getuserGroupList()
        {
            DataTable dt = new DataTable();
            userGroupBLL userGroupbll = new userGroupBLL();
            try
            {
                dt = userGroupbll.getUserGroupList();
                if (dt.Rows.Count > 0)
                {
                    userGroupListGridView.DataSource = dt;
                    userGroupListGridView.DataBind();
                }
                else
                {
                    msgBox.Visible = true;
                    msgBoxTitle.Text = "Data !!!";
                    msgBoxDetails.Text = "No User group Found";
                    msgBox.Attributes.Add("Class", "alert alert-danger alert-block fade in");
                }
                if (userGroupListGridView.Rows.Count > 0)
                {
                    userGroupListGridView.UseAccessibleHeader = true;
                    userGroupListGridView.HeaderRow.TableSection = TableRowSection.TableHeader;
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

        protected void userGroupListGridView_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            try
            {
                if (e.Row.RowType == DataControlRowType.DataRow)
                {
                    if (e.Row.Cells[3].Text.ToString() == "Yes")
                    {
                        e.Row.Cells[3].ForeColor = System.Drawing.Color.Green;
                        e.Row.Cells[3].Style.Add("font-weight", "bold");
                    }
                    else
                    {
                        e.Row.Cells[3].ForeColor = System.Drawing.Color.Red;
                        e.Row.Cells[3].Style.Add("font-weight", "bold");
                    }

                    if (e.Row.Cells[4].Text.ToString() == "Yes")
                    {
                        e.Row.Cells[4].ForeColor = System.Drawing.Color.Green;
                        e.Row.Cells[4].Style.Add("font-weight", "bold");
                    }
                    else
                    {
                        e.Row.Cells[4].ForeColor = System.Drawing.Color.Red;
                        e.Row.Cells[4].Style.Add("font-weight", "bold");
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

        protected void EditBtn_Click(object sender, EventArgs e)
        {
            try
            {
                LinkButton btn = (LinkButton)sender;
                GridViewRow row = (GridViewRow)btn.NamingContainer;

                Label lblSerial = (Label)userGroupListGridView.Rows[row.RowIndex].FindControl("userGroupIdLabel");

                AppSupportSessionManager.Add("UserGroupIdForView", lblSerial.Text);
                Response.Redirect("~/UI/settings/usergroup/view.aspx", true);
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
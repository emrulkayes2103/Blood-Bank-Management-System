using AppSupport.Project.BLL;
using AppSupport.Tech;
using System;
using System.Data;
using System.Web.UI.WebControls;

namespace VersityFinalProject.settings.usergroup
{
    public partial class list : System.Web.UI.Page
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

                Label lblUserGroupId = (Label)userGroupListGridView.Rows[row.RowIndex].FindControl("userGroupIdLabel");
                AppSupportSessionManager.Add("UserGroupIdForEdit", lblUserGroupId.Text.Trim());
                Response.Redirect("~/settings/usergroup/update.aspx", true);
            }
            catch (Exception ex)
            {
                msgBox.Visible = true;
                msgBoxTitle.Text = "Warning !!!";
                msgBoxDetails.Text = ex.Message.ToString();
                msgBox.Attributes.Add("Class", "alert alert-danger alert-block fade in");
            }
        }

        protected void activateBtn_Click(object sender, EventArgs e)
        {
            try
            {
                bool st = false;
                userGroupBLL usergroupBll = new userGroupBLL();
                LinkButton btn = (LinkButton)sender;
                GridViewRow row = (GridViewRow)btn.NamingContainer;

                Label lblUserGroupId = (Label)userGroupListGridView.Rows[row.RowIndex].FindControl("userGroupIdLabel");

                string isActive = userGroupListGridView.Rows[row.RowIndex].Cells[3].Text.ToString();
                if (isActive == "Yes")
                {
                    msgBox.Visible = true;
                    msgBoxTitle.Text = "Warning !!!";
                    msgBoxDetails.Text = "User Group is Already activated";
                    msgBox.Attributes.Add("Class", "alert alert-danger alert-block fade in");
                }
                else
                {
                    st = usergroupBll.activateUserGroupById(lblUserGroupId.Text.Trim());
                    if (st)
                    {
                        msgBox.Visible = true;
                        msgBoxTitle.Text = "Success";
                        msgBoxDetails.Text = "User Group Successfully Activated";
                        msgBox.Attributes.Add("Class", "alert alert-success alert-block fade in");
                    }
                    else
                    {
                        msgBox.Visible = true;
                        msgBoxTitle.Text = "Warning !!!";
                        msgBoxDetails.Text = "User Group Can Not Be activated";
                        msgBox.Attributes.Add("Class", "alert alert-danger alert-block fade in");
                    }
                    getuserGroupList();
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

        protected void deactiveBtn_Click(object sender, EventArgs e)
        {
            try
            {
                bool st = false;
                userGroupBLL usergroupBll = new userGroupBLL();
                LinkButton btn = (LinkButton)sender;
                GridViewRow row = (GridViewRow)btn.NamingContainer;

                Label lblUserGroupId = (Label)userGroupListGridView.Rows[row.RowIndex].FindControl("userGroupIdLabel");

                string isActive = userGroupListGridView.Rows[row.RowIndex].Cells[3].Text.ToString();
                if (isActive == "No")
                {
                    msgBox.Visible = true;
                    msgBoxTitle.Text = "Warning !!!";
                    msgBoxDetails.Text = "User Group is Already Deactivated";
                    msgBox.Attributes.Add("Class", "alert alert-danger alert-block fade in");
                }
                else
                {
                    st = usergroupBll.DeactivateUserGroupById(lblUserGroupId.Text.Trim());
                    if (st)
                    {
                        msgBox.Visible = true;
                        msgBoxTitle.Text = "Success";
                        msgBoxDetails.Text = "User Group Successfully Deactivated";
                        msgBox.Attributes.Add("Class", "alert alert-success alert-block fade in");
                    }
                    else
                    {
                        msgBox.Visible = true;
                        msgBoxTitle.Text = "Warning !!!";
                        msgBoxDetails.Text = "User Group Can Not Be Deactivated";
                        msgBox.Attributes.Add("Class", "alert alert-danger alert-block fade in");
                    }
                    getuserGroupList();
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

        protected void deleteBtn_Click(object sender, EventArgs e)
        {
            try
            {
                bool st = false;
                userGroupBLL usergroupBll = new userGroupBLL();
                LinkButton btn = (LinkButton)sender;
                GridViewRow row = (GridViewRow)btn.NamingContainer;

                Label lblUserGroupId = (Label)userGroupListGridView.Rows[row.RowIndex].FindControl("userGroupIdLabel");

                st = usergroupBll.DeleteUserGroupById(lblUserGroupId.Text.Trim());
                if (st)
                {
                    msgBox.Visible = true;
                    msgBoxTitle.Text = "Success";
                    msgBoxDetails.Text = "User Group Successfylly Deleted";
                    msgBox.Attributes.Add("Class", "alert alert-success alert-block fade in");
                }
                else
                {
                    msgBox.Visible = true;
                    msgBoxTitle.Text = "Warning !!!";
                    msgBoxDetails.Text = "User Group Can Not Be Deleted";
                    msgBox.Attributes.Add("Class", "alert alert-danger alert-block fade in");
                }
                getuserGroupList();
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
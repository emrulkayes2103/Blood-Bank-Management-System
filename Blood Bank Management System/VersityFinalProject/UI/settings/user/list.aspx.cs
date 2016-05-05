using AppSupport.Project.BLL;
using AppSupport.Tech;
using System;
using System.Data;
using System.Web.UI.WebControls;

namespace VersityFinalProject.settings.user
{
    public partial class list : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
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
            catch (Exception ex)
            {
                msgBox.Visible = true;
                msgBoxTitle.Text = "Error !!!";
                msgBoxDetails.Text = ex.Message.ToString();
                msgBox.Attributes.Add("Class", "alert alert-danger alert-block fade in");
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

        protected void getUserList(string type)
        {
            DataTable dt = new DataTable();
            userBLL userListBll = new userBLL();
            try
            {
                dt = userListBll.getUserListbyType(type);
                if (dt.Rows.Count > 0)
                {
                    userListGridView.DataSource = dt;
                    userListGridView.DataBind();
                }
                else
                {
                    msgBox.Visible = true;
                    msgBoxTitle.Text = "Warning !!!";
                    msgBoxDetails.Text = "No " + type + " Data Found";
                    msgBox.Attributes.Add("Class", "alert alert-danger alert-block fade in");
                }
                if (userListGridView.Rows.Count > 0)
                {
                    userListGridView.UseAccessibleHeader = true;
                    userListGridView.HeaderRow.TableSection = TableRowSection.TableHeader;
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

        protected void listTypeDrpDwn_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                string userType = listTypeDrpDwn.SelectedValue.ToString();
                getUserList(userType);

                //if (userListGridView.Rows.Count > 0)
                //{
                //    userListGridView.UseAccessibleHeader = true;
                //    userListGridView.HeaderRow.TableSection = TableRowSection.TableHeader;
                //}
                //else
                //{
                //    msgBox.Visible = true;
                //    msgBoxTitle.Text = "Warning !!!";
                //    msgBoxDetails.Text = "No "+userType+" Data Found";
                //    msgBox.Attributes.Add("Class", "alert alert-danger alert-block fade in");
                //}
            }
            catch (Exception ex)
            {
                msgBox.Visible = true;
                msgBoxTitle.Text = "Error !!!";
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

                Label id = (Label)userListGridView.Rows[row.RowIndex].FindControl("serialLabel");
                AppSupportSessionManager.Add("UserSerialNumber", id.Text);
                Response.Redirect("~/settings/user/update.aspx", true);
            }
            catch (Exception ex)
            {
                msgBox.Visible = true;
                msgBoxTitle.Text = "Error !!!";
                msgBoxDetails.Text = ex.Message.ToString();
                msgBox.Attributes.Add("Class", "alert alert-danger alert-block fade in");
            }
        }

        protected void ActiveBtn_Click(object sender, EventArgs e)
        {
            userBLL userlistBll = new userBLL();
            bool st = false;
            try
            {
                LinkButton btn = (LinkButton)sender;
                GridViewRow row = (GridViewRow)btn.NamingContainer;

                Label serial = (Label)userListGridView.Rows[row.RowIndex].FindControl("serialLabel");
                string IsActive = userListGridView.Rows[row.RowIndex].Cells[7].Text.ToString();
                string IsDelete = userListGridView.Rows[row.RowIndex].Cells[8].Text.ToString();
                if (IsActive == "Yes")
                {
                    msgBox.Visible = true;
                    msgBoxTitle.Text = "Message ";
                    msgBoxDetails.Text = "User is alreaady Activated";
                    msgBox.Attributes.Add("Class", "alert alert-danger alert-block fade in");
                }
                else
                {
                    if (IsDelete == "Yes")
                    {
                        msgBox.Visible = true;
                        msgBoxTitle.Text = "Message ";
                        msgBoxDetails.Text = "User can not be Activated. User is Deleted";
                        msgBox.Attributes.Add("Class", "alert alert-danger alert-block fade in");
                    }
                    else
                    {
                        st = userlistBll.ActiveUser(serial.Text);
                        if (st)
                        {
                            msgBox.Visible = true;
                            msgBoxTitle.Text = "Success ";
                            msgBoxDetails.Text = "User is Successfully Activated";
                            msgBox.Attributes.Add("Class", "alert alert-success alert-block fade in");
                        }
                        else
                        {
                            msgBox.Visible = true;
                            msgBoxTitle.Text = "Warning !!! ";
                            msgBoxDetails.Text = "User can not Activated";
                            msgBox.Attributes.Add("Class", "alert alert-danger alert-block fade in");
                        }
                    }
                    getALlUserList();
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

        protected void DeactiveBtn_Click(object sender, EventArgs e)
        {
            userBLL userlistBll = new userBLL();
            bool st = false;
            try
            {
                LinkButton btn = (LinkButton)sender;
                GridViewRow row = (GridViewRow)btn.NamingContainer;

                Label serial = (Label)userListGridView.Rows[row.RowIndex].FindControl("serialLabel");
                string IsActive = userListGridView.Rows[row.RowIndex].Cells[7].Text.ToString();
                if (IsActive == "No")
                {
                    msgBox.Visible = true;
                    msgBoxTitle.Text = "Message ";
                    msgBoxDetails.Text = "User is alreaady Deactivated";
                    msgBox.Attributes.Add("Class", "alert alert-danger alert-block fade in");
                }
                else
                {
                    st = userlistBll.DeactivateUser(serial.Text);
                    if (st)
                    {
                        msgBox.Visible = true;
                        msgBoxTitle.Text = "Success ";
                        msgBoxDetails.Text = "User is Successfully Deactivated";
                        msgBox.Attributes.Add("Class", "alert alert-success alert-block fade in");
                    }
                    else
                    {
                        msgBox.Visible = true;
                        msgBoxTitle.Text = "Warning !!! ";
                        msgBoxDetails.Text = "User can not Deactivated";
                        msgBox.Attributes.Add("Class", "alert alert-danger alert-block fade in");
                    }
                    getALlUserList();
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

        protected void DeleteBtn_Click(object sender, EventArgs e)
        {
            userBLL userlistBll = new userBLL();
            bool st = false;
            try
            {
                LinkButton btn = (LinkButton)sender;
                GridViewRow row = (GridViewRow)btn.NamingContainer;
                Label serialNumber = (Label)userListGridView.Rows[row.RowIndex].FindControl("serialLabel");
                string serial = serialNumber.Text;
                string IsDeleted = userListGridView.Rows[row.RowIndex].Cells[8].Text.ToString();

                if (IsDeleted == "Yes")
                {
                    msgBox.Visible = true;
                    msgBoxTitle.Text = "Message !!! ";
                    msgBoxDetails.Text = "User is already Deleted";
                    msgBox.Attributes.Add("Class", "alert alert-danger alert-block fade in");
                }
                else
                {
                    st = userlistBll.DeleteUser(serial);
                    if (st)
                    {
                        msgBox.Visible = true;
                        msgBoxTitle.Text = "Success ";
                        msgBoxDetails.Text = "User is Successfully Deleted";
                        msgBox.Attributes.Add("Class", "alert alert-success alert-block fade in");
                    }
                    else
                    {
                        msgBox.Visible = true;
                        msgBoxTitle.Text = "Warning !!! ";
                        msgBoxDetails.Text = "User can not Deleted";
                        msgBox.Attributes.Add("Class", "alert alert-danger alert-block fade in");
                    }
                    getALlUserList();
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
    }
}
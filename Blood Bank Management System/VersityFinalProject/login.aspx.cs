using AppSupport.Project.BLL;
using AppSupport.Tech;
using System;
using System.Configuration;
using System.Data;

namespace VersityFinalProject
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
            }
        }

        protected void btnLogIn_Click(object sender, EventArgs e)
        {
            try
            {
                DataTable dt = new DataTable();
                LogInBLL loginBll = new LogInBLL();
                loginBll.userEmail = userIdTxtBx.Text.Trim();
                loginBll.passWord = passwordTxtBX.Text.Trim();

                dt = loginBll.userLogin();
                if (dt.Rows.Count > 0)
                {
                    if (rememberMeChkBox.Checked)
                    {
                        Response.Cookies["UserEmail"].Value = userIdTxtBx.Text;
                        Response.Cookies["UserPW"].Value = passwordTxtBX.Text;
                        Response.Cookies["UserEmail"].Expires = DateTime.Now.AddDays(30);
                        Response.Cookies["UserPW"].Expires = DateTime.Now.AddDays(30);
                    }
                    else
                    {
                        Response.Cookies["UserEmail"].Expires = DateTime.Now.AddDays(-1);
                        Response.Cookies["UserPW"].Expires = DateTime.Now.AddDays(-1);
                    }
                    AppSupportSessionManager.Add("LogInfo", "Email");
                    AppSupportSessionManager.Add("UserName", dt.Rows[0]["Name"].ToString());
                    AppSupportSessionManager.Add("UserEmail", dt.Rows[0]["Email"].ToString());
                    AppSupportSessionManager.Add("UserId", dt.Rows[0]["Serial"].ToString());
                    AppSupportSessionManager.Add("UserRole", dt.Rows[0]["userRole"].ToString());
                    AppSupportSessionManager.Add("ProfileImageName", dt.Rows[0]["profilePicName"].ToString());

                    Response.Redirect("~/UI/index.aspx", true);
                }
                else
                {
                    logInErrorMsg.Text = "Email or password do not match";
                }
            }
            catch (Exception ex)
            {
                logInErrorMsg.Text = ex.Message.ToString();
            }
        }

        protected void FaceBookLogInBtn_Click(object sender, EventArgs e)
        {
            AppSupportSessionManager.Add("LogInfo", "Facebook User");
            Response.Redirect("https://www.facebook.com/v2.4/dialog/oauth/?client_id=" + ConfigurationManager.AppSettings["FacebookAppId"] + "&redirect_uri=http://" + Request.ServerVariables["SERVER_NAME"] + ":" + Request.ServerVariables["SERVER_PORT"] + "/UI/RetriveFacebookLoginData.aspx&response_type=code&state=1");
        }
    }
}
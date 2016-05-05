using AppSupport.Project.BLL;
using System;

namespace VersityFinalProject.page
{
    public partial class externaluseractivation : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                msgBox.Visible = false;
                string activationCode = (string)Request.QueryString["ActivationCode"].ToString();
                if (!IsPostBack)
                {
                    if (string.IsNullOrEmpty(activationCode))
                    {
                        msgBox.Visible = true;
                        msgBoxTitle.Text = "Wrong Interuptiopn";
                        msgBoxDetails.Text = "Something Goes Wrong . Please Check your Email Address";
                        msgBox.Attributes.Add("class", "alert alert-danger alert-block fade in");
                    }
                    else
                    {
                        if (checkAccountActivationExixtense(activationCode))
                        {
                            if (activateAccount(activationCode))
                            {
                                msgBox.Visible = true;
                                msgBoxTitle.Text = "Account Activation";
                                msgBoxDetails.Text = "Your Account Successfully Activated";
                                msgBox.Attributes.Add("class", "alert alert-success alert-block fade in");
                            }
                            else
                            {
                                msgBox.Visible = true;
                                msgBoxTitle.Text = "Wrong Interuptiopn";
                                msgBoxDetails.Text = "Something Goes Wrong . Contact with Admin";
                                msgBox.Attributes.Add("class", "alert alert-danger alert-block fade in");
                            }
                        }
                        else
                        {
                            msgBox.Visible = true;
                            msgBoxTitle.Text = "Notice";
                            msgBoxDetails.Text = "Your account is already activated or Accounts does not exists";
                            msgBox.Attributes.Add("class", "alert alert-danger alert-block fade in");
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                msgBox.Visible = true;
                msgBoxTitle.Text = "Error !!!";
                msgBoxDetails.Text = ex.ToString();
                msgBox.Attributes.Add("class", "alert alert-danger alert-block fade in");
            }
        }

        protected bool activateAccount(string activationCode)
        {
            bool status = false;
            try
            {
                userBLL userbll = new userBLL();

                status = userbll.activateAccount(activationCode);
                if (status)
                {
                    status = true;
                }
            }
            catch (Exception ex)
            {
                msgBox.Visible = true;
                msgBoxTitle.Text = "Error !!!";
                msgBoxDetails.Text = ex.ToString();
                msgBox.Attributes.Add("class", "alert alert-danger alert-block fade in");
            }
            return status;
        }

        protected bool checkAccountActivationExixtense(string activationCode)
        {
            bool status = false;
            try
            {
                userBLL userBll = new userBLL();
                status = userBll.checkAccountActivationExixtense(activationCode);
                if (status)
                {
                    status = true;
                }
            }
            catch (Exception ex)
            {
                msgBox.Visible = true;
                msgBoxTitle.Text = "Error !!!";
                msgBoxDetails.Text = ex.ToString();
                msgBox.Attributes.Add("class", "alert alert-danger alert-block fade in");
            }
            return status;
        }
    }
}
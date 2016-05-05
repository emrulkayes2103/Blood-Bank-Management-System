using AppSupport.Project.BLL;
using System;
using System.Data;

namespace VersityFinalProject
{
    public partial class _default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BloodRequestBLL bloodRequestBll = new BloodRequestBLL();
                DataTable dt = new DataTable();
                dt = bloodRequestBll.GetRecentBloodRequest();
                recentPostRepeter.DataSource = dt;
                recentPostRepeter.DataBind();
            }
        }
    }
}
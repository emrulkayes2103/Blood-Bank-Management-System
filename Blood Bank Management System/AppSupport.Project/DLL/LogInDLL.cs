using AppSupport.Project.BLL;
using AppSupport.Tech;
using System;
using System.Data;

namespace AppSupport.Project.DLL
{
    public class LogInDLL
    {
        internal DataTable userLogIn(DBplayer db, LogInBLL logInBLL)
        {
            DataTable dt = new DataTable();
            try
            {
                db.AddParameters("@email", logInBLL.userEmail.Trim());
                db.AddParameters("@pass", AppSupportLibraryManager.EncryptSHA1hash(logInBLL.passWord.Trim()));

                dt = db.ExecuteDataTable("USER_LOGIN", true);
            }
            catch (Exception)
            {
                throw;
            }
            return dt;
        }
    }
}
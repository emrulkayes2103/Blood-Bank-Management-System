using AppSupport.Project.DLL;
using AppSupport.Tech;
using System;
using System.Data;

namespace AppSupport.Project.BLL
{
    public class LogInBLL
    {
        public string userEmail { get; set; }

        public string passWord { get; set; }

        public DataTable userLogin()
        {
            LogInDLL loginDll = new LogInDLL();
            DataTable dt = new DataTable();
            DBplayer db = new DBplayer();
            try
            {
                db.Start();
                dt = loginDll.userLogIn(db, this);
                db.Stop();
            }
            catch (Exception)
            {
                throw;
            }
            return dt;
        }
    }
}
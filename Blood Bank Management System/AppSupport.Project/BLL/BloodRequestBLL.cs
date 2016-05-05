using AppSupport.Project.DLL;
using AppSupport.Tech;
using System;
using System.Data;

namespace AppSupport.Project.BLL
{
    public class BloodRequestBLL
    {
        public DataTable getAllBloodRequest()
        {
            DataTable dt = new DataTable();
            try
            {
                BloodRequestDLL bloodRequest = new BloodRequestDLL();
                DBplayer db = new DBplayer();
                db.Start();
                dt = bloodRequest.getAllBloodRequest(db);
                db.Stop();
            }
            catch (Exception)
            {
                throw;
            }
            return dt;
        }

        public DataTable GetRecentBloodRequest()
        {
            DataTable dt = new DataTable();
            try
            {
                BloodRequestDLL bloodRequest = new BloodRequestDLL();
                DBplayer db = new DBplayer();
                db.Start();
                dt = bloodRequest.GetRecentBloodRequest(db);
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
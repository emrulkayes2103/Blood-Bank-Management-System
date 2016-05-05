using AppSupport.Tech;
using System;
using System.Data;

namespace AppSupport.Project.DLL
{
    public class BloodRequestDLL
    {
        internal DataTable getAllBloodRequest(DBplayer db)
        {
            DataTable dt = new DataTable();
            try
            {
                dt = db.ExecuteDataTable("GET_ALL_BLOOD_REQUEST", true);
            }
            catch (Exception)
            {
                throw;
            }
            return dt;
        }

        internal DataTable GetRecentBloodRequest(DBplayer db)
        {
            DataTable dt = new DataTable();
            try
            {
                dt = db.ExecuteDataTable("GET_RECENT_BLOOD_REQUEST", true);
            }
            catch (Exception)
            {
                throw;
            }
            return dt;
        }
    }
}
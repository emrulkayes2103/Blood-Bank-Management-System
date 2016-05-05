using AppSupport.Project.BLL;
using AppSupport.Tech;
using System;
using System.Data;

namespace AppSupport.Project.DLL
{
    public class DonorDLL
    {
        internal DataTable getDonorList(DBplayer db, string userType)
        {
            DataTable dt = new DataTable();
            try
            {
                if (userType == "Facebook User")
                {
                    db.AddParameters("@fbId", AppSupportSessionManager.Get("UserId"));
                    dt = db.ExecuteDataTable("GET_BLOOD_DONORS_FOR_FB_USER", true);
                }
                else
                {
                    dt = db.ExecuteDataTable("GET_DONOR_LIST", true);
                }
            }
            catch (Exception)
            {
                throw;
            }
            return dt;
        }

        internal DataTable GetDonorListByFiltered(DonorBLL donorBLL, DBplayer db)
        {
            DataTable dt = new DataTable();
            try
            {
                db.AddParameters("@BloodGroup", donorBLL.bloodGroup);
                db.AddParameters("@Division", donorBLL.Division);
                db.AddParameters("@location", donorBLL.location.Trim());

                dt = db.ExecuteDataTable("GET_DONOR_LIST_BY_FILTERING", true);
            }
            catch (Exception)
            {
                throw;
            }
            return dt;
        }

        internal DataTable GetDonorListForFBByFiltered(DonorBLL donorBLL, DBplayer db)
        {
            DataTable dt = new DataTable();
            try
            {
                db.AddParameters("@fbId", AppSupportSessionManager.Get("UserId"));
                db.AddParameters("@BloodGroup", donorBLL.bloodGroup);
                db.AddParameters("@Division", donorBLL.Division);
                db.AddParameters("@location", donorBLL.location.Trim());

                dt = db.ExecuteDataTable("GET_BLOOD_DONORS_FOR_FB_USER_BY_FILTERING", true);
            }
            catch (Exception)
            {
                throw;
            }
            return dt;
        }
    }
}
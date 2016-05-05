using AppSupport.Project.BLL;
using AppSupport.Tech;
using System;
using System.Data;

namespace AppSupport.Project.DLL
{
    public class MakeDonationDLL
    {
        internal bool MakeDonation(DBplayer db, MakeDonationBLL makeDonationBll)
        {
            bool st = false;
            try
            {
                db.AddParameters("@Location", makeDonationBll.Location.Trim());
                db.AddParameters("@BloodGrp", makeDonationBll.bloodGrp.Trim());
                db.AddParameters("@Age", makeDonationBll.Age);
                db.AddParameters("@Stat", makeDonationBll.Status);
                db.AddParameters("@gender", makeDonationBll.gender);
                db.AddParameters("@createdBy", AppSupportSessionManager.Get("UserId"));
                db.AddParameters("@createdDate", DateTime.Today);
                db.AddParameters("@createdForm", AppSupportLibraryManager.Terminal());
                db.AddParameters("@DonationDate", makeDonationBll.donationDate);

                db.ExecuteNonQuery("ADD_MAKE_DONATION", true);
                st = true;
            }
            catch (Exception)
            {
                throw;
            }
            return st;
        }

        internal DataTable GetDonbationHistory(string UserId, DBplayer db)
        {
            DataTable dt = new DataTable();
            try
            {
                db.AddParameters("@userId", UserId.Trim());
                dt = db.ExecuteDataTable("GET_DONATION_HISTORY", true);
            }
            catch (Exception)
            {
                throw;
            }
            return dt;
        }

        internal bool DeleteDonationHistory(string DonationId, DBplayer db)
        {
            bool st = false;
            try
            {
                db.AddParameters("@DonationId", Convert.ToInt32(DonationId));
                db.ExecuteNonQuery("DELETE_DONATION_HISTORY", true);
                st = true;
            }
            catch (Exception)
            {
                throw;
            }
            return st;
        }

        internal DataTable loadDonationById(string DonationId, DBplayer db)
        {
            DataTable dt = new DataTable();
            try
            {
                db.AddParameters("@DonationId", Convert.ToInt32(DonationId));
                dt = db.ExecuteDataTable("LOAD_DONATION_HISTORY_BY_ID", true);
            }
            catch (Exception)
            {
                throw;
            }
            return dt;
        }

        internal bool UpdateMakeDonation(MakeDonationBLL makeDonationBll, DBplayer db, string Id)
        {
            bool st = false;
            try
            {
                db.AddParameters("@DonationId", Convert.ToInt32(Id));
                db.AddParameters("@Location", makeDonationBll.Location.Trim());
                db.AddParameters("@BloodGrp", makeDonationBll.bloodGrp.Trim());
                db.AddParameters("@Age", makeDonationBll.Age);
                db.AddParameters("@Stat", makeDonationBll.Status);
                db.AddParameters("@gender", makeDonationBll.gender);
                db.ExecuteNonQuery("UPADTE_MAKE_DONATION", true);
                st = true;
            }
            catch (Exception)
            {
                throw;
            }
            return st;
        }

        internal bool CheckPreviousDuration(DBplayer db, string userId, DateTime? donationDate)
        {
            bool st = false;
            try
            {
                DataTable dt = new DataTable();
                db.AddParameters("@userId", userId.Trim());
                db.AddParameters("@donationDate", donationDate);

                dt = db.ExecuteDataTable("CHECK_PREVIOUS_DONATION_DATE", true);

                int result;
                result = Convert.ToInt32(dt.Rows[0]["Result"]);
                if (result == 1)
                {
                    st = true;
                }
            }
            catch (Exception)
            {
                throw;
            }
            return st;
        }
    }
}
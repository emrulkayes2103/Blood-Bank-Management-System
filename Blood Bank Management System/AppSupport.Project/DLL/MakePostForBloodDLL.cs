using AppSupport.Project.BLL;
using AppSupport.Tech;
using System;
using System.Data;

namespace AppSupport.Project.DLL
{
    public class MakePostForBloodDLL
    {
        internal bool savePostForBlood(DBplayer db, MakePostForBloodBLL makePostForBloodBLL)
        {
            try
            {
                bool st = false;
                db.AddParameters("@internalUserId", makePostForBloodBLL.interNalUserId.Trim());
                db.AddParameters("@name", makePostForBloodBLL.Name.Trim());
                db.AddParameters("@location", makePostForBloodBLL.Location.Trim());
                db.AddParameters("@bloodGroup", makePostForBloodBLL.bloodGroup.Trim());
                db.AddParameters("@contactNumber", makePostForBloodBLL.contactNumber.Trim());
                db.AddParameters("@lastDate", makePostForBloodBLL.lastDate);
                db.AddParameters("@description", makePostForBloodBLL.description.Trim());
                db.AddParameters("@isDeleted", "No");
                db.AddParameters("@createdBy", AppSupportSessionManager.Get("UserId"));
                db.AddParameters("@createdFrom", AppSupportLibraryManager.Terminal());
                db.AddParameters("@createdDate", DateTime.Now);

                db.ExecuteNonQuery("SAVE_POST_FOR_BLOOD", true);

                st = true;

                return st;
            }
            catch (Exception)
            {
                throw;
            }
        }

        internal DataTable getPostOfMySelfById(DBplayer db, string userId)
        {
            try
            {
                DataTable dt = new DataTable();
                db.AddParameters("@InternalUserId", userId);

                dt = db.ExecuteDataTable("GET_ALL_POST_OF_BLOOD_MYSELF", true);
                return dt;
            }
            catch (Exception)
            {
                throw;
            }
        }

        internal bool DeletePostById(string Serial, DBplayer db)
        {
            try
            {
                bool st = false;
                db.AddParameters("@posiId", Serial);
                db.ExecuteNonQuery("DELETE_POST_BY_ID", true);
                return st;
            }
            catch (Exception)
            {
                throw;
            }
        }

        internal DataTable GetPostDetailsByPostSerial(DBplayer db, string postSerial)
        {
            try
            {
                DataTable dt = new DataTable();
                db.AddParameters("@PostSerial", postSerial.Trim());

                dt = db.ExecuteDataTable("GET_POST_DETAILS_BY_POST_SERIAL", true);
                return dt;
            }
            catch (Exception)
            {
                throw;
            }
        }

        internal bool UpdatePostForBloodByPostId(DBplayer db, MakePostForBloodBLL makePostForBloodBLL, string postSerial)
        {
            try
            {
                bool st = false;
                db.AddParameters("@postSerial", postSerial);
                db.AddParameters("@location", makePostForBloodBLL.Location.Trim());
                db.AddParameters("@bloodGroup", makePostForBloodBLL.bloodGroup.Trim());
                db.AddParameters("@contactNumber", makePostForBloodBLL.contactNumber.Trim());
                db.AddParameters("@lastDate", makePostForBloodBLL.lastDate);
                db.AddParameters("@description", makePostForBloodBLL.description.Trim());

                db.ExecuteNonQuery("UPDATE_POST_FOR_BLOOD_BY_SERIAL", true);
                st = true;
                return st;
            }
            catch (Exception)
            {
                throw;
            }
        }

        internal DataTable getImageUrlByUserId(DBplayer db, string userId)
        {
            DataTable dt = new DataTable();
            try
            {
                db.AddParameters("@userId", userId.Trim());
                dt = db.ExecuteDataTable("GET_USER_IMAGE_URL_GET_BY_ID", true);
            }
            catch (Exception)
            {
                throw;
            }
            return dt;
        }
    }
}
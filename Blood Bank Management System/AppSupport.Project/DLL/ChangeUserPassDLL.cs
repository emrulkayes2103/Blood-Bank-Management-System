using AppSupport.Project.BLL;
using AppSupport.Tech;
using System;
using System.Data;

namespace AppSupport.Project.DLL
{
    public class ChangeUserPassDLL
    {
        internal bool chkPreviousPass(DBplayer db, string PrePass, string id, string email)
        {
            bool st = false;
            DataTable dt = new DataTable();
            try
            {
                db.AddParameters("@prePass", AppSupportLibraryManager.EncryptSHA1hash(PrePass.Trim()));
                db.AddParameters("@userId", Convert.ToInt32(id));
                db.AddParameters("@UserEmail", email.Trim());

                dt = db.ExecuteDataTable("CHECK_PREVIUOS_PASS_FOR_CHANGE_PASS", true);
                if (dt.Rows.Count > 0)
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

        internal bool changePassword(DBplayer db, ChangeUserPassBLL changeUserPassBLL, string id, string Email)
        {
            bool st = false;

            try
            {
                db.AddParameters("@NewPass", AppSupportLibraryManager.EncryptSHA1hash(changeUserPassBLL.newPass.Trim()));
                db.AddParameters("@userId", Convert.ToInt32(id));
                db.AddParameters("@UserEmail", Email.Trim());

                db.ExecuteNonQuery("CHANGE_USER_PASSWORD", true);
                st = true;
            }
            catch (Exception)
            {
                throw;
            }
            return st;
        }
    }
}
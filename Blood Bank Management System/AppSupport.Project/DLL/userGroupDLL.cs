using AppSupport.Project.BLL;
using AppSupport.Tech;
using System;
using System.Data;

namespace AppSupport.Project.DLL
{
    public class userGroupDLL
    {
        internal bool createUserGroup(DBplayer db, userGroupBLL userGroupBLL)
        {
            bool status = false;
            try
            {
                db.AddParameters("@userGroupName", userGroupBLL.UserGroupName.Trim());
                db.AddParameters("@description", userGroupBLL.Description.Trim());
                db.AddParameters("@createdBy", AppSupportSessionManager.Get("UserId").ToString());
                db.AddParameters("@createtedDate", DateTime.Today);
                db.AddParameters("@createForm", AppSupportLibraryManager.Terminal());

                db.ExecuteNonQuery("CREATE_USER_GROUP", true);

                status = true;
            }
            catch (Exception)
            {
                throw;
            }
            return status;
        }

        internal DataTable getUserList(DBplayer db)
        {
            DataTable dt = new DataTable();
            try
            {
                dt = db.ExecuteDataTable("GET_USER_GROUP_LIST", true);
            }
            catch (Exception)
            {
                throw;
            }
            return dt;
        }

        internal DataTable getUserDetailsById(DBplayer db, string GroupId)
        {
            DataTable dt = new DataTable();
            try
            {
                db.AddParameters("@UserGroupId", GroupId.Trim());

                dt = db.ExecuteDataTable("GET_USER_GROUP_DETAILS_BY_ID", true);
            }
            catch (Exception)
            {
                throw;
            }
            return dt;
        }

        internal DataTable getUserGroupInfoById(string userGroupid, DBplayer db)
        {
            DataTable dt = new DataTable();
            try
            {
                db.AddParameters("@UserGroupId", userGroupid.Trim());

                dt = db.ExecuteDataTable("GET_USER_GROUP_DETAILS_BY_ID", true);
            }
            catch (Exception)
            {
                throw;
            }
            return dt;
        }

        internal bool updateUserGroup(string userGroupId, DBplayer db, userGroupBLL usergroupBll)
        {
            bool st = false;
            try
            {
                db.AddParameters("@userGroupId", userGroupId.Trim());
                db.AddParameters("@userGroupName", usergroupBll.UserGroupName.Trim());
                db.AddParameters("@description", usergroupBll.Description.Trim());

                db.ExecuteNonQuery("UPDATE_USER_GROUP_BY_ID", true);
                st = true;
            }
            catch (Exception)
            {
                throw;
            }
            return st;
        }

        internal bool ActivateUserGroupById(string userGroupId, DBplayer db)
        {
            bool st = false;
            try
            {
                db.AddParameters("@userGroupId", userGroupId.Trim());

                string query_command = "update UserGroup set IsActive='Yes' where UserGroupId=@userGroupId";
                db.ExecuteNonQuery(query_command);
                st = true;
            }
            catch (Exception)
            {
                throw;
            }
            return st;
        }

        internal bool DeactivateUserGroupById(string userGroupId, DBplayer db)
        {
            bool st = false;
            try
            {
                db.AddParameters("@userGroupId", userGroupId.Trim());

                string query_command = "update UserGroup set IsActive='No' where UserGroupId=@userGroupId";
                db.ExecuteNonQuery(query_command);
                st = true;
            }
            catch (Exception)
            {
                throw;
            }
            return st;
        }

        internal bool DeleteUserGroupById(string userGroupId, DBplayer db)
        {
            bool st = false;
            try
            {
                db.AddParameters("@usergroupId", userGroupId.Trim());
                db.ExecuteNonQuery("DELETE_USER_GROUP_BY_ID", true);

                st = true;
            }
            catch (Exception)
            {
                throw;
            }
            return st;
        }

        internal DataTable getDeletdUserList(DBplayer db)
        {
            DataTable dt = new DataTable();
            try
            {
                dt = db.ExecuteDataTable("GET_DELETD_USER_GROUP_LIST", true);
            }
            catch (Exception)
            {
                throw;
            }
            return dt;
        }
    }
}
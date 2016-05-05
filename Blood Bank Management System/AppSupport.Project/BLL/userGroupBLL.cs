using AppSupport.Project.DLL;
using AppSupport.Tech;
using System;
using System.Data;

namespace AppSupport.Project.BLL
{
    public class userGroupBLL
    {
        public string UserGroupName { get; set; }
        public string Description { get; set; }

        public bool createUserGroup()
        {
            bool status = false;
            userGroupDLL usergroupDll = new userGroupDLL();
            DBplayer db = new DBplayer();
            try
            {
                db.Start();
                status = usergroupDll.createUserGroup(db, this);
                db.Stop();
            }
            catch (Exception)
            {
                throw;
            }
            return status;
        }

        public DataTable getUserGroupList()
        {
            DataTable dt = new DataTable();
            userGroupDLL usergroupDll = new userGroupDLL();
            DBplayer db = new DBplayer();
            try
            {
                db.Start();
                dt = usergroupDll.getUserList(db);
                db.Stop();
            }
            catch (Exception)
            {
                throw;
            }
            return dt;
        }

        public DataTable getUserDetailById(string GroupId)
        {
            DataTable dt = new DataTable();
            userGroupDLL usergroupDll = new userGroupDLL();
            DBplayer db = new DBplayer();
            try
            {
                db.Start();
                dt = usergroupDll.getUserDetailsById(db, GroupId);
                db.Stop();
            }
            catch (Exception)
            {
                throw;
            }
            return dt;
        }

        public DataTable getUseroupinfoById(string userGroupid)
        {
            DataTable dt = new DataTable();
            userGroupDLL usergroupdll = new userGroupDLL();
            DBplayer db = new DBplayer();
            try
            {
                db.Start();
                dt = usergroupdll.getUserGroupInfoById(userGroupid, db);
                db.Stop();
            }
            catch (Exception)
            {
                throw;
            }
            return dt;
        }

        public bool updateUserGroupById(string userGroupId)
        {
            bool st = false;
            userGroupDLL usergroupdll = new userGroupDLL();
            DBplayer db = new DBplayer();
            try
            {
                db.Start();
                st = usergroupdll.updateUserGroup(userGroupId, db, this);
                db.Stop();
            }
            catch (Exception)
            {
                throw;
            }
            return st;
        }

        public bool activateUserGroupById(string userGroupId)
        {
            bool st = false;
            try
            {
                userGroupDLL usergroupDll = new userGroupDLL();
                DBplayer db = new DBplayer();
                db.Start();
                st = usergroupDll.ActivateUserGroupById(userGroupId, db);

                db.Stop();
            }
            catch (Exception)
            {
                throw;
            }
            return st;
        }

        public bool DeactivateUserGroupById(string userGroupId)
        {
            bool st = false;
            try
            {
                userGroupDLL usergroupDll = new userGroupDLL();
                DBplayer db = new DBplayer();
                db.Start();
                st = usergroupDll.DeactivateUserGroupById(userGroupId, db);

                db.Stop();
            }
            catch (Exception)
            {
                throw;
            }
            return st;
        }

        public bool DeleteUserGroupById(string userGroupId)
        {
            bool st = false;
            try
            {
                userGroupDLL usergroupDll = new userGroupDLL();
                DBplayer db = new DBplayer();
                db.Start();
                st = usergroupDll.DeleteUserGroupById(userGroupId, db);

                db.Stop();
            }
            catch
            {
                throw;
            }
            return st;
        }

        public DataTable getDeletedUserGroupList()
        {
            DataTable dt = new DataTable();
            userGroupDLL usergroupDll = new userGroupDLL();
            DBplayer db = new DBplayer();
            try
            {
                db.Start();
                dt = usergroupDll.getDeletdUserList(db);
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
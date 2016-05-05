using AppSupport.Project.DLL;
using AppSupport.Tech;
using System;
using System.Data;

namespace AppSupport.Project.BLL
{
    public class MakePostForBloodBLL
    {
        public string bloodGroup { get; set; }

        public DateTime lastDate { get; set; }

        public string description { get; set; }

        public string interNalUserId { get; set; }

        public string Name { get; set; }

        public string contactNumber { get; set; }

        public string Location { get; set; }

        public bool savePostForBlood()
        {
            try
            {
                bool st = false;
                MakePostForBloodDLL makepostForBlood = new MakePostForBloodDLL();
                DBplayer db = new DBplayer();
                db.Start();
                st = makepostForBlood.savePostForBlood(db, this);
                db.Stop();
                return st;
            }
            catch (Exception)
            {
                throw;
            }
        }

        public DataTable getPostOfMySelfById(string userId)
        {
            try
            {
                DataTable dt = new DataTable();
                MakePostForBloodDLL makePOstForBlood = new MakePostForBloodDLL();
                DBplayer db = new DBplayer();

                db.Start();
                dt = makePOstForBlood.getPostOfMySelfById(db, userId);
                db.Stop();
                return dt;
            }
            catch (Exception)
            {
                throw;
            }
        }

        public bool deletePostById(string Serial)
        {
            try
            {
                bool st = false;
                MakePostForBloodDLL makePostForBlood = new MakePostForBloodDLL();
                DBplayer db = new DBplayer();
                db.Start();
                st = makePostForBlood.DeletePostById(Serial, db);
                db.Stop();
                return st;
            }
            catch (Exception)
            {
                throw;
            }
        }

        public DataTable getPostDetailsByPostSerial(string postSerial)
        {
            try
            {
                DataTable dt = new DataTable();
                MakePostForBloodDLL makePOstForBlood = new MakePostForBloodDLL();
                DBplayer db = new DBplayer();
                db.Start();
                dt = makePOstForBlood.GetPostDetailsByPostSerial(db, postSerial);
                db.Stop();
                return dt;
            }
            catch (Exception)
            {
                throw;
            }
        }

        public bool UpdatePostForBloodByPostId(string postSerial)
        {
            try
            {
                bool st = false;
                MakePostForBloodDLL makePostForBlood = new MakePostForBloodDLL();
                DBplayer db = new DBplayer();
                db.Start();
                st = makePostForBlood.UpdatePostForBloodByPostId(db, this, postSerial);
                db.Stop();
                return st;
            }
            catch (Exception)
            {
                throw;
            }
        }

        public DataTable getImageUrlByUserId(string userId)
        {
            DataTable dt = new DataTable();
            try
            {
                DBplayer db = new DBplayer();
                MakePostForBloodDLL makePostForBlood = new MakePostForBloodDLL();
                db.Start();
                dt = makePostForBlood.getImageUrlByUserId(db, userId);
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
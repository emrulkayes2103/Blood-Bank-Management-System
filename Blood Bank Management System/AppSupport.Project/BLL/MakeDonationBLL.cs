using AppSupport.Project.DLL;
using AppSupport.Tech;
using System;
using System.Data;

namespace AppSupport.Project.BLL
{
    public class MakeDonationBLL
    {
        public string Location { get; set; }

        public string bloodGrp { get; set; }

        public int Age { get; set; }

        public string Status { get; set; }

        public string gender { get; set; }

        public bool MakeDonation(MakeDonationBLL makeDonationBll)
        {
            bool st = false;
            try
            {
                DBplayer db = new DBplayer();
                MakeDonationDLL makeDonationDll = new MakeDonationDLL();
                db.Start();
                st = makeDonationDll.MakeDonation(db, makeDonationBll);
                db.Stop();
            }
            catch (Exception)
            {
                throw;
            }
            return st;
        }

        public static DataTable GetDonationHistoryById(string UserId)
        {
            DataTable dt = new DataTable();
            try
            {
                DBplayer db = new DBplayer();
                MakeDonationDLL makeDonationDll = new MakeDonationDLL();
                db.Start();
                dt = makeDonationDll.GetDonbationHistory(UserId, db);
                db.Stop();
            }
            catch (Exception)
            {
                throw;
            }
            return dt;
        }

        public bool DeleteDonationHistory(string DonationId)
        {
            bool st = false;
            try
            {
                DBplayer db = new DBplayer();
                MakeDonationDLL makeDonationDll = new MakeDonationDLL();
                db.Start();
                st = makeDonationDll.DeleteDonationHistory(DonationId, db);
                db.Stop();
            }
            catch (Exception)
            {
                throw;
            }
            return st;
        }

        public DataTable LoadDonationById(string DonationId)
        {
            DataTable dt = new DataTable();
            try
            {
                DBplayer db = new DBplayer();
                MakeDonationDLL makeDonationDll = new MakeDonationDLL();

                db.Start();
                dt = makeDonationDll.loadDonationById(DonationId, db);
                db.Stop();
            }
            catch (Exception)
            {
                throw;
            }
            return dt;
        }

        public bool UpdateMakeDonation(MakeDonationBLL makeDonationBll, string Id)
        {
            bool st = false;
            try
            {
                DBplayer db = new DBplayer();
                MakeDonationDLL makeDonationDll = new MakeDonationDLL();
                db.Start();
                st = makeDonationDll.UpdateMakeDonation(makeDonationBll, db, Id);
                db.Stop();
            }
            catch (Exception)
            {
                throw;
            }
            return st;
        }

        public DateTime? donationDate { get; set; }

        public bool checkPreviuosDuration(string userId, DateTime? donationDate)
        {
            bool st = false;
            try
            {
                DBplayer db = new DBplayer();
                MakeDonationDLL makeDonationDll = new MakeDonationDLL();
                db.Start();
                st = makeDonationDll.CheckPreviousDuration(db, userId, donationDate);
                db.Stop();
            }
            catch (Exception)
            {
                throw;
            }
            return st;
        }
    }
}
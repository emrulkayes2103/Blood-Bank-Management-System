using AppSupport.Project.DLL;
using AppSupport.Tech;
using System;
using System.Data;

namespace AppSupport.Project.BLL
{
    public class DonorBLL
    {
        public DataTable getDonorList(string userType)
        {
            DataTable dt = new DataTable();
            try
            {
                DBplayer db = new DBplayer();
                DonorDLL donorDll = new DonorDLL();

                db.Start();
                dt = donorDll.getDonorList(db, userType);
                db.Stop();
            }
            catch (Exception)
            {
                throw;
            }
            return dt;
        }

        public string bloodGroup { get; set; }

        public string Division { get; set; }

        public string location { get; set; }

        public DataTable GetDonorListByFilterd(DonorBLL donorBll)
        {
            DataTable dt = new DataTable();
            try
            {
                DBplayer db = new DBplayer();
                DonorDLL donorDll = new DonorDLL();
                db.Start();
                dt = donorDll.GetDonorListByFiltered(this, db);
                db.Stop();
            }
            catch (Exception)
            {
                throw;
            }
            return dt;
        }

        public DataTable getDonorLIstForFBByFiltering(DonorBLL donorBll)
        {
            DataTable dt = new DataTable();
            try
            {
                DBplayer db = new DBplayer();
                DonorDLL donorDll = new DonorDLL();
                db.Start();
                dt = donorDll.GetDonorListForFBByFiltered(this, db);
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
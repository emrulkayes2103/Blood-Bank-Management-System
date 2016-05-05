using AppSupport.Project.DLL;
using AppSupport.Tech;
using System;

namespace AppSupport.Project.BLL
{
    public class EditProfileBLL
    {
        public string Name { get; set; }

        public DateTime DOB { get; set; }

        public string ContactNumber { get; set; }

        public string Gender { get; set; }

        public string bloodGroup { get; set; }

        public string nationality { get; set; }

        public string NationalID { get; set; }

        public string perManentAdd { get; set; }

        public string presentAdd { get; set; }

        public string FathersName { get; set; }

        public string motherName { get; set; }

        public string profileImage { get; set; }

        public bool UpdateUser(string serial)
        {
            bool st = false;
            EditProfileDLL editProfileDll = new EditProfileDLL();
            DBplayer db = new DBplayer();
            try
            {
                db.Start();
                st = editProfileDll.updateUser(db, this, serial);
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
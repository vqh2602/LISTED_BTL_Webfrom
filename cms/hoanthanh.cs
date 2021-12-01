using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Xml.Serialization;

namespace LISTED.cms
{

    public class hoanthanh
    {
        //đối tượng lớp học

        private string mabaikiemtra; // mã bai ktra
        private string masv;
        private int check; // check da lam hay chua 0-chua 1- da lam
        private string time_lam;
        private string time_done;
        public hoanthanh() { }

        public string Mabaikiemtra { get => mabaikiemtra; set => mabaikiemtra = value; }
        public string Masv { get => masv; set => masv = value; }
        public int Check{ get => check; set => check = value; }

        public string Time_lam { get => time_lam; set => time_lam = value; }
        public string Time_done { get => time_done; set => time_done = value; }
    }
}
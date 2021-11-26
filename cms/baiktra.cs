using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Xml.Serialization;

namespace LISTED.cms
{

    public class baiktra
    {
        //đối tượng lớp học

        private string malophoc; // mã lớp
        private string mabaiktra; // mã giáo viên
        private string tenbaiktra;
        private int thoigian;
      
        public baiktra() { }

        public string Malophoc { get => malophoc; set => malophoc = value; }
        public string Mabaiktra { get => mabaiktra; set => mabaiktra = value; }
        public string Tenbaiktra { get => tenbaiktra; set => tenbaiktra = value; }
        public int Thoigian { get => thoigian; set => thoigian = value; }
       
    }
}
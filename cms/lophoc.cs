using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Xml.Serialization;

namespace LISTED.cms
{

    public class lophoc
    {
        //đối tượng lớp học

        private string malop; // mã lớp
        private string magv; // mã giáo viên
        private string tenlop;
        private string tengv;
        private string dshs; // mã danh sách hs
        public lophoc() { }

        public string Malop { get => malop; set => malop = value; }
        public string Magv { get => magv; set => magv = value; }
        public string Dshs { get => dshs; set => dshs = value; }
        public string Tenlop { get => tenlop; set => tenlop = value; }
        public string Tengv { get => tengv; set => tengv = value; }
    }
}
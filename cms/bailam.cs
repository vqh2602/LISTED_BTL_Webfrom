using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Xml.Serialization;

namespace LISTED.cms
{

    public class bailam
    {
        //đối tượng lớp học

        private string mabaikiemtra; // mã bai ktra
        private string tencauhoi; // ten cau hoi
        private string datrue; //d,an dung
        private string a; // d.an sai
        private string b;
        private string c;
        private string d;
        private string masv;
        private string dasvchon; // d.an sv chọn
        private int id; // só tt cau hoi
        private int diem; // diem cua cau hoi

        public bailam() { }

        public string Mabaikiemtra { get => mabaikiemtra; set => mabaikiemtra = value; }
        public string Tencauhoi { get => tencauhoi; set => tencauhoi = value; }
        public string DaTrue { get => datrue; set => datrue = value; }
        public string A { get => a; set => a = value; }
        public string B { get => b; set => b = value; }
        public string C { get => c; set => c = value; }
        public string D { get => d; set => d = value; }
        public string Masv { get => masv; set => masv = value; }
        public string Dasvchon { get => dasvchon; set => dasvchon = value; }
        public int Id { get => id; set => id = value; }
        public int Diem { get => diem; set => diem = value; }
    }
}
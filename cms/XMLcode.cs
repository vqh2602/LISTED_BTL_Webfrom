using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Xml.Serialization;
using LISTED.cms;

namespace LISTED.cms
{
    public class XMLcode
    {


        //doc ds hoc sinh  file student.xml
        public static List<student> getListStudent(String path)
        {
            List<student> list;
            // Đọc file
            XmlSerializer reader = new XmlSerializer(typeof(List<student>));
            StreamReader file = new StreamReader(path);
            list = (List<student>)reader.Deserialize(file);
            file.Close();
            return list;

        }

        // thêm hoc sinh
        public static bool AddMemberToList(student member, String path)
        {
            bool test = false;
            List<student> list = getListStudent(path);
            //List < User > list = new List<User>();
            foreach (student u in list)
            {
                if (u.Username == member.Username || u.Email == member.Email || u.Studentcode == member.Studentcode)
                {
                    test = true;
                    break;
                }
            }
            if (test == false)
            {
                list.Add(member);
                XmlSerializer writer = new XmlSerializer(typeof(List<student>));
                FileStream _file = File.Create(path);
                writer.Serialize(_file, list);
                _file.Close();
                return true;
            }
            
            return false;
        }



    


        //doc ds lớp học  file lophoc.xml
        public static List<lophoc> getListLophoc(String path)
        {
            List<lophoc> list;
            // Đọc file
            XmlSerializer reader = new XmlSerializer(typeof(List<lophoc>));
            StreamReader file = new StreamReader(path);
            list = (List<lophoc>)reader.Deserialize(file);
            file.Close();
            return list;

        }


        //doc ds baiktra file lophoc.xml
        public static List<baiktra> getListBaiktra(String path)
        {
            List<baiktra> list1;
            // Đọc file
            XmlSerializer reader = new XmlSerializer(typeof(List<baiktra>));
            StreamReader file = new StreamReader(path);
            list1 = (List<baiktra>)reader.Deserialize(file);
            file.Close();
            return list1;

        }



        //doc ds trac nghiem file tracnghiem.xml
        public static List<tracnghiem> getListTracnghiem(String path)
        {
            List<tracnghiem> list1;
            // Đọc file
            XmlSerializer reader = new XmlSerializer(typeof(List<tracnghiem>));
            StreamReader file = new StreamReader(path);
            list1 = (List<tracnghiem>)reader.Deserialize(file);
            file.Close();
            return list1;

        }

        // get by student id...
        public static List<bailam> getListBailam(String path)
        {
            List<bailam> list1;
            // Đọc file
            XmlSerializer reader = new XmlSerializer(typeof(List<bailam>));
            StreamReader file = new StreamReader(path);
            list1 = (List<bailam>)reader.Deserialize(file);

            file.Close();
            return list1;

        }


        public static List<hoanthanh> getListHoanthanh(String path)
        {
            List<hoanthanh> list1;
            // Đọc file
            XmlSerializer reader = new XmlSerializer(typeof(List<hoanthanh>));
            StreamReader file = new StreamReader(path);
            list1 = (List<hoanthanh>)reader.Deserialize(file);

            file.Close();
            return list1;

        }
        //public static List<bailam> getListBailamByStudentIDandTestID(String path,String path2,string studentID, string mabaiktra)
        //{
        //    List<bailam> list1 = getListBailam(path);


        //    List<tracnghiem> list_tracnghiem = getListTracnghiem(path2);
        //     List<bailam> list2 = new List<bailam>();

        //    foreach (tracnghiem t in list_tracnghiem)
        //    {
        //        if(t.Mabaikiemtra.Equals(mabaiktra)){
        //            bailam bl = new bailam();
        //            bl.Mabaikiemtra = mabaiktra;
        //            bl.Masv = studentID;
        //            bl.Id = t.Id;
        //            bl.Tencauhoi = t.Tencauhoi;
        //            bl.A = t.A;
        //            bl.B = t.B;
        //            bl.C = t.C;
        //            bl.D = t.D;
        //            bl.DaTrue = t.DaTrue;
        //            bl.Diem = t.Diem;
        //            bl.Dasvchon = "";
        //            bl.Thoigianlambai = 0;
        //            list2.Add(bl);
        //        }
        //    }

        //    XmlSerializer writer = new XmlSerializer(typeof(List<bailam>));
        //    FileStream _file = File.Create(path);
        //    writer.Serialize(_file, list2);
        //    _file.Close();

        //    return list2;

        //}

        //doc ds ket qua file ketqua.xml
        //public static List<ketqua> getListKetqua(String path)
        //{
        //    List<ketqua> list1;
        //    // Đọc file
        //    XmlSerializer reader = new XmlSerializer(typeof(List<ketqua>));
        //    StreamReader file = new StreamReader(path);
        //    list1 = (List<ketqua>)reader.Deserialize(file);
        //    file.Close();
        //    return list1;

        //}

    }
}
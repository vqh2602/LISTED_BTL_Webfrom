using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Xml.Serialization;

namespace LISTED.cms
{
    public class XMLcode
    {


        //hoc sinh doc file xml
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
    }
}
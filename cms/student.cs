using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Xml.Serialization;

namespace LISTED.cms
{
   
    public class student
    {
        private string fistname;
        private string lastname;
        private string username;
        private string email;
        private string studentcode;
        private string passw;
         public student() { }

        public string Fistname { get => fistname; set => fistname = value; }
        public string Lastname { get => lastname; set => lastname = value; }
        public string Username { get => username; set => username = value; }
        public string Email { get => email; set => email = value; }
        public string Studentcode { get => studentcode; set => studentcode = value; }

        public string Passw { get => passw; set => passw = value; }
    }
}
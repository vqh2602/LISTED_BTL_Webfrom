using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Serialization;
using LISTED.cms;
namespace LISTED
{
    public partial class Thongtintaikhoan : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if ((bool)Session["login"] == true)
            {
                xinchao.InnerText = "Xin Chào: " + Session["lastname"]+ " "+ Session["fistname"] ;
                thongtin_email.InnerText = "Email: " + Session["email"];
                thongtin_stundentcode.InnerText = "Mã sinh viên: " + Session["studentcode"];
                thongtin_username.InnerText = "Username: " + Session["username"];


            }
            else { Response.Redirect("Dangnhap.aspx"); }
        }



        protected void Dangxuat(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("Dangnhap.aspx");
        }

        // hiện display đổi tên
        protected void addkh(object sender, EventArgs e)
        {
            thongtin_khachhang_thaydoi.Style["display"] = "block";
            thongtin_khachhang_thaydoipass.Style["display"] = "none";
        }

        // hiện display đổi pass
        protected void addpass(object sender, EventArgs e)
        {
            thongtin_khachhang_thaydoi.Style["display"] = "none";
            thongtin_khachhang_thaydoipass.Style["display"] = "block";
        }

        // đổi tên
        protected void change_name(object sender, EventArgs e)
        {

            string path = Server.MapPath("~/Data/Student.xml");
            List<student> list = XMLcode.getListStudent(path);

            string username = (string)Session["username"];
            String Fistnamenew = Request.Form["Fistname"];
            String Lastnamenew = Request.Form["Lastname"];
            bool test = false;
            if (Fistnamenew != "" && Lastnamenew != "")
            {
                foreach (student u in list)
                {
                    if (u.Username.Equals(username))
                    {
                        u.Fistname = Fistnamenew;
                        u.Lastname = Lastnamenew;

                        XmlSerializer writer = new XmlSerializer(typeof(List<student>));
                        FileStream _file = File.Create(path);
                        writer.Serialize(_file, list);
                        _file.Close();

                        // cập nhat sesion
                        Session["fistname"] = Fistnamenew;
                        Session["lastname"] = Lastnamenew;
                        test = true;
                    }
                }
            }
            else
            {
                Response.Write("<script> alert('Không để trống nội dung.'); </script>");
            }

            if (test == true)
            {
                Response.Write("<script> alert('Thành Công.'); </script>");
                Response.Redirect(Request.Url.AbsoluteUri);
            }
            else
            {
                Response.Write("<script> alert('Không Thành Công.'); </script>");
            }


        }

        // đổi pass
        protected void change_pass(object sender, EventArgs e)
        {


            string path = Server.MapPath("~/Data/Student.xml");
            List<student> list = XMLcode.getListStudent(path);

            string username = (string)Session["username"];
            String passold = Request.Form["passold"];
            String passnew = Request.Form["passnew"];
            bool test = false;
            if (passold != "" && passnew != "")
            {
                foreach (student u in list)
                {
                    if (u.Username.Equals(username) && u.Passw.Equals(passold))
                    {
                       

                        u.Passw = passnew;

                        XmlSerializer writer = new XmlSerializer(typeof(List<student>));
                        FileStream _file = File.Create(path);
                        writer.Serialize(_file, list);
                        _file.Close();

                        // cập nhat sesion

                        test = true;
                    }
                }
            }
            else
            {
                Response.Write("<script> alert('Không để trống nội dung.'); </script>");
            }

            if (test == true)
            {
                Response.Write("<script> alert('Thành Công.'); </script>");
                Response.Redirect(Request.Url.AbsoluteUri);
            }
            else
            {
                Response.Write("<script> alert('Không Thành Công.'); </script>");
            }


        }



    }
}
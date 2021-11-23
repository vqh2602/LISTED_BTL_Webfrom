using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using LISTED.cms;

namespace LISTED
{
    public partial class Dangki : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {


             if ((bool)Session["login"] == true)
             {
                 Response.Redirect("Home.aspx");
             } 

      
        }
        protected void SignUp_Click(object sender, EventArgs e)
        {

            string fistname = Request.Form["fistname"];
            string lastname = Request.Form["lastname"];
            string username = Request.Form["username"];
            string email = Request.Form["email"];
            string studentcode = Request.Form["studentcode"];
            string passw = Request.Form["passw"];

            if (fistname!= "" && lastname != "" && email != "" && username != "" && studentcode != "" && passw != "")
            {
                student user = new student();
                user.Fistname = fistname;
                user.Lastname = lastname;
                user.Username = username;
                user.Email = email;
                user.Studentcode = studentcode;
                user.Passw = passw;

                string path = Server.MapPath("~/Data/Student.xml");
                if (XMLcode.AddMemberToList(user, path))
                {
                    Response.Write("<script> var result = confirm('Đăng kí hoàn tất! bạn có muốn đăng nhập?');if (result){window.location='Dangnhap.aspx';}else{alert('ok!');} </script>");
                    //Response.Redirect("LogIn.aspx");
                }
                else
                {
                    Response.Write("<script> alert('Lỗi đăng kí!. email hoặc username, mã sinh viên đã tồn tại'); </script>");
                }
            }
            else { Response.Write("<script> alert('Lỗi đăng kí!. không được để trống thông tin'); </script>"); }

        }

    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using LISTED.cms;

namespace LISTED
{
    public partial class Dangnhap : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if ((bool)Session["login"] == true)
            {
                Response.Redirect("Home.aspx");
            }
        }
        //dang nhap
        protected void Submit_Click(object sender, EventArgs e)
        {
            string path = Server.MapPath("~/Data/Student.xml");
            List<student> list = XMLcode.getListStudent(path);

            string username = Request.Form["username"];
            string passw = Request.Form["passw"];

            int x = 0;
            for (int i = 0; i < list.Count; i++)
            {
                if (list[i].Username == username && list[i].Passw== passw)
                {
                    //Tạo session
                    Session["login"] = true;
                    Session["studentcode"] = list[i].Studentcode;
                    // Session["password"] = list[i].Password;
                    Session["fistname"] = list[i].Fistname;
                    Session["lastname"] = list[i].Lastname;
           
                    Response.Redirect("Home.aspx");
                    x = 0;

                }
                else
                {
                    x = 1;

                }
            }
            if (x == 1)
            {
                Response.Write("<script> alert('Tài khoản không hợp lệ! Mời nhập lại.'); </script>");
            }

            if ((bool)Session["login"] == true)
            {

                Response.Redirect("Home.aspx");
            }

        }

    }
}
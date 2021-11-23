using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LISTED
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if ((bool)Session["login"] == true)
            {
                head_user.InnerHtml = "<a href='#' > Xin chào: " + Session["fistname"] +"</a>";
            }
            else
            {
               head_user.InnerHtml = "<a href='Dangnhap.aspx'> Login / Signup </a>";
            }
        }
    }
}
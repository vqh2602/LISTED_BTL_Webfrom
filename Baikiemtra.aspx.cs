using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using LISTED.cms;

namespace LISTED
{
    public partial class Baikiemtra : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {    // lấy ds lớp học
              

            if ((bool)Session["login"] == true)
            {

                h3_tenlop.InnerText = "Những bài kiểm tra có trong lớp: "+ Request.QueryString["id"];

                String path = Server.MapPath("~/Data/Baiktra.xml");
                List<baiktra> bkt = XMLcode.getListBaiktra(path);
                List<baiktra> bktfilter = new List<baiktra>();

                foreach(baiktra u in bkt)
                {
                    if (u.Malophoc.Equals(Request.QueryString["id"]))
                    {
                        bktfilter.Add(u);
                    }
                }
                ListViewbaiktra.DataSource = bktfilter;
                ListViewbaiktra.DataBind();

            }
            else { Response.Redirect("Dangnhap.aspx"); }

        }
    }
}
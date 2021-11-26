using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using LISTED.cms;
namespace LISTED
{
    public partial class Home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if ((bool)Session["login"] == true)
            {
                
                // lấy ds lớp học
            String path = Server.MapPath("~/Data/Lophoc.xml");
            List<lophoc> lophoc = XMLcode.getListLophoc(path);
             List<lophoc> lophocfilter = new List<lophoc>();

  

                // lọc ds hs đăng nhạp đang thuộc ds nào
             
                foreach(lophoc u in lophoc)
                {
#pragma warning disable CS0253 // Possible unintended reference comparison; right hand side needs cast
                    if (u.Dshs.Equals( Session["studentcode"]))
#pragma warning restore CS0253 // Possible unintended reference comparison; right hand side needs cast
                    {
                        lophocfilter.Add(u);
                    }
                }

                // kiểm tra những lớp nào có ds đó.
               /* for(int i=0;i<lophoc.Count; i++)
                {
                    for(int j = 0; j < dshs_filter.Count; j++)
                    {
                        if(lophoc[i].Dshs == dshs_filter[j])
                        {
                            lophocfilter.Add(lophoc[i]);
                        }
                    }
                } */

                ListViewlophoc.DataSource = lophocfilter;
                ListViewlophoc.DataBind();

            }
            else { Response.Redirect("Dangnhap.aspx"); }


            
        }
    }
}
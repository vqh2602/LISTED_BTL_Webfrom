using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Script.Services;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Serialization;
using LISTED.cms;

namespace LISTED
{
    public partial class Tracnghiem : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {


            if ((bool)Session["login"] == true)
            {
                 // lấy thời gian làm bài
                    int time = 0;
                    String path = Server.MapPath("~/Data/Baiktra.xml");
                    List<baiktra> bkt = XMLcode.getListBaiktra(path);

                    foreach (baiktra u in bkt)
                    {
                        if (u.Mabaiktra.Equals(Request.QueryString["id"]))
                        {
                            thoigian_lambai.InnerText = "Thời gian: " + u.Thoigian + " phút.";
                            time = u.Thoigian;
                            break;
                        }
                    }

                if (!IsPostBack)
                {
                

                    // hoàn thành
                    string path2 = Server.MapPath("~/Data/Hoanthanh.xml");
                    List<hoanthanh> list_hoanthanh = XMLcode.getListHoanthanh(path2);
                    int check = 0;
                    foreach (hoanthanh ht in list_hoanthanh)
                    {
                        if (ht.Check == 1 && ht.Mabaikiemtra.Equals(Request.QueryString["id"]) && ht.Masv.Equals((string)Session["studentcode"]))
                        {
                            // đa lam kiem tra
                            check = 1;
                            //Response.Redirect("Home.aspx");
                            Response.Write("<script> alert('Bạn đã nộp bài rồi!'); </script>");

                            btn_nopbai.Style.Add("Display", "none");

                            // hiện thoi gian nộp bài và làm bài
                            p_tglambai.InnerText = "Thời gian làm bài: "+ ht.Time_lam;
                            p_tgnopbai.InnerText = "Thời gian nộp bài: "+ht.Time_done;

                            DateTime d1 = Convert.ToDateTime(ht.Time_lam);
                            DateTime d2 = Convert.ToDateTime(ht.Time_done);
                            TimeSpan Time = d2 - d1;
                            int time1 = (int)Time.TotalMinutes;
                            if(time - time1 >= 0)
                            {
                                p_thoigian_sommuon.InnerText = "Nộp sớm: " + (time-time1) + " phút";
                            }
                            else
                            {
                                p_thoigian_sommuon.InnerText = "Nộp muộn: " + (time-time1) + " phút";
                            }



                            string path4 = Server.MapPath("~/Data/Bailam.xml");
                            List<bailam> list_bailam_kq = XMLcode.getListBailam(path4);
                            int diem = 0;
                            foreach(bailam bl in list_bailam_kq)
                            {
                                if (bl.Dasvchon.Equals(bl.DaTrue))
                                {
                                    diem += bl.Diem;
                                }
                            }
                            h1_kq.InnerText = "Kết quả: " + diem;
                            ListView_kq.DataSource = list_bailam_kq;
                            ListView_kq.DataBind();

                        }
                    }

                    if (check == 0)
                    {
                        tt_lambai.InnerText = "Thời gian bắt đầu làm bài: " + DateTime.Now.ToString();

                     

                        hoanthanh ht1 = new hoanthanh();
                        ht1.Mabaikiemtra = Request.QueryString["id"];
                        ht1.Masv = (string)Session["studentcode"];
                        ht1.Check = 0;
                        ht1.Time_lam = DateTime.Now.ToString();
                        ht1.Time_done = "";
                        list_hoanthanh.Add(ht1);

                        XmlSerializer writer1 = new XmlSerializer(typeof(List<hoanthanh>));
                        FileStream _file1 = File.Create(path2);
                        writer1.Serialize(_file1, list_hoanthanh);
                        _file1.Close();

                        // thêm dữ liệu
                        string path3 = Server.MapPath("~/Data/Tracnghiem.xml");
                        List<tracnghiem> list_tracnghiem = XMLcode.getListTracnghiem(path3);
                        List<tracnghiem> list_tracnghiem_filter = new List<tracnghiem>();

                        //List<bailam> list_bailam = XMLcode.getListBailamByStudentIDandTestID(path, (string)Session["studentcode"], Request.QueryString["id"]);
                        //    string a = "";

                        foreach (tracnghiem u in list_tracnghiem)
                        {
                            if (u.Mabaikiemtra.Equals(Request.QueryString["id"]/*"MHN0001"*/))
                            {
                                //  a += sapxepdapan(u.Stt, u.Tencauhoi, u.DaTrue, u.DaFalse1, u.DaFalse2, u.DaFalse3);


                                list_tracnghiem_filter.Add(u);

                            }
                        }

                        string path1 = Server.MapPath("~/Data/Bailam.xml");
                        List<bailam> list_bailam = XMLcode.getListBailam(path1);
                        foreach (tracnghiem tn in list_tracnghiem_filter)
                        {
                            bailam bl = new bailam();
                            bl.Mabaikiemtra = tn.Mabaikiemtra;
                            bl.Id = tn.Id;
                            bl.Tencauhoi = tn.Tencauhoi;
                            bl.A = tn.A;
                            bl.B = tn.B;
                            bl.C = tn.C;
                            bl.D = tn.D;
                            bl.DaTrue = tn.DaTrue;
                            bl.Masv = (string)Session["studentcode"]/*"19a10010220"*/;
                            bl.Dasvchon = "0";
                            bl.Diem = tn.Diem;

                            list_bailam.Add(bl);
                        }

                        XmlSerializer writer = new XmlSerializer(typeof(List<bailam>));
                        FileStream _file = File.Create(path1);
                        writer.Serialize(_file, list_bailam);
                        _file.Close();

                        ListView_tracnghiem.DataSource = list_bailam;
                        ListView_tracnghiem.DataBind();
                    }
                
             }



                    
                


         

            }
            else { Response.Redirect("Dangnhap.aspx"); }




        }



        [WebMethod]
        [ScriptMethod]
        public static void TraLoi(string masv,int id,string dapansv)
        {
            //System.Web.HttpContext.Current.Server.MapPath("~/Data/Bailam.xml");
            string path2 = System.Web.HttpContext.Current.Server.MapPath("~/Data/Bailam.xml");
            //List<tracnghiem> list_tracnghiem = XMLcode.getListTracnghiem(path);
            //    List<tracnghiem> list_tracnghiem_filter = new List<tracnghiem>();
            List<bailam> list_bailam = XMLcode.getListBailam(path2);
         
            foreach(bailam bl in list_bailam)
            {
                
                if (bl.Id == id && bl.Masv.Equals(masv)) 
                {
                    bl.Dasvchon = dapansv;
                    break;
                }
            }


            XmlSerializer writer = new XmlSerializer(typeof(List<bailam>));
            FileStream _file = File.Create(path2);
            writer.Serialize(_file, list_bailam);
            _file.Close();
        }



        protected void Check_Hoanthanh(object sender, EventArgs e)
        {
            btn_nopbai.Style.Add("Display", "none");

            string path2 = Server.MapPath("~/Data/HoanThanh.xml");
            List<hoanthanh> list_hoanthanh = XMLcode.getListHoanthanh(path2);
            foreach (hoanthanh ht in list_hoanthanh)
            {
                if (ht.Mabaikiemtra.Equals(Request.QueryString["id"]) && ht.Masv.Equals((string)Session["studentcode"]))
                {
                    ht.Check = 1;
                   ht.Time_done = DateTime.Now.ToString();
                    break;
                }
            } 
                    XmlSerializer writer1 = new XmlSerializer(typeof(List<hoanthanh>));
                    FileStream _file1 = File.Create(path2);
                    writer1.Serialize(_file1, list_hoanthanh);
                    _file1.Close();

            Page.Response.Redirect(Page.Request.Url.ToString(), true);
        }

  

     

        //string sapxepdapan(int i, string tencauhoi, string datrue, string dafalse1, string dafalse2, string dafalse3)
        //{
        //    string a = "";
        //    switch (i)
        //    {
        //        case 1:
        //            a= "<div class='info_classroom_min'>  <h4>Câu hỏi: " +
        //            tencauhoi + "</h4><div class='cauhoi_container'>" +
        //            "<label><input type = 'radio' name = '" +tencauhoi +
        //            "' value = '1' />" + datrue + "</label >" +
        //            "<label><input type = 'radio' name = '" + tencauhoi +
        //            "' value = '0' />" + dafalse1 + "</label >" +
        //            "<label><input type = 'radio' name = '" + tencauhoi +
        //            "' value = '0' />" + dafalse2 + "</label >" +
        //            "<label><input type = 'radio' name = '" + tencauhoi +
        //            "' value = '0' />" + dafalse3 + "</label >";
        //            break;
        //        case 2:
        //            a = "<div class='info_classroom_min'>  <h4>Câu hỏi: " +
        //           tencauhoi + "</h4><div class='cauhoi_container'>" +
        //           "<label><input type = 'radio' name = '" + tencauhoi +
        //           "' value = '0' />" + dafalse1 + "</label >" +
        //           "<label><input type = 'radio' name = '" + tencauhoi +
        //           "' value = '1' />" + datrue + "</label >" +
        //           "<label><input type = 'radio' name = '" + tencauhoi +
        //           "' value = '0' />" + dafalse2 + "</label >" +
        //           "<label><input type = 'radio' name = '" + tencauhoi +
        //           "' value = '0' />" + dafalse3 + "</label >";
        //            break;

        //        case 3:
        //            a = "<div class='info_classroom_min'>  <h4>Câu hỏi: " +
        //           tencauhoi + "</h4><div class='cauhoi_container'>" +
        //           "<label><input type = 'radio' name = '" + tencauhoi +
        //           "' value = '0' />" + dafalse2 + "</label >" +
        //           "<label><input type = 'radio' name = '" + tencauhoi +
        //           "' value = '0' />" + dafalse1 + "</label >" +
        //           "<label><input type = 'radio' name = '" + tencauhoi +
        //           "' value = '1' />" + datrue + "</label >" +
        //           "<label><input type = 'radio' name = '" + tencauhoi +
        //           "' value = '0' />" + dafalse3 + "</label >";
        //            break;
        //        case 4:
        //            a = "<div class='info_classroom_min'>  <h4>Câu hỏi: " +
        //           tencauhoi + "</h4><div class='cauhoi_container'>" +
        //           "<label><input type = 'radio' name = '" + tencauhoi +
        //           "' value = '0' />" + dafalse3 + "</label >" +
        //           "<label><input type = 'radio' name = '" + tencauhoi +
        //           "' value = '0' />" + dafalse1 + "</label >" +
        //           "<label><input type = 'radio' name = '" + tencauhoi +
        //           "' value = '0' />" + dafalse2 + "</label >" +
        //           "<label><input type = 'radio' name = '" + tencauhoi +
        //           "' value = '1' />" + datrue + "</label >";
        //            break;

        //    };
        //    return  a;
        //}
    }
}
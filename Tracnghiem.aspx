<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Tracnghiem.aspx.cs" Inherits="LISTED.Tracnghiem" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        /* phần tìm kiếm */

        .search_container {
            background-image: url(./Master_style/img/header_bg.jpg);
            background-position: -25px -25px;
            /*background-size: cover;*/
            background-position: center center;
            min-height: 100px;
            height: 0vh;
            margin-bottom: 120px;
            display: flex;
            flex-direction: row;
            justify-content: center;
        }

            .search_container:before {
                content: "";
                background: rgba(0, 0, 0, .5);
                width: 100%;
                min-height: 100px;
                height: 0vh;
                z-index: 1;
                position: absolute;
                top: 0;
                left: 0;
                right: 0;
                bottom: 0;
            }

        /* lớp học */

        .classroom_container {
            width: 80%;
            margin: 20px auto;
            padding: 20px;
            border-top: solid 1px #e5e5e5;
            background-color: rgba(214,228,215,0.2);
            box-shadow: 0px 0px 15px 1px #d1d1d1;
        }

            .classroom_container > h3 {
                margin: 10px 0 10px 0;
                font-size: 20pt;
                font-family: 'Roboto-Regular';
            }

            .classroom_container > p {
                margin: 0 0 20px 0;
            }

        .list_rooms {
            border-top: solid 1px #e5e5e5;
            padding: 20px 0 0 0;
            /*display: grid;
            gap: 1.25em;
            grid-template-columns: repeat(3,minmax(0,1fr));*/
            display: flex;
            flex-direction: column;
        }

        .classroom {
            width: 100%;
            height: auto;
            /* border: solid 1px gray; */
            /* padding: 1px; */
            /* border-top: solid 1px #e5e5e5; */
            /* background-color: rgba(214,228,215,0.2); */
            box-shadow: 0px 0px 5px 1px #c6c6c6;
            border-radius: 10px;
        }
        /* .classroom::before{
    position: absolute;
	top: 0;
	left: -75%;
	z-index: 2;
	display: block;
	content: '';
	width: 50%;
	height: 100%;
	background: -webkit-linear-gradient(left, rgba(255,255,255,0) 0%, rgba(255,255,255,.3) 100%);
	background: linear-gradient(to right, rgba(255,255,255,0) 0%, rgba(255,255,255,.3) 100%);
	-webkit-transform: skewX(-25deg);
	transform: skewX(-25deg);
} */

        .classroom_min_img {
            position: relative;
            overflow: hidden;
        }

            .classroom_min_img:hover::before {
                -webkit-animation: shine .75s;
                animation: shine .75s;
            }

            .classroom_min_img::before {
                position: absolute;
                top: 0;
                left: -75%;
                z-index: 2;
                display: block;
                content: '';
                width: 50%;
                height: 100%;
                background: -webkit-linear-gradient(left, rgba(255,255,255,0) 0%, rgba(255,255,255,.3) 100%);
                background: linear-gradient(to right, rgba(255,255,255,0) 0%, rgba(255,255,255,.3) 100%);
                -webkit-transform: skewX(-25deg);
                transform: skewX(-25deg);
            }

        @-webkit-keyframes shine {
            100% {
                left: 125%;
            }
        }

        @keyframes shine {
            100% {
                left: 125%;
            }
        }

        .classroom_min_img > img {
            width: 100%;
            height: auto;
            object-fit: cover;
            object-position: 50% 50%;
            transition: all 1s;
            border-radius: 10px 10px 0 0;
        }

        .classroom_min_img:hover > img {
            -webkit-transform: scale(1.2);
            transform: scale(1.2);
        }
        /* .classroom>img{
    width: 100%;
    height: auto;
    object-fit: cover;
    object-position: 50% 50%;

}
.classroom>img:hover{
    -webkit-transform: scale(1.3);
	transform: scale(1.3);
} */

        .info_classroom {
            padding: 15px 15px 25px 15px;
            background: white;
            border-radius: 10px;
        }

            .info_classroom > h4 {
                color: black;
                font-size: 15pt;
            }

            .info_classroom > p {
                color: #666;
                margin: 10px 0;
            }

            .info_classroom > h5 {
                color: #666;
            }

        .info_classroom_min {
            margin: 22px 0px;
        }

        .cauhoi_container {
            display: flex;
            flex-direction: column;
        }

            .cauhoi_container > label {
                padding: 7px;
            }

            .btn_nopbai{
                padding:15px;
                background:#357a38;
                border-radius:20px;
                color:white;
            }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <!-- khu vực hiển thị tìm kiếm -->
    <div class="search_container">
    </div>

    <!-- khu vực hiển thị lớp học -->
    <div class="classroom_container" id="classroom_container" id="classroom_container">
        <h3 id="h3_tenlop" runat="server">Bài kiểm tra: </h3>
        <p id="thoigian_lambai" runat="server">Thời gian: ?? phút</p>
        <p id="tt_lambai" runat="server">Thời gian bắt đầu làm bài: 'Bạn đã nộp bài' </p>


        <p>Danh sách câu hỏi.</p>

        <asp:Button class="btn_nopbai" ID="btn_nopbai" runat="server" Text="Nộp Bài" onclick="Check_Hoanthanh"/>
        <div class="list_rooms">
            <from>

                <div class="info_classroom" id="List_tracngiem">


                    <asp:ListView ID="ListView_tracnghiem" runat="server">
                        <ItemTemplate>
                            <div class="info_classroom_min">
                                <h4>Câu hỏi: <%# Eval("tencauhoi") %></h4>

                                <div class="cauhoi_container">
                                    <label>
                                        <input type="radio" name="<%# Eval("tencauhoi") %>" value="A"
                                            onclick="Check_Click('<%# Eval("masv") %>',<%# Eval("id") %>,'A')" />
                                        A, <%# Eval("a") %>
                                    </label>
                                    <label>
                                        <input type="radio" name="<%# Eval("tencauhoi") %>" value="B"
                                            onclick="Check_Click('<%# Eval("masv") %>',<%# Eval("id") %>,'B')"  />
                                        B, <%# Eval("b") %>
                                    </label>
                                    <label>
                                        <input type="radio" name="<%# Eval("tencauhoi") %>" value="C"
                                            onclick="Check_Click('<%# Eval("masv") %>',<%# Eval("id") %>,'C')"  />
                                        C, <%# Eval("c") %>
                                    </label>
                                    <label>
                                        <input type="radio" name="<%# Eval("tencauhoi") %>" value="D"
                                            onclick="Check_Click('<%# Eval("masv") %>',<%# Eval("id") %>,'D')"  />
                                        D, <%# Eval("d") %>
                                    </label>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:ListView>
                    <!--  <div class="info_classroom_min">
                                    <h4>Câu hỏi: </h4>

                                    <div class="cauhoi_container">
                                        <label>
                                            <input type="radio" name="b" value="1" />
                                            D.an A </label>
                                        <label>
                                            <input type="radio" name="b" value="0" />
                                            D.an A </label>
                                        <label>
                                            <input type="radio" name="b" value="0" />
                                            D.an A </label>
                                        <label>
                                            <input type="radio" name="b" value="0" />
                                            D.an A </label>
                                    </div>
                                </div> -->
                </div>


            </from>

        </div>
    </div>

    <div class="classroom_container" >
        <h3 id="h1_kq" runat="server">Kết quả: 'Nộp bài để xem kết quả' </h3>
        <p id="p_tglambai" runat="server">Thời gian làm bài: 'Nộp bài để xem kết quả' </p>
        <p id="p_tgnopbai" runat="server">Thời gian nộp bài: 'Nộp bài để xem kết quả' </p>
        <p id="p_thoigian_sommuon" runat="server">Sớm/muộn: ?? phút. </p>

         <div class="info_classroom" >
                    <asp:ListView ID="ListView_kq" runat="server">
                        <ItemTemplate>
                            <div class="info_classroom_min">
                                <h4>Câu hỏi: <%# Eval("tencauhoi") %></h4>
                                <p>Đáp án chọn:  <%# Eval("dasvchon") %> | Đáp án đúng: <%# Eval("datrue") %> | Điểm: <%# Eval("diem") %></p>
                            </div>
                        </ItemTemplate>
                    </asp:ListView>
    </div>



    <script>
        function Check_Click(masv,id,dapansv) {
            var cmtJson = "{'masv':'" + masv + "','id':" + id +",'dapansv':'" + dapansv +"'}";
            console.log(cmtJson);
            $.ajax({
                url: "Tracnghiem.aspx/TraLoi",
                data: cmtJson,
                type: 'post',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    /*document.getElementById('#tick-' + maCauHoi).innerText = "Da tra loi";*/
                }
            });
        }
    </script>
</asp:Content>

<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="LISTED.Home" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <style>
        /* phần tìm kiếm */

        .search_container {
            background-image: url(./Master_style/img/header_bg.jpg);
            background-position: -25px -25px;
            background-size: cover;
            background-position: center center;
            min-height: 700px;
            height: 100vh;
            margin-bottom: 120px;
            display: flex;
            flex-direction: row;
            justify-content: center;
        }

            .search_container:before {
                content: "";
                background: rgba(0, 0, 0, .5);
                width: 100%;
                min-height: 700px;
                height: 100vh;
                z-index: 1;
                position: absolute;
                top: 0;
                left: 0;
                right: 0;
                bottom: 0;
            }

        .search_container_content {
            z-index: 9;
            display: flex;
            flex-direction: column;
            /* flex-wrap   : nowrap; */
            justify-content: center;
            /* align-items    : center; */
        }

            .search_container_content > h1 {
                font-size: 35pt;
                color: white;
                font-family: layfairDisplay;
                font-weight: normal;
                /* text-align : start; */
                text-align: center;
            }

            .search_container_content > p {
                font-size: 15pt;
                color: white;
                font-family: Roboto-Thin;
                font-weight: normal;
                /* text-align : start; */
                text-align: center;
            }

        .span_search {
            margin: 25px 0 20px 0;
            text-align: center;
            /* margin-top   : 25px; */
            /* margin-bottom: 25px; */
        }

            .span_search > input {
                width: 300px;
                height: 55px;
                border-radius: 0px;
                padding-left: 20px;
                padding-right: 20px;
                border: none;
                text-align: start;
            }

                .span_search > input:focus,
                .span_search > input:focus-visible {
                    border: none;
                    outline: none;
                    box-shadow: none;
                }


        .btn_search {
            width: 100px;
            height: 55px;
            margin-left: -10px;
            background: #4b6b4c;
            color: white;
        }

            .btn_search:hover {
                background: RGBA(31, 77, 29, 1);
                transition: 0.5s;
            }

        #texteg {
            text-align: left;
        }
        /* 
.btn_dictionary {
    display        : flex;
    justify-content: flex-start;
    width          : 100%;
    align-items    : center;
}

.btn {
    padding   : 7px;
    margin    : 0 7px 0 0px;
    background: none;
    color     : white;
    border    : 1px solid #dedede;
}

.btn:hover {
    background: RGBA(210, 219, 209, 0.4);
    transition: 0.5s;
} */



        /* 
hiệu ứng di chuột dropdown */

        .mouse_scroll {
            /* justify-items: left; */
            /* text-align: center; */
            /* align-items: center; */
            /* width: 60px; */
            position: relative;
            top: 25%;
            left: 50%;
        }

        .m_scroll_arrows {
            display: block;
            width: 5px;
            height: 5px;
            -ms-transform: rotate(45deg); /* IE 9 */
            -webkit-transform: rotate(45deg); /* Chrome, Safari, Opera */
            transform: rotate(45deg);
            border-right: 2px solid white;
            border-bottom: 2px solid white;
            margin: 0 0 3px 4px;
            width: 16px;
            height: 16px;
        }


        .unu {
            margin-top: 1px;
        }

        .unu, .doi, .trei {
            -webkit-animation: mouse-scroll 1s infinite;
            -moz-animation: mouse-scroll 1s infinite;
            animation: mouse-scroll 1s infinite;
        }

        .unu {
            -webkit-animation-delay: .1s;
            -moz-animation-delay: .1s;
            -webkit-animation-direction: alternate;
            animation-direction: alternate;
            animation-delay: alternate;
        }

        .doi {
            -webkit-animation-delay: .2s;
            -moz-animation-delay: .2s;
            -webkit-animation-direction: alternate;
            animation-delay: .2s;
            animation-direction: alternate;
            margin-top: -6px;
        }

        .trei {
            -webkit-animation-delay: .3s;
            -moz-animation-delay: .3s;
            -webkit-animation-direction: alternate;
            animation-delay: .3s;
            animation-direction: alternate;
            margin-top: -6px;
        }

        @-webkit-keyframes mouse-wheel {
            0% {
                opacity: 1;
                -webkit-transform: translateY(0);
                -ms-transform: translateY(0);
                transform: translateY(0);
            }

            100% {
                opacity: 0;
                -webkit-transform: translateY(6px);
                -ms-transform: translateY(6px);
                transform: translateY(6px);
            }
        }

        @-moz-keyframes mouse-wheel {
            0% {
                top: 1px;
            }

            25% {
                top: 2px;
            }

            50% {
                top: 3px;
            }

            75% {
                top: 2px;
            }

            100% {
                top: 1px;
            }
        }

        @-o-keyframes mouse-wheel {

            0% {
                top: 1px;
            }

            25% {
                top: 2px;
            }

            50% {
                top: 3px;
            }

            75% {
                top: 2px;
            }

            100% {
                top: 1px;
            }
        }

        @keyframes mouse-wheel {

            0% {
                top: 1px;
            }

            25% {
                top: 2px;
            }

            50% {
                top: 3px;
            }

            75% {
                top: 2px;
            }

            100% {
                top: 1px;
            }
        }

        @-webkit-keyframes mouse-scroll {

            0% {
                opacity: 0;
            }

            50% {
                opacity: .5;
            }

            100% {
                opacity: 1;
            }
        }

        @-moz-keyframes mouse-scroll {

            0% {
                opacity: 0;
            }

            50% {
                opacity: .5;
            }

            100% {
                opacity: 1;
            }
        }

        @-o-keyframes mouse-scroll {

            0% {
                opacity: 0;
            }

            50% {
                opacity: .5;
            }

            100% {
                opacity: 1;
            }
        }

        @keyframes mouse-scroll {

            0% {
                opacity: 0;
            }

            50% {
                opacity: .5;
            }

            100% {
                opacity: 1;
            }
        }



        /* lớp học */

        .classroom_container {
            width: 80%;
            margin: 0 auto;
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
            display: grid;
            gap: 1.25em;
            grid-template-columns: repeat(3,minmax(0,1fr));
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
    </style>
</asp:Content>



<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

      <!-- khu vực hiển thị tìm kiếm -->
    <div class="search_container">
        <div class="search_container_content">
            <h1>Tìm kiếm khoá học.</h1>
            <p>Look up a word, learn it forever.</p>

            <span class="span_search">
                <input type="text" placeholder="Nhập mã lớp" value="" />
                <button type="button" class="btn_search">Search</button>
            </span>

            <p id="texteg">e.g: MHN2020LMS01, MHN2021LMS03 ...</p>
            <!-- <div class="btn_dictionary">
                <button type="button" class="btn">Anh - Việt</button>
                <button type="button" class="btn">Trung - Việt</button>
                <button type="button" class="btn">Hàn - Việt</button>
            </div> -->


            <div class="mouse_scroll">
                <a href="#classroom_container">
                    <div>
                        <span class="m_scroll_arrows unu"></span>
                        <span class="m_scroll_arrows doi"></span>
                        <span class="m_scroll_arrows trei"></span>
                    </div>
                </a>

            </div>
        </div>
    </div>

    <!-- khu vực hiển thị lớp học -->
    <div class="classroom_container" id="classroom_container">
        <h3>Lớp học của bạn</h3>
        <p>Danh sách lớp học của bạn được thêm khi bạn có trong danh sách lớp.</p>

        <div class="list_rooms">

            <a href="#" class="classroom">
                <div class="classroom_min_img"><img src="./Master_style/img/book.jpg" alt="" /></div>

                <div class="info_classroom">
                    <h4>Lớp Tiếng Anh chuyên ngành</h4>
                    <p>mã lớ: Mhn03498946</p>
                    <h5>GV: Nguyễn thị trang</h5>
                </div>
            </a>

            <a href="#" class="classroom">
                <div class="classroom_min_img"><img src="./Master_style/img/book.jpg" alt="" /></div>

                <div class="info_classroom">
                    <h4>Lớp Tiếng Anh chuyên ngành</h4>
                    <p>mã lớ: Mhn03498946</p>
                    <h5>GV: Nguyễn thị trang</h5>
                </div>
            </a>

            <a href="#" class="classroom">
                <div class="classroom_min_img"><img src="./Master_style/img/book.jpg" alt="" /></div>

                <div class="info_classroom">
                    <h4>Lớp Tiếng Anh chuyên ngành</h4>
                    <p>mã lớ: Mhn03498946</p>
                    <h5>GV: Nguyễn thị trang</h5>
                </div>
            </a>
           
            <a href="#" class="classroom">
                <div class="classroom_min_img"><img src="./Master_style/img/book.jpg" alt="" /></div>

                <div class="info_classroom">
                    <h4>Lớp Tiếng Anh chuyên ngành</h4>
                    <p>mã lớ: Mhn03498946</p>
                    <h5>GV: Nguyễn thị trang</h5>
                </div>
            </a>

            <a href="#" class="classroom">
                <div class="classroom_min_img"><img src="./Master_style/img/book.jpg" alt="" /></div>

                <div class="info_classroom">
                    <h4>Lớp Tiếng Anh chuyên ngành</h4>
                    <p>mã lớ: Mhn03498946</p>
                    <h5>GV: Nguyễn thị trang</h5>
                </div>
            </a>

            <a href="#" class="classroom">
                <div class="classroom_min_img"><img src="./Master_style/img/book.jpg" alt="" /></div>

                <div class="info_classroom">
                    <h4>Lớp Tiếng Anh chuyên ngành</h4>
                    <p>mã lớ: Mhn03498946</p>
                    <h5>GV: Nguyễn thị trang</h5>
                </div>
            </a>

            <a href="#" class="classroom">
                <div class="classroom_min_img"><img src="./Master_style/img/book.jpg" alt="" /></div>

                <div class="info_classroom">
                    <h4>Lớp Tiếng Anh chuyên ngành</h4>
                    <p>mã lớ: Mhn03498946</p>
                    <h5>GV: Nguyễn thị trang</h5>
                </div>
            </a>

            <a href="#" class="classroom">
                <div class="classroom_min_img"><img src="./Master_style/img/book.jpg" alt="" /></div>

                <div class="info_classroom">
                    <h4>Lớp Tiếng Anh chuyên ngành</h4>
                    <p>mã lớ: Mhn03498946</p>
                    <h5>GV: Nguyễn thị trang</h5>
                </div>
            </a>
        </div>
    </div>


</asp:Content>

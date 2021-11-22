<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Dangki.aspx.cs" Inherits="LISTED.Dangki" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style>
        /* phần from */
        .search_container {
            background-image: url(./Master_style/img/bg_login.jpg);
            background-position: -25px -25px;
            background-size: cover;
            background-position: center center;
            min-height: 720px;
            height: 110vh;
            display: flex;
            flex-direction: row;
            justify-content: center;
        }

            .search_container:before {
                content: "";
                background: rgba(0, 0, 0, .5);
                width: 100%;
                min-height: 720px;
                height: 110vh;
                z-index: 1;
                position: absolute;
                top: 0;
                left: 0;
                right: 0;
                bottom: 0;
            }

        .search_container_content {
            z-index: 9;
            padding: 20px;
            background: #fff;
            max-width: 850px;
            margin: auto;
            display: flex;
        }



        .image_container {
            width: 45%;
        }

            .image_container > img {
                width: 100%;
                height: 100%;
                object-fit: cover;
                object-position: 70% 50%;
            }

        .from_container {
            width: 55%;
            padding-top: 36px;
            padding-left: 45px;
            padding-right: 45px;
        }

        .h3_from {
            text-transform: uppercase;
            font-size: 25px;
            font-family: Roboto-Regular;
            text-align: center;
            margin-bottom: 28px;
        }

        .from_group {
            display: flex;
        }

            .from_group > input {
                width: 50%;
                margin-right: 25px;
            }

        .from_input {
            border: 1px solid #333;
            border-top: none;
            border-right: none;
            border-left: none;
            display: block;
            width: 100%;
            height: 30px;
            padding: 0;
            margin-bottom: 25px;
        }

            .from_input:focus,
            .from_input:focus-visible {
                border-top: none;
                border-right: none;
                border-left: none;
                outline: none;
                box-shadow: none;
            }

        .from_wrapper {
            position: relative;
        }

            .from_wrapper > i {
                position: absolute;
                bottom: 9px;
                right: 0;
                font-size: 11px;
            }

        .btn_from {
            border: none;
            width: 164px;
            height: 51px;
            margin: auto;
            margin-top: 40px;
            cursor: pointer;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 0;
            background: #333;
            font-size: 15px;
            color: #fff;
            vertical-align: middle;
        }

            .btn_from > i {
                margin-left: 15px;
            }

        .text_center {
            margin-top: 10px;
            font-size: 11pt;
            text-align: center;
        }

            .text_center > a {
                color: #357a38 !important;
            }

                .text_center > a:hover {
                    font-weight: bold;
                    transition: 0.3s;
                }

            .text_center:visited {
                color: rgb(97, 97, 97) !important;
            }
    </style>
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="search_container">
        <div class="search_container_content">
            <div class="image_container">
                <img src="./Master_style/img/cogai.jpg" alt="" />
            </div>

            <div class="from_container">
                <form action="">
                    <h3 class="h3_from">Registration Form</h3>

                    <div class="from_group">
                        <input type="text" class="from_input" placeholder="Fist name" />
                        <input type="text" class="from_input" placeholder="Last name" />
                    </div>

                    <div class="from_wrapper">
                        <input type="text" class="from_input" placeholder="Username" />
                        <i class="fas fa-user"></i>
                    </div>
                    <div class="from_wrapper">
                        <input type="email" class="from_input" placeholder="Email address" />
                        <i class="fa-solid fa-envelope"></i>
                    </div>
                    <div class="from_wrapper">
                        <input type="text" class="from_input" placeholder="Student code" />
                        <i class="fa-solid fa-graduation-cap"></i>
                    </div>
                    <div class="from_wrapper">
                        <input type="password" class="from_input" placeholder="Password" />
                        <i class="fa-solid fa-lock"></i>
                    </div>
                    <div class="from_wrapper">
                        <input type="password" class="from_input" placeholder="Confirm Password" />
                        <i class="fa-solid fa-lock"></i>
                    </div>

                    <button class="btn_from">Sign Up <i class="fa-solid fa-arrow-right"></i></button>
                </form>

                <div class="text_center">
                    <span>Already have an account? </span>
                    <a href="#">Log In</a>
                </div>
            </div>
        </div>
    </div>

</asp:Content>

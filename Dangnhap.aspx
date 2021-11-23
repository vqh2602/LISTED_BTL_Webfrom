<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Dangnhap.aspx.cs" Inherits="LISTED.Dangnhap" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style>     
/* phần from */
.search_container {
    background-image   : url(Master_style/img/bg_login.jpg);
    background-position: -25px -25px;
    background-size    : cover;
    background-position: center center;
    min-height         : 720px;
    height             : 110vh;

    display        : flex;
    flex-direction : row;
    justify-content: center;
}

.search_container:before {
    content   : "";
    background: rgba(0, 0, 0, .5);
    width     : 100%;
    min-height: 720px;
    height    : 110vh;
    z-index   : 1;
    position  : absolute;
    top       : 0;
    left      : 0;
    right     : 0;
    bottom    : 0;
}

.search_container_content {
    z-index   : 9;
    padding   : 20px;
    background: #fff;
    max-width : 850px;
    margin    : auto;
    display   : flex;
}



.image_container {
    width: 45%;
}

.image_container>img {
    width: 100%;
    height: 100%;
    object-fit: cover;
    object-position: 70% 50%;
}
/*-------------Login--------------------*/
.login_form {
    width        : 55%;
    padding-top  : 36px;
    padding-left : 45px;
    padding-right: 45px;
    padding-bottom: 45px;
}
.h3 {
    text-transform: uppercase;
    font-size: 25px;
    font-family: Roboto-Regular;
    margin-bottom: 28px;
    margin-left: 30px;
}
.form p{
    margin-left:30px;
}
.input{
    width: 350px;
    height: 40px;
    margin-left:30px;
    border-radius: 5px;
    border: 1px solid grey;
        padding-left: 10px;
}

.form{
    position: relative;
}
.btt_login{
    border: none;
    width: 350px;
    height: 40px;
    margin: auto;
    margin-top: 20px;
    cursor: pointer;
    display: flex;
    align-items: center;
    justify-content: center;
    padding: 0;
    background: #333;
    font-size: 15px;
    color: #fff;
    vertical-align: middle;
    border-radius: 5px;
    border: 1px solid grey;

}
.btn_from>i{
    margin-left: 15px;
   
}
.nhopass{
    margin-left:30px;
}
.nhopass input{
    width: 10px;
    height: 10px;
}
.nhopass>a {
    float: right;
    margin-right: 40px;
    text-decoration: none;
    color: black;
}
.nhopass>a {
    color: #357a38 !important;
}

.nhopass>a:hover {
    font-weight: bold;
    transition: 0.3s;
}

.nhopass:visited {
    color: rgb(97, 97, 97) !important;
}
.text{
    margin-top: 10px;
    font-size: 11pt;
    text-align: center;
}
.text>a {
    color: #357a38 !important;
}

.text>a:hover {
    font-weight: bold;
    transition: 0.3s;
}

.text:visited {
    color: rgb(97, 97, 97) !important;
}



    </style>
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

       <div class="search_container">
        <div class="search_container_content">
            <div class="image_container">
                <img src="Master_style/img/cogai.jpg" alt=""/>
            </div>
 <!-- from đăng nhập -->
            <div class="login_form"> 
                <form id="login" method="post" action="Login.aspx" >
                    <h3 class="h3">Log In</h3>
                    <div class="form">
                        <p>USERNAME</p>
                        <br>
                        <input type="text" class="input" placeholder="Username" name="username" id="username" value=""/>
                    </div>
                    <br>
                    <div class="form">
                        <p>PASSWORD</p>
                        <br>
                        <input type="password" class="input" placeholder="Password" name="passw" id="passw" value=""/>
                    </div>
                   <!-- <button class="btt_login">Log In</button> -->
                    <asp:Button class="btt_login" runat="server" Text="Login"  OnClick="Submit_Click" />
                </form>
        <!--        <div>
                    <br>
                    <div class="nhopass">
                        <input type="checkbox">
                        Remember Me
                        <a href="#"> Forgot Password</a>
                    </div>
                </div>-->
                <div class="text">
                    <span>Not a member? </span>
                    <a href="Dangki.aspx">Sign Up</a>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

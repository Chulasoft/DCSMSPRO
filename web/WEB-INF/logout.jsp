<%-- 
    Document   : logout
    Created on : Apr 20, 2017, 2:12:32 AM
    Author     : Jab
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Decision Support Tool</title>
        <script src="./js/jquery-3.2.0.min.js"></script>        
        <script src="./bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
        <link rel="stylesheet" type="text/css" href="./bootstrap-3.3.7-dist/css/bootstrap.min.css" >
        <style>
            @font-face {
                font-family: bangna-new;
                src: url(./font/bangna-new.ttf);
            }
            .navbar-brand,h1{
                font-family: bangna-new;
                font-size: 30px;
            }
            /*full Screen video*/
            video { 
                position: fixed;
                top: 50%;
                left: 50%;
                min-width: 100%;
                min-height: 100%;
                width: auto;
                height: auto;
                z-index: -100;
                transform: translateX(-50%) translateY(-50%);
                background-size: cover;
                transition: 2s opacity;
            }

            /*transparent navbar*/
            .navbar-inner {
                -webkit-box-shadow: 0px 0px;
                box-shadow: 0px 0px;
                background-color: rgba(0,0,0,0.0);
                background-image: -webkit-gradient(linear, 50.00% 0.00%, 50.00% 100.00%, color-stop( 0% , rgba(0,0,0,0.00)),color-stop( 100% , rgba(0,0,0,0.00)));
                background-image: -webkit-linear-gradient(270deg,rgba(0,0,0,0.00) 0%,rgba(0,0,0,0.00) 100%);
                background-image: linear-gradient(180deg,rgba(0,0,0,0.00) 0%,rgba(0,0,0,0.00) 100%);
            }

            /*not collaspe*/
            .navbar-collapse.collapse {
                display: block!important;
            }

            .navbar-nav>li, .navbar-nav {
                float: left !important;
            }

            .navbar-nav.navbar-right:last-child {
                margin-right: -15px !important;
            }

            .navbar-right {
                float: right!important;
            }

            a{
                color: white;
            }

            /*            black transparent box*/
            .tr-black { 
                background-color: black;
                background: linear-gradient(
                    rgba(0, 0, 0, 0.7), 
                    rgba(0, 0, 0, 0.7)
                    ) center center fixed; 
                -webkit-background-size: cover;
                -moz-background-size: cover;
                -o-background-size: cover;
                background-size: cover;
                padding: 20px;
                color :white;
                font-size: 30px;
            }

        </style>
    </head>
    <body>
        <video id="myvideo" playsinline autoplay muted loop>
            <source src="video/people2.mp4" type="video/mp4">
        </video>
        <div class="container" style="margin-top: 20%">
            <div class="row">
                <div class="col-sm-4 ">
                    <h1 style="text-align: center;color: white;font-size: 48px">THANK YOU</h1>
                    <script>
                        setTimeout(function(){ 
                            window.location.href = "Login";
                        }, 2000);
                    </script>
                </div>
            </div>
        </div>
    </body>
</html>

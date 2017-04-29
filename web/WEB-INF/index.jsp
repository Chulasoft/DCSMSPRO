<%-- 
    Document   : index
    Created on : Apr 9, 2017, 11:08:56 AM
    Author     : 006131
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>AHP</title>
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
        <div class="container">
            <div class="row">
                <nav class="navbar navbar-inner" style="padding: 20px">
                    <div class="container-fluid">
                        <div class="navbar-header" >
                            <a class="navbar-brand" href="#">AHP Project</a>
                        </div>
                        <!--<ul class="nav navbar-nav">
                            <li class="active"><a href="#">Home</a></li>
                            <li><a href="#">Page 1</a></li>
                            <li><a href="#">Page 2</a></li>
                        </ul>-->
                        <ul class="nav navbar-nav navbar-right">
                            <li><a href="#"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
                            <li><a href="#"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
                        </ul>
                    </div>
                </nav>
            </div>
        </div>
        <video id="myvideo" playsinline autoplay muted loop>
            <source src="video/people2.mp4" type="video/mp4">
        </video>
        <div class="container" style="margin-top: 10%">
            <div class="row">
                <div class="col-sm-offset-4 col-sm-4 ">
                    <h1 style="text-align: center;color: white">Login AHP</h1>
                    <form method="POST" action="Login" style="margin-top: 20px">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                            <input id="usr" type="text" class="form-control" name="username" placeholder="Username">
                        </div>
                        <div class="input-group">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                            <input id="password" type="password" class="form-control" name="password" placeholder="Password">
                        </div>
                        <button type="submit" class="btn btn-md btn-primary btn-block" style="margin-top: 10px">Login</button>
                    </form>
                    <p style="color: white">${msg}</p>
                </div>
            </div>
        </div>
    </body>
</html>

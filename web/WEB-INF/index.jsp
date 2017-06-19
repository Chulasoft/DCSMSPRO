<%-- 
    Document   : index
    Created on : Apr 9, 2017, 11:08:56 AM
    Author     : 006131
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--<html>
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
        </style>
    </head>
    <body>
        <div class="container">
            <div class="row">
                <nav class="navbar navbar-inner" style="padding: 20px">
                    <div class="container-fluid">
                        <div class="navbar-header" >
                            <a class="navbar-brand" href="#">Decision Support Tool</a>
                        </div>
                        <ul class="nav navbar-nav">
                            <li class="active"><a href="#">Home</a></li>
                            <li><a href="#">Page 1</a></li>
                            <li><a href="#">Page 2</a></li>
                        </ul>
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
                    <h1 style="text-align: center;color: white">Login</h1>
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
</html>-->
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
        <meta name="description" content="">
        <meta name="author" content="">

        <script src="./js/jquery-3.2.0.min.js"></script>        
        <script src="./bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>

        <title>Decision Support Tool</title>

        <!-- Bootstrap core CSS -->
        <link rel="stylesheet" type="text/css" href="./bootstrap-3.3.7-dist/css/bootstrap.min.css" >

        <!-- Custom styles for this template -->
        <link href="./css/cover.css" rel="stylesheet">
        <style>
            @font-face {
                font-family: bangna-new;
                src: url(./font/bangna-new.ttf);
            }
            h1{
                font-family: bangna-new;
                font-size: 30px;
            }
        </style>
    </head>

    <body>

        <div class="site-wrapper">

            <div class="site-wrapper-inner">

                <div class="cover-container">

                    <div class="masthead clearfix">
                        <div class="inner">
                            <h3 class="masthead-brand">Decision Support Tool</h3>
                            <nav>
                                <ul class="nav masthead-nav">
                                    <li class="active"><a href="#">Login</a></li>
                                    <li><a href="#">Sign Up</a></li>
                                </ul>
                            </nav>
                        </div>
                    </div>

                    <div class="inner cover">
                        <div class="col-sm-offset-2 col-sm-8 ">
                            <h1 style="text-align: center;color: white">Login</h1>
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

                    <div class="mastfoot">
                        <div class="inner">
                            <p>Powered by <a href="#">Noraset</a></p>
                        </div>
                    </div>

                </div>

            </div>

        </div>

    </body>
</html>
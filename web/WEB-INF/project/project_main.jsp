<%-- 
    Document   : project_main
    Created on : Apr 30, 2017, 11:54:39 AM
    Author     : Jab
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>AHP Main Menu</title>
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
            h3,label{ 
                font-family: bangna-new;
            }
            @media (max-width: 768px) {
                .hidden-mob {
                    display: none;
                }
            }



            .sidebar {
                position: fixed;
                top: 72px;
                bottom: 0;
                left: 0;
                z-index: 1000;
                display: block;
                padding: 20px;
                /*                overflow-x: hidden;
                                overflow-y: auto;*/
                background-color: #f5f5f5;
                border-right: 1px solid #eee;
            }
            .nav>li>span:focus, .nav>li>span:hover
            {
                text-decoration: none;
                background-color: #eee;
            }
            .nav>li>span {
                position: relative;
                display: block;
                padding: 10px 15px;
            }
        </style>
    </head>
    <body>
        <jsp:include page="../header.jsp" flush="false"/>
    <content>
        <div class="container-fluid">
            <div class="row">
                <span class="hidden-mob">
                    <div class="col-sm-3 col-md-2 sidebar">
                        <h3>Model 
                            <div class="dropdown" style="float: right;">
                                <a href="#" data-toggle="dropdown"><span class="glyphicon glyphicon-plus-sign"></span></a>
                                <ul class="dropdown-menu" style="z-index: 20">
                                    <li><a href="CreateProject">Add</a></li>
                                    <li><a href="#">Clone</a></li>
                                </ul>
                            </div>
                        </h3>
                        
                        <ul class="nav nav-sidebar">
                            <li>
                                <span>
                                    <a href="#">project1</a>
                                    <a href="#" style="float: right;"><span class="glyphicon glyphicon-remove"></span></a>
                                    <a href="#" style="float: right;margin-right: 6px;"><span class="glyphicon glyphicon-wrench"></span></a>
                                </span>
                            </li>

                        </ul>
                    </div>
                </span>
                <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main" style="top: 72px">
                    <div class="row">
                        <div class="form-group col-xs-4">
                            <h3>project 1 </h3>
                        </div>
                        <div class="form-group col-xs-5">
                            <h3>Last update : </h3>
                        </div>
                        <div class="form-group col-xs-3">
                            <h3>Status : </h3>
                        </div>
                    </div>
                    <hr>
                    <div class="row">
                        <div id='chart_div'></div>
                    </div>
                </div>
            </div>
    </content>
</body>
</html>

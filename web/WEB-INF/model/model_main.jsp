<%-- 
    Document   : main_menu
    Created on : Apr 9, 2017, 2:01:12 PM
    Author     : 006131
--%>

<%@page import="DSST.Model.Model"%>
<%@page import="java.util.ArrayList"%>
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
            .fixborder{
                text-align: center;
                vertical-align: middle;
                font-family: arial,helvetica;
                cursor: default;
                -moz-border-radius: 5px;
                -webkit-border-radius: 5px;
                -webkit-box-shadow: rgba(0, 0, 0, 0.5) 3px 3px 3px;
                -moz-box-shadow: rgba(0, 0, 0, 0.5) 3px 3px 3px;
                background-color: #edf7ff;
                background: -webkit-gradient(linear, left top, left bottom, from(#edf7ff), to(#cde7ee));
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
                                    <li><a href="CreateModel">Add</a></li>
                                    <li><a href="#">Clone</a></li>
                                </ul>
                            </div>
                        </h3>
                        
                        <ul class="nav nav-sidebar">
                            <%  
                                if(request.getAttribute("am")!=null){
                                ArrayList<Model> am = (ArrayList)request.getAttribute("am");
                                for(Model m : am){
                            %>
                            <li>
                                <span>
                                    <a href="#"><%=m.getModel_name()%></a>
                                    <a href="#" style="float: right;"><span class="glyphicon glyphicon-remove"></span></a>
                                    <a href="#" style="float: right;margin-right: 6px;"><span class="glyphicon glyphicon-wrench"></span></a>
                                </span>
                            </li>
                            <% }
}
                            %>
                        </ul>
                    </div>
                </span>
                     <%if(request.getAttribute("Model_id")!=null){%>   
                <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main" style="top: 72px">
                    <div class="row">
                        <div class="form-group col-xs-4">
                            <h3><%=request.getAttribute("Model_id")%></h3>
                        </div>
                        <div class="form-group col-xs-5">
                            <h3>Last update : <%=request.getAttribute("Model_last")%></h3>
                        </div>
                        <div class="form-group col-xs-3">
                            <h3>Status : <%=request.getAttribute("Model_status")%></h3>
                        </div>
                    </div>
                    <hr>
                    <div class="row">
                        <div id='chart_div'></div>
                    </div>
                </div>
                   <%}%>     
            </div>
    </content>
</body>
</html>

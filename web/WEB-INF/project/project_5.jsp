<%-- 
    Document   : project_5
    Created on : May 8, 2017, 2:20:14 AM
    Author     : Jab-PC
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="DSST.Model.Model"%>
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

            .carousel-control.left, .carousel-control.right {
                background-image: none
            }

        </style>
    </head>
    <body>
        <jsp:include page="../header.jsp" flush="false"/>
    <content>
        <div class="container-fluid">
            <div class="row">
                <span class="hidden-mob">
                    <jsp:include page="sidenav_create_project.jsp" flush="false"/>
                </span>
                <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main" style="top: 72px">
                    <div class="row">
                        <h3>Define SubCri</h3>
                        <hr>
                        <h4 style="color: red">${msg}</h4>
                        <div id="myCarousel" class="carousel slide" data-ride="carousel" data-interval="false" style="height: 70vh;">
                            <!-- Wrapper for slides -->
                            <form action="ComparisonSubcriteria" method="POST">
                                <input type="hidden" name="page" value="5">
                                <div class="carousel-inner">
                                    <%
                                        ArrayList<Model> allCri = (ArrayList) session.getAttribute("allCri");
                                        session.setAttribute("allCri", allCri);
                                        ArrayList<Model> subCri = (ArrayList) request.getAttribute("subCri");
                                        int size = subCri.size();
                                    %>
                                    <input type="hidden" name="size" value="<%=size%>">
                                    <%
                                        int z = 0;
                                        for (int i = 0; i < subCri.size(); i++) {
                                            for (int y = i + 1; y < subCri.size(); y++) {
                                                Model a = subCri.get(i);
                                                Model b = subCri.get(y);
                                                if (z == 0) {
                                    %>
                                    <div class="item active" style="margin-top: 130px">
                                        <%
                                        } else {
                                        %>
                                        <div class="item" style="margin-top: 130px">
                                            <%
                                                }
                                            %>
                                            <div class="col-lg-offset-1 col-lg-10" style="text-align: center">
                                                <h1>Comparison Criteria</h1>
                                                <hr>
                                                <div class="col-lg-5">
                                                    <div class="panel panel-default">
                                                        <div class="panel-heading" style="text-align: left"><%=a.getSc_name()%></div>
                                                        <div class="panel-body"><%=a.getSc_des()%></div>
                                                    </div>
                                                </div>
                                                <div class="col-lg-2">
                                                    VS
                                                </div>
                                                <div class="col-lg-5">
                                                    <div class="panel panel-default">
                                                        <div class="panel-heading" style="text-align: left"><%=b.getSc_name()%></div>
                                                        <div class="panel-body"><%=b.getSc_des()%></div>
                                                    </div>
                                                </div>
                                                <ul class="pagination pagination-lg" style="margin-top: 100px;font-size: 30px" id="ul<%=z%>">
                                                    <li><a onclick="setnum<%=z%>('9')" href="#">9</a></li>
                                                    <li><a onclick="setnum<%=z%>('7')" href="#">7</a></li>
                                                    <li><a onclick="setnum<%=z%>('5')" href="#">5</a></li>
                                                    <li><a onclick="setnum<%=z%>('3')" href="#">3</a></li>
                                                    <li><a onclick="setnum<%=z%>('1')" href="#">1</a></li>
                                                    <li><a onclick="setnum<%=z%>('1/3')" href="#">3</a></li>
                                                    <li><a onclick="setnum<%=z%>('1/5')" href="#">5</a></li>
                                                    <li><a onclick="setnum<%=z%>('1/7')" href="#">7</a></li>
                                                    <li><a onclick="setnum<%=z%>('1/9')" href="#">9</a></li>
                                                    <input type="hidden" name="ansSc" id="<%=z%>" value=""/>
                                                    <input type="hidden" name="criId" value="<%=a.getSc_id()%>:<%=b.getSc_id()%>"/>
                                                </ul>
                                                <div class="alert alert-info">
                                                    The <%=a.getSc_name()%> is <span id="text<%=z%>"></span> <%=b.getSc_name()%>
                                                </div>
                                            </div>
                                        </div>
                                        <script>
                                            function setnum<%=z%>(num) {
                                                $('#<%=z%>').val(num);
                                                if (num == '9') {
                                                    $('#text<%=z%>').text('Extremely More Important Than');
                                                } else if (num == '7') {
                                                    $('#text<%=z%>').text('Very Strongly More Important Than');
                                                } else if (num == '5') {
                                                    $('#text<%=z%>').text('Moderately More Important Than');
                                                } else if (num == '3') {
                                                    $('#text<%=z%>').text('Moderately More Important Than');
                                                } else if (num == '1') {
                                                    $('#text<%=z%>').text('Equally Important');
                                                } else if (num == '1/3') {
                                                    $('#text<%=z%>').text('Moderately Less Important Than');
                                                } else if (num == '1/5') {
                                                    $('#text<%=z%>').text('Moderately Less Important Than');
                                                } else if (num == '1/7') {
                                                    $('#text<%=z%>').text('Very Strongly Less Important Than');
                                                } else if (num == '1/9') {
                                                    $('#text<%=z%>').text('Extremely Less Important Than');
                                                }
                                            }
                                            $("#ul<%=z%> li").on("click", function () {
                                                $("#ul<%=z%> li").removeClass("active");
                                                $(this).addClass("active");
                                                $("#text<%=z%>").parent("div").show();
                                            });
                                            $(document).ready(function () {
                                                $(".alert").hide();
                                            });
                                        </script>
                                        <%
                                                    z++;
                                                }
                                            }
                                        %>
                                    </div>
                            </form>
                            <!-- Left and right controls -->
                            <a class="left carousel-control" href="#myCarousel" data-slide="prev">
                                <span class="glyphicon glyphicon-chevron-left"></span>
                                <span class="sr-only">Previous</span>
                            </a>
                            <a class="right carousel-control" href="#myCarousel" data-slide="next">
                                <span class="glyphicon glyphicon-chevron-right"></span>
                                <span class="sr-only">Next</span>
                            </a>
                        </div>
                        <ul class="pager">
                            <li><a href="ModelMenu">Cancel</a></li>
                            <li><a href="#" onclick="document.forms[0].submit()">Next</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </content>
</body>
</html>

<%-- 
    Document   : project_2
    Created on : May 1, 2017, 11:27:11 AM
    Author     : Jab-PC
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
            .pagination>li.active>a {
                background: #eee;
                border-color: #f9f2f4;
                color: #fff;
            }
            .pagination>li.active>a:hover {
                background: #eee;
                color: #fff;
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
                        <h3>Specification for ${whoName}</h3>
                        <hr>
                        <form method="POST" action="CreateProject">
                            <input type="hidden" name="page" value="2"/>
                            <div class="col-sm-offset-2 col-sm-8 ">
                                <div class="panel-group">
                                    <%
                                        ArrayList<Model> allQuest = (ArrayList) request.getAttribute("allQuest");
                                        for (int i = 0; i < allQuest.size(); i++) {
                                    %>                                    
                                    <div class="panel panel-default">
                                        <div class="panel-heading"><%=allQuest.get(i).getSc_name()%></div>
                                        <div class="panel-body">
                                            <div style="float: left;"><%=allQuest.get(i).getQuest_name()%></div>
                                            <div style="float: right;">
                                                <select style="width: 100%;padding: 10px;border-radius: 5px;" name="ansQues" required>
                                                    <option value="">--Choice--</option>
                                                    <option value="<%=allQuest.get(i).getQuest_id()%>:3">Must Have</option>
                                                    <option value="<%=allQuest.get(i).getQuest_id()%>:2">Should Have</option>
                                                    <option value="<%=allQuest.get(i).getQuest_id()%>:1">Could Have</option>
                                                    <option value="<%=allQuest.get(i).getQuest_id()%>:0">Don't Want</option>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                    <%
                                        }
                                    %>
                                </div>

                            </div>
                        </form>
                    </div>
                    <div class="col-sm-12" style="margin-top: 10px">
                        <ul class="pager">
                            <li><a href="#" onclick="document.forms[0].submit()" >Submit</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </content>
<!--    <script>
        $("#submit").click(function () {
            if($("select[name='ansQues']").val()==0){
                alert("กรุณากรอกข้อมูลให้ครบถ้วน");
            }
        });
    </script>-->
</body>
</html>

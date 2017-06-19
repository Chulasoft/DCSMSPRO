<%-- 
    Document   : main_menu
    Created on : Apr 20, 2017, 1:18:35 AM
    Author     : Softt
--%>

<%@page import="DSST.Model.Project"%>
<%@page import="DSST.Model.Model"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Decision Support Tool</title>
        <script src="./js/jquery-3.2.0.min.js"></script>        
        <script src="./bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
        <script src="./js/Chart.js"></script>
        <link rel="stylesheet" type="text/css" href="./bootstrap-3.3.7-dist/css/bootstrap.min.css" >
        <link href='http://fonts.googleapis.com/css?family=Roboto:400,700,300|Material+Icons' rel='stylesheet' type='text/css'>
        <link href="./css/material-dashboard.css" rel="stylesheet"/>
        <style>
            @font-face {
                font-family: bangna-new;
                src: url(./font/bangna-new.ttf);
            }
            .navbar-brand,h1{
                font-family: bangna-new;
                font-size: 30px;
            }
            h3 , div{ 
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
        <%
            Model m = new Model();
            m = m.TotalModel();
            Project pj = new Project();
            pj = pj.TotalProject();
        %>
        <script>
            $(document).ready(function () {
                var ctx = document.getElementById("myChart");
                var myChart = new Chart(ctx, {
                    type: 'doughnut',
                    data: {
                        labels: ["Recent Model", "Publish Model"],
                        datasets: [{
                                backgroundColor: [
                                    "#276E9E",
                                    "#3498db"
                                ],
                                data: [

            <%=m.getTotal_re()%>,<%=m.getTotal_Pub()%>

                                ]
                            }]
                    }
                });
                var ctx2 = document.getElementById("myChart2");
                var myChart2 = new Chart(ctx2, {
                    type: 'doughnut',
                    data: {
                        labels: ["Recent Project", "Request Answers Project", "Finished Project"],
                        datasets: [{
                                backgroundColor: [
                                    "#FF9933",
                                    "#FF8000",
                                    "#CC6600"
                                ],
                                data: [
                                    <%=pj.getTotal_re()%>,
                                    <%=pj.getTotal_req()%>,
                                    <%=pj.getTotal_fin()%>
                                ]
                            }]
                    }
                });
            });

        </script>
        <jsp:include page="header.jsp" flush="false"/>
        <div class="container-fluid" style="margin-top: 100px">
            <div class="container-fluid">
                <div class="panel panel-default" style="border-radius: 0px">
                    <div class="panel-heading">ALL Model</div>
                    <div class="panel-body">
                        <div class="col-sm-4">
                            <div class="chart-container" style="position: relative; height:300px; width:300px">
                                <canvas id="myChart" width="50" height="50"></canvas>
                            </div>
                        </div>
                        <div class="col-sm-8">
                            <div class="card card-stats">
                                <div class="card-header" data-background-color="blue">
                                    <i class="material-icons">account_balance_wallet</i>
                                </div>
                                <div class="card-content">
                                    <p class="category">All Model</p>
                                    <h3 class="title"><%=m.getTotal()%><small> Model</small></h3>
                                </div>
                                <div class="card-footer">
                                    <div class="stats">
                                        Model
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="container-fluid">
                <div class="panel panel-default" style="border-radius: 0px">
                    <div class="panel-heading">ALL Project</div>
                    <div class="panel-body">
                        <div class="col-sm-4">
                            <div class="chart-container" style="position: relative; height:300px; width:300px">
                                <canvas id="myChart2" width="50" height="50"></canvas>
                            </div>
                        </div>
                        <div class="col-sm-8">
                            <div class="card card-stats">
                                <div class="card-header" data-background-color="orange">
                                    <i class="material-icons">assessment</i>
                                </div>
                                <div class="card-content">
                                    <p class="category">All Project</p>
                                    <h3 class="title"><%=pj.getTotal()%><small> Project</small></h3>
                                </div>
                                <div class="card-footer">
                                    <div class="stats">
                                        Project
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </body>
</html>

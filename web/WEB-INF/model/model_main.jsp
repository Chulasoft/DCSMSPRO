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
        <title>Main Menu</title>
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
        <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
        <%
            if (request.getAttribute("m") != null && request.getAttribute("listCri") != null) {
                Model d = (Model) request.getAttribute("m");
                ArrayList<Model> listCri = (ArrayList) request.getAttribute("listCri");
        %>
        <script type="text/javascript">
            google.charts.load('current', {packages: ["orgchart"]});
            google.charts.setOnLoadCallback(drawChart);

            function drawChart() {
                var data = new google.visualization.DataTable();
                data.addColumn('string', 'Name');
                data.addColumn('string', 'Manager');
                data.addColumn('string', 'ToolTip');

                // For each orgchart box, provide the name, manager, and tooltip to show.
                data.addRows([
                    ['<%=d.getModel_goal()%>', '', '']
                ]);

            <%
                for (int i = 0; i < listCri.size(); i++) {
            %>
                data.addRows([[{v: '<%=listCri.get(i).getCri_name()%>', f: '<div style="color:red; font-style:italic"><%=listCri.get(i).getCri_name()%></div>'}, '<%=d.getModel_goal()%>', '']]);
            <%
                ArrayList<Model> scri = (ArrayList) request.getAttribute("listSub" + listCri.get(i).getCri_id());
                for (int j = 0; j < scri.size(); j++) {
                    if (j == 0) {
            %>
                data.addRows([['<%=scri.get(j).getSc_name()%>', '<%=listCri.get(i).getCri_name()%>', '']]);
            <%
            } else {
            %>
                data.addRows([['<%=scri.get(j).getSc_name()%>', '<%=scri.get(j - 1).getSc_name()%>', '']]);
            <%
                        }
                    }
                }
            %>
                // Set chart options
                var options = {
                    allowHtml: true,
                    size: 'large',
                    nodeClass: 'fixborder'
                };
                // Create the chart.
                var chart = new google.visualization.OrgChart(document.getElementById('chart_div'));
                // Draw the chart, setting the allowHtml option to true for the tooltips.
                chart.draw(data, options);
            }
        </script>
        <%
            }
        %>
    </head>
    <body>
        <jsp:include page="../header.jsp" flush="false"/>
    <content>
        <div class="container-fluid">
            <div class="row">
                <span class="hidden-mob">
                    <div class="col-sm-3 col-md-2 sidebar" style="overflow-y:auto">
                        <h3 style="margin-bottom: 30px">Model 
                            <div class="dropdown" style="float: right;">
                                <!--                                <a href="#" data-toggle="dropdown" data-toggle="tooltip" data-placement="bottom" title="Add New Model"><span class="glyphicon glyphicon-plus-sign"></span></a>
                                                                <ul class="dropdown-menu" style="z-index: 20">
                                                                    <li><a href="CreateModel" >Add</a></li>
                                                                </ul>-->
                                <a href="CreateModel" ><button type="button" class="btn btn-primary" style="border-radius: 0px"> Add </button></a>
                            </div>
                        </h3>


                        <%
                            if (request.getAttribute("am") != null) {
                        %>
                        <div class="panel panel-default" style="border-radius: 0px">
                            <div class="panel-heading"><strong>Recent Model</strong></div>
                            <div class="panel-body"><ul class="nav nav-sidebar" id="reChkEmt">
                                    <%
                                        ArrayList<Model> am = (ArrayList) request.getAttribute("am");
                                        for (Model m : am) {
                                            if (!m.isPublish()) {
                                    %>
                                    <li>
                                        <span>
                                            <a href="ModelMenu?m_id=<%=m.getModel_id()%>"><%=m.getModel_name()%></a>
                                            <a href="#" style="float: right;" data-toggle="modal" data-target="#myModal" onclick="who(<%=m.getModel_id()%>)"><span class="glyphicon glyphicon-remove"></span></a>
                                            <a href="#" style="float: right;margin-right: 6px;" onclick="who2(<%=m.getModel_id()%>)"><span class="glyphicon glyphicon-wrench"></span></a>
                                        </span>
                                    </li>
                                    <%
                                            }
                                        }
                                    %>
                                </ul></div>
                        </div>
                        <div class="panel panel-default" style="border-radius: 0px">
                            <div class="panel-heading" ><strong>Publish Model</strong></div>
                            <div class="panel-body"><ul class="nav nav-sidebar" id="pubChkEmt">
                                    <%
                                        for (Model m : am) {
                                            if (m.isPublish()) {
                                    %>
                                    <li>
                                        <span>
                                            <a href="ModelMenu?m_id=<%=m.getModel_id()%>"><%=m.getModel_name()%></a>
                                            <a href="#" style="float: right;" data-toggle="modal" data-target="#myModal" onclick="who(<%=m.getModel_id()%>)"><span class="glyphicon glyphicon-remove"></span></a>
                                        </span>
                                    </li>
                                    <%
                                            }
                                        }
                                    %>
                                </ul></div>
                        </div>
                        <%
                            }
                        %>

                    </div>
                </span>
                <%
                    if (request.getAttribute("m") != null) {
                        Model model = (Model) request.getAttribute("m");
                %>   
                <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main" style="top: 72px">
                    <div class="row">
                        <div class="form-group col-xs-4">
                            <h3><%=model.getModel_name()%></h3>
                        </div>
                        <div class="form-group col-xs-5">
                            <h3>Last update : <%=model.getModel_lastUpdate()%></h3>
                        </div>
                        <div class="form-group col-xs-3">
                            <h3>Status : <% if (model.getModel_status().equals("1")) {
                                    out.print("Finished");
                                } else {
                                    out.print("On Progress");
                                }%></h3>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-xs-3">
                            <p>${msg}</p>
                        </div>
                        <%
                            if (!model.isPublish()) {
                        %>
                        <div class="col-xs-offset-6 col-xs-3">
                            <a href="PublishModel?m_id=<%=model.getModel_id()%>"><button type="button" class="btn btn-default"><span class="glyphicon glyphicon-open-file"></span> Publish Model </button></a>
                        </div>
                        <%
                            }
                        %>
                    </div>
                    <hr>
                    <ul class="nav nav-tabs">
                        <li class="active"><a data-toggle="tab" href="#Hierarchy">Hierarchy</a></li>
                        <li><a data-toggle="tab" href="#AllCriteria">Criteria</a></li>
                        <li><a data-toggle="tab" href="#AllAlternative">Related Alternative</a></li>
                    </ul>
                    <div class="tab-content">
                        <div id="Hierarchy" class="tab-pane fade in active">
                            <div class="row" style="margin-top: 50px">
                                <div id='chart_div'></div>
                            </div>
                        </div>
                        <div id="AllCriteria" class="tab-pane fade">
                            <div class="col-sm-offset-3 col-sm-6" style="margin-top: 30px">
                                <%
                                    ArrayList<Model> allSubDB = (ArrayList) request.getAttribute("allSubDB");
                                    int criteria_id = -1;
                                    for (int i = 0; i < allSubDB.size(); i++) {
                                        if (criteria_id != allSubDB.get(i).getCri_id()) {
                                %>
                                <span class="col-sm-12">
                                    <div class='alert alert-danger'>
                                        <h3><%=allSubDB.get(i).getCri_name()%></h3>
                                    </div>
                                </span>
                                <%
                                        criteria_id = allSubDB.get(i).getCri_id();
                                    }
                                    if (allSubDB.get(i).getSc_name() != null) {
                                %>
                                <span class="col-sm-offset-1 col-sm-11">
                                    <a href="#" onclick='window.open("ShowModelQuestion.jsp?sc_id=<%=allSubDB.get(i).getSc_id()%>", "", "width=400,height=400")' style="text-decoration: none">
                                        <div class="alert alert-success"> 
                                            <h3><%=allSubDB.get(i).getSc_name()%></h3>
                                            click
                                        </div>
                                    </a>
                                </span>
                                <%
                                        }
                                    }
                                %>
                            </div>
                        </div>
                        <div id="AllAlternative" class="tab-pane fade">
                            <div class="col-sm-offset-3 col-sm-6" style="margin-top: 30px">
                                <%
                                    ArrayList<Model> listAlter = (ArrayList) request.getAttribute("listAlter");
                                    for (Model m : listAlter) {
                                %>
                                <a href="#" onclick='window.open("ShowModelAlAns.jsp?al_id=<%=m.getAl_id()%>", "", "width=400,height=400")' style="text-decoration: none">
                                    <div class="alert alert-danger" id="<%=m.getAl_id()%>" style="border-color: #EBEDEF;background-color: white;color: black;"> 
                                        <h3><%=m.getAl_name()%></h3>
                                        click
                                    </div>
                                </a>
                                <%
                                    }
                                %>
                            </div>
                        </div>
                    </div>


                </div>
                <%
                } else {
                %>
                <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main" style="top: 72px">
                    <div style="top:50%;left: 50%;position: fixed; text-align: center">
                        <h1>Create Your First Model</h1><br>
                        <a href="CreateModel" ><button type="button" class="btn btn-primary" style="border-radius: 0px"> Add </button></a>
                    </div>
                </div>
                <%
                    }
                %>
            </div>
            <!-- Modal -->
            <div id="myModal" class="modal fade" role="dialog">
                <div class="modal-dialog">

                    <!-- Modal content-->
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h4 class="modal-title">Confirm Delete</h4>
                        </div>
                        <div class="modal-body">
                            <form action="DeleteModel" method="post">
                                <p>Delete Model is related to Project </p>
                                <input type="hidden" name="modelId" id="modelId" value="">
                            </form>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-primary" onclick="document.forms[0].submit();">Accept</button>
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        </div>
                    </div>

                </div>
            </div>
            <form action="EditModel" method="post">
                <input type="hidden" name="modelId" id="modelId2" value="">
            </form>
            <script>
                $(document).ready(function () {
                    if ($("ul#reChkEmt li").length == 0) {
                        $("ul#reChkEmt").html("<li style='color:#C0C0C0;text-align: center'>Empty</li>");
                    }
                    if ($("ul#pubChkEmt li").length == 0) {
                        $("ul#pubChkEmt").html("<li style='color:#C0C0C0;text-align: center'>Empty</li>");
                    }
                });
                function who(num) {
                    $("#modelId").val(num);
                }
                function who2(num) {
                    $("#modelId2").val(num);
                    document.forms[1].submit();
                }
            </script>
    </content>
</body>
</html>

<%-- 
    Document   : project_main
    Created on : Apr 30, 2017, 11:54:39 AM
    Author     : Jab
--%>

<%@page import="DSST.Model.Member"%>
<%@page import="DSST.Model.Project"%>
<%@page import="DSST.Model.Model"%>
<%@page import="java.util.ArrayList"%>
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
        </style>
    </head>
    <body>
        <jsp:include page="../header.jsp" flush="false"/>
    <content>
        <div class="container-fluid">
            <div class="row">
                <span class="hidden-mob">
                    <div class="col-sm-3 col-md-2 sidebar" style="overflow-y:auto">
                        <h3 style="margin-bottom: 30px">Project 
                            <%
                                Member login = (Member) session.getAttribute("login");
                                if (login.getType() == 1) {
                            %>
                            <div class="dropdown" style="float: right;">
                                <a href="#" data-toggle="dropdown"><span class="glyphicon glyphicon-plus-sign"></span></a>
                                <ul class="dropdown-menu" style="z-index: 20">
                                    <li><a href="CreateProject">Add</a></li>
                                </ul>
                            </div>
                            <%
                                }
                            %>
                        </h3>


                        <%
                            if (request.getAttribute("listProjects") != null) {
                                ArrayList<Project> listProjects = (ArrayList) request.getAttribute("listProjects");
                                if (login.getType() == 1) {
                        %>
                        <div class="panel panel-default">
                            <div class="panel-heading"><strong>Recent Project</strong></div>
                            <div class="panel-body">
                                <ul class="nav nav-sidebar" id="reChkEmt">
                                    <%
                                        for (Project pj : listProjects) {
                                            if (pj.getProj_state() == 0) {
                                    %>
                                    <li>
                                        <span>
                                            <a href="ProjectMenu?pId=<%=pj.getProj_id()%>"><%=pj.getProj_name()%></a>
                                            <a href="#" style="float: right;" data-toggle="modal" data-target="#myModal" onclick="who(<%=pj.getProj_id()%>)"><span class="glyphicon glyphicon-remove"></span></a>
                                            <a href="#" style="float: right;margin-right: 6px;" onclick="who2(<%=pj.getProj_id()%>)"><span class="glyphicon glyphicon-wrench"></span></a>
                                        </span>
                                    </li>
                                    <%
                                            }
                                        }
                                    %>
                                </ul>
                            </div>
                        </div>
                        <%
                            }
                        %>
                        <div class="panel panel-default">
                            <div class="panel-heading"><strong>Request Answers</strong></div>
                            <div class="panel-body"><ul class="nav nav-sidebar" id="reqChkEmt">
                                    <%
                                        for (Project pj : listProjects) {
                                            if (pj.getProj_state() == 1) {
                                    %>
                                    <li>
                                        <span>
                                            <a href="ProjectMenu?pId=<%=pj.getProj_id()%>"><%=pj.getProj_name()%></a>
                                            <a href="#" style="float: right;" data-toggle="modal" data-target="#myModal" onclick="who(<%=pj.getProj_id()%>)"><span class="glyphicon glyphicon-remove"></span></a>
<!--                                            <a href="#" style="float: right;margin-right: 6px;" onclick="who2(<%=pj.getProj_id()%>)"><span class="glyphicon glyphicon-wrench"></span></a>-->
                                        </span>
                                    </li>
                                    <%
                                            }
                                        }
                                    %>
                                </ul></div>
                        </div>
                        <div class="panel panel-default">
                            <div class="panel-heading"><strong>Finished Project</strong></div>
                            <div class="panel-body"><ul class="nav nav-sidebar" id="finChkEmt">
                                    <%
                                        for (Project pj : listProjects) {
                                            if (pj.getProj_state() == 2) {
                                    %>
                                    <li>
                                        <span>
                                            <a href="ProjectMenu?pId=<%=pj.getProj_id()%>"><%=pj.getProj_name()%></a>
                                            <a href="#" style="float: right;" data-toggle="modal" data-target="#myModal" onclick="who(<%=pj.getProj_id()%>)"><span class="glyphicon glyphicon-remove"></span></a>
<!--                                            <a href="#" style="float: right;margin-right: 6px;" onclick="who2(<%=pj.getProj_id()%>)"><span class="glyphicon glyphicon-wrench"></span></a>-->
                                        </span>
                                    </li>
                                    <%
                                            }
                                        }
                                    %>
                                </ul></div>
                        </div>
                        <%
                        } else {
                            if (login.getType() == 1) {
                        %>
                        <div class="panel panel-default">
                            <div class="panel-heading"><strong>Recent Project</strong></div>
                            <div class="panel-body">
                                <ul class="nav nav-sidebar">
                                    <li style="color:#C0C0C0;text-align: center">
                                        Empty
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <%
                            }
                        %>
                        <div class="panel panel-default">
                            <div class="panel-heading"><strong>Request Answers</strong></div>
                            <div class="panel-body">
                                <ul class="nav nav-sidebar">
                                    <li style="color:#C0C0C0;text-align: center">
                                        Empty
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <div class="panel panel-default">
                            <div class="panel-heading"><strong>Finished Project</strong></div>
                            <div class="panel-body">
                                <ul class="nav nav-sidebar">
                                    <li style="color:#C0C0C0;text-align: center">
                                        Empty
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <%
                            }
                        %>
                    </div>
                </span>
                <%
                    if (request.getAttribute("pj") != null) {
                        Project proj = (Project) request.getAttribute("pj");
                        if (request.getAttribute("msg") == null) {
                %>
                <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main" style="top: 72px">
                    <div class="row">
                        <div class="form-group col-xs-4">
                            <h3><%=proj.getProj_name()%></h3>
                        </div>
                        <div class="form-group col-xs-5">
                            <h3>Last update : <%=proj.getProj_lastUpdate()%></h3>
                        </div>
                        <div class="form-group col-xs-3">
                            <h3>Status : <%if (proj.getProj_status().equals("0")) {
                                    out.print("OnProgress");
                                } else {
                                    out.print("Finished");
                                }%></h3>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-xs-3">
                            <p style="color: red">${msgRes}</p>
                        </div>
                        <%
                            if (proj.getProj_state() == 0) {
                        %>
                        <div class="col-xs-offset-6 col-xs-3">
                            <a href="RequestAns?p_id=<%=proj.getProj_id()%>"><button type="button" class="btn btn-default"><span class="glyphicon glyphicon-open-file"></span> Request Answer </button></a>
                        </div>
                        <%
                        } else if (login.getType() == 2) {
                            if (proj.getProj_status().equals("1")) {
                        %>
                        <div class="col-xs-offset-6 col-xs-3">
                            <a href="CustomerAns?p_id=<%=proj.getProj_id()%>"><button type="button" class="btn btn-default"><span class="glyphicon glyphicon-log-out"></span> Set New Answer </button></a>
                            <a href="ProcessAns?p_id=<%=proj.getProj_id()%>"><button type="button" class="btn btn-default"><span class="glyphicon glyphicon-log-out"></span> Process Answer </button></a>
                        </div>
                        <%
                        } else if (!proj.getProj_status().equals("2")) {
                        %>
                        <div class="col-xs-offset-6 col-xs-3">
                            <a href="CustomerAns?p_id=<%=proj.getProj_id()%>"><button type="button" class="btn btn-default"><span class="glyphicon glyphicon-log-out"></span> Set Answer </button></a>
                        </div>
                        <%
                                }
                            }
                        %>
                    </div>
                    <hr>
                    <%
                        if (proj.getProj_state() == 2 && proj.getProj_status().equals("2")) {
                    %>
                    <div class="row">
                        <h3>Result</h3>
                        <hr>
                        <ul class="nav nav-tabs">
                            <li class="active"><a data-toggle="tab" href="#Score">Score</a></li>
                            <li><a data-toggle="tab" href="#Product">Product</a></li>
                            <li><a data-toggle="tab" href="#QuesAnswer">Question & Answer</a></li>
                            <li><a data-toggle="tab" href="#IntenAnswer">Criteria Intensity</a></li>
                        </ul>

                        <div class="tab-content">
                            <div id="Score" class="tab-pane fade in active">
                                <table class="table">
                                    <thead>
                                        <tr style="text-align: center">
                                            <th colspan="3">Main Criteria</th>
                                            <th colspan="4">Sub-Criteria</th>
                                        </tr>
                                        <tr style="text-align: center">
                                            <th>Criteria Item</th>
                                            <th>CR</th>
                                            <th>Weight</th>
                                            <th>Sub-Criteria Item</th>
                                            <th>CR</th>
                                            <th>Local-Weight</th>
                                            <th>Global-Weight</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <%
                                            ArrayList<Project> table1 = (ArrayList) request.getAttribute("table");
                                            Model m1 = new Model();
                                            int after1 = 0;
                                            ArrayList<Model> mcri1 = new ArrayList();
                                            for (Project cri : table1) {
                                                if (after1 == 0 || after1 != cri.getCRI_ID()) {
                                                    mcri1 = m1.getSubCriteriaByID(cri.getCRI_ID());
                                                }
                                                if (cri.getCRI_TYPE() == 1) {
                                        %>
                                        <tr>
                                            <td rowspan = "<%=mcri1.size() + 1%>"><a href="#" onclick='window.open("PieChart.jsp?p_id=<%=cri.getProj_id()%>&cri_id=<%=cri.getCRI_ID()%>", "", "width=800,height=500")'><%=cri.getCRITERIA_NAME()%></a></td>
                                            <td rowspan = "<%=mcri1.size() + 1%>"><%=cri.getCR()%></td>
                                            <td rowspan = "<%=mcri1.size() + 1%>"><%=Project.round(cri.getLOCAL_WEIGHT(), 4)%></td>
                                            <%
                                            } else {
                                                if (after1 == cri.getCRI_ID()) {
                                            %>
                                        <tr>
                                            <%
                                                }
                                            %>
                                            <td><%=cri.getCRITERIA_NAME()%></td>
                                            <td><%=cri.getCR()%></td>
                                            <td><%=Project.round(cri.getLOCAL_WEIGHT(), 4)%></td>
                                            <td><%=Project.round(cri.getGLOBAL_WEIGHT(), 4)%></td>
                                        </tr>
                                        <%

                                                }
                                                after1 = cri.getCRI_ID();
                                            }
                                        %>
                                    </tbody>
                                </table>
                                <a href="#" onclick='window.open("allCriteriaPie.jsp?p_id=<%=proj.getProj_id()%>", "", "width=800,height=500")'><button class="btn btn-default" type="button"><span>Criteria Pie Chart</span></button></a>
                                <a href="#" onclick='window.open("allSubPie.jsp?p_id=<%=proj.getProj_id()%>", "", "width=800,height=500")'><button class="btn btn-default" type="button"><span>Sub-Criteria Pie Chart</span></button></a>
                            </div>


                            <div id="Product" class="tab-pane fade">
                                <table class="table">
                                    <thead>
                                        <tr style="text-align: center">
                                            <th>Criteria</th>
                                            <th>Sub-Criteria</th>
                                            <th>Global Weight</th>
                                                <%
                                                    ArrayList<Project> list = (ArrayList) request.getAttribute("list");
                                                    int oldSc_id = list.get(0).getSc_id();
                                                    int stop = -1;
                                                    for (int i = 0; stop != 0; i++) {
                                                        if (oldSc_id != list.get(i).getSc_id()) {
                                                            stop++;
                                                        } else {
                                                %>
                                            <th><%=list.get(i).getAl_name()%></th>
                                                <%
                                                        }
                                                    }
                                                %>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <%
                                            ArrayList<Project> table = (ArrayList) request.getAttribute("table");
                                            Model m = new Model();
                                            int after = 0;
                                            int proNum = 0;
                                            ArrayList<Model> mcri = new ArrayList();
                                            int count = 0;
                                            for (Project cri : table) {
                                                if (after == 0 || after != cri.getCRI_ID()) {
                                                    mcri = m.getSubCriteriaByID(cri.getCRI_ID());
                                                }
                                                if (cri.getCRI_TYPE() == 1) {
                                        %>
                                        <tr>
                                            <td rowspan = "<%=mcri.size() + 1%>"><a href="#" onclick='window.open("ChartCriteria.jsp?p_id=<%=cri.getProj_id()%>&cr_id=<%=cri.getCRI_ID()%>", "", "width=420,height=420")'><%=cri.getCRITERIA_NAME()%></a></td>
                                                <%
                                                } else {
                                                    if (after == cri.getCRI_ID()) {
                                                %>
                                        <tr>
                                            <%
                                                }
                                            %>
                                            <td><a href="#" onclick='window.open("Chart.jsp?p_id=<%=cri.getProj_id()%>&sc_id=<%=cri.getSc_id()%>", "", "width=420,height=420")'><%=cri.getCRITERIA_NAME()%></a></td>
                                            <td name="glow"><%=Project.round(cri.getGLOBAL_WEIGHT(), 4)%></td>
                                            <%
                                                proNum = 0;
                                                while (count < list.size()) {

                                                    if (oldSc_id != list.get(count).getSc_id()) {
                                                        oldSc_id = list.get(count).getSc_id();
                                                        break;
                                                    }
                                            %>
                                            <td name="pro<%=proNum%>"><%=Project.round(list.get(count).getWeight(), 4)%></td>
                                            <%
                                                    count++;
                                                    proNum++;
                                                }
                                            %>
                                        </tr>
                                        </tr>
                                    <input type="hidden" id="length" value="<%=proNum%>">
                                    <%
                                            }
                                            after = cri.getCRI_ID();
                                        }
                                    %>
                                    <tr>
                                        <td colspan="3">Alternative Priority</td>
                                        <%
                                            for (int j = 0; j < proNum; j++) {
                                        %>
                                        <td id="pro<%=j%>"></td>
                                        <%
                                            }
                                        %>
                                    </tr>
                                    </tbody>
                                </table>
                                <script>
                                    $(document).ready(function () {
                                        var allPriorityProduct = [];
                                        var global = [];
                                        $('td[name^="glow"]').each(function () {
                                            global.push($(this).text());
                                        });
                                        var length = $("#length").val();
                                        for (var i = 0; i < length; i++) {
                                            var product = [];
                                            $('td[name^="pro' + i + '"]').each(function () {
                                                product.push($(this).text());
                                            });
                                            var priority = 0;
                                            console.log("Product" + product.toString());
                                            console.log("Global" + global.toString());
                                            for (var j = 0; j < product.length; j++) {
                                                priority = (product[j] * global[j]) + priority;
                                            }
//                                            var xx = 0;
//                                            $('td[name^="pro' + i + '"]').each(function () {
//                                                $(this).text(Math.round((product[xx] * global[xx]) * 10000) / 10000);
//                                                xx++;
//                                            });
//                                            var xx = 0;
                                            allPriorityProduct.push(priority);
                                        }
                                        for (var i = 0; i < length; i++) {
                                            $("#pro" + i).text(Math.round(allPriorityProduct[i] * 10000) / 10000);
                                        }
                                    });
                                </script>
                            </div>

                            <div id="QuesAnswer" class="tab-pane fade">
                                <%
                                    Project pjInten = new Project();

                                    ArrayList<Project> listReq = pjInten.getReqAnswer(proj.getProj_id());
                                    if (!listReq.isEmpty()) {

                                %>
                                <div class="col-sm-5" >
                                    <table class="table">
                                        <tr>
                                            <th>Question</th>
                                            <th>Answers</th>
                                        </tr>
                                        <%                for (Project req : listReq) {
                                        %>
                                        <tr>
                                            <td><%=req.getQuestion()%></td>
                                            <td><%
                                                if (req.getAnswer() == 0) {
                                                    out.print("Don't Want");
                                                } else if (req.getAnswer() == 1) {
                                                    out.print("Could Have");
                                                } else if (req.getAnswer() == 2) {
                                                    out.print("Should Have");
                                                } else if (req.getAnswer() == 3) {
                                                    out.print("Must Have");
                                                }
                                                %></td>
                                        </tr>
                                        <%
                                            }
                                        %>
                                    </table>
                                </div>
                                <%
                                } else {
                                %>
                                <h1>Not Have Answer</h1>
                                <%
                                    }
                                %>
                            </div>

                            <div id="IntenAnswer" class="tab-pane fade">
                                <%
                                    ArrayList<Project> listInten = pjInten.getIntenAnswer(proj.getProj_id());
                                    if (!listInten.isEmpty()) {

                                %>

                                <div class="col-sm-5">
                                    <table class="table">
                                        <tr>
                                            <th>Criteria A</th>
                                            <th>Intensity</th>
                                            <th>Criteria B</th>
                                        </tr>
                                        <%                for (Project inten : listInten) {
                                        %>
                                        <tr>
                                            <td><%=inten.getCri_a()%></td>
                                            <td><%=inten.getIntensity()%></td>
                                            <td><%=inten.getCri_b()%></td>
                                        </tr>
                                        <%
                                            }
                                        %>
                                    </table>
                                </div>
                                <%
                                } else {
                                %>
                                <h1>Not Have Answer</h1>
                                <%
                                    }
                                %>
                            </div>

                        </div>
                    </div>
                    <%
                        }
                    %>
                </div>
                <%
                } else {
                    if (!(proj.getProj_state() == 0 && login.getType() == 2)) {
                %>
                <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main" style="top: 72px;">
                    <div class="row">
                        <div class="form-group col-xs-4">
                            <h3><%=proj.getProj_name()%></h3>
                        </div>
                        <div class="form-group col-xs-5">
                            <h3>Last update : <%=proj.getProj_lastUpdate()%></h3>
                        </div>
                        <div class="form-group col-xs-3">
                            <h3>Status : <%if (proj.getProj_status().equals("0")) {
                                    out.print("OnProgress");
                                } else {
                                    out.print("Finished");
                                }%></h3>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-xs-3">
                            <p style="color: red">${msgRes}</p>
                        </div>
                        <%

                            if (proj.getProj_state() == 0) {
                        %>
                        <div class="col-xs-offset-6 col-xs-3">
                            <a href="RequestAns?p_id=<%=proj.getProj_id()%>"><button type="button" class="btn btn-default"><span class="glyphicon glyphicon-open-file"></span> Request Answer </button></a>
                        </div>
                        <%
                        } else if (login.getType() == 2) {
                        %>
                        <div class="col-xs-offset-6 col-xs-3">
                            <a href="CustomerAns?p_id=<%=proj.getProj_id()%>"><button type="button" class="btn btn-default"><span class="glyphicon glyphicon-log-out"></span> Set Answer </button></a>
                        </div>
                        <%
                            }
                        %>
                    </div>
                    <hr>
                    <h1><%=request.getAttribute("msg")%></h1>
                    <br>
                    <!--Unfinished Project-->

                    <ul class="nav nav-tabs">
                        <li class="active"><a data-toggle="tab" href="#QuesAnswer">Question & Answer</a></li>
                        <li><a data-toggle="tab" href="#IntenAnswer">Criteria Intensity</a></li>
                    </ul>
                    <div class="tab-content">



                        <div id="QuesAnswer" class="tab-pane fade in active">
                            <%
                                Project pjInten = new Project();

                                ArrayList<Project> listReq = pjInten.getReqAnswer(proj.getProj_id());
                                if (!listReq.isEmpty()) {

                            %>
                            <div class="col-sm-5" >
                                <table class="table table-striped">
                                    <tr>
                                        <th>Question</th>
                                        <th>Answers</th>
                                    </tr>
                                    <%                for (Project req : listReq) {
                                    %>
                                    <tr>
                                        <td><%=req.getQuestion()%></td>
                                        <td><%
                                            if (req.getAnswer() == 0) {
                                                out.print("Don't Want");
                                            } else if (req.getAnswer() == 1) {
                                                out.print("Could Have");
                                            } else if (req.getAnswer() == 2) {
                                                out.print("Should Have");
                                            } else if (req.getAnswer() == 3) {
                                                out.print("Must Have");
                                            }
                                            %></td>
                                    </tr>
                                    <%
                                        }
                                    %>
                                </table>
                            </div>
                            <%
                            } else {
                            %>
                            <h1>Not Have Answer</h1>
                            <%
                                }
                            %>
                        </div>

                        <div id="IntenAnswer" class="tab-pane fade">
                            <%
                                ArrayList<Project> listInten = pjInten.getIntenAnswer(proj.getProj_id());
                                if (!listInten.isEmpty()) {

                            %>

                            <div class="col-sm-5">
                                <table class="table table-striped">
                                    <tr>
                                        <th>Criteria A</th>
                                        <th>Intensity</th>
                                        <th>Criteria B</th>
                                    </tr>
                                    <%                for (Project inten : listInten) {
                                    %>
                                    <tr>
                                        <td><%=inten.getCri_a()%></td>
                                        <td><%=inten.getIntensity()%></td>
                                        <td><%=inten.getCri_b()%></td>
                                    </tr>
                                    <%
                                        }
                                    %>
                                </table>
                            </div>
                            <%
                            } else {
                            %>
                            <h1>Not Have Answer</h1>
                            <%
                                }
                            %>
                        </div>


                    </div>

                    <!--Unfinished Project-->

                </div>
            </div>
            <%
            } else {
            %>
            <div style="top:50%;left: 50%;position: fixed;">
                <h1>Project are not available</h1>
            </div>
            <%
                    }
                }
            } else {
            %>
            <div style="top:50%;left: 50%;position: fixed;">
                <h1>Project are not available</h1>
            </div>
            <%
                }
            %>
        </div>
    </content>
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
                    <form action="DeleteProject" method="post">
                        <p>Delete Model is related to Project </p>
                        <input type="hidden" name="projectId" id="projectId" value="">
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" onclick="document.forms[0].submit();">Accept</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
            </div>

        </div>
    </div>
    <form action="EditProject" method="post">
        <input type="hidden" name="projectId" id="projectId2" value="">
    </form>
    <script>
        $(document).ready(function () {
            if ($("ul#reChkEmt li").length == 0) {
                $("ul#reChkEmt").html("<li style='color:#C0C0C0;text-align: center'>Empty</li>");
            }
            if ($("ul#reqChkEmt li").length == 0) {
                $("ul#reqChkEmt").html("<li style='color:#C0C0C0;text-align: center'>Empty</li>");
            }
            if ($("ul#finChkEmt li").length == 0) {
                $("ul#finChkEmt").html("<li style='color:#C0C0C0;text-align: center'>Empty</li>");
            }
        });
        function who(num) {
            $("#projectId").val(num);
        }
        function who2(num) {
            $("#projectId2").val(num);
            document.forms[1].submit();
        }
    </script>
</body>
</html>

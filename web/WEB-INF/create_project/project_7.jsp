<%-- 
    Document   : project_6
    Created on : May 10, 2017, 1:44:30 AM
    Author     : Jab-PC
--%>

<%@page import="DSST.Model.Model"%>
<%@page import="DSST.Model.Project"%>
<%@page import="java.util.ArrayList"%>
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
                        <h3>Result</h3>
                        <hr>
                        <ul class="nav nav-tabs">
                            <li class="active"><a data-toggle="tab" href="#Score">Score</a></li>
                            <li><a data-toggle="tab" href="#Product">Product</a></li>
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
                                            <td rowspan = "<%=mcri1.size() + 1%>"><%=cri.getCRITERIA_NAME()%></td>
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
                                            <td><%=Project.round(cri.getLOCAL_WEIGHT(),4)%></td>
                                            <td><%=Project.round(cri.getGLOBAL_WEIGHT(),4)%></td>
                                        </tr>
                                        <%

                                                }
                                                after1 = cri.getCRI_ID();
                                            }
                                        %>
                                    </tbody>
                                </table>
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
                    <td rowspan = "<%=mcri.size() + 1%>"><%=cri.getCRITERIA_NAME()%></td>
                    <%
                    } else {
                        if (after == cri.getCRI_ID()) {
                    %>
                <tr>
                    <%
                        }
                    %>
                    <td><%=cri.getCRITERIA_NAME()%></td>
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
                    for(int j = 0 ;j < proNum; j++){
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
                    for (var j = 0; j < product.length ; j++) {
                        priority = (product[j]*global[j])+priority;
                    }
                    allPriorityProduct.push(priority);
                }
                for (var i = 0; i < length; i++) {
                    $("#pro"+i).text(Math.round(allPriorityProduct[i]*10000)/10000);
                }
            });
        </script>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </content>
</body>
</html>

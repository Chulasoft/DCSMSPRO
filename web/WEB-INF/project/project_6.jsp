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
                        <h3>Result</h3>
                        <hr>
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
                                    ArrayList<Project> table = (ArrayList) session.getAttribute("table");
                                    Model m = new Model();
                                    int after = 0;
                                    ArrayList<Model> mcri = new ArrayList();
                                    for (Project cri : table) {
                                        if (after == 0 || after != cri.getCRI_ID()) {
                                            mcri = m.getSubCriteriaByID(cri.getCRI_ID());
                                        }
                                        if (cri.getCRI_TYPE() == 1) {
                                %>
                                <tr>
                                    <td rowspan = "<%=mcri.size() + 1%>"><%=cri.getCRITERIA_NAME()%></td>
                                    <td rowspan = "<%=mcri.size() + 1%>"><%=cri.getCR()%></td>
                                    <td rowspan = "<%=mcri.size() + 1%>"><%=cri.getLOCAL_WEIGHT()%></td>
                                    <%
                                    } else {
                                        if (after == cri.getCRI_ID()) {
                                    %>
                                <tr>
                                    <%
                                        }
                                    %>
                                    <td><%=cri.getCRITERIA_NAME()%></td>
                                    <td><%=cri.getCR()%></td>
                                    <td><%=cri.getLOCAL_WEIGHT()%></td>
                                    <td><%=cri.getGLOBAL_WEIGHT()%></td>
                                </tr>
                                <%

                                        }
                                        after = cri.getCRI_ID();
                                    }
                                %>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </content>
</body>
</html>

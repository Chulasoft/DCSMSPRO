<%-- 
    Document   : model_7
    Created on : Apr 27, 2017, 4:28:56 PM
    Author     : Jab
--%>

<%@page import="DSST.Model.Model"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
            Model d = (Model)session.getAttribute("mo");
            int cri_id[] = (int[]) session.getAttribute("cri_id");
            String cri[] = (String[]) session.getAttribute("cri");
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
                for (int i = 0; i < cri_id.length; i++) {
            %>
                data.addRows([[{v: '<%=cri[i]%>', f: '<div style="color:red; font-style:italic"><%=cri[i]%></div>'}, '<%=d.getModel_goal()%>', '']]);
            <%
                int sub_id[] = (int[]) session.getAttribute("sub_id" + cri_id[i]);
                String scri[] = (String[]) session.getAttribute("scri" + cri_id[i]);
                for (int j = 0; j < sub_id.length; j++) {
                    if (j == 0) {
            %>
                data.addRows([['<%=scri[j]%>', '<%=cri[i]%>', '']]);
            <%
            } else {
            %>
                data.addRows([['<%=scri[j]%>', '<%=scri[j - 1]%>', '']]);
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
    </head>
    <body>
        <jsp:include page="../header.jsp" flush="false"/>
    <content>
        <div class="container-fluid">
            <div class="row">
                <span class="hidden-mob">
                    <jsp:include page="sidenav_create_model.jsp" flush="false"/>
                </span>
                <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main" style="top: 72px">
                    <div class="row" style="margin-bottom: 72px">
                        <h3>Summary</h3>
                        <hr> 
                    </div>
                    <div id="chart_div"></div>
                    <div class="row" style="margin-top: 72px">
                        <div class="col-sm-2">
                            <h3>Status</h3>
                            <hr>
                            <p>
                                Overall Status :  On progress
                            </p>
                            <a href="ModelMenu" style="text-decoration: none"><button class="btn btn-default" style="border-radius: 0px">Back to Menu</button></a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </content>
</body>

</html>

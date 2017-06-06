<%-- 
    Document   : Chart
    Created on : Jun 5, 2017, 11:54:12 AM
    Author     : Jab-PC
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="DSST.Model.Project"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <script src="./js/jquery-3.2.0.min.js"></script>        
        <script src="./js/Chart.js"></script>
    </head>
    <body>
        <div>
            <%
                String p_id = request.getParameter("p_id");
                String sc_id = request.getParameter("sc_id");
                Project pj = new Project();
                ArrayList<Project> listPj = (ArrayList) pj.getChart(Integer.parseInt(p_id), Integer.parseInt(sc_id));
            %>
            <canvas id="myChart" width="200" height="200"></canvas>
            <script>
                var ctx = document.getElementById("myChart");
                var myRadarChart = new Chart(ctx, {
                type: 'radar',
                        data: {
                        labels: [
                <%
                    for (Project p : listPj) {
                %>
                        "<%=p.getAl_name()%>",
                <%
                    }
                %>
                        ],
                                datasets: [
                                {
                                    label: "Sub-Criteria",
                                fill: true,
                                        backgroundColor: "rgba(179,181,198,0.2)",
                                        borderColor: "rgba(179,181,198,1)",
                                        pointBorderColor: "#fff",
                                        pointBackgroundColor: "rgba(179,181,198,1)",
                                        data: [
                <%
                    for (Project p : listPj) {
                %>
                <%=p.getWeight()%>,
                <%
                    }
                %>
                                        ]
                                }
                                ]
                        }
                });
            </script>
        </div>
    </body>
</html>

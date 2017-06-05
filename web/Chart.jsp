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
        <script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.10.4/jquery-ui.min.js"></script>
        <script type="text/javascript" src="./js/polygonalGraphWidget.js"></script>
    </head>
    <body>
        <div>
            <%
                String p_id = request.getParameter("p_id");
                String sc_id = request.getParameter("sc_id");
                Project pj = new Project();
                ArrayList<Project> listPj = (ArrayList) pj.getChart(Integer.parseInt(p_id), Integer.parseInt(sc_id));
            %>
            <canvas id="myCanvas" width="400" height="400"></canvas>
            <script>
                var labels = new Array();
                var data1 = new Array();
                <%
                    for (Project p : listPj) {
                %>
                    labels.push('<%=p.getAl_name()%>');
                    data1.push('<%=p.getWeight()*100%>');
                <%
                    }
                %>
                
                var data = new Array(data1);
                var myVar = $("#myCanvas").polygonalGraphWidget(
                        {
                            labels: labels,
                            data: data
                        }
                );
            </script>
        </div>
    </body>
</html>

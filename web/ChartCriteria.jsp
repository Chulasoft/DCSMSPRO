<%-- 
    Document   : Chart
    Created on : Jun 5, 2017, 11:54:12 AM
    Author     : Jab-PC
--%>

<%@page import="DSST.Model.Model"%>
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
                String cr_id = request.getParameter("cr_id");
                Project pj = new Project();
                Model m = new Model();
                ArrayList<Model> listSub = (ArrayList) m.getSubCriteriaByID(Integer.parseInt(cr_id));
                ArrayList<Project> listPj = new ArrayList();
            %>
            <canvas id="myCanvas" width="400" height="400"></canvas>
            <script>
                var labels = new Array();
                var data = new Array();
                var veticalData = new Array();
                var i = 0;
                <%
                    for (int i = 0; i < listSub.size(); i++) {
                        listPj = (ArrayList) pj.getChart(Integer.parseInt(p_id), listSub.get(i).getSc_id());
                %>
                var data<%=i%> = new Array();
                <%
                    for (int j = 0; j < listPj.size(); j++) {
                %>
                        data<%=i%>.push(<%=listPj.get(j).getWeight() * 100%>);
                <%
                    }
                %>
                    labels.push(<%=listSub.get(i).getSc_name()%>);
                    data.push(data<%=i%>);
                <%
                    }
                %>

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

<%-- 
    Document   : PieChart
    Created on : Jun 5, 2017, 7:01:00 PM
    Author     : Soft-PC
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="DSST.Model.Project"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
      google.charts.load("current", {packages:["corechart"]});
      google.charts.setOnLoadCallback(drawChart);
      function drawChart() {
        var data = google.visualization.arrayToDataTable([
          ['Task', 'Hours per Day'],
          <%
              String p_id = request.getParameter("p_id");
              String cri_id = request.getParameter("cri_id");
              Project pj = new Project();
              ArrayList<Project> listPro = new ArrayList();
              listPro = pj.getPieChart(Integer.parseInt(p_id), Integer.parseInt(cri_id));
              int count = 0;
              for(Project pp : listPro){
          %>
                ['<%=pp.getCRITERIA_NAME()%>', <%=pp.getWeight()%>]<%if(count+1<listPro.size()){out.print(",");}%>
          <%
              count++;
              }
          %>
        ]);

        var options = {
          title: 'PieChart Criteria',
          pieHole: 0.4,
        };

        var chart = new google.visualization.PieChart(document.getElementById('donutchart'));
        chart.draw(data, options);
      }
    </script>
  </head>
  <body>
    <div id="donutchart" style="width: 900px; height: 500px;"></div>
  </body>
</html>

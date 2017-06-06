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
        <script src="./js/Chart.js"></script>
    </head>
    <body>
        <%
            String p_id = request.getParameter("p_id");
            String cr_id = request.getParameter("cr_id");
            Project pj = new Project();
            Model m = new Model();
            ArrayList<Model> listSub = (ArrayList) m.getSubCriteriaByID(Integer.parseInt(cr_id));
            ArrayList<Project> listPj = new ArrayList();
            listPj = (ArrayList) pj.getRadarCriChart(Integer.parseInt(p_id), Integer.parseInt(cr_id));
        %>
        <div style="width: 400px">
            <canvas id="myChart" width="200" height="200"></canvas>
        </div>
        <script>
            var colors = ["rgba(179,181,198,0.2)", "rgba(255,99,132,0.2)", "rgba(145, 84, 25,0.2)", "rgba(45, 192, 116,0.2)", "rgba(177, 58, 116,0.2)", "rgba(86, 131, 116,0.2)", "rgba(32, 62, 166,0.2)"];
            var colors2 = ["rgba(179,181,198,1)", "rgba(255,99,132,1)", "rgba(145, 84, 25,1)", "rgba(45, 192, 116,1)", "rgba(177, 58, 116,1)", "rgba(86, 131, 116,1))", "rgba(32, 62, 166,1)"];
            var ctx = document.getElementById("myChart");
            var myChart = new Chart(ctx, {
            type: 'radar',
                    data: {

                    labels: [
            <%
                for (int i = 0; i < listSub.size(); i++) {
                    if (listSub.size() != i + 1) {
            %>
                    '<%=listSub.get(i).getSc_name()%>',
            <%
            } else {
            %>
                    '<%=listSub.get(i).getSc_name()%>'
            <%
                    }
                }
            %>
                    ],datasets: [
            <%
                int old_al_id = -1;
                int co = -1;
                for (int i = 0; i < listPj.size(); i++) {
                    if (listPj.get(i).getAl_id()!=old_al_id) {
                        co++;
            %>
                    
                    {label: "<%=listPj.get(i).getAl_name()%>",
                            fill: true,
                            backgroundColor: colors[<%=co%>],
                            borderColor: colors2[<%=co%>],
                            pointBorderColor: "#fff",
                            pointBackgroundColor: colors2[<%=co%>],
                            data: [
            <%
                old_al_id = listPj.get(i).getAl_id();
                                    }
            %>
                            <%=listPj.get(i).getWeight()%>,
            <%
                if(i+1!=listPj.size()){
                    if (listPj.get(i+1).getAl_id()!=old_al_id) {
            %>
                            ]
                    },
            <%
                }
                }else{
            %>
                           ]
                    },         
            <%
                }
                
}
            %>
                    ]
                    }
            });
        </script>
    </body>
</html>

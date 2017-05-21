<%-- 
    Document   : newjsp
    Created on : May 17, 2017, 6:00:31 PM
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
        <title>JSP Page</title>
        <script src="./js/jquery-3.2.0.min.js"></script>        
        <script src="./bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
        <link rel="stylesheet" type="text/css" href="./bootstrap-3.3.7-dist/css/bootstrap.min.css" >
    </head>
    <body>
        <table>
            <thead>
                <tr style="text-align: center">
                    <th colspan="3"></th>
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
    </body>
</html>

<%-- 
    Document   : ShowModelQuestion
    Created on : Jun 18, 2017, 9:41:33 AM
    Author     : 006131
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="DSST.Model.Model"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Question</title>
        <script src="./js/jquery-3.2.0.min.js"></script>        
        <script src="./bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
        <link rel="stylesheet" type="text/css" href="./bootstrap-3.3.7-dist/css/bootstrap.min.css" >
    </head>
    <body>
        <h1>Question</h1>
        <table class="table table-striped">
            <tr>
                <th>Question</th>
            </tr>
            <%

                Model m = new Model();
                ArrayList<Model> listQuest = (ArrayList) m.getQuestionByID(Integer.parseInt(request.getParameter("sc_id")));
                if (!listQuest.isEmpty()) {
                    for (Model mm : listQuest) {
            %>
            <tr>
                <td><%=mm.getQuest_name()%></td>
            </tr>
            <%
                }
            } else {
            %>
            <h1>No Question</h1>
            <%
                }
            %>
        </table>
    </body>
</html>

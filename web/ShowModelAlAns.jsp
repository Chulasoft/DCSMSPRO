<%-- 
    Document   : ShowModelAlAns
    Created on : Jun 18, 2017, 10:02:18 AM
    Author     : 006131
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="DSST.Model.Model"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="./js/jquery-3.2.0.min.js"></script>        
        <script src="./bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
        <link rel="stylesheet" type="text/css" href="./bootstrap-3.3.7-dist/css/bootstrap.min.css" >
        <title>Alternative Answer</title>
    </head>
    <body>
        <h1>Question</h1>
        <table class="table">
            <tr>
                <th>Question</th>
                <th>Answer</th>
            </tr>
            <%
                Model m = new Model();
                ArrayList<Model> listAnswer = (ArrayList) m.getSpecAns(Integer.parseInt(request.getParameter("al_id")));
                if (!listAnswer.isEmpty()) {
                    int old = -1;
                    for (Model mm : listAnswer) {
                        if (mm.getSc_id()!= old) {
            %>
            <tr>
                <td colspan="2" style="text-align: center"><strong><%=mm.getSc_name()%></strong></td>
            </tr>
            <%
                System.out.println("old : " + old);
                System.out.println("sc : " + mm.getSc_id());
                old = mm.getSc_id();
                }
            %>
            <tr>
                <td><%=mm.getQuest_name()%></td>
                <td><%if(mm.getSpecAns()==1){out.print("Yes");}else{out.print("No");}%></td>
            </tr>
            <%
                }
            } else {
            %>
            <h1>No Answer</h1>
            <%
                }
            %>
        </table>
    </body>
</html>

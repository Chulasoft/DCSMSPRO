<%-- 
    Document   : newjsp
    Created on : May 17, 2017, 6:00:31 PM
    Author     : Soft-PC
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
        <%
            Project pj = new Project();
            ArrayList<Project> listInten = pj.getIntenAnswer(281);
            if (!listInten.isEmpty()) {
                
        %>
        <table class="table table-striped">
            <tr>
                <th>Criteria A</th>
                <th>Intensity</th>
                <th>Criteria B</th>
            </tr>
            <%
                for (Project inten : listInten) {
            %>
            <tr>
                <td><%=inten.getCri_a()%></td>
                <td><%=inten.getIntensity()%></td>
                <td><%=inten.getCri_b()%></td>
            </tr>
            <%
                }
            %>
        </table>
        <%
            }else{
        %>
        <h1>Not Have Answer</h1>
        <%
            }
        %>
        
        <%
            ArrayList<Project> listReq = pj.getReqAnswer(281);
            if (!listReq.isEmpty()) {
                
        %>
        <table class="table table-striped">
            <tr>
                <th>Question</th>
                <th>Answers</th>
            </tr>
            <%
                for (Project req : listReq) {
            %>
            <tr>
                <td><%=req.getQuestion()%></td>
                <td><%
                    if(req.getAnswer()==0){
                        out.print("Don't Want");
                    }else if(req.getAnswer()==1){
                        out.print("Could Have");
                    }else if(req.getAnswer()==2){
                        out.print("Should Have");
                    }else if(req.getAnswer()==3){
                        out.print("Must Have");
                    }
                %></td>
            </tr>
            <%
                }
            %>
        </table>
        <%
            }else{
        %>
        <h1>Not Have Answer</h1>
        <%
            }
        %>
    </body>
</html>

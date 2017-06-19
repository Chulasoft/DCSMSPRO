<%-- 
    Document   : project_1
    Created on : Apr 30, 2017, 11:28:32 AM
    Author     : Soft
--%>

<%@page import="DSST.Model.Project"%>
<%@page import="java.util.ArrayList"%>
<%@page import="DSST.Model.Model"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Decision Support Tool</title>
        <script src="./js/jquery-3.2.0.min.js"></script>        
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
        </style>
    </head>
    <body>
        <jsp:include page="../header.jsp" flush="false"/>
    <content>
        <div class="container-fluid">
            <div class="row">
                <span class="hidden-mob">
                    <jsp:include page="sidenav_edit_project.jsp" flush="false"/>
                </span>
                <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main" style="top: 72px">
                    <div class="row">
                        <h3>Define Project</h3>
                        <hr>
                        <div class="col-sm-offset-4 col-sm-4 ">
                            <%
                                        Project pj = (Project)request.getAttribute("pj");
                                    %>
                            <form action="EditProject" method="POST">
                                <input type="hidden" name="page" id="page" value="1"/>
                                <div class="form-group">
                                    <label for="model_name">Project Name : </label>
                                    <input type="text" class="form-control" name="proName" value="<%=pj.getProj_name()%>" required/>
                                </div>
                                <div class="form-group">
                                    
                                    <label for="goal">Model : </label><br>
                                    <select style="width: 100%;padding: 10px;border-radius: 5px;" name="proModel" required>
                                        <option value="">--Select Model--</option>
                                        <%
                                            if (request.getAttribute("am") != null) {
                                                ArrayList<Model> am = (ArrayList) request.getAttribute("am");
                                                for (Model m : am) {
                                        %>
                                        <option value="<%=m.getModel_id()%>" <%if(m.getModel_id()==pj.getProj_m_id()){out.print("selected");}%>><%=m.getModel_name()%></option>
                                        <%
                                                }
                                            }
                                        %>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label for="goal_des">Project Description : </label>
                                    <textarea rows="5" class="form-control" name="proDes"><%=pj.getProj_des()%></textarea>
                                </div>
                                <ul class="pager">
                                    <li><button type="submit" class="btn btn-default"><span class="glyphicon glyphicon-floppy-disk"></span> Save</button></li>
                                </ul>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </content>
</body>
</html>

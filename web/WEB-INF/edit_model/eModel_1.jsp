<%@page import="DSST.Model.Model"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>AHP Main Menu</title>
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
                    <jsp:include page="sidenav_edit_model.jsp" flush="false"/>
                </span>
                <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main" style="top: 72px">
                    <div class="row">
                        <h3>Define Goal</h3>
                        <hr>
                        <form action="EditModel" method="POST">
                            <div class="col-sm-offset-4 col-sm-4 ">

                                <%
                                    Model m = (Model) request.getAttribute("m");
                                %>
                                <input type="hidden" name="page" id="page" value="1"/>
                                <div class="form-group">
                                    <label for="model_name">Model Name : </label>
                                    <input type="text" class="form-control" name="model_name" value="<%=m.getModel_name()%>" required="ture"/>
                                </div>
                                <div class="form-group">
                                    <label for="goal">Goal : </label>
                                    <input type="text" class="form-control" name="goal" value="<%=m.getModel_goal()%>" required="ture"/>
                                </div>
                                <div class="form-group">
                                    <label for="goal_des">Goal Description: </label>
                                    <textarea rows="5" class="form-control" name="goal_des"><%=m.getModel_goal_des()%></textarea>
                                </div>
                                <button type="submit" class="btn btn-default" style="float: right"><span class="glyphicon glyphicon-floppy-disk"></span> Save</button>

                            </div>
                        </form>
                    </div>
                </div>
            </div>
    </content>
</body>
</html>

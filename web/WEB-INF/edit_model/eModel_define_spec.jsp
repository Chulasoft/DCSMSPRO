<%-- 
    Document   : model_define_spec
    Created on : Apr 27, 2017, 9:38:21 AM
    Author     : Soft
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="DSST.Model.Model"%>
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
            .pagination>li.active>a {
                background: #eee;
                border-color: #f9f2f4;
                color: #fff;
            }
            .pagination>li.active>a:hover {
                background: #eee;
                color: #fff;
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
                        <h3>Specification for ${whoName}</h3>
                        <hr>
                        <form method="POST" action="SetAnswer">
                            <input type="hidden" name="who" value="${who}"/>
                            <div class="col-sm-offset-2 col-sm-8 ">
                                <div class="panel-group">
                                    <%
                                        ArrayList<Model> allQuest = (ArrayList) request.getAttribute("listQuest");
                                        int old_id = -1;
                                        Model m = new Model();
                                        for (int i = 0; i < allQuest.size(); i++) {
                                            int questAc =  m.getSpecAnsByID(allQuest.get(i).getQuest_id(),Integer.parseInt(request.getAttribute("who")+""));
                                            if(allQuest.get(i).getSc_id()!=old_id){
                                        %>
                                    <div class="panel panel-default">
                                        <div class="panel-heading"><%=allQuest.get(i).getSc_name()%></div>
                                        <%
                                            old_id = allQuest.get(i).getSc_id();
                                        }
                                        %>
                                        <div class="panel-body">
                                            <div  style="float: left"><%=allQuest.get(i).getQuest_name()%></div>
                                            <div style="float: right;">
                                                <ul class="pagination" id="<%=allQuest.get(i).getQuest_id()%>">
                                                    <li <%if(questAc==1){out.print("class='active'");}%>><a onclick="setRes<%=allQuest.get(i).getQuest_id()%>(1)"><span class="glyphicon glyphicon-ok" style="color: green"></span></a></li>
                                                    <li <%if(questAc==0){out.print("class='active'");}%>><a onclick="setRes<%=allQuest.get(i).getQuest_id()%>(0)"><span class="glyphicon glyphicon-remove" style="color: #ac2925"></span></a></li>
                                                    <input type="hidden" name="ans" value="<%=allQuest.get(i).getQuest_id()%>:<% String vals = questAc == 1 ? "1":"0"; out.print(vals); %>" id="hidden<%=allQuest.get(i).getQuest_id()%>" />
                                                </ul>
                                            </div>
                                        </div>
                                        <script>
                                            function setRes<%=allQuest.get(i).getQuest_id()%>(num) {
                                                $('#hidden<%=allQuest.get(i).getQuest_id()%>').val(<%=allQuest.get(i).getQuest_id()%> + ':' + num);
                                            }
                                            $("#<%=allQuest.get(i).getQuest_id()%> li").on("click", function () {
                                                $("#<%=allQuest.get(i).getQuest_id()%> li").removeClass("active");
                                                $(this).addClass("active");
                                            });
                                        </script>
                                        <%
                                            if(i+1==allQuest.size()){
                                        %>
                                    </div>

                                    <%
                                            }else if(allQuest.get(i).getSc_id()!=allQuest.get(i+1).getSc_id()){
                                            %>
                                            </div>
                                    <%
                                            }
                                        }
                                    %>
                                </div>
                            </div>
                        </form>
                    </div>
                    <div class="col-sm-12" style="margin-top: 10px">
                        <ul class="pager">
                            <li><a href="#" onclick="document.forms[0].submit()">Submit</a></li>
                        </ul>
                    </div>
                </div>
            </div>

        </div>
    </content>
</body>
</html>

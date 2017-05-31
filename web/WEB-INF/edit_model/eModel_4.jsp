<%-- 
    Document   : model_4
    Created on : Apr 17, 2017, 5:46:40 PM
    Author     : 006131
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="DSST.Model.Model"%>
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
                        <form action="EditModel" method="POST">
                            <h3>Define Survey</h3>
                            <hr>
                            <div class="col-sm-offset-2 col-sm-8 ">
                                <input type="hidden" name="page" id="page" value="4"/>
                                <%
                                    ArrayList<Model> allSubDB = (ArrayList) request.getAttribute("allSubDB");
                                    ArrayList<Model> allQuestDB = (ArrayList) request.getAttribute("allQuestDB");
                                    int count = 0;
                                    for (int j = 0; j < allSubDB.size(); j++) {
                                %>    
                                <div class="col-sm-12">
                                    <a href="#" style="text-decoration: none;" data-toggle="modal" data-target="#myModal<%=allSubDB.get(j).getSc_id()%>" >
                                        <div class="alert alert-success"> 
                                            <h3 name="<%=allSubDB.get(j).getSc_id()%>"><%=allSubDB.get(j).getSc_name()%></h3>
                                            <p style="text-align: right" id="countQues<%=allSubDB.get(j).getSc_id()%>">CLICK</p>
                                        </div>
                                    </a>
                                </div>

                                <!-- Modal -->
                                <div id="myModal<%=allSubDB.get(j).getSc_id()%>" class="modal fade" role="dialog" style="display: none;">
                                    <div class="modal-dialog">

                                        <!-- Modal content-->
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <button type="button" class="close" data-dismiss="modal">×</button>
                                                <h4 class="modal-title">Define Question</h4>
                                            </div>
                                            <div class="modal-body">
                                                <span id="questionOutput<%=allSubDB.get(j).getSc_id()%>">
                                                    <%
                                                        for (int k = 0; k < allQuestDB.size(); k++) {
                                                            if (allQuestDB.get(k).getSc_id() == allSubDB.get(j).getSc_id()) {
                                                    %>
                                                    <div class="alert alert-success" style="border-color: #EBEDEF;background-color: white;color: black;"> 
                                                        <a href="#" class="close" data-dismiss="alert" aria-label="close">×</a>
                                                        <%=allQuestDB.get(k).getQuest_name()%><input type="hidden" name="questionDB" id="question<%=allSubDB.get(j).getSc_id()%>" value="<%=allQuestDB.get(k).getQuest_name()%>">
                                                        <input type="hidden" name="questionIdDB" value="<%=allQuestDB.get(k).getQuest_id()%>">
                                                    </div>
                                                    <%
                                                            }
                                                        }
                                                    %>
                                                </span>

                                                <span class="label label-default">Question</span>
                                                <div class="input-group input-group-lg">
                                                    <input class="form-control" type="text" id="ques<%=allSubDB.get(j).getSc_id()%>">
                                                    <div class="input-group-btn">
                                                        <button type="button" class="btn" id="subQuest<%=allSubDB.get(j).getSc_id()%>">ADD</button>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-primary" data-dismiss="modal" id="OK<%=allSubDB.get(j).getSc_id()%>">OK</button>
                                            </div>
                                        </div>

                                    </div>
                                </div>

                                <script>
                                    $(document).ready(function () {
                                        $("#subQuest<%=allSubDB.get(j).getSc_id()%>").click(function () {
                                            if ($("#ques<%=allSubDB.get(j).getSc_id()%>").val() != "") {
                                                var question = $("#ques<%=allSubDB.get(j).getSc_id()%>").val();
                                                $("#questionOutput<%=allSubDB.get(j).getSc_id()%>").append("<div class='alert alert-success' style='border-color: #EBEDEF;background-color: white;color: black;'> <a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a>" +
                                                        question +
                                                        "<input type='hidden' name='question' id='question" + <%=allSubDB.get(j).getSc_id()%> + "' value='" +<%=allSubDB.get(j).getSc_id()%> + ":" + question + "'></div>");
                                                $("#ques<%=allSubDB.get(j).getSc_id()%>").val("");
                                            } else {
                                                alert("กรอกข้อมูลให้ครบท้วน");
                                            }
                                        });
                                        $("#OK<%=allSubDB.get(j).getSc_id()%>").click(function () {
                                            var count = $('input[id*="question<%=allSubDB.get(j).getSc_id()%>"]').length;
                                            $("#countQues<%=allSubDB.get(j).getSc_id()%>").text(count + " Question");
                                        });
                                        
                                        $('#myModal<%=allSubDB.get(j).getSc_id()%>').on('hidden.bs.modal', function () {
                                            var count = $('input[id*="question<%=allSubDB.get(j).getSc_id()%>"]').length;
                                            $("#countQues<%=allSubDB.get(j).getSc_id()%>").text(count + " Question");
                                        })
                                        
                                        var count = $('input[id*="question<%=allSubDB.get(j).getSc_id()%>"]').length;
                                        $("#countQues<%=allSubDB.get(j).getSc_id()%>").text(count + " Question");
                                    });
                                </script>

                                <%
                                    }
                                %>
                            </div>
                            <div class="col-sm-offset-2 col-sm-8" style="margin-bottom: 40px">
                                <div style="text-align: center">
                                    <button type="submit" class="btn btn-default" style="float: right"><span class="glyphicon glyphicon-floppy-disk"></span> Save</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</content>
</body>
</html>

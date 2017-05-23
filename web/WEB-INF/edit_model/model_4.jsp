<%-- 
    Document   : model_4
    Created on : Apr 17, 2017, 5:46:40 PM
    Author     : 006131
--%>

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
                    <jsp:include page="sidenav_create_model.jsp" flush="false"/>
                </span>
                <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main" style="top: 72px">
                    <div class="row">
                        <form action="CreateModel" method="POST">
                        <h3>Define Survey</h3>
                        <hr>
                        <div class="col-sm-offset-2 col-sm-8 ">
                            <input type="hidden" name="page" id="page" value="4"/>
                            <%
                                String cri[] = (String[]) session.getAttribute("cri");
                                int cri_id[] = (int[]) session.getAttribute("cri_id");
                                System.out.println(cri_id.length);
                                for (int i = 0; i < cri.length; i++) {
                            %>
                            <div class="col-sm-12">
                                <div class="alert alert-danger">
                                    <h3><%=cri[i]%></h3>
                                </div>
                            </div>
                            <%
                                String scri[] = (String[]) session.getAttribute("scri" + cri_id[i]);
                                int sub_id[] = (int[]) session.getAttribute("sub_id" + cri_id[i]);
                                for (int j = 0; j < scri.length; j++) {
                            %>    
                            <div class="col-sm-offset-1 col-sm-11">
                                <a href="#" style="text-decoration: none;" data-toggle="modal" data-target="#myModal<%=sub_id[j]%>" >
                                    <div class="alert alert-success"> 
                                        <h3 name="<%=sub_id[j]%>"><%=scri[j]%></h3>
                                        <p style="text-align: right" id="countQues<%=sub_id[j]%>">CLICK</p>
                                    </div>
                                </a>
                            </div>

                            <!-- Modal -->
                            <div id="myModal<%=sub_id[j]%>" class="modal fade" role="dialog" style="display: none;">
                                <div class="modal-dialog">

                                    <!-- Modal content-->
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal">×</button>
                                            <h4 class="modal-title">Define Question</h4>
                                        </div>
                                        <div class="modal-body">
                                            <span id="questionOutput<%=sub_id[j]%>"></span>

                                            <span class="label label-default">Question</span>
                                            <div class="input-group input-group-lg">
                                                <input class="form-control" type="text" name="ques<%=sub_id[j]%>" id="ques<%=sub_id[j]%>">
                                                <div class="input-group-btn">
                                                    <button type="button" class="btn" id="subQuest<%=sub_id[j]%>">ADD</button>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-primary" data-dismiss="modal" id="OK<%=sub_id[j]%>">OK</button>
                                        </div>
                                    </div>

                                </div>
                            </div>

                            <script>
                                $(document).ready(function () {
                                    $("#subQuest<%=sub_id[j]%>").click(function () {
                                        if ($("#ques<%=sub_id[j]%>").val() != "") {
                                            var question = $("#ques<%=sub_id[j]%>").val();
                                            $("#questionOutput<%=sub_id[j]%>").append("<div class='alert alert-success' style='border-color: #EBEDEF;background-color: white;color: black;'> <a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a>" +
                                                    question +
                                                    "<input type='hidden' name='question" + <%=sub_id[j]%> + "' value=" + question + "></div>");
                                            $("#ques<%=sub_id[j]%>").val("");
                                        } else {
                                            alert("กรอกข้อมูลให้ครบท้วน");
                                        }
                                    });
                                    $("#OK<%=sub_id[j]%>").click(function () {
                                        var count = $('input[name*="question<%=sub_id[j]%>"]').length;
                                        console.log(count);
                                        $("#countQues<%=sub_id[j]%>").text(count+" Question");
                                    });
                                });
                            </script>

                            <%
                                    }
                                }
                            %>
                        </div>
                        <div class="col-sm-12">
                            <ul class="pager">
                                <li><a href="#">Previous</a></li>
                                <li><a href="#" onclick="document.forms[0].submit();">Next</a></li>
                            </ul>
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

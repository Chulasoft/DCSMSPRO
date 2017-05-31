<%-- 
    Document   : model_2
    Created on : Apr 16, 2017, 9:37:37 AM
    Author     : 006131
--%>

<%@page import="java.util.ArrayList"%>
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
        <script>
            $(document).ready(function () {
                $("#accept").click(function () {
                    if ($("#c1").val() != "" && $("#c2").val() != "") {
                        var t_criter = $("#c1").val();
                        var d_criter = $("#c2").val();
                        $("#cr").append("<div class='alert alert-danger'> <a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a>" +
                                "<h3>" + t_criter + "</h3>" + d_criter +
                                "<input type='hidden' name='Ncri' value='" + t_criter + "'><input type='hidden' name='NcriDes' value='" + d_criter + "'></div>");
                        $("#c1").val("");
                        $("#c2").val("");
                        $('#myModal').modal('toggle');
                    } else {
                        if ($("#c1").val() == "") {
                            alert("กรุณากรอกข้อมูลให้ครบ");
                            $("#c1").focus();
                        } else {
                            alert("กรุณากรอกข้อมูลให้ครบ");
                            $("#c2").focus();
                        }
                    }
                });
                $("#sub").click(function () {
                    if ($("input[name='cri']").length < 2) {
                        alert("ต้องมีอย่างน้อย 2 criteria");
                    } else {
                        document.forms[0].submit();
                    }
                });
            });
        </script>
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
                        <h3>Define Criteria</h3>
                        <hr>
                        <form action="EditModel" method="POST">
                            <div class="col-sm-offset-2 col-sm-8 ">
                                <input type="hidden" name="page" id="page" value="2"/>

                                <span id="cr">
                                    <%
                                        if (request.getAttribute("criDB") != null) {
                                            ArrayList<Model> criDB = (ArrayList) request.getAttribute("criDB");
                                            for (Model mdb : criDB) {
                                    %>
                                    <div class="alert alert-danger" id="<%=mdb.getCri_id()%>">
                                        <a href="#" class="close" onclick="alertBefore()">×</a>
                                        <a href="#" data-toggle="modal" data-target="#old" onclick="idIs(<%=mdb.getCri_id()%>)"><h3><%=mdb.getCri_name()%></h3><span><%=mdb.getCri_des()%></span></a>
                                        <input type="hidden" name="criId" value="<%=mdb.getCri_id()%>">
                                        <input type="hidden" name="cri" value="<%=mdb.getCri_name()%>">
                                        <input type="hidden" name="criDes" value="<%=mdb.getCri_des()%>">
                                    </div>
                                    <%
                                            }
                                        }
                                    %>
                                </span>

                                <!-- Trigger the modal with a button -->
                                <a href="#" data-toggle="modal" data-target="#myModal" style="font-size: 30px"><div class="glyphicon glyphicon-plus-sign"></div></a>

                                <!-- Modal -->
                                <div id="myModal" class="modal fade" role="dialog">
                                    <div class="modal-dialog">

                                        <!-- Modal content-->
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h4 class="modal-title">Define Criteria</h4>
                                            </div>
                                            <div class="modal-body">
                                                <span class="label label-default">Criteria</span>
                                                <input class="form-control" type="text" name="c1" id="c1" />
                                                <span class="label label-default">Criteria Description</span>
                                                <textarea rows="4" class="form-control" name="c2" id="c2"></textarea>
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-primary"  id="accept">Accept</button>
                                                <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div id="old" class="modal fade" role="dialog">
                                    <div class="modal-dialog">

                                        <!-- Modal content-->
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h4 class="modal-title">Edit Criteria</h4>
                                            </div>
                                            <div class="modal-body">
                                                <span class="label label-default">Criteria</span>
                                                <input type="hidden" id="oldNum" />
                                                <input class="form-control" type="text" name="oldc1" id="oldc1"/>
                                                <span class="label label-default">Criteria Description</span>
                                                <textarea rows="4" class="form-control" name="oldc2" id="oldc2"></textarea>
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-primary"  onclick="changeText()" data-dismiss="modal">Accept</button>
                                                <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <script>
                                    function idIs(num) {
                                        $("#oldc1").val($("#" + num + "> a > h3").text());
                                        $("#oldc2").val($("#" + num + "> a > span").text());
                                        $("#oldNum").val(num);
                                    }
                                    function changeText() {
                                        $("#" + $("#oldNum").val() + "> a > h3").text($("#oldc1").val());
                                        $("#" + $("#oldNum").val() + "> a > span").text($("#oldc2").val());
                                        $("#" + $("#oldNum").val() + "> input[name=cri]").val($("#oldc1").val());
                                        $("#" + $("#oldNum").val() + "> input[name=criDes]").val($("#oldc2").val());
                                    }
                                    $(document).ready(function () {
                                        $(".close").click(function () {
                                            var r = confirm("Delete this Criteria will delete your Sub-Criteria and Your Survey");
                                            if (r == true) {
                                                $(this).alert("close");
                                            } else {
                                                console.log("cancel");
                                            }
                                        });
                                    });
                                </script>
                                <div style="text-align: center">
                                    <button type="submit" class="btn btn-default" style="float: right"><span class="glyphicon glyphicon-floppy-disk"></span> Save</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
    </content>
</body>
</html>

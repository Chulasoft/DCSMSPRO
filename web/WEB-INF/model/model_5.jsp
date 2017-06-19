<%-- 
    Document   : model_5
    Created on : Apr 26, 2017, 1:11:06 AM
    Author     : Soft
--%>

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
        <script>
            $(document).ready(function () {
                $("#accept").click(function () {
                    if ($("#ra1").val() != "" && $("#ra2").val() != "") {
                        var t_ra = $("#ra1").val();
                        var d_ra = $("#ra2").val();
                        $("#ra").append("<div class='alert alert-danger'  style='border-color: #EBEDEF;background-color: white;color: black;'> <a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a>" +
                                "<h3>" + t_ra + "</h3>" + d_ra +
                                "<input type='hidden' name='ra' value='" + t_ra + "'><input type='hidden' name='raDes' value='" + d_ra + "'></div>");
                        $("#ra1").val("");
                        $("#ra2").val("");
                        $('#myModal').modal('toggle');
                    } else {
                        if($("#ra1").val() == ""){
                            alert("กรุณากรอกข้อมูลให้ครบ");
                            $("#ra1").focus();
                        }else{
                            alert("กรุณากรอกข้อมูลให้ครบ");
                            $("#ra2").focus();
                        }
                    }
                });
                $("#sub").click(function () {
                    if($("input[name='ra']").length < 2){
                        alert("ต้องมีอย่างน้อย 2 Alternative");
                    }else{
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
                    <jsp:include page="sidenav_create_model.jsp" flush="false"/>
                </span>
                <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main" style="top: 72px">
                    <div class="row">
                        <h3>Define Related Alternative</h3>
                        <hr>
                        <form action="CreateModel" method="POST">
                            <div class="col-sm-offset-2 col-sm-8 ">
                                <input type="hidden" name="page" id="page" value="5"/>

                                <span id="ra"></span>

                                <!-- Trigger the modal with a button -->
                                <a href="#" data-toggle="modal" data-target="#myModal" style="font-size: 30px"><div class="glyphicon glyphicon-plus-sign"></div></a>

                                <!-- Modal -->
                                <div id="myModal" class="modal fade" role="dialog">
                                    <div class="modal-dialog">

                                        <!-- Modal content-->
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                <h4 class="modal-title">Define Related Alternative</h4>
                                            </div>
                                            <div class="modal-body">
                                                <span class="label label-default">Alternative Name</span>
                                                <input class="form-control" type="text" name="ra1" id="ra1" />
                                                <span class="label label-default">Description</span>
                                                <textarea rows="4" class="form-control" name="ra2" id="ra2"></textarea>
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-primary"  id="accept">Accept</button>
                                                <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-12">
                                <ul class="pager">
                                    <li><a href="#" id="sub">Next</a></li>
                                </ul>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
    </content>
    </body>
</html>

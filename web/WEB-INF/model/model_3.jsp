<%-- 
    Document   : model_3
    Created on : Apr 16, 2017, 9:42:23 PM
    Author     : 006131
--%>

<%@page import="java.util.Arrays"%>
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
                    <jsp:include page="sidenav_create_model.jsp" flush="false"/>
                </span>
                <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main" style="top: 72px">
                    <div class="row">
                        <h3>Define Sub-Criteria</h3>
                        <hr>
                        <div class="col-sm-offset-2 col-sm-8 ">
                            <form method="POST" action="CreateModel">
                                <input type="hidden" name="page" id="page" value="3"/>
                            <%
                                String cri[] = (String[]) session.getAttribute("cri");
                                int cri_id[] = (int[])session.getAttribute("cri_id");
                                System.out.println(cri_id.length);
                                for (int i = 0; i < cri.length; i++) {
                            %>
                            <div class='alert alert-danger'>
                                <h3><%=cri[i]%></h3>
                            </div>
                            
                            <div class="col-sm-offset-1 col-sm-11" id="output<%=cri_id[i]%>"></div>
                            <!-- Trigger the modal with a button -->
                            <a href="#" data-toggle="modal" data-target="#myModal" style="font-size: 30px" onclick="whereIsTagA(<%=cri_id[i]%>)"><div class="glyphicon glyphicon-plus-sign"></div></a>
                                <%
                                    }
                                %>
                            <script>
                                var who ;
                                function whereIsTagA(a){
                                        who = a;
                                };
                                $(document).ready(function () {
                                    $("#accept").click(function () {
                                        var t_criter = $("#sc1").val();
                                        var d_criter = $("#sc2").val();
                                        $("#output"+who).append("<div class='alert alert-success'> <a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a>" +
                                                "<h3>" + t_criter + "</h3>" + d_criter +
                                                "<input type='hidden' name='scri"+who+"' value='" + t_criter + "'><input type='hidden' name='scriDes"+who+"' value='" + d_criter + "'></div>");
                                        $("#sc1").val("");
                                        $("#sc2").val("");
                                    });
                                    
                                });
                                
                            </script>
                            <!-- Modal -->
                            <div id="myModal" class="modal fade" role="dialog">
                                <div class="modal-dialog">

                                    <!-- Modal content-->
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                                            <h4 class="modal-title">Define Sub-Criteria</h4>
                                        </div>
                                        <div class="modal-body">
                                            <span class="label label-default">Sub-Criteria</span>
                                            <input class="form-control" type="text" name="sc1" id="sc1" />
                                            <span class="label label-default">Sub-Criteria Description</span>
                                            <textarea rows="4" class="form-control" name="sc2" id="sc2"></textarea>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-primary" data-dismiss="modal" id="accept">Accept</button>
                                            <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                                        </div>
                                    </div>
                                    
                                </div>
                            </div>
                            <div class="col-sm-12">
                            <ul class="pager">
                                <li><a href="#" onclick="document.forms[0].submit();">Next</a></li>
                            </ul>
                            </div>
                            </form>
                        </div>
                    </div>
                </div>
                </content>
                </body>
                </html>

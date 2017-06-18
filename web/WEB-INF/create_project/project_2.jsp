<%-- 
    Document   : project_3
    Created on : May 1, 2017, 9:15:50 PM
    Author     : Jab-PC
--%>

<%@page import="DSST.Model.Model"%>
<%@page import="java.util.ArrayList"%>
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
            .pagination>li.active>a {
                background: #eee;
                border-color: #f9f2f4;
                color: #fff;
            }
            .pagination>li.active>a:hover {
                background: #eee;
                color: #fff;
            }

            .v-center {
                min-height:200px;
                display: flex;
                justify-content:center;
                flex-flow: column wrap;
            }
        </style>
        <script>
            $(document).ready(function () {
                $('.add').click(function () {
                    $('.all').prop("checked", false);
                    var items = $("#list1 input:checked:not('.all')");
                    var n = items.length;
                    if (n > 0) {
                        items.each(function (idx, item) {
                            var choice = $(item);
                            choice.prop("checked", false);
                            choice.parent().appendTo("#list2");
                        });
                    } else {
                        alert("Choose an item from list 1");
                    }
                });

                $('.remove').click(function () {
                    $('.all').prop("checked", false);
                    var items = $("#list2 input:checked:not('.all')");
                    items.each(function (idx, item) {
                        var choice = $(item);
                        choice.prop("checked", false);
                        choice.parent().appendTo("#list1");
                    });
                });

                /* toggle all checkboxes in group */
                $('.all').click(function (e) {
                    e.stopPropagation();
                    var $this = $(this);
                    if ($this.is(":checked")) {
                        $this.parents('.list-group').find("[type=checkbox]").prop("checked", true);
                    } else {
                        $this.parents('.list-group').find("[type=checkbox]").prop("checked", false);
                        $this.prop("checked", false);
                    }
                });

                $('[type=checkbox]').click(function (e) {
                    e.stopPropagation();
                });

                /* toggle checkbox when list group item is clicked */
                $('.list-group a').click(function (e) {

                    e.stopPropagation();

                    var $this = $(this).find("[type=checkbox]");
                    if ($this.is(":checked")) {
                        $this.prop("checked", false);
                    } else {
                        $this.prop("checked", true);
                    }

                    if ($this.hasClass("all")) {
                        $this.trigger('click');
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
                    <jsp:include page="sidenav_create_project.jsp" flush="false"/>
                </span>
                <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main" style="top: 72px">
                    <div class="row">
                        <h3>Pick Candidate</h3>
                        <hr>
                        
                        <div class="col-md-12 text-center"><h3>Pick List</h3></div>
                        <div class="col-sm-4 col-sm-offset-1">
                            <div class="list-group" id="list1">
                                <a href="#" class="list-group-item active">Related Alternative<input title="toggle all" type="checkbox" class="all pull-right"></a>
                                <%
                                    ArrayList<String> al_name_want = (ArrayList)request.getAttribute("al_name_want");
                                    ArrayList<Integer> array_al_id = (ArrayList)request.getAttribute("array_al_id");
                                    int i = 0;
                                    for(String a :al_name_want){
                                %>
                                <a href="#" class="list-group-item"><%=a%><input type="hidden" name="chosenAL" value="<%=array_al_id.get(i)%>"><input type="checkbox" class="pull-right"></a>
                                <%
                                    i++;
                                    }
                                %>
                            </div>
                        </div>
                        <div class="col-md-2 v-center">
                            <button title="Send to list 2" class="btn btn-default center-block add"><i class="glyphicon glyphicon-chevron-right"></i></button>
                            <button title="Send to list 1" class="btn btn-default center-block remove"><i class="glyphicon glyphicon-chevron-left"></i></button>
                        </div>
                        <div class="col-sm-4">
                            <form action="CreateProject" method="POST">
                                <input type="hidden" name="page" value="2"/>
                                <div class="list-group" id="list2">
                                    <a href="#" class="list-group-item active">Picked Candidates<input title="toggle all" type="checkbox" class="all pull-right"></a>
                                </div>
                            </form>
                        </div>
                        <div class="col-sm-12" style="margin-top: 10px">
                        <ul class="pager">
                            <li><a href="#" onclick="document.forms[0].submit()" >Submit</a></li>
                        </ul>
                    </div>
                    </div>
                </div>
            </div>
        </div>
    </content>
</body>
</html>

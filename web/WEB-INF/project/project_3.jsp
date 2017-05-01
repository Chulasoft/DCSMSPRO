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
                        <h3>Add Competitor</h3>
                        <hr>
                            <input type="hidden" name="page" value="3"/>
                            <div class="col-md-12 text-center"><h3>Pick List Example</h3></div>
                            <div class="col-sm-4 col-sm-offset-1">
                                <div class="list-group" id="list1">
                                    <a href="#" class="list-group-item active">List 1 <input title="toggle all" type="checkbox" class="all pull-right"></a>
                                    <a href="#" class="list-group-item">Second item <input type="checkbox" class="pull-right"></a>
                                    <a href="#" class="list-group-item">Third item <input type="checkbox" class="pull-right"></a>
                                    <a href="#" class="list-group-item">More item <input type="checkbox" class="pull-right"></a>
                                    <a href="#" class="list-group-item">Another <input type="checkbox" class="pull-right"></a>
                                </div>
                            </div>
                            <div class="col-md-2 v-center">
                                <button title="Send to list 2" class="btn btn-default center-block add"><i class="glyphicon glyphicon-chevron-right"></i></button>
                                <button title="Send to list 1" class="btn btn-default center-block remove"><i class="glyphicon glyphicon-chevron-left"></i></button>
                            </div>
                            <div class="col-sm-4">
                                <div class="list-group" id="list2">
                                    <a href="#" class="list-group-item active">List 2 <input title="toggle all" type="checkbox" class="all pull-right"></a>
                                    <a href="#" class="list-group-item">Alpha <input type="checkbox" class="pull-right"></a>
                                    <a href="#" class="list-group-item">Charlie <input type="checkbox" class="pull-right"></a>
                                    <a href="#" class="list-group-item">Bravo <input type="checkbox" class="pull-right"></a>
                                </div>
                            </div>
                    </div>
                </div>
            </div>
        </div>
    </content>
</body>
</html>

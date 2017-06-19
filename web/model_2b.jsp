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
            $("#btn1").click(function () {
            $("#cr").append("<!-- Trigger the modal with a button -->" +
                    "<button class='alert alert-warning fade in' style='width:100%;text-align: left;' type='button' id='mo' data-toggle='modal' data-target='#myModal'>" +
                    "<a href='#' class='close' data-dismiss='alert' aria-label='close' onclick='document.getElementById('mo').removeAttribute('data-toggle');'>&times;</a>" + "<strong>Criteria</strong>" + "</button>");
            $("#md").append("<!-- Modal -->" +
            "<div id='myModal' class='modal fade' role='dialog'>" +
                    "<div class='modal-dialog'>" +
                    "<!-- Modal content-->" + "<div class='modal-content'>" +
"<div class='modal-header'>" +
"<button type='button' class='close' data-dismiss='modal'>&times;</button>" + "<h4 class='modal-title'>Modal Header</h4>" +
"</div>" + 
"<div class='modal-body'>"+
"<p>Some text in the modal.</p>"+
"</div>"+
"<div class='modal-footer'>"+
"<button type='button' class='btn btn-default' data-dismiss='modal'>Close</button>"+
"</div>"+
"</div>"+
"</div>"+
"</div>");
});
function rmToggle() {
document.getElementById('mo').removeAttribute('data-toggle');
}
});
        </script>
    </head>
    <body>
        <jsp:include page="header.jsp" flush="false"/>
    <content>
        <div class="container-fluid">
            <div class="row">
                <span class="hidden-mob">
                    <jsp:include page="sidenav_create_model.jsp" flush="false"/>
                </span>
                <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main" style="top: 72px">
                    <div class="row">
                        <h3>Define Criteria</h3>
                        <hr>
                        <div class="col-sm-offset-4 col-sm-4 ">
                            <form action="" method="POST">

                                <span id="cr">
                                    <!-- Trigger the modal with a button -->
                                    <button class="alert alert-warning fade in" style="width:100%;text-align: left;" type="button" id="mo" data-toggle="modal" data-target="#myModal">
                                        <a href="#" class="close" data-dismiss="alert" aria-label="close" onclick="document.getElementById('mo').removeAttribute('data-toggle');">&times;</a>
                                        <strong>Criteria</strong> 
                                    </button>

                                </span>
                                <span id="md">
                                    <!-- Modal -->
                                    <div id="myModal" class="modal fade" role="dialog">
                                        <div class="modal-dialog">

                                            <!-- Modal content-->
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                    <h4 class="modal-title">Modal Header</h4>
                                                </div>
                                                <div class="modal-body">
                                                    <p>Some text in the modal.</p>
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                                </div>
                                            </div>

                                        </div>
                                    </div>
                                </span>

                                <button type="button" id="btn1" style="float:left" class="btn btn-info">ADD</button>
                                <ul class="pager">
                                    <li><a href="#">Previous</a></li>
                                    <li><a href="#">Next</a></li>
                                </ul>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
    </content>
</body>
</html>

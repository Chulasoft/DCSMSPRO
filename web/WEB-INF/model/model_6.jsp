<%-- 
    Document   : model_6
    Created on : Apr 26, 2017, 2:39:11 AM
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
                        <h3>Related Alternative</h3>
                        <hr>
                        <div class="col-sm-offset-2 col-sm-8">
                            <%
                                String ra[] = (String[]) session.getAttribute("ra");
                                int ra_id[] = (int[]) session.getAttribute("ra_id");
                                System.out.println(ra_id.length);
                                for (int i = 0; i < ra.length; i++) {
                            %>
                            <form method="POST" action="DefineSpecification" id="<%=ra_id[i]%>"> 
                                <a href="#" style="text-decoration: none" onclick="document.getElementById('<%=ra_id[i]%>').submit();">
                                    <div class='alert alert-danger' style='border-color: #EBEDEF;background-color: white;color: black;'>
                                        <h3><%=ra[i]%></h3>
                                        <p style="text-align: right">CLICK</p>
                                    </div>
                                    <input type="hidden" name="ra_id" value="<%=ra_id[i]%>">
                                    <input type="hidden" name="ra" value="<%=ra[i]%>">
                                </a>
                            </form>
                            <%
                                }
                            %>
                        </div>
                        <form action="CreateModel" method="POST" id="end">
                            <div class="col-sm-12">
                                <ul class="pager">
                                    <li><a href="#" onclick="document.getElementById('end').submit();">Next</a></li>
                                </ul>
                            </div>
                            <input type="hidden" name="page" id="page" value="6"/>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</content>
</body>
</html>

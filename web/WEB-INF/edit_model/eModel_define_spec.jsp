<%-- 
    Document   : model_define_spec
    Created on : Apr 27, 2017, 9:38:21 AM
    Author     : Jab
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
                    <jsp:include page="sidenav_create_model.jsp" flush="false"/>
                </span>
                <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main" style="top: 72px">
                    <div class="row">
                        <h3>Specification for ${whoName}</h3>
                        <hr>
                        <form method="POST" action="DefineSpecification">
                            <input type="hidden" name="who" value="${who}">
                        <div class="col-sm-offset-2 col-sm-8 ">
                            <%
                                String cri[] = (String[]) session.getAttribute("cri");
                                int cri_id[] = (int[]) session.getAttribute("cri_id");
                                System.out.println(cri_id.length);
                                for (int i = 0; i < cri.length; i++) {
                            %>
                            <h3><%=cri[i]%></h3>
                            <%
                                String scri[] = (String[]) session.getAttribute("scri" + cri_id[i]);
                                int sub_id[] = (int[]) session.getAttribute("sub_id" + cri_id[i]);
                                for (int j = 0; j < scri.length; j++) {
                            %>    
                            <div class="panel-group">
                                <div class="panel panel-default">
                                    <div class="panel-heading">
                                        <h4 class="panel-title">
                                            <a data-toggle="collapse" href="#collapse<%=sub_id[j]%>"><%=i + 1%>.<%=j + 1%> <%=scri[j]%></a>
                                        </h4>
                                    </div>
                                    <div id="collapse<%=sub_id[j]%>" class="panel-collapse collapse in">
                                        <%
                                            String question[] = (String[]) session.getAttribute("question" + sub_id[j]);
                                            int ques_id[] = (int[]) session.getAttribute("ques_id" + sub_id[j]);
                                            for (int k = 0; k < question.length; k++) {
                                        %>

                                        <div class="panel-body">
                                            <div  style="float: left"><%=question[k]%></div>
                                            <div style="float: right">
                                                <ul class="pagination" id="<%=ques_id[k]%>">
                                                    <li><a onclick="setRes<%=ques_id[k]%>(1)"><span class="glyphicon glyphicon-ok" style="color: green"></span></a></li>
                                                    <li><a onclick="setRes<%=ques_id[k]%>(0)"><span class="glyphicon glyphicon-remove" style="color: #ac2925"></span></a></li>
                                                    <input type="hidden" name="ans" value="" id="hidden<%=ques_id[k]%>" />
                                                </ul>
                                            </div>
                                        </div>

                                        <script>
                                            function setRes<%=ques_id[k]%>(num){
                                                $('#hidden<%=ques_id[k]%>').val(<%=ques_id[k]%>+':'+num);
                                            }
                                            $("#<%=ques_id[k]%> li").on("click", function () {
                                                $("#<%=ques_id[k]%> li").removeClass("active");
                                                $(this).addClass("active");
                                            });
                                            
                                        </script>
                                        <%
                                            }
                                        %>
                                    </div>
                                </div>
                            </div>

                            <%
                                    }
                                }
                            %>
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

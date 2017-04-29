<%@page import="DSST.Model.Member"%>
<%
    Member login = (Member)session.getAttribute("login");
%>
        <nav class="navbar navbar-inverse navbar-fixed-top" style="padding: 10px">
            <div class="container-fluid">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>                        
                    </button>
                    <a class="navbar-brand" href="Login">DSST Project</a>
                </div>
                <div class="collapse navbar-collapse" id="myNavbar">
                    <ul class="nav navbar-nav">
                        <li><a href="ModelMenu">Model</a></li>
                        <li><a href="#">Project</a></li>
                        <li class="dropdown">
                            <a href="#" data-toggle="dropdown">More</a>
                            <ul class="dropdown-menu">
                                <li><a href="#">About</a></li>
                                <li><a href="#">Help</a></li>
                            </ul>
                        </li>
                    </ul>
                    <ul class="nav navbar-nav navbar-right">
                        <li class="dropdown">
                            <a href="#" data-toggle="dropdown"><span class="glyphicon glyphicon-user"></span> <%=login.getName()%></a>
                            <ul class="dropdown-menu">
                                <li><a href="#">Setting</a></li>
                                <li><a href="Logout">Logout</a></li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>

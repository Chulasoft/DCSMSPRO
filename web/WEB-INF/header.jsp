<%@page import="DSST.Model.Member"%>
<%
    Member login = (Member) session.getAttribute("login");
%>
<nav class="navbar navbar-inverse navbar-fixed-top" style="padding: 10px">
    <div class="container-fluid">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>                        
            </button>
            <a class="navbar-brand" href="Login">Decision Support Tool</a>
        </div>
        <div class="collapse navbar-collapse" id="myNavbar">
            <ul class="nav navbar-nav">
                <%
                    if(login.getType()==1){
                %>
                <li><a href="ModelMenu">Model</a></li>
                <%
                    }
                %>
                <li><a href="ProjectMenu">Project</a></li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <li class="dropdown">
                    <a href="#" data-toggle="dropdown"><span class="glyphicon glyphicon-user"></span> <%=login.getName()%></a>
                    <ul class="dropdown-menu">
                        <li><a href="SettingPath">Setting</a></li>
                        <li><a href="Logout">Logout</a></li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
</nav>

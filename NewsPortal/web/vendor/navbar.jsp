<%@ page import="Classes.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div class="container">
    <nav class="navbar navbar-expand-lg bg-primary">
        <div class="container-fluid">
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="/news">NEWS PORTAL</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/news">NEWS</a>
                    </li>
                    <%
                        User user = (User) request.getSession().getAttribute("current");
                    if (user!=null && user.getRole_id().equals("1")){
                        %>
                    <li class="nav-item">
                        <a class="nav-link" href="/addNews">ADD NEWS</a>
                    </li>
                    <%
                    } else if (user==null) { %>
                    <li class="nav-item">
                        <a class="nav-link" href="/login">SIGN IN</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/register">REGISTER</a>
                    </li>
                    <%
                    }
                    %>
                    <%
                    if (user!=null){%>
                    <li class="nav-item">
                        <a class="nav-link" href="/logout">LOG OUT</a>
                    </li>
                    <%
                    }
                    %>
                </ul>
            </div>
        </div>
    </nav>
</div>
</body>
</html>


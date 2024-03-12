<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<%@include file="/vendor/head.jsp"%>
<body>
<%@include file="/vendor/navbar.jsp"%>
</body>
<div class="container">
    <div class="row mt-3">
        <div class="col">
            <h1>Login Page</h1>
        </div>
    </div>
</div>
<%
    if(request.getParameter("error")!=null){
%>
<div class="alert alert-danger" role="alert">
    This user does not exist!
</div>
<%
} else if (request.getParameter("errorPassword")!=null) {
%>
<div class="alert alert-danger" role="alert">
    Wrong Password!
</div>
<%
    }
    else if (request.getParameter("errorPassword")!=null){
%>
<div class="alert alert-danger" role="alert">
    Wrong Email!
</div>
        <%
            }
            else if (request.getParameter("errorRole")!=null){
        %>
<div class="alert alert-danger" role="alert">
    You don't have admin role!
</div>
<%
    }
        %>

<div class="row mt-3">
    <div class="col">
        <form action="/login" method="post">
            <div class="mb-3">
                <label for="exampleInputEmail1" class="form-label">Email address</label>
                <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="email" name="email">
            </div>
            <div class="mb-3">
                <label for="exampleInputPassword1" class="form-label">Password</label>
                <input type="password" class="form-control" id="exampleInputPassword1" name="password">
            </div>
            <button type="submit" class="btn btn-primary">LOGIN</button>
        </form>
    </div>
</div>
</html>

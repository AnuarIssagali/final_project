<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<%@include file="/vendor/head.jsp"%>
<body>
<%@include file="/vendor/navbar.jsp"%>
</body>
<div class="container">
    <div class="row mt-3">
        <div class="col">
            <h1>Register Page</h1>
        </div>
    </div>
</div>
        <%
            if(request.getParameter("emailBusy")!=null){
                %>
<div class="alert alert-danger" role="alert">
    This email is already busy. Please write another one!
</div>
        <%
            } else if (request.getParameter("passwordsNotEqual")!=null) {
                %>
        <div class="alert alert-danger" role="alert">
            Passwords are not the same!
        </div>
        <%
            }
        %>
<div class="row mt-3">
    <div class="col">
        <form action="/register" method="post">
            <div class="mb-3">
                <label for="exampleInputEmail1" class="form-label">Email address</label>
                <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="email" name="email">
            </div>
            <div class="mb-3">
                <label for="exampleInputPassword1" class="form-label">Password</label>
                <input type="password" class="form-control" id="exampleInputPassword1" name="password">
            </div>
            <div class="mb-3">
                <label for="exampleInputPassword2" class="form-label">Repeat Password</label>
                <input type="password" class="form-control" id="exampleInputPassword2" name="repPassword">
            </div>
            <div class="mb-3">
                <label for="fullName" class="form-label">FullName</label>
                <input type="text" class="form-control" id="fullName"  name="fullName" required>
            </div>
            <button type="submit" class="btn btn-primary">REGISTER</button>
        </form>
    </div>
</div>
</html>

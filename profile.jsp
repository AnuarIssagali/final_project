<%@ page import="Classes.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<%@include file="/vendor/head.jsp"%>
<body>
<%@include file="/vendor/navbar.jsp"%>
</body>
<div class="container">
    <div class="row mt-3">
        <div class="col">
            <h1>Profile Page</h1>
        </div>
    </div>
</div>

<div class="row mt-3">
    <div class="col">
        <form action="/profile" method="post">
            <%
                if (user!=null){
                    %>
            <div class="mb-3">
                <label for="exampleInputEmail1" class="form-label">Email address</label>
                <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="email" name="email" readonly value="<%=user.getEmail()%>">
            </div>
            <div class="mb-3">
                <label for="exampleInputPassword1" class="form-label">Password</label>
                <input type="password" class="form-control" id="exampleInputPassword1" name="password" value="<%=user.getPassword()%>">
            </div>
            <div class="mb-3">
                <label for="exampleInputPassword2" class="form-label">Repeat Password</label>
                <input type="password" class="form-control" id="exampleInputPassword2" name="repPassword" >
            </div>
            <div class="mb-3">
                <label for="fullName" class="form-label">FullName</label>
                <input type="text" class="form-control" id="fullName"  name="fullName" value="<%=user.getFull_name()%>" >
            </div>
            <div class="mb-3">
                <input type="hidden" class="form-control"   name="role" value="<%=user.getRole_id()%>" >
            </div>
            <div class="mb-3">
                <input type="hidden" class="form-control"   name="id" value="<%=user.getId()%>" >
            </div>
            <button type="submit" class="btn btn-primary">UPDATE</button>
            <%
                }
            %>
        </form>
    </div>
</div>
</html>

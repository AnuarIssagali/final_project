<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="Classes.News" %>
<%@ page import="Classes.Category" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<%@include file="/vendor/head.jsp"%>
<body>
<%@include file="/vendor/navbar.jsp"%>
<div class="container">

</div>
<div class="container">
    <div class="row mt-3">
        <div class="col">
            <form action="/addNews" method="post">
                <div class="mb-3">
                    <label for="exampleInputEmail1" class="form-label">TITLE</label>
                    <input type="text" class="form-control" id="exampleInputEmail1" aria-describedby="email" name="title">
                </div>
                <div class="mb-3">
                    <label for="exampleInputPassword1" class="form-label">CONTENT</label>
                    <textarea class="form-control" name="content" id="exampleInputPassword1" style="width: 100%; height: 50%;"></textarea>
                </div>
                <div class="mb-3">
                    <label class="form-label">CATEGORY</label>
                    <label>
                        <select name="cat" class="form-select">
                            <%List<Category> categories = (List<Category>) request.getSession().getAttribute("cat");
                                if (categories!=null){
                                    for(Category cat:categories){
                            %>
                            <option value="<%=cat.getId()%>"> <%=cat.getName()%> </option>
                            <%
                                    }
                                }
                            %>
                        </select>
                    </label>
                </div>
                <button type="submit" class="btn btn-primary">ADD THIS NEWS</button>
            </form>
        </div>
    </div>
</div>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</html>

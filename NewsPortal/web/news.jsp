<%@ page import="java.util.List" %>
<%@ page import="Classes.News" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<%@include file="/vendor/head.jsp"%>
<body>
<%@include file="/vendor/navbar.jsp"%>
<div class="container">

</div>
<div class="container">
    <div class="row mt-3">
        <%
            List<News> news = (List<News>) request.getAttribute("news");
            if(news!=null){
                for(News n:news){
                    %>
        <div class="col-9 mt-2">
            <div class="card" style="width: 100%;">
                <div class="card-body">
                    <p class="text-secondary"><%=n.getCategory().getName()%></p>
                    <h5 class="card-title"><%=n.getTitle()%></h5>
                    <p class="text-secondary"><%=n.getPost_date()%></p>
                    <p class="card-text"><%=n.getContent()%></p>
                    <a href="/detailsNews?id=<%=n.getId()%>" class="btn btn-primary">DETAILS</a>
                </div>
            </div>
        </div>
        <%
                }
            }
        %>
    </div>
</div>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</html>

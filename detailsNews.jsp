<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="Classes.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<%@include file="/vendor/head.jsp"%>
<body>
<%@include file="/vendor/navbar.jsp"%>



<div class="container">
    <%News news = (News) request.getAttribute("news");
    if (user!=null){
        if (user!=null && user.getRole_id().equals("1")){
    %>
    <div class="row mt-3">
        <div class="col">
            <form action="/update" method="post">
                <div class="mb-3">
                    <label for="exampleInputEmail1" class="form-label">TITLE</label>
                    <input type="text" class="form-control" id="exampleInputEmail1" aria-describedby="email" name="title" value="<%=news.getTitle()%>">
                </div>
                <div class="mb-3">
                    <label for="exampleInputPassword1" class="form-label">CONTENT</label>
                    <textarea class="form-control" name="content" id="exampleInputPassword1" style="width: 100%; height: 70%;" ><%=news.getContent()%></textarea>
                </div>
                <div class="mb-3">
                    <label class="form-label">CATEGORY</label>
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
                </div>
                <button type="submit" class="btn btn-success">UPDATE NEWS</button>
            </form>
            <form action="delete" method="post">
                <input type="hidden" class="form-control" name="id" value="<%=news.getId()%>">
                <button type="submit" class="btn btn-danger">DELETE NEWS</button>
            </form>
            <%
                } else{ %>
            <div class="col-8 mt-2">
                <div class="card" style="width: 100%;">
                    <div class="card-body">
                        <p class="text-secondary"><%=news.getCategory().getName()%></p>
                        <h5 class="card-title"><%=news.getTitle()%></h5>
                        <p class="card-text"><%=news.getContent()%></p>
                        <p class="text-secondary"><%=news.getPost_date()%></p>
                    </div>
                </div>
            </div>

            <div class="col-4 mt-2">
                <%List<Comment> comments = (List<Comment>) request.getAttribute("comments");
                    if (comments!=null){
                        for(Comment comment:comments){
                            %>
                <div class="col-9 mt-2">
                    <div class="card" style="width: 100%;">
                        <div class="card-body">
                            <p class="text-secondary"><%=comment.getPost_date()%></p>
                            <h5 class="card-title"><%=comment.getComment()%></h5>
                            <p class="text-secondary"><%=comment.getUser().getEmail()%></p>
                        </div>
                    </div>
                </div>
                <%
                        }
                    }
                %>
            </div>
                <div class="col-12 mt-2">
                    <%if (user!=null){
                    %>
                    <form action="/comment" method="post">
                        <div class="mb-3">
                            <label class="form-label">COMMENT</label>
                            <input type="text" class="form-control"  aria-describedby="email" name="comment">
                        </div>
                        <div class="mb-3">
                            <input type="hidden" class="form-control" name="user_id" value="<%=user.getId()%>">
                            <input type="hidden" class="form-control" name="news_id" value="<%=news.getId()%>">
                        </div>
                        <div class="mb-3">
                            <button type="submit" class="btn btn-success">SEND COMMENT</button>
                        </div>
                    </form>
                    <%
                        }
                    %>
                </div>
            <%
                    }
                }
            %>
        </div>
    </div>
</div>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</html>

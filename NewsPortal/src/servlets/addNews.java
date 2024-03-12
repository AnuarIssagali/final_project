package servlets;

import Classes.Category;
import Classes.DBManager;
import Classes.News;
import Classes.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet(value = "/addNews")
public class addNews extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Category> categories = DBManager.getCats();
        req.getSession().setAttribute("cat",categories);
        req.setAttribute("cat", categories);
        User user = (User) req.getSession().getAttribute("current");
        if (user!=null && user.getRole_id().equals("1")){
            req.getRequestDispatcher("addNews.jsp").forward(req, resp);
        }
        else{
            resp.sendRedirect("/login?errorRole");
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String title = req.getParameter("title");
        String content = req.getParameter("content");
        Long cat_id = Long.valueOf(req.getParameter("cat"));

        News news = new News();
        news.setTitle(title);
        news.setContent(content);
        Category cat = new Category();
        cat.setId(cat_id);
        news.setCategory(cat);

        DBManager.addNews(news);
        resp.sendRedirect("/news");
    }
}

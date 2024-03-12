package servlets;

import Classes.DBManager;
import Classes.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet(value = "/login")
public class LoginServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("login.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String email = req.getParameter("email");
        String password = req.getParameter("password");
        User currentUser = DBManager.getUser(email);

        HttpSession session = req.getSession();
        session.setAttribute("current", currentUser);

        String redirect = "";

        if (currentUser!=null){
            if (currentUser.getEmail().equals(email)){
                if (currentUser.getPassword().equals(password)){
                    redirect = "/profile";
                }
                else {
                    redirect = "/login?errorPassword";
                }
            }
            else {
                redirect = "/login?errorEmail";
            }
        }
        else {
            redirect = "/login?error";
        }
        resp.sendRedirect(redirect);
    }
}

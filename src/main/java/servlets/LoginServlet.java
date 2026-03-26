package servlets;

import dao.UserDAO;
import dao.UserDAOImpl;
import models.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private UserDAO userDAO = new UserDAOImpl();

    // 🔹 AFFICHAGE DU FORMULAIRE
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.getRequestDispatcher("/WEB-INF/login.jsp")
               .forward(request, response);
    }

    // 🔹 TRAITEMENT DU FORMULAIRE
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String login = request.getParameter("login");
        String password = request.getParameter("password");

        User user = userDAO.authenticate(login, password);

        if (user != null) {
            HttpSession session = request.getSession();
            session.setAttribute("user", user);

            // redirection vers /home
            response.sendRedirect(request.getContextPath() + "/home");

        } else {
            request.setAttribute("error", "Login ou mot de passe incorrect");

            request.getRequestDispatcher("/WEB-INF/login.jsp")
                   .forward(request, response);
        }
    }
}

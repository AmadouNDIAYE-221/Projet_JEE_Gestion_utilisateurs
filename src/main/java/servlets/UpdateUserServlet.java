package servlets;

import dao.UserDAO;
import dao.UserDAOImpl;
import models.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet("/users/update")
public class UpdateUserServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private UserDAO userDAO = new UserDAOImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Récupération de l'utilisateur à modifier
        int id = Integer.parseInt(request.getParameter("id"));
        User user = userDAO.getUserById(id);

        if (user != null) {
            request.setAttribute("user", user);
            request.getRequestDispatcher("/WEB-INF/update.jsp")
                   .forward(request, response);
        } else {
            response.sendRedirect(request.getContextPath() + "/users/list");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String nom = request.getParameter("nom");
        String prenom = request.getParameter("prenom");
        String login = request.getParameter("login");
        String password = request.getParameter("password");

        User user = new User(id, nom, prenom, login, password);

        if (userDAO.updateUser(user)) {
            response.sendRedirect(request.getContextPath() + "/users/list");
        } else {
            request.setAttribute("error", "Erreur lors de la modification");
            request.setAttribute("user", user);
            request.getRequestDispatcher("/WEB-INF/update.jsp")
                   .forward(request, response);
        }
    }
}
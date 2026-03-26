package servlets;

import dao.UserDAO;

import dao.UserDAOImpl;
import models.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet("/users/add")
public class AddUserServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private UserDAO userDAO = new UserDAOImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Affichage du formulaire
        request.getRequestDispatcher("/WEB-INF/add.jsp")
               .forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String nom = request.getParameter("nom");
        String prenom = request.getParameter("prenom");
        String login = request.getParameter("login");
        String password = request.getParameter("password");

        User user = new User(0, nom, prenom, login, password);

        if (userDAO.addUser(user)) {
            // Redirection vers la liste
            response.sendRedirect(request.getContextPath() + "/users/list");
        } else {
            request.setAttribute("error", "Erreur lors de l'ajout");

            request.getRequestDispatcher("/WEB-INF/add.jsp")
                   .forward(request, response);
        }
    }
}

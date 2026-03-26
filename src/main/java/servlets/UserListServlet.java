package servlets;

import dao.UserDAO;
import dao.UserDAOImpl;
import models.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/users/list")
public class UserListServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
	
	private UserDAO userDAO = new UserDAOImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        List<User> users = userDAO.getAllUsers();
        request.setAttribute("users", users);
        request.getRequestDispatcher("/WEB-INF/list.jsp").forward(request, response);
    }
}
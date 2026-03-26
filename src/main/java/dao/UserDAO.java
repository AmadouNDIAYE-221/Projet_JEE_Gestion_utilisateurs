package dao;

import models.User;
import java.util.List;

public interface UserDAO {
    User authenticate(String login, String password);
    List<User> getAllUsers();
    User getUserById(int id);
    boolean addUser(User user);
    boolean updateUser(User user);
    boolean deleteUser(int id);
}
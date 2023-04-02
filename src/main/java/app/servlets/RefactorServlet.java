package app.servlets;

import app.model.Model;
import app.entities.User;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class RefactorServlet extends HttpServlet {

    private User _currentUser;
    private Model _model;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("views/refactor.jsp");
        requestDispatcher.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Если нажата кнопка поиска записи
        if (req.getParameter("btnSearch") != null) {
            String idValue = req.getParameter("id");
            _currentUser = FindUser(idValue);
            req.setAttribute("findedUser", _currentUser);
        }
        // Если нажата кнопка замены значения найденной записи
        else if (req.getParameter("btnReplace") != null) {
            if (_currentUser != null) {
                _currentUser.setName(req.getParameter("newValue"));
            }
        }

        doGet(req, resp);
    }

    private <T> User FindUser(T idValue) {
        Model model = Model.getInstance();
        List<User> users = model.getUserList();

        // Если ищем запись по id
        if (intTryParse(idValue.toString())) {
            Integer id = Integer.parseInt(idValue.toString());
            for (User user : users) {
                if (user.getId().equals(id)) {
                    return user;
                }
            }
        }
        // Если ищем запись по значению
        else {
            for(User user : users) {
                if(user.getName().equals(idValue)) {
                    return user;
                }
            }
        }

        return null;
    }

    // Проверяем, является ли переданное значение числом
    private boolean intTryParse(String value) {
        try {
            Integer.parseInt(value);
            return true;
        } catch (Exception ex) {
            return false;
        }
    }
}

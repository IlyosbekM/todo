package servlet;

import Repository.TodoRepository;
import entity.Todo;
import entity.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/add")
public class AddTodoServlet extends HttpServlet {

    private final TodoRepository todoRepository = new TodoRepository();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        if (user == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        String text = request.getParameter("text");
        Todo todo = new Todo();
        todo.setText(text);
        todo.setUser(user);
        todoRepository.add(todo);
        response.sendRedirect("list.jsp");
    }
}

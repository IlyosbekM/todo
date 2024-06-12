
<%@ page import="com.pdp.User" %>
<%@ page import="com.pdp.Todo" %>
<%@ page import="com.pdp.TodoDAO" %>
<%
    HttpSession sessionn = request.getSession();
    User user = (User) sessionn.getAttribute("user");

    if (user == null) {
        response.sendRedirect("login.jsp");
    } else {
        if ("POST".equalsIgnoreCase(request.getMethod())) {
            String text = request.getParameter("text");
            Todo todo = new Todo();
            todo.setText(text);
            todo.setUser(user);
            TodoDAO.addTodo(todo);
            response.sendRedirect("list.jsp");
        }
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Add Todo</title>
</head>
<body>
<h1>Add Todo</h1>
<form method="post">
    Text: <input type="text" name="text">
    <input type="submit" value="Add">
</form>
<a href="list.jsp">Back to List</a>
</body>
</html>

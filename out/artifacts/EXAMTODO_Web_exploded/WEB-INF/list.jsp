<%@ page import="java.util.List" %>
<%@ page import="com.example.TodoDAO" %>
<%@ page import="com.example.Todo" %>
<%@ page import="com.pdp.Todo" %>
<%@ page import="com.pdp.TodoDAO" %>
<%
    List<Todo> todos = TodoDAO.getAllTodos();
%>
<!DOCTYPE html>
<html>
<head>
    <title>Todo List</title>
</head>
<body>
<h1>Todo List</h1>
<ul>
    <c:forEach var="todo" items="${todos}">
        <li>${todo.getText()} - <a href="edit.jsp?id=${todo.getId()}">Edit</a> - <a href="delete?id=${todo.getId()}">Delete</a></li>
    </c:forEach>
</ul>
<a href="add.jsp">Add Todo</a>
</body>
</html>
